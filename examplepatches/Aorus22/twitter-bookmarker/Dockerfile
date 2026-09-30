# syntax=docker/dockerfile:1

# One image, because one process serves everything: the Go server already serves
# the built SPA out of TWITTER_BOOKMARKER_WEB_DIR, so there is nothing left for a
# second container or a proxy to do.

FROM node:24-alpine AS web

WORKDIR /web

# pnpm 12 is what produced pnpm-lock.yaml on the development machine, and the
# lockfile format is tied to that major, so the image pins the same one instead of
# taking whatever npm would hand out today.
RUN npm install --global pnpm@12.4.1

COPY web/package.json web/pnpm-lock.yaml web/pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

COPY web/ ./
RUN pnpm run build

FROM golang:1.25-alpine AS api

WORKDIR /src

# Dependencies first: editing Go code then re-building should not re-download them.
COPY backend/go.mod backend/go.sum ./
RUN go mod download

COPY backend/ ./
# modernc.org/sqlite is pure Go, so CGO stays off and the runtime image needs no
# toolchain at all.
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /out/twitter-bookmarker ./cmd/server

FROM alpine:3.22

# busybox's wget is what the healthcheck below uses.
RUN apk add --no-cache ca-certificates \
    && adduser -D -u 1000 -h /home/twb twb

COPY --from=api /out/twitter-bookmarker /usr/local/bin/twitter-bookmarker
COPY --from=web /web/dist /app/web

# The server reads this path at startup and serves the SPA from it.
ENV TWITTER_BOOKMARKER_WEB_DIR=/app/web

# This uid owns the mounted storage directory on a normal Linux account, and that
# directory is mode 0700, so it has to match: compose overrides it with
# TWB_UID/TWB_GID for an account whose ids differ.
USER 1000:1000
WORKDIR /home/twb

# Host networking (see docker-compose.yml), so this is the real port on the host.
EXPOSE 43121

# /health is public by design: the token never covers it.
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -q -O /dev/null "http://${TWITTER_BOOKMARKER_ADDR}/health" || exit 1

ENTRYPOINT ["/usr/local/bin/twitter-bookmarker"]
