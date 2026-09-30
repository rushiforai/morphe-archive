---
phase: 02-extension-settings
plan: 03
subsystem: extension-ui
tags: [chrome-mv3, popup, settings, health-check, abortcontroller, storage-onchanged, bootstrap]

# Dependency graph
requires:
  - phase: 02-extension-settings (plan 01)
    provides: "shared/storage.ts getStore/setSettings/onStoreChanged, BACKEND_BASE_URL + HEALTH_TIMEOUT_MS constants"
  - phase: 02-extension-settings (plan 02)
    provides: "popup markup sections and the initX() -> { render(store) } module contract"
provides:
  - "Backend status row driven by GET /health with a 1.5s AbortController timeout and Retry"
  - "Persisted unbookmarkAfterSave toggle (default false) and Popover/Inline display mode (default popover)"
  - "Popup bootstrap wiring categories + settings + status and rerendering on chrome.storage.onChanged"
  - "onStoreChanged exported for the Phase 3 content script's live rerender"
affects: [03-x-dom-integration, 04-save-integration, 05-auto-unbookmark]

# Actuals — chars/4 over this plan's files (settings.ts, backend-status.ts, popup.ts).
actuals:
  tokens: 1689
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Health probe: AbortController + setTimeout, single catch, boolean result — never rejects"
    - "Segmented control as role=radiogroup with aria-checked, re-synced from storage on every change"
    - "Bootstrap subscribes to onStoreChanged before the first read so no update is missed"
    - "syncing flag keeps programmatic control updates from re-persisting"

key-files:
  created:
    - extension/src/popup/settings.ts
    - extension/src/popup/backend-status.ts
    - extension/src/popup/popup.ts
  modified: []

key-decisions:
  - "The popup performs the health fetch directly (extension page with host permission) rather than round-tripping through the service worker"
  - "Retry stays visible and is only disabled while a probe is in flight, so the state is always recoverable"
  - "bootstrap() wraps all init in try/catch and routes failures into the popup's inline error surface"
  - "onStoreChanged returns an unsubscribe function (superset of the required callback-only signature) for Phase 3 observers"

patterns-established:
  - "Every popup section exports initX() -> { render(store) }; popup.ts is the only place that binds them together"
  - "Network probes degrade to a boolean; nothing in the popup can produce an unhandled rejection"

requirements-completed: [EXT-02, EXT-08, EXT-09, EXT-10]

coverage:
  - id: D1
    description: "Backend status row shows Connected only on 200 {status:\"ok\"} from http://127.0.0.1:43121/health, Disconnected otherwise, with a 1.5s timeout and Retry"
    requirement: "EXT-02"
    verification:
      - kind: manual_procedural
        ref: "Load dist/ unpacked; with the Go server running the popup shows ● Connected, with it stopped ● Disconnected; Retry flips after starting the server (NOT RUN — no browser/backend available during this execution)"
        status: unknown
      - kind: other
        ref: "npm run verify — built popup bundle contains the health URL, /health path, 1500ms timeout, AbortController, and both settings keys; #backend-status/#backend-retry/.status-text exist in popup.html"
        status: pass
    human_judgment: true
    rationale: "The probe's request shape and the rendered states are statically verified, but confirming ● Connected/● Disconnected and Retry against a real (and really stopped) localhost server requires loading the extension in Chrome — the Go backend is owned by another agent and was not running during this execution, so this manual check was not performed."
  - id: D2
    description: "unbookmarkAfterSave toggle persists with default false and survives popup close/reopen"
    requirement: "EXT-08"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#setSettings merges partial updates over the defaults"
        status: pass
      - kind: unit
        ref: "test/storage-chrome.test.mjs#first run yields PRD defaults under the single storage key"
        status: pass
      - kind: other
        ref: "npm run verify — popup markup contains 'Unbookmark after save' (#setting-unbookmark)"
        status: pass
    human_judgment: false
  - id: D3
    description: "displayMode Popover/Inline persists with default popover and reflects the stored value on open"
    requirement: "EXT-09"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#setSettings merges partial updates over the defaults"
        status: pass
      - kind: unit
        ref: "test/storage.test.mjs#normalizeDisplayMode and normalizeColor clamp to valid values"
        status: pass
      - kind: other
        ref: "npm run verify — popup markup contains Popover/Inline (.segmented-option) hooks"
        status: pass
    human_judgment: false
  - id: D4
    description: "onStoreChanged wraps chrome.storage.onChanged filtered to the local area and only the store key; popup rerenders on it; unsubscribe works"
    requirement: "EXT-10"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#onStoreChanged fires only for the local area and only for the store key"
        status: pass
      - kind: other
        ref: "npm run verify — built popup bundle calls onStoreChanged(render) in the bootstrap"
        status: pass
    human_judgment: true
    rationale: "The hook and the popup's subscription are proven, but EXT-10's end-to-end promise (existing in-page controls rerender without a tab reload) is only fulfilled once the Phase 3 content script consumes the hook — UAT must confirm it in Phase 3."
  - id: D5
    description: "Popup opens with categories + settings + backend status rendered together and no console errors"
    requirement: "EXT-02"
    verification:
      - kind: other
        ref: "npm run verify — all required element ids/classes exist; popup bundle is a single iife; no ESM syntax leakage"
        status: pass
    human_judgment: true
    rationale: "Requires loading dist/ in Chrome and observing the popup console; static wiring checks cannot substitute for a real render."

# Metrics
duration: 8min
completed: 2026-09-27
status: complete
---

# Phase 2: Extension Foundation & Settings Popup — Plan 03 Summary

**Popup settings and status layer: a timeout-guarded `GET /health` probe with Retry, persisted auto-unbookmark and Popover/Inline controls with PRD defaults, and a bootstrap that rerenders the popup from `chrome.storage.onChanged` without a reload.**

## Performance

- **Duration:** ~8 min (plans 02-01..02-03 were executed together in one sequential pass)
- **Started:** 2026-09-27T01:30:00Z
- **Completed:** 2026-09-27T01:37:00Z
- **Tasks:** 3
- **Files modified:** 3 created

## Accomplishments
- `backend-status.ts` probes `${BACKEND_BASE_URL}/health` with `AbortController` + a 1500 ms timer and renders `● Connected` only for `200 {"status":"ok"}`; every failure path (non-200, bad JSON, abort, network error) collapses to `● Disconnected` and never rejects. Retry re-runs the probe and disables itself only while checking.
- `settings.ts` binds the auto-unbookmark switch and the Popover/Inline radiogroup to `setSettings`, and re-syncs both from the store so an external change (or a reset) is reflected.
- `popup.ts` is the single popup entry: it subscribes to `onStoreChanged` *before* the first `getStore()` read, renders categories + settings, and kicks off the health check — all inside a try/catch that funnels failures into the popup's inline error surface.
- The extension never auto-starts the backend; there is no launch affordance anywhere in the popup.
- `onStoreChanged` is exported from `shared/storage.ts` and covered by a test that proves `sync`-area changes and unrelated keys are ignored and that unsubscribe works — the Phase 3 content script can use it as-is.

## Task Commits

No commits were made — this execution was explicitly forbidden from running any `git` command.

**Plan metadata:** not committed (git out of scope).

## Files Created/Modified
- `extension/src/popup/backend-status.ts` — `healthUrl()`, `probeBackend()`, and the Connected/Disconnected/Retry UI
- `extension/src/popup/settings.ts` — unbookmark switch + display-mode segmented control bound to storage
- `extension/src/popup/popup.ts` — popup bootstrap and the only place the sections are wired together

## Decisions Made
- **Popup-side health probe**: the popup is an extension page that holds the localhost host permission, so a direct `fetch` is simpler and more observable than a worker round-trip; the service worker's `HEALTH_CHECK` contract still exists for Phase 3/4 use.
- **Boolean probe contract**: `probeBackend()` returns `Promise<boolean>` and swallows everything, which is what makes "no unhandled rejections" structurally true rather than merely tested.
- **Subscribe-before-read**: `onStoreChanged(render)` is registered before the initial `getStore()`, so a change landing during popup startup cannot be lost.
- **Retry always visible**: hidden-only-when-disconnected was rejected so the user can re-probe a backend that has just come up.

## Deviations from Plan

None — plan executed as written.

## Issues Encountered
- None.

## User Setup Required
None.

## Next Phase Readiness
- Phase 3 (content script) can import `onStoreChanged`, `getStore`, and the `Category`/`Settings` types directly; the store subscription it needs already exists and is unit-tested.
- Phase 4 replaces the service worker's `not_implemented` replies with the HTTP client; the `HEALTH_CHECK | GET_SAVED_INDEX | SAVE_TWEET` contract and response types are already frozen, and `BACKEND_BASE_URL`/`HEALTH_PATH`/`HEALTH_TIMEOUT_MS` are shared constants.
- Remaining manual UAT for Phase 2: load `extension/dist` unpacked in Chrome, confirm the popup renders with no console errors, exercise add/rename/color/delete/drag and reopen the popup, toggle both settings, and watch the status row flip as the Go server starts and stops.
- No blockers.

---
*Phase: 02-extension-settings*
*Completed: 2026-09-27*
