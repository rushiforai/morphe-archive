---
phase: 04-save-integration
plan: 01
subsystem: api
tags: [chrome-mv3, service-worker, fetch, typed-messaging, abort-controller, backend-http]

# Dependency graph
requires:
  - phase: 02-extension-foundation
    provides: shared/messages.ts contract, BACKEND_BASE_URL/HEALTH_PATH/HEALTH_TIMEOUT_MS, shared domain types
  - phase: 03-x-dom-integration
    provides: content-side saved-index loader (loadSavedIndexFromServiceWorker) that consumes GetSavedIndexResponse
provides:
  - "shared/api.ts: checkHealth / fetchSavedIndex / postBookmark with BackendUnavailableError + BackendRequestError"
  - "service-worker.ts: real HEALTH_CHECK / GET_SAVED_INDEX / SAVE_TWEET router (stateless, never throws)"
  - "shared/messages.ts: BgError union + savedIndexToSet helper"
affects: [05-auto-unbookmark, 06-hardening]

# Actuals (#2632)
actuals:
  tokens: 6468
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Single network surface: only the service worker imports shared/api.ts"
    - "Sentinel error classes normalized onto a BgError union for the message boundary"

key-files:
  created:
    - extension/src/shared/api.ts
    - extension/test/api.test.mjs
    - extension/test/service-worker.test.mjs
  modified:
    - extension/src/shared/messages.ts
    - extension/src/background/service-worker.ts

key-decisions:
  - "Kept error?: string on the response interfaces (prompt constraint: do not change response shapes); BgError is exported and is the only value the worker ever writes"
  - "Async message handling: listener returns true and answers via sendResponse; a defensive rejection path still answers a typed response"
  - "10s timeout on /v1/index and /v1/bookmarks (plan only specified the 1.5s health timeout) so a hung request cannot wedge the saving UI"

patterns-established:
  - "Transport failures become values, not rejections: the worker resolves { ok:false, error:'backend_unavailable' }"
  - "Status mapping has one home: 400 -> invalid_request, other non-2xx -> internal, transport -> backend_unavailable"

requirements-completed: [SAVE-01, SAVE-02]

# Coverage metadata (#1602)
coverage:
  - id: D1
    description: "Service worker answers HEALTH_CHECK / GET_SAVED_INDEX / SAVE_TWEET with real backend HTTP and the documented response shapes, and never throws out of the listener"
    requirement: SAVE-02
    verification:
      - kind: unit
        ref: "test/service-worker.test.mjs#HEALTH_CHECK resolves { ok, connected } from GET /health"
        status: pass
      - kind: unit
        ref: "test/service-worker.test.mjs#SAVE_TWEET forwards the payload and resolves 201/409/5xx to typed shapes"
        status: pass
      - kind: unit
        ref: "test/service-worker.test.mjs#GET_SAVED_INDEX resolves a typed backend_unavailable failure instead of throwing"
        status: pass
      - kind: unit
        ref: "test/service-worker.test.mjs#an unknown message is ignored (returns false, sends nothing)"
        status: pass
    human_judgment: false
  - id: D2
    description: "shared/api.ts maps every backend outcome to saved / duplicate / backend_unavailable / invalid_request / internal"
    requirement: SAVE-02
    verification:
      - kind: unit
        ref: "test/api.test.mjs#201 maps to kind:'saved' and posts a JSON body"
        status: pass
      - kind: unit
        ref: "test/api.test.mjs#409 maps to kind:'duplicate'"
        status: pass
      - kind: unit
        ref: "test/api.test.mjs#400 maps to invalid_request"
        status: pass
      - kind: unit
        ref: "test/api.test.mjs#5xx maps to internal"
        status: pass
      - kind: unit
        ref: "test/api.test.mjs#network failure and abort map to backend_unavailable"
        status: pass
      - kind: integration
        ref: "node --input-type=module -e 'import { checkHealth, fetchSavedIndex, postBookmark } from \"./src/shared/api.ts\"' against a live /tmp/twbm-server -> {health:true, saved:'saved', duplicate:'duplicate', indexKeys:['123456']}; after SIGINT -> {health:false, saveError:'backend_unavailable'}"
        status: pass
    human_judgment: false
  - id: D3
    description: "The content script only sends typed extension messages; no backend fetch or backend URL exists anywhere under src/content, and the built content bundle is clean of both"
    requirement: SAVE-01
    verification:
      - kind: unit
        ref: "test/bookmark-page.test.mjs#loadSavedIndexFromServiceWorker tolerates ok:false and thrown messages"
        status: pass
      - kind: other
        ref: "grep -rn \"fetch(\" src/content -> no matches; grep -rn \"127.0.0.1\\|43121\" src/content -> no matches"
        status: pass
      - kind: other
        ref: "npm run build && grep -c 127.0.0.1 dist/background/service-worker.js -> 1, grep of dist/content/content.js -> clean"
        status: pass
    human_judgment: false

# Metrics
duration: ~6min
completed: 2026-09-27
status: complete
---

# Phase 4: Save Integration — Plan 01 Summary

**Service worker became the extension's single backend HTTP client: typed `HEALTH_CHECK` / `GET_SAVED_INDEX` / `SAVE_TWEET` messages now drive real `GET /health`, `GET /v1/index`, and `POST /v1/bookmarks` calls with every failure normalized to `backend_unavailable` / `invalid_request` / `internal`.**

## Performance

- **Duration:** ~6 min
- **Started:** 2026-09-27T01:49:52Z (08:49:52 +07:00)
- **Completed:** 2026-09-27T01:55Z (08:55 +07:00)
- **Tasks:** 3
- **Files modified:** 5 (2 modified, 3 created)

## Accomplishments
- `shared/api.ts` is the only module in the extension that calls `fetch`; `checkHealth`, `fetchSavedIndex`, and `postBookmark` implement the full status mapping and raise typed sentinel errors.
- The service worker's three `not_implemented` stubs are now real async handlers; the listener keeps the channel open with `return true`, answers every message with a documented shape, and cannot throw into `chrome.runtime.onMessage`.
- `chrome.runtime.onInstalled` logging is preserved; the worker holds no state, so the per-page saved cache stays in the content script (PRD §34).
- Content-side proof of SAVE-01/02 is mechanical: no `fetch(` and no backend URL under `src/content`, and after `npm run build` only `dist/background/service-worker.js` contains the backend origin.

## Task Commits

No git commands were run in this phase (explicit phase constraint), so there are no task commit hashes. Changes are staged in the working tree for the orchestrator to commit.

1. **Task 1: Reuse the Phase 2 message protocol** — `src/shared/messages.ts` (working tree, uncommitted)
2. **Task 2: Backend HTTP client** — `src/shared/api.ts` (working tree, uncommitted)
3. **Task 3: Service worker message router** — `src/background/service-worker.ts` (working tree, uncommitted)

**Plan metadata:** not committed (git prohibited this phase)

## Files Created/Modified
- `extension/src/shared/api.ts` — `checkHealth` / `fetchSavedIndex` / `postBookmark`, `BackendUnavailableError`, `BackendRequestError`, `bgErrorFrom`, `REQUEST_TIMEOUT_MS`
- `extension/src/background/service-worker.ts` — real async message router with `handleMessage` and a defensive response path
- `extension/src/shared/messages.ts` — added `BgError` union, `savedIndexToSet` helper, and a clearer `sendExtensionMessage` throw contract
- `extension/test/api.test.mjs` — stubbed-`fetch` coverage of every status mapping plus `savedIndexToSet`
- `extension/test/service-worker.test.mjs` — stubbed `chrome.runtime` + `fetch` coverage of the router, including transport failure

## Decisions Made
- **`error` stays a `string` in the response interfaces.** The plan suggested narrowing it to `BgError`; the phase brief forbids changing response shapes, so `BgError` is exported for internal use and the worker only ever writes its members.
- **Async channel via `return true`.** Correct MV3 pattern for a promise-backed `sendResponse`; a second defensive branch answers `{ ok:false, index:null, error:"internal" }` if `handleMessage` ever rejects.
- **Request timeouts beyond health.** Added a 10s ceiling for index/save so a wedged request cannot leave controls disabled forever (abort → `backend_unavailable`).

## Deviations from Plan

### Auto-fixed / intentional adjustments

**1. [Rule 2 - Missing critical] Added a 10s timeout to index/save requests**
- **Found during:** Task 2 (Backend HTTP client)
- **Issue:** The plan only specified the health timeout; a hung `/v1/bookmarks` would leave the tweet permanently in `Saving…`.
- **Fix:** `REQUEST_TIMEOUT_MS = 10_000` with an `AbortController`, mapped to `backend_unavailable`.
- **Files modified:** `extension/src/shared/api.ts`
- **Verification:** `test/api.test.mjs#network failure and abort map to backend_unavailable`
- **Committed in:** not committed (git prohibited)

**2. [Rule 3 - Blocking] Added an automated service-worker test instead of a manual load-unpacked check**
- **Found during:** Task 3 (Service worker message router)
- **Issue:** The plan's verification ("load unpacked") cannot run headlessly; SAVE-01/02 would have no executable proof.
- **Fix:** Stubbed `globalThis.chrome` and `globalThis.fetch`, dynamically imported the worker, and asserted the router's responses.
- **Files modified:** `extension/test/service-worker.test.mjs`
- **Verification:** 5 passing tests in `test/service-worker.test.mjs`
- **Committed in:** not committed (git prohibited)

**3. [Rule 1 - Small addition] `savedIndexToSet` helper**
- **Found during:** Task 1 (Reuse the Phase 2 message protocol)
- **Issue:** The conversion from `GetSavedIndexResponse` to `Set<string>` existed inline in `bookmark-page.ts`.
- **Fix:** Added the typed helper in `messages.ts`; `bookmark-page.ts` keeps its existing (logging) behavior to avoid churn in a passing Phase 3 module.
- **Files modified:** `extension/src/shared/messages.ts`
- **Verification:** `test/api.test.mjs#savedIndexToSet degrades a failed index to an empty Set`
- **Committed in:** not committed (git prohibited)

---

**Total deviations:** 3 (1 missing critical, 1 blocking, 1 small addition)
**Impact on plan:** No scope creep — all three protect correctness or make a required proof executable. Response shapes and the Phase 2 contract are untouched.

## Issues Encountered
None. `npm run typecheck`, `npm test`, `npm run build`, and `npm run verify` are green; the live-backend integration run confirmed the real status mapping.

## User Setup Required
None — no external service configuration required.

## Next Phase Readiness
- `shared/api.ts` and the worker are stable seams for Phase 5, which only needs to consume the `onSaved` hook on the content side (no worker change required).
- `bgErrorFrom` means any new backend endpoint can be added without inventing new error plumbing.
- No blockers.

---
*Phase: 04-save-integration*
*Completed: 2026-09-27*
