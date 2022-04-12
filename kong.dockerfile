FROM kong:2.8.0-alpine

# add missing library.
# See https://github.com/Kong/kong/issues/8259
USER root
RUN apk add --no-cache curl git gcc musl-dev && \
 luarocks install luaossl OPENSSL_DIR=/usr/local/kong CRYPTO_DIR=/usr/local/kong
USER kong