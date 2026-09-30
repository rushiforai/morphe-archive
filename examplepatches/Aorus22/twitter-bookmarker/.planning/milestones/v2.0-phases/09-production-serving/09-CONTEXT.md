# Phase 9: Production Serving - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 9 of 10** (= PRD §85 "Phase 2.9 — Production Serving")

<domain>
## Phase Boundary

Make the single Go process serve the built web app: `web/dist` at `/`, API routes taking precedence over static serving, SPA fallback for client routes, a proper JSON 404 for unknown `/api/*` paths, graceful behaviour when `web/dist` is missing, and Makefile targets for building/running the web app.

**In scope:** a static/SPA handler in the Go server, route registration order in `NewServer`, dist-path resolution (including `TWITTER_BOOKMARKER_DIR`-style configurability for tests), graceful missing-dist handling, `.gitignore` for `web/dist`, and Makefile targets.

**Out of scope:** changing any gallery API semantics (Phase 2), changing frontend behaviour (Phases 3–8), hardening/a11y (Phase 10).

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Production is **one Go process**: `/` serves `web/dist`, `/api/*` serves the gallery API, `/v1/*`
  serves the existing extension API, `/health` serves health. No Vite runtime in production
  (PRD §11, §84).
- API routing has **precedence** over static serving: `/api/*`, `/v1/*`, and `/health` must never
  fall through to the SPA fallback (PRD §56).
- Unknown **frontend** routes (e.g. `/collections/linux.csv`) serve `index.html` so React Router
  survives a direct browser refresh (PRD §57). Unknown `/api/*` must return a proper API `404` in the
  `{"status":"error","reason":"..."}` shape, never `index.html` (PRD §57).
- Build flow: `cd web && pnpm build` → `web/dist/`, then the backend serves that directory
  (PRD §58).
- The root Makefile should gain commands in its existing style — `make web`, `make dev-web`,
  `make dev-backend`, and `make build` composing the web build. Exact naming may follow the existing
  Makefile conventions (PRD §58).
- `make build` must still produce the server binary and the loadable extension `dist/` (v1.0
  contract, PRD §81.35).
- Static serving must not create an arbitrary filesystem endpoint: only files inside the resolved
  `web/dist` are served (PRD §70).

### Implementation notes

- Go 1.22 `http.ServeMux`: register the API patterns **before** the catch-all `/`. A catch-all
  pattern `/` matches everything, and Go's mux picks the most specific pattern, so explicit
  `/api/gallery/...` and `/v1/...` registrations win — but verify that an unknown `/api/foo` does
  **not** land on the SPA handler. The safest shape is a single root handler that inspects
  `r.URL.Path`: if it starts with `/api/` or `/v1/` or equals `/health` → JSON 404; otherwise try the
  file from `dist`, else serve `index.html`.
- Traversal safety: `http.FileServer` already cleans paths, but confirm `..` and encoded traversal
  cannot escape `dist`.
- Missing `dist` (not built yet) must not crash the server: log a clear message once and return a
  helpful response for `/` (e.g. a plain-text hint to run `pnpm build`) while keeping `/api` and `/v1`
  fully functional. This keeps development (`make dev-backend` + `pnpm dev`) working.
- Resolve the dist path relative to the executable/repo, and allow an override (env var) so tests can
  point at a temp dir. Document the resolution order.
- Cache headers: hashed Vite assets under `/assets/` may be served with a long cache; `index.html`
  must not be cached (otherwise a rebuild is invisible).

</decisions>

<code_context>
## Existing Code Insights

- `internal/api/server.go` — `NewServer(store, idx, log)` builds a `http.ServeMux` and wraps it in
  `withExtensionCORS`. This is where the static/SPA handler is added. Note `withExtensionCORS` returns
  405 for OPTIONS requests from non-extension origins — same-origin browser requests are unaffected,
  but confirm the SPA/static paths still behave.
- `cmd/server/main.go` — startup logging (`logging.Startup`) and graceful shutdown; the static handler
  needs a dist path resolved here (or in `config`).
- `internal/config/config.go` — the established pattern for env-var-overridable paths
  (`TWITTER_BOOKMARKER_DIR`). Follow it (e.g. `TWITTER_BOOKMARKER_WEB_DIR`).
- `internal/api/acceptance_test.go` — the acceptance test style for hitting the real server handler.
- Makefile: currently `build`, `test`, `run`, `fmt`, `lint`, `clean`, `clean-storage`; it is aware of
  `.env.local` and `TWITTER_BOOKMARKER_DIR`. Add web targets without breaking `make test`/`make build`.

</code_context>

<specifics>
## Specific Ideas

1. Build the web app, start the server, and `curl http://127.0.0.1:43121/` returns the built
   `index.html`; `/assets/...` returns the hashed JS/CSS with a 200.
2. `curl http://127.0.0.1:43121/collections/linux.csv` returns `index.html` (200, HTML), not a 404.
3. `curl http://127.0.0.1:43121/api/nope` returns 404 JSON `{"status":"error",...}` and **not** HTML.
4. `curl http://127.0.0.1:43121/api/gallery/collections` still returns the gallery JSON, and
   `/health` + `/v1/index` still behave exactly as before.
5. `curl 'http://127.0.0.1:43121/../etc/passwd'` (and an encoded variant) cannot read outside `dist`.
6. With `web/dist` absent, the server starts normally, logs a clear message, still serves
   `/api/gallery/collections`, and `/` returns a helpful non-crashing response.
7. `make build` builds the server binary, the web bundle, and the extension `dist/`; `make web` and
   `make dev-web` exist and `make -n` shows sane commands.
8. Go tests cover the SPA fallback, API precedence, unknown-API 404, and missing-dist behaviour using
   a temp `dist` fixture.

</specifics>

<deferred>
## Deferred Ideas

- gzip/brotli compression, ETag tuning, HTTP/2 — not required for a localhost personal tool
- Embedding `web/dist` into the Go binary with `embed.FS` (a possible future simplification)
- Docker/systemd packaging (v1.0 explicitly excludes infrastructure)

</deferred>
