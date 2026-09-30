---
phase: 09-production-serving
plan: 01
subsystem: backend-serving
tags: [go, net/http, servemux, http.FileServerFS, os.DirFS, spa-fallback, cache-control, immutable-assets, static-serving, graceful-degradation, makefile, pnpm, vite]

# Dependency graph
requires:
  - phase: 08-media-lightbox
    provides: "the completed SPA (web/dist is produced by `cd web && pnpm build`); nothing in web/ changes here"
  - phase: 02-gallery-http-api
    provides: "the frozen /api/gallery read API, the {\"status\":\"error\",\"reason\":…} envelope and the deferred unknown-/api/* catch-all this phase lands"
  - phase: 01-go-persistence-layer
    provides: "the frozen v1.0 contracts (/health, /v1/index, /v1/bookmarks) and the config env-var pattern (TWITTER_BOOKMARKER_DIR)"
provides:
  - "backend/internal/api/static.go: handleStatic / serveFile / serveIndex / handleUnknownAPI / isAPIPath / isAssetPath / isHashedAsset / methodGate — static file serving plus the SPA fallback in one root handler"
  - "backend/internal/config/config.go: EnvWebDir (TWITTER_BOOKMARKER_WEB_DIR), WebDirName (web/dist), WebDir() and the pure resolveWebDir(env, cwd, exeDir) with the documented precedence"
  - "backend/internal/logging/logging.go: WebAssets(dir) and WebAssetsMissing(dir) startup messages"
  - "backend/internal/api/server.go: NewServer resolves and reports the dist dir once, registers /api + /api/ + /v1 + /v1/ JSON catch-alls, and gates every known route by method"
  - "Makefile: backend / extension / web / dev-web / dev-backend targets, with build, test and lint composing them; WEB_DIR := $(CURDIR)/web/dist passed to run and dev-backend"
affects: [phase-10]

actuals:
  tokens: 0
  tasks: 5
  commits: 3

tech-stack:
  added: ["Go standard library only: net/http (ServeMux, ServeFileFS), io/fs, os.DirFS, path — no new module, go.mod unchanged"]
  patterns:
    - "One root pattern, explicit prefix refusals: /api, /api/, /v1, /v1/ answer the JSON envelope, known API routes keep exact patterns, and / serves web/dist — so an API path can never fall through to the SPA (and the static handler refuses API prefixes again as defence in depth)"
    - "Known routes register without a method and are wrapped in methodGate: a method-less catch-all shadows the ServeMux's automatic 405 (a probe showed POST /health and GET /v1/bookmarks landing on the catch-all), so the method check moves into the handler while the automatic 405 is preserved exactly"
    - "Asset vs client route by namespace, not by extension: /assets/ is build output and a root-level name with an extension is a file; everything else unmatched is a client route — a generic extension test would wrongly capture the PRD's own /collections/linux.csv"
    - "Cache policy follows the file name: content-hashed /assets/* are public, max-age=31536000, immutable; index.html (and every SPA fallback that serves it) is no-cache so a rebuild is never invisible"
    - "Degrade, never crash: construction never requires web/dist; a per-request stat of index.html decides behaviour, so `make web` while the server runs starts working without a restart"
    - "Two missing-build behaviours: \"/\" explains how to build it (503 + text), every other unmatched non-API path stays a plain 404 — which keeps the pre-SPA 404 contract that the v1.0 no-categories/settings test and TestMethodNotAllowedAndNotFound assert"
    - "Traversal safety by cleaning then containment: path.Clean(\"/\"+URL.Path) strips . and ..; os.DirFS rejects anything that is not an fs.ValidPath, so static serving is never an arbitrary filesystem endpoint (PRD-2 §70)"
    - "Resolution precedence documented and unit-tested: $TWITTER_BOOKMARKER_WEB_DIR (authoritative, no fallback) → <cwd>/web/dist → <exeDir>{,/..,/../..}/web/dist"

key-files:
  created:
    - backend/internal/api/static.go
    - backend/internal/api/static_test.go
    - backend/internal/config/webdir_test.go
  modified:
    - backend/internal/api/server.go
    - backend/internal/config/config.go
    - backend/internal/logging/logging.go
    - Makefile

key-decisions:
  - "$TWITTER_BOOKMARKER_WEB_DIR is authoritative when set: WebDir never falls back to another candidate, otherwise the PROD-05 degraded path could never be tested (an existing cwd/web/dist would always mask a missing override)"
  - "The SPA fallback requires index.html to exist; without a build there are no client routes, so unmatched paths 404 for every method instead of 405. This is what keeps the frozen v1.0 \"no /categories or /settings surface\" assertion (which runs with no dist) green while still returning 405 for a non-GET client route when the SPA is built"
  - "Missing dist: GET / returns 503 text/plain with the expected directory and `make web` / `pnpm build`, not an empty 200; the equivalent message is logged exactly once at construction"
  - "make build composes backend + extension + web because that is precisely the PRD-2 §84 production workflow (build the frontend, then build/run the backend) and it guarantees web/dist exists for `make run`; the Node toolchain was already required by the extension build, and `make backend` is the Go-only path for anyone who wants none of it"
  - "make test includes the web suite (Go -race, extension, web) and make lint includes the web type gate (`pnpm run typecheck`, i.e. `tsc -b`): the SPA is now part of the shipped product, so a green `make test` must mean the whole product is green"
  - "make run and make dev-backend pass TWITTER_BOOKMARKER_WEB_DIR=$(WEB_DIR) so the dist path is a property of the invocation, not of the directory the server happens to start from — the same reasoning the Makefile already applies to TWITTER_BOOKMARKER_DIR"
  - "clean removes web/dist along with backend/bin and extension/dist: it is a build output. `make build` (or `make web`) must run before the orchestrator's acceptance harness, which serves the SPA from the tree"
  - "New tests for the unexported resolver live in webdir_test.go (`package config`) because config_test.go is an external test package (`package config_test`) and cannot call resolveWebDir"

patterns-established:
  - "API precedence is structural, not incidental: prefix catch-alls own every /api and /v1 miss, so adding a frontend route can never shadow an API path"
  - "Static content is read-only by construction: the method gate runs before any file lookup, so a write to a frontend path answers 405 and never HTML"

requirements-completed: [PROD-01, PROD-02, PROD-03, PROD-04, PROD-05, PROD-06]

coverage:
  - id: D1
    description: "GET / serves web/dist/index.html as text/html with no Vite process; hashed /assets/* are served with the right content type and an immutable cache while index.html is no-cache"
    requirement: "PROD-01"
    verification:
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestRootServesTheBuiltShell"
        status: pass
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestHashedAssetsAreServedWithImmutableCache"
        status: pass
      - kind: e2e
        ref: "unshare -rn live check: GET / -> 200 text/html, Cache-Control no-cache; /assets/index-YLi8pRYJ.js -> text/javascript; charset=utf-8 + public, max-age=31536000, immutable"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.24 / serves web/dist HTML"
        status: pass
    human_judgment: false
  - id: D2
    description: "/api/*, /v1/* and /health never fall through to the SPA; the gallery API still answers JSON alongside static serving"
    requirement: "PROD-02"
    verification:
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestAPIPrecedenceOverStaticServing"
        status: pass
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestFrozenV1ContractsSurviveStaticServing"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.4 collections endpoint available (52 passed, 0 failed, 0 skipped)"
        status: pass
    human_judgment: false
  - id: D3
    description: "Unknown client routes (including /collections/linux.csv and deep nested paths) serve index.html for GET/HEAD; a non-GET client route is 405; a missing /assets/ file is 404 and never the shell"
    requirement: "PROD-03"
    verification:
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestSPAFallbackForClientRoutes"
        status: pass
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestNonGetClientRouteIsNotTheSPA"
        status: pass
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestMissingAssetDoesNotFallBackToTheShell"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.25 deep SPA route serves index.html"
        status: pass
    human_judgment: false
  - id: D4
    description: "Unknown /api/* and /v1/* paths return HTTP 404 with the existing {\"status\":\"error\",\"reason\":…} envelope, never index.html"
    requirement: "PROD-04"
    verification:
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestAPIPrecedenceOverStaticServing"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.25 unknown /api path → 404 + error JSON"
        status: pass
      - kind: e2e
        ref: "unshare -rn live check: GET /api/nope -> 404 {\"status\":\"error\",\"reason\":\"not found\"}"
        status: pass
    human_judgment: false
  - id: D5
    description: "A missing web/dist never crashes the server: one actionable startup log, GET / returns an observable non-200 hint, the API keeps working, and unknown paths keep the pre-SPA 404"
    requirement: "PROD-05"
    verification:
      - kind: unit
        ref: "backend/internal/api/static_test.go#TestMissingDistDegradesGracefully"
        status: pass
      - kind: e2e
        ref: "unshare -rn live check with TWITTER_BOOKMARKER_WEB_DIR=<absent>: GET / -> 503 text/plain hint, /api/gallery/collections -> 200, /health -> 200, startup WARN logged once"
        status: pass
    human_judgment: false
  - id: D6
    description: "Makefile gains web / dev-web / dev-backend and composes build, test and lint without breaking the server-binary or extension-dist outputs"
    requirement: "PROD-06"
    verification:
      - kind: e2e
        ref: "make build -> backend/bin/twitter-bookmarker-server (ELF x86-64, 10.8 MB) + extension/dist/{manifest.json,background,content,popup} + web/dist/{index.html,assets,...}"
        status: pass
      - kind: e2e
        ref: "make lint -> exit 0 (gofmt clean, go vet, extension tsc --noEmit, web tsc -b)"
        status: pass
      - kind: e2e
        ref: "make -n dev-web / dev-backend / run show the documented commands with WEB_DIR and STORAGE_DIR"
        status: pass
    human_judgment: false
---

# Phase 9: Production Serving Summary

**One Go process now serves the whole product.** `GET /` returns the built `web/dist/index.html` with
no Vite process, `/api/*`, `/v1/*` and `/health` keep absolute precedence over static serving, unknown
client routes fall back to the shell so a browser refresh survives, unknown `/api/*` paths answer the
existing JSON error envelope, a missing `web/dist` degrades with an actionable message instead of a
crash, and the root Makefile gained the web targets. The two §80.24/§80.25 acceptance checks that
Phase 2 deliberately deferred to this phase — the ones that were **skipped** because the SPA was not
being served — now **pass**.

## Performance

The static handler adds one `fs.Stat` and one `http.ServeFileFS` per request; no new process, no
cache, no dependency. Resolution runs once per `NewServer`. `make build` grew by the SPA build
(`tsc -b && vite build`, ~0.4 s here) and `make test` by the 359-test web suite (~12 s).

## Accomplishments

- **PROD-01 — serve `web/dist` at `/`.** `backend/internal/api/static.go` looks the request up inside
  `os.DirFS(webDir)` with `http.ServeFileFS` (stdlib only, `go.mod` unchanged). Hashed assets are
  `Cache-Control: public, max-age=31536000, immutable`; `index.html` and every SPA fallback are
  `no-cache`. The dist path resolves through
  `$TWITTER_BOOKMARKER_WEB_DIR` → `<cwd>/web/dist` → `<exeDir>{,/..,/../..}/web/dist`.
- **PROD-02 — API precedence.** `/api`, `/api/`, `/v1`, `/v1/` are registered as JSON catch-alls
  before the root `/` pattern, so an API path can never reach the SPA; the static handler refuses API
  prefixes again as defence in depth.
- **PROD-03 — SPA fallback.** `GET|HEAD` to an unmatched non-API path serves `index.html`; a non-GET is
  405; a miss under `/assets/` (or a root-level dotted name) is 404 rather than a 200 shell.
- **PROD-04 — unknown `/api/*` → API 404.** Reuses `writeJSON` + `model.ErrorResponse`, so the envelope
  cannot drift from the rest of the API.
- **PROD-05 — missing `web/dist`.** Construction never panics; one `WARN` names the directory and how
  to build it; `GET /` returns `503 text/plain` with the hint; the API is untouched.
- **PROD-06 — Makefile.** `backend`, `extension`, `web`, `dev-web`, `dev-backend`; `build` composes all
  three build targets; `test` runs Go `-race` + extension + web; `lint` adds the web type gate.

## Task Commits

| # | Commit | Subject |
| --- | --- | --- |
| 1 | `49d9583` | `docs(09): add Phase 9 production serving plan` |
| 2 | `6313d63` | `feat(09): serve web/dist from the Go server with SPA fallback and web Makefile targets` |
| 3 | _(this file)_ | `docs(09): summarize Phase 9 production serving` |

## Files Created/Modified

Created:
- `backend/internal/api/static.go` — the static/SPA handler and the API 404.
- `backend/internal/api/static_test.go` — 10 new test functions (PROD-01…PROD-05 + traversal).
- `backend/internal/config/webdir_test.go` — 7 new test functions for `resolveWebDir` / `WebDir`.

Modified:
- `backend/internal/api/server.go` — dist resolution + reporting, API catch-alls, `methodGate` on every
  known route, `/` static handler last.
- `backend/internal/config/config.go` — `EnvWebDir`, `WebDirName`, `WebDir()`, `resolveWebDir()`, `isDir()`.
- `backend/internal/logging/logging.go` — `WebAssets`, `WebAssetsMissing`.
- `Makefile` — web targets, composed `build`, extended `test`/`lint`, `WEB_DIR` for `run`/`dev-backend`,
  `web/dist` in `clean`, updated header/help block.

No frontend file, no `extension/**` file, no `go.mod`, and no `.gitignore` changed (`web/dist` was
already ignored by both `.gitignore` and `web/.gitignore`).

## Decisions Made

1. **Catch-alls force the method gate.** A routing probe proved that registering `GET /health` plus a
   method-less `/` (or `/api/`) makes `POST /health` land on the catch-all instead of the ServeMux's
   automatic 405, and `GET /v1/bookmarks` similarly. Known routes are therefore registered without a
   method and wrapped in `methodGate`, which restores the exact 405 behaviour; `/api` and `/v1` are
   registered as exact patterns as well so they answer 404 JSON instead of the ServeMux's 307 subtree
   redirect.
2. **Asset vs client route is decided by namespace, not extension.** `/assets/` is build output and a
   root-level dotted name is a file; everything else is a client route. A generic "has an extension"
   rule would have broken the PRD's own example, `/collections/linux.csv`.
3. **Missing build ⇒ 404 for unmatched non-API paths.** Without a shell there are no client routes, so
   unmatched paths 404 for every method (rather than 405). This is what keeps the frozen v1.0
   "no `/categories` or `/settings` surface" assertion green while still returning 405 for a non-GET
   client route once the SPA exists.
4. **`make build` composes the web build** (see the Makefile header and `key-decisions`): PRD-2 §84
   describes the production workflow as "build the frontend, then build/run the backend", and this
   guarantees `web/dist` is present for `make run` and for the acceptance harness. `make backend` is
   the Go-only path, so the Go build itself still needs no Node toolchain.
5. **`make test` includes the web suite and `make lint` the web type gate.** The SPA is shipped by this
   phase, so a green `make test` should mean the whole product is green; `pnpm run typecheck` is
   `tsc -b`, the repo's real type gate.

## Deviations from Plan

- The plan listed `backend/internal/config/config_test.go` as the resolver-test file; the tests landed
  in the new `backend/internal/config/webdir_test.go` instead, because `resolveWebDir` is unexported
  and `config_test.go` is the external `package config_test` and cannot call it.
- The phase brief describes the frozen `POST /v1/bookmarks` body as `{"filename":…,"tweet":{…}}`. That
  is the **request** shape; the v1.0 artifact and the shipped code define the **response** as
  `{"status":"saved","tweet_id","url","filename","saved_at"}` (and 409 as
  `{"status":"duplicate","tweet_id"}`). The regression test pins the real, unchanged contract; no
  handler code was touched.

## Issues Encountered

- **ServeMux method-match shadowing** (resolved, see Decision 1) — found with a throwaway probe before
  writing the handler, not with the test suite.
- **`/api` and `/v1` subtree redirects** — the mux answered `GET /api` with a 307 to `/api/`; fixed by
  registering the exact patterns.
- **Port 43121 is owned by the operator's `make run`** (PID 2653626, started 20:19:55). No process was
  stopped or started on it outside a private network namespace: the acceptance harness re-execs itself
  under `unshare -rn` when the port is busy, and the extra live checks were wrapped in `unshare -rn`
  with an explicit kill trap.

## User Setup Required

None. `make build` is enough; `TWITTER_BOOKMARKER_WEB_DIR` is optional (tests and unusual layouts only).

## Next Phase Readiness

- **Phase 10 direct-refresh SPA check:** build once (`make build`, producing `web/dist`), start the
  server (`make run`), then open/refresh **`http://127.0.0.1:43121/collections/linux.csv`** (any
  unknown client route works, e.g. `/anything/deep`) — it must render the gallery, not a 404. The
  unknown-API counterpart is **`http://127.0.0.1:43121/api/nope`** → `404 {"status":"error","reason":"not found"}`.
- **Hardening hook:** the SPA fallback is unconditional for unmatched paths; Phase 10's browser pass is
  where a real refresh through React Router is exercised (this phase proves it at the HTTP layer only).
- **Fragility to know about:** the acceptance harness serves the SPA from `web/dist` in the tree and
  does not build it, so `make clean` must be followed by `make build` (or `make web`) before the harness.
- **Verification evidence:** `go test -race ./...` all green (123 top-level test functions, +17 new);
  `pnpm test` 38 files / 359 tests; `make build` exit 0 with all three artifact groups;
  `make lint` exit 0; `scripts/check-gallery-acceptance.sh` **52 passed, 0 failed, 0 skipped** (was
  48/0/2).
