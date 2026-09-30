---
phase: 01-go-persistence-layer
plan: 03
subsystem: api
tags: [go, net-http, serve-mux, httptest, json, status-codes, maxbytesreader, cors, validation]

# Dependency graph
requires:
  - phase: 01-go-persistence-layer
    provides: "storage.Store (CSV append + dedupe) and index.Index (All/Lookup)"
  - phase: 01-go-persistence-layer
    provides: "config.Addr/storage-dir bootstrap, logging helpers, run() lifecycle"
provides:
  - "Loopback HTTP API: GET /health, GET /v1/index, POST /v1/bookmarks"
  - "Exact 201/409/400/500 contract with strict JSON decoding"
  - "http.MaxBytesReader body cap (1 MiB) and DisallowUnknownFields"
  - "Extension-origin-only CORS echo; no wildcard origin"
  - "Final cmd/server wiring plus an end-to-end smoke script result"
affects: [phase-4, phase-5, phase-6]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
actuals:
  tokens: 4783
  tasks: 2
  commits: 0

tech-stack:
  added: ["Go standard library only: net/http (Go 1.22 ServeMux method+path patterns), encoding/json, net/http/httptest"]
  patterns:
    - "writeJSON(w, code, v) helper; every response sets Content-Type: application/json"
    - "Handler maps typed storage errors: *DuplicateError -> 409, *ValidationError -> 400, else 500"
    - "api.NewServer accepts BookmarkStore/IndexReader interfaces so handlers are unit-testable without the filesystem"
    - "Extension-origin-only CORS middleware wrapping the mux"

key-files:
  created:
    - backend/internal/api/server.go
    - backend/internal/api/handlers.go
    - backend/internal/api/handlers_test.go
  modified:
    - backend/cmd/server/main.go

key-decisions:
  - "api.NewServer takes interfaces (BookmarkStore, IndexReader) rather than concrete types, enabling the 500-path stub test and nil-safety"
  - "Oversized bodies map to 400 (not 413) to match the plan's acceptance wording"
  - "CORS echoes only chrome-extension:// and moz-extension:// origins; arbitrary origins receive no ACAO header and no 204 preflight"
  - "Unmatched method returns ServeMux's automatic 405; unknown paths return 404"
  - "Nil store/index/log degrade safely instead of panicking, so wiring mistakes surface as 500/empty rather than a crash"

patterns-established:
  - "HTTP contract tests use httptest.NewRequest/NewRecorder against NewServer with a real Store in t.TempDir()"
  - "Key-set assertions on response JSON prove the PRD examples byte-for-byte on keys"

requirements-completed: [BE-03, BE-09, BE-18]

coverage:
  - id: D1
    description: "GET /health returns 200 {\"status\":\"ok\"} with Content-Type application/json"
    requirement: "BE-03"
    verification:
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestHealth"
        status: pass
      - kind: e2e
        ref: "curl -s http://127.0.0.1:43121/health -> {\"status\":\"ok\"}"
        status: pass
    human_judgment: false
  - id: D2
    description: "GET /v1/index returns every saved ID under items with url/filename/saved_at (empty object when nothing is saved)"
    requirement: "BE-09"
    verification:
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestIndexEmptyShape"
        status: pass
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestIndexAfterSave"
        status: pass
      - kind: e2e
        ref: "curl -s http://127.0.0.1:43121/v1/index -> items contains 123 with canonical url/filename/saved_at"
        status: pass
    human_judgment: false
  - id: D3
    description: "POST /v1/bookmarks returns 201 on save, 409 on duplicate, 400 on invalid payload, 500 on internal failure"
    requirement: "BE-18"
    verification:
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestSaveCreatedContract"
        status: pass
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestSaveDuplicateReturns409"
        status: pass
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestSaveInvalidRequestsReturn400"
        status: pass
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestSaveOversizedBodyReturns400"
        status: pass
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestInternalErrorReturns500"
        status: pass
      - kind: e2e
        ref: "first POST -> HTTP 201; same id into ai.csv -> HTTP 409 {\"status\":\"duplicate\",\"tweet_id\":\"123\"}"
        status: pass
    human_judgment: false
  - id: D4
    description: "Backend stores no categories or settings: unknown top-level/nested JSON fields are rejected and nothing but filename + tweet is accepted"
    requirement: "BE-18"
    verification:
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestSaveInvalidRequestsReturn400 (settings / category / quoted_text cases)"
        status: pass
    human_judgment: false
  - id: D5
    description: "Sane 404/405 handling and no wildcard CORS exposure"
    requirement: "BE-18"
    verification:
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestMethodNotAllowedAndNotFound"
        status: pass
      - kind: unit
        ref: "backend/internal/api/handlers_test.go#TestCORSOnlyForExtensionOrigins"
        status: pass
    human_judgment: false
  - id: D6
    description: "End-to-end server wiring: isolated HOME creates csv + index.json, serves all three routes, and drains on SIGINT"
    requirement: "BE-09"
    verification:
      - kind: e2e
        ref: "TMPHOME=$(mktemp -d); HOME=$TMPHOME /tmp/twbm-server ... kill -INT -> exit code 0; linux.csv + index.json present, ai.csv absent"
        status: pass
    human_judgment: false

# Metrics
duration: 7min
completed: 2026-09-27
status: complete
---

# Phase 1: Go Persistence Layer & HTTP API Summary

**Loopback HTTP API with strict JSON decoding and the exact 201/409/400/500 contract, wired end-to-end into a signal-draining server binary.**

## Performance

- **Duration:** 7 min
- **Started:** 2026-09-27T01:31:00Z
- **Completed:** 2026-09-27T01:38:00Z
- **Tasks:** 2
- **Files modified:** 4

## Accomplishments
- `api.NewServer` registers `GET /health`, `GET /v1/index`, `POST /v1/bookmarks` on a Go 1.22 `http.ServeMux` (method+path patterns ⇒ automatic 405 for wrong methods, 404 for unknown paths)
- `POST /v1/bookmarks` caps the body with `http.MaxBytesReader` (1 MiB), rejects unknown fields with `DisallowUnknownFields`, and maps typed storage errors to 409/400/500 exactly
- 201 body carries exactly `{status, tweet_id, url, filename, saved_at}`; 409 carries exactly `{status, tweet_id}`; `/v1/index` always returns a non-nil `items` object
- `/v1/bookmarks` accepts nothing but `filename` + `tweet`; `settings`, `category` and quoted-text fields are rejected with 400, proving the backend owns no extension state (PRD §4.3/§16)
- CORS echoes only `chrome-extension://` / `moz-extension://` origins and never returns `Access-Control-Allow-Origin: *`; arbitrary web origins get neither a grant nor a successful preflight
- Final `cmd/server/main.go` wiring verified by the isolated-HOME smoke test: health ok, first POST 201, cross-file duplicate 409, byte-exact header, index lists id 123, SIGINT exit 0

## Task Commits

Not committed by the executor — per the orchestrator's instructions the executor must not run `git`; the orchestrator commits plan artifacts.

## Files Created/Modified
- `backend/internal/api/server.go` — `NewServer`, `BookmarkStore`/`IndexReader` seams, extension-only CORS middleware
- `backend/internal/api/handlers.go` — `writeJSON`, health/index/save handlers, error→status mapping
- `backend/internal/api/handlers_test.go` — contract, validation table, oversize, 404/405, 500 stub, CORS, nil-safety
- `backend/cmd/server/main.go` — final wiring of index → store → API handler into the loopback server

## Decisions Made
- Interfaces at the API boundary keep handlers independent of the filesystem and make the 500 path a first-class test
- Oversized request bodies return 400, matching the plan's "Unknown fields / oversized bodies rejected with 400"
- CORS limited to browser-extension origins; the extension needs no wildcard, and exposing one would violate PRD §52's loopback-only intent
- `handleIndex` coerces a nil map to `{}` so the contract is stable for an empty store

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] `api.NewServer` accepts interfaces rather than `*storage.Store` / `*index.Index`**
- **Found during:** Task 1 (HTTP server + routes)
- **Issue:** With concrete types, the required 500-path test cannot inject an internal failure without a real filesystem fault, and nil wiring would panic.
- **Fix:** Added `BookmarkStore` and `IndexReader` interfaces; `main.go` still passes the concrete `*storage.Store` and `*index.Index`.
- **Files modified:** `backend/internal/api/server.go`, `backend/internal/api/handlers.go`
- **Verification:** `TestInternalErrorReturns500` and `TestServerHandlesNilDependenciesSafely` pass; smoke test unchanged.
- **Committed in:** n/a (orchestrator commits)

**2. [Rule 2 - Missing Critical] Extension-only CORS middleware added**
- **Found during:** Task 1 (HTTP server + routes)
- **Issue:** The plan said "add minimal CORS handling only if required … do not expose to arbitrary origins" without specifying behavior; MV3 service-worker fetches can send a preflight.
- **Fix:** Middleware echoes only `chrome-extension://`/`moz-extension://` origins, advertises GET/POST/OPTIONS, and answers extension preflights with 204.
- **Files modified:** `backend/internal/api/server.go`
- **Verification:** `TestCORSOnlyForExtensionOrigins` — arbitrary origin gets no ACAO and no 204.
- **Committed in:** n/a (orchestrator commits)

---

**Total deviations:** 2 auto-fixed (1 blocking, 1 missing critical)
**Impact on plan:** No scope creep; the observable HTTP contract is exactly as specified.

## Issues Encountered
None.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Phase 1 is complete: all 18 BE requirements are implemented and covered by 40 passing Go test functions under `-race`
- Phase 2/4 can target `http://127.0.0.1:43121` with the documented request/response shapes; no backend change is needed to add extension settings (they stay in `chrome.storage.local`)
- Residual note: the API intentionally does not persist anything the extension owns, so Phase 2 must not expect a category endpoint

---
*Phase: 01-go-persistence-layer*
*Completed: 2026-09-27*
