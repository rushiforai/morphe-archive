# Twitter Bookmarker — root build/test tooling.
#
# Targets:
#   make build          build the server binary + the loadable extension dist/ + the web SPA
#   make backend        build only the Go server binary
#   make extension      build only the loadable extension dist/
#   make web            build only the production SPA into web/dist/
#   make test           run the Go suite (-race), the extension suite and the web suite
#   make dev-web        run the Vite dev server (proxies /api to 127.0.0.1:43121)
#   make dev-backend    run the Go server from source (storage: $(STORAGE_DIR))
#   make run            run the built server
#   make fmt            gofmt -w the backend sources
#   make lint           gofmt check + go vet + extension typecheck + web typecheck
#   make clean          remove build outputs (never touches user data)
#   make clean-storage  DESTRUCTIVE: delete the storage directory
#
# `clean` never deletes user data; only `clean-storage` does.
#
# Where the database lives: `make run` passes TWITTER_BOOKMARKER_DIR to the server,
# so the location is a property of this Makefile invocation and never needs a shell
# profile. The server stores everything in <dir>/tw-bookmarker.db and owns nothing
# else in that directory. The value is resolved in this order:
#
#   1. `make run TWITTER_BOOKMARKER_DIR=/somewhere`
#   2. `.env.local` (gitignored, so a personal path is never committed):
#          TWITTER_BOOKMARKER_DIR := $(HOME)/Personal/twitter-bookmarker
#   3. the historical default, $(HOME)/.twitter-bookmarker
#
# If the directory was migrated from the CSV era, it also holds a read-only
# `backup/` folder with the original CSVs. The server never reads or writes it.
# That migration is not a backend concern and has no Makefile target: the scripts
# that perform it live with the data they migrate.
#
# Where the built web app lives: `make run` and `make dev-backend` pass
# TWITTER_BOOKMARKER_WEB_DIR=$(WEB_DIR) so the server finds the SPA no matter
# which directory it starts from. Without that override the server resolves
# <cwd>/web/dist first, then executable-relative candidates (see
# internal/config.WebDir). A missing web/dist is not fatal: the API keeps
# working and "/" explains how to build it.
#
# Where the server listens: the default is 127.0.0.1:43121, so nothing but this
# machine can reach it. `make run` resolves TWITTER_BOOKMARKER_ADDR the same way
# as the storage directory — command line, then `.env.local`, then the default:
#
#          TWITTER_BOOKMARKER_ADDR := 192.168.1.20:43121
#          TWITTER_BOOKMARKER_TOKEN := <a long random string>
#
# A non-loopback address is refused unless TWITTER_BOOKMARKER_TOKEN is also set:
# the port would otherwise be an unauthenticated copy of the bookmark database on
# the LAN. With both set, the host is reachable from a phone on the same network
# — and then every request from that phone must send
# `Authorization: Bearer <token>`, while loopback clients (the extension, this
# machine's browser) keep working with no token at all. The port must also be
# opened in the host firewall, which is outside what a Makefile can do.
#
# `make dev-web` + `make dev-backend` are meant to run together in two shells:
# Vite serves the SPA with HMR on its own port and proxies /api to 43121, so the
# Go server does not need a SPA build at all in development.
#
# `make build` composes `backend`, `extension` and `web` because that is exactly
# the production workflow of PRD-2 §84 (build the frontend, then build/run the
# backend) and always leaves web/dist present for `make run`. The Node toolchain
# was already required for the extension build; `make backend` is the Go-only
# path for anyone who wants no Node at all.

SHELL := /bin/bash

-include .env.local

BACKEND_BIN := backend/bin/twitter-bookmarker-server
STORAGE_DIR := $(if $(TWITTER_BOOKMARKER_DIR),$(TWITTER_BOOKMARKER_DIR),$(HOME)/.twitter-bookmarker)
WEB_DIR := $(CURDIR)/web/dist
LISTEN_ADDR := $(if $(TWITTER_BOOKMARKER_ADDR),$(TWITTER_BOOKMARKER_ADDR),127.0.0.1:43121)

.DEFAULT_GOAL := build

.PHONY: build backend extension web test dev-web dev-backend run fmt lint clean clean-storage docker-build docker-up docker-down docker-logs

build: backend extension web ## Build the server binary, the loadable extension and the web SPA.

backend: ## Build only the Go server binary.
	mkdir -p backend/bin
	# CGO_ENABLED=0 keeps the binary pure-Go: modernc.org/sqlite needs no cgo, and a
	# static build is what makes the released artifact portable.
	cd backend && CGO_ENABLED=0 go build -o bin/twitter-bookmarker-server ./cmd/server

extension: ## Build only the loadable extension dist/.
	cd extension && npm ci && npm run build

web: ## Build only the production SPA into web/dist/.
	cd web && pnpm install --frozen-lockfile && pnpm build

test: ## Run the Go suite under -race, then the extension suite, then the web suite.
	cd backend && go test ./... -race
	cd extension && npm test
	cd web && pnpm test

verify-http: ## PRD §80 acceptance over HTTP only (no browser).
	bash scripts/check-gallery-acceptance.sh

verify-web: ## Real-browser acceptance for the SPA (agent-browser; needs `make build`).
	bash scripts/check-web-acceptance.sh

verify-trace: ## Check every PRD requirement has a traceability row.
	bash scripts/check-requirement-traceability.sh

verify-extension: ## Check the built extension dist (needs `make build`).
	cd extension && npm run verify

verify: verify-http verify-trace verify-web verify-extension ## Run every acceptance gate. Needs `make build`.

dev-web: ## Run the Vite dev server for the SPA (proxies /api to 127.0.0.1:43121).
	@echo "==> pair with 'make dev-backend' in another shell"
	cd web && pnpm dev

dev-backend: ## Run the Go server from source (API + web/dist; pair with `make dev-web`).
	@echo "==> storage: $(STORAGE_DIR)"
	@echo "==> web:     $(WEB_DIR)"
	@echo "==> listen:  $(LISTEN_ADDR)"
	cd backend && TWITTER_BOOKMARKER_DIR="$(STORAGE_DIR)" TWITTER_BOOKMARKER_WEB_DIR="$(WEB_DIR)" \
		TWITTER_BOOKMARKER_ADDR="$(LISTEN_ADDR)" TWITTER_BOOKMARKER_TOKEN="$(TWITTER_BOOKMARKER_TOKEN)" \
		go run ./cmd/server

run: ## Run the built server (build it first with `make build`).
	@if [ ! -x "$(BACKEND_BIN)" ]; then \
		echo "error: $(BACKEND_BIN) not found; run 'make build' first" >&2; \
		exit 1; \
	fi
	@echo "==> storage: $(STORAGE_DIR)"
	@echo "==> web:     $(WEB_DIR)"
	@echo "==> listen:  $(LISTEN_ADDR)"
	@case "$(LISTEN_ADDR)" in \
		127.0.0.1:*|localhost:*|"[::1]:"*) ;; \
		*) echo "==> note:    non-loopback bind — set TWITTER_BOOKMARKER_TOKEN, and open the port in the firewall"; \
		   echo "             (without a token the server refuses to start, by design)";; \
	esac
	TWITTER_BOOKMARKER_DIR="$(STORAGE_DIR)" TWITTER_BOOKMARKER_WEB_DIR="$(WEB_DIR)" \
		TWITTER_BOOKMARKER_ADDR="$(LISTEN_ADDR)" TWITTER_BOOKMARKER_TOKEN="$(TWITTER_BOOKMARKER_TOKEN)" \
		./$(BACKEND_BIN)

docker-build: ## Build the image (server + built SPA).
	docker compose build

docker-up: ## Start the container (reads .env; see .env.example).
	@if [ ! -f .env ]; then \
		echo "error: .env not found; copy .env.example and set TWITTER_BOOKMARKER_DATA_DIR" >&2; \
		exit 1; \
	fi
	docker compose up -d --build
	@echo "==> web:   http://$$(sed -n 's/^TWITTER_BOOKMARKER_ADDR=//p' .env | tail -1)/"
	@echo "==> check: docker compose ps"

docker-down: ## Stop and remove the container (the database is untouched).
	docker compose down

docker-logs: ## Follow the container log.
	docker compose logs -f --tail=50

fmt: ## Format the backend sources in place.
	gofmt -w backend

lint: ## Fail on unformatted Go, vet errors, lint errors, or extension/web type errors.
	@unformatted="$$(gofmt -l backend)"; \
	if [ -n "$$unformatted" ]; then \
		echo "gofmt would change:" >&2; \
		echo "$$unformatted" >&2; \
		exit 1; \
	fi
	cd backend && go vet ./...
	cd extension && npm run typecheck
	cd web && pnpm run typecheck
	cd web && pnpm run lint

clean: ## Remove build outputs. User data is never touched.
	rm -rf backend/bin extension/dist web/dist

clean-storage: ## DESTRUCTIVE: delete the storage directory (database + backups).
	@echo ""
	@echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@echo "!!  DESTRUCTIVE COMMAND                                             !!"
	@echo "!!  This permanently deletes the bookmark database under:           !!"
	@echo "!!      $(STORAGE_DIR)/"
	@echo "!!                                                                  !!"
	@echo "!!  tw-bookmarker.db is the durable source of truth. If this dir    !!"
	@echo "!!  was migrated from the CSV era, backup/ inside it holds the only !!"
	@echo "!!  copy of the original CSVs and is deleted too.                   !!"
	@echo "!!                                                                  !!"
	@echo "!!  Nothing here is backed up anywhere else. There is no undo.      !!"
	@echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@echo ""
	@echo "Contents about to be deleted:"
	@ls -la "$(STORAGE_DIR)" 2>/dev/null || echo "  ($(STORAGE_DIR) does not exist)"
	@echo ""
	rm -rf "$(STORAGE_DIR)"
	@echo "Removed $(STORAGE_DIR)."
