---
phase: 04-save-integration
plan: 02
subsystem: ui
tags: [chrome-mv3, content-script, state-machine, toast, aria-live, mutation-observer]

# Dependency graph
requires:
  - phase: 04-save-integration
    plan: 01
    provides: "typed SAVE_TWEET message + backend HTTP client behind the service worker"
  - phase: 03-x-dom-integration
    provides: "bookmark-page seams (setTweetSaving/markTweetSaved/isTweetSaved/refreshBookmarksPage), organizer labels, extractor"
provides:
  - "content/toast.ts: showToast(kind, message) with success/error/warning/info, stacking, ~3.5s auto-dismiss, click dismiss"
  - "content/save-controller.ts: createSaveController({ settings, onSaved, onExtractionError }) -> real onSelect"
  - "content/index.ts: wired controller + toast + onStoreChanged refresh, with a logged no-op onSaved for Phase 5"
affects: [05-auto-unbookmark, 06-hardening]

# Actuals (#2632)
actuals:
  tokens: 8556
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Per-tweet in-flight Set as the synchronous double-click guard"
    - "Dependency-injected toast/controller seams so both are unit-testable against the fake DOM"
    - "pointer-events: none container + pointer-events: auto toasts for click-through"

key-files:
  created:
    - extension/src/content/toast.ts
    - extension/src/content/save-controller.ts
    - extension/test/toast.test.mjs
    - extension/test/save-controller.test.mjs
  modified:
    - extension/src/content/index.ts

key-decisions:
  - "The controller always invokes onSaved after a confirmed 201 (SAVE-04); the settings.unbookmarkAfterSave gate lives in index.ts's no-op placeholder, which is where the unbookmark click will land in Phase 5"
  - "Extraction-failure toast is emitted by the controller; the onExtractionError hook is the logging/telemetry signal, while bookmark-page-level injection failures toast through the bootstrap handler — exactly one toast per event"
  - "settings is accepted by the controller but Phase 4 never branches on it (reserved for Phase 5)"

patterns-established:
  - "Save state machine: idle -> saving -> saved | idle, with the guard released in finally"
  - "No failure path ever unbookmarks, marks saved, or sends a partial record"

requirements-completed: [SAVE-03, SAVE-04, SAVE-05, SAVE-06, SAVE-07]

# Coverage metadata (#1602)
coverage:
  - id: D1
    description: "In-page toast system with success/error/warning/info states, stacking, ~3.5s auto-dismiss, click dismissal, aria-live=polite, fixed high z-index, and click-through outside the toasts"
    requirement: SAVE-07
    verification:
      - kind: unit
        ref: "test/toast.test.mjs#every kind maps to a distinct, complete state (SAVE-07)"
        status: pass
      - kind: unit
        ref: "test/toast.test.mjs#a shown toast carries the kind/state attributes, message, and styling (SAVE-07)"
        status: pass
      - kind: unit
        ref: "test/toast.test.mjs#each kind renders its mapped state"
        status: pass
      - kind: unit
        ref: "test/toast.test.mjs#toasts auto-dismiss after ~3.5s and the container is removed with the last one"
        status: pass
      - kind: unit
        ref: "test/toast.test.mjs#a click dismisses a toast immediately and cancels its auto-dismiss timer"
        status: pass
    human_judgment: false
  - id: D2
    description: "A category click disables the tweet's controls, shows Saving…, and a second click starts no second request (in-flight guard released in finally)"
    requirement: SAVE-03
    verification:
      - kind: unit
        ref: "test/save-controller.test.mjs#a click disables the controls synchronously and a second click starts no second request (SAVE-03)"
        status: pass
      - kind: unit
        ref: "test/save-controller.test.mjs#distinct tweets each get their own request"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#setSaving disables every control and restores them (PRD §35)"
        status: pass
    human_judgment: false
  - id: D3
    description: "201 marks the tweet saved in the local cache, renders ✓ Saved, shows 'Saved to <Category>', and invokes onSaved with the backend saved_at"
    requirement: SAVE-04
    verification:
      - kind: unit
        ref: "test/save-controller.test.mjs#201 marks saved, toasts the category name, and fires onSaved with snake_case-safe payload (SAVE-04)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#markTweetSaved updates the cache and renders ✓ Saved (Phase 4 seam)"
        status: pass
      - kind: integration
        ref: "node --input-type=module postBookmark against live /tmp/twbm-server -> kind 'saved'; CSV row appended with normalized URL, UTC saved_at, comma/emoji/newline text"
        status: pass
    human_judgment: false
  - id: D4
    description: "409 adds the tweet id to the cache, shows ✓ Saved plus the 'Already saved' info toast, appends nothing, and never unbookmarks"
    requirement: SAVE-06
    verification:
      - kind: unit
        ref: "test/save-controller.test.mjs#409 marks saved and shows the info toast without firing onSaved (SAVE-06)"
        status: pass
      - kind: integration
        ref: "curl -X POST duplicate -> 409; CSV row count unchanged (1 data row)"
        status: pass
    human_judgment: false
  - id: D5
    description: "A thrown sendExtensionMessage or backend_unavailable response restores controls, shows 'Backend unavailable', and never unbookmarks"
    requirement: SAVE-05
    verification:
      - kind: unit
        ref: "test/save-controller.test.mjs#a thrown sendExtensionMessage restores the controls and shows 'Backend unavailable' (SAVE-05)"
        status: pass
      - kind: unit
        ref: "test/save-controller.test.mjs#a resolved backend_unavailable response behaves like a thrown send (SAVE-05)"
        status: pass
      - kind: integration
        ref: "api.ts against a stopped backend -> saveError 'backend_unavailable'"
        status: pass
    human_judgment: false
  - id: D6
    description: "invalid_request / internal restore controls with 'Could not save tweet'; an extraction failure restores controls, signals onExtractionError, toasts 'Could not read tweet data', and sends no partial record"
    requirement: SAVE-07
    verification:
      - kind: unit
        ref: "test/save-controller.test.mjs#invalid_request and internal restore the controls and show 'Could not save tweet' (SAVE-07)"
        status: pass
      - kind: unit
        ref: "test/save-controller.test.mjs#an extraction failure restores the controls, toasts, and sends no partial record"
        status: pass
      - kind: unit
        ref: "test/save-controller.test.mjs#an extractor that throws is treated as an extraction failure, not a crash"
        status: pass
    human_judgment: false
  - id: D7
    description: "Toasts render and stack on the real x.com page without intercepting page clicks or disturbing X's layout"
    verification: []
    human_judgment: true
    rationale: "The DOM/aria/pointer-events contract is automated, but actual visual placement, no-layout-shift, and click-through on the live x.com bookmarks page require loading the unpacked extension in Chrome — not reproducible headlessly."

# Metrics
duration: ~6min
completed: 2026-09-27
status: complete
---

# Phase 4: Save Integration — Plan 02 Summary

**Clicking a category now runs a guarded per-tweet save state machine that disables the controls, sends one `SAVE_TWEET`, and lands on `✓ Saved` + a stacked toast for 201/409 while failures restore the controls with `Backend unavailable` / `Could not save tweet`.**

## Performance

- **Duration:** ~6 min
- **Started:** 2026-09-27T01:49:52Z (08:49:52 +07:00)
- **Completed:** 2026-09-27T01:55Z (08:55 +07:00)
- **Tasks:** 3
- **Files modified:** 5 (1 modified, 4 created)

## Accomplishments
- The PRD §60 primary flow is wired end to end: category click → `Saving…` → `SAVE_TWEET` → worker → backend, with the local `Set<TweetID>` cache updated only on a confirmed `201`/`409`.
- Double-click safety is layered: the organizer's per-button 400ms guard, the disabled state, and the controller's synchronous in-flight `Set` — a second click never starts a second request.
- All four failure classes are handled without side effects: nothing is unbookmarked, no partial record is sent, and the controls return to a usable state.
- The toast system speaks the exact PRD copy (`Saved to <Category>`, `Already saved`, `Backend unavailable`, `Could not save tweet`, `Could not read tweet data`) and exposes the warning state Phase 5 will use.
- `onStoreChanged` still refreshes live organizers and now also keeps the settings seam fresh for Phase 5.

## Task Commits

No git commands were run in this phase (explicit phase constraint), so there are no task commit hashes. Changes are staged in the working tree for the orchestrator to commit.

1. **Task 1: Toast system** — `src/content/toast.ts` (working tree, uncommitted)
2. **Task 2: Save state machine** — `src/content/save-controller.ts` (working tree, uncommitted)
3. **Task 3: Wire controller + index cache into bootstrap** — `src/content/index.ts` (working tree, uncommitted)

**Plan metadata:** not committed (git prohibited this phase)

## Files Created/Modified
- `extension/src/content/toast.ts` — injectable toast presenter, `TOAST_STATES` kind→state mapping, `TOAST_DISMISS_MS = 3500`, `showToast`/`dismissAllToasts`
- `extension/src/content/save-controller.ts` — `createSaveController`, save state machine, in-flight guard, extraction-failure path, `SavedTweetContext`
- `extension/src/content/index.ts` — real controller wired into `startBookmarksPage`, toast routing for extraction failures, settings seam, `onStoreChanged` refresh, logged no-op `onSaved`
- `extension/test/toast.test.mjs` — kind→state, stacking, styling, aria/pointer-events, auto-dismiss, click dismiss
- `extension/test/save-controller.test.mjs` — double-click guard, 201/409/unavailable/invalid/internal/extraction transitions

## Decisions Made
- **`onSaved` is invoked on every confirmed `201`**, matching SAVE-04's literal contract. The `unbookmarkAfterSave` gate lives in the `index.ts` placeholder (which logs and returns), so Phase 5 can add the click without reworking the controller.
- **Exactly one toast per extraction event.** Save-time failures toast inside the controller and signal `onExtractionError` for logs; injection-time failures (`bookmark-page`) toast through the bootstrap handler. The two handlers are named for their roles.
- **Click-through by construction.** The fixed container is `pointer-events: none` and each toast is `pointer-events: auto`, so only the toasts themselves can capture a click.

## Deviations from Plan

### Auto-fixed / intentional adjustments

**1. [Rule 2 - Missing critical] Settings gate moved to the placeholder hook**
- **Found during:** Task 2 (Save state machine)
- **Issue:** The plan suggested invoking `onSaved` only when `settings.unbookmarkAfterSave`; SAVE-04 requires the hook to be invoked after a confirmed `201`.
- **Fix:** The controller always invokes `onSaved` on `201`; `index.ts`'s placeholder records the save and notes the setting. The unbookmark decision remains Phase 5's.
- **Files modified:** `extension/src/content/save-controller.ts`, `extension/src/content/index.ts`
- **Verification:** `test/save-controller.test.mjs#201 marks saved, toasts the category name, and fires onSaved with snake_case-safe payload (SAVE-04)`
- **Committed in:** not committed (git prohibited)

**2. [Rule 1 - Small addition] Single-toast routing for extraction failures**
- **Found during:** Task 3 (Wire controller + index cache)
- **Issue:** Naively passing the toasting handler to both `bookmark-page` and the controller would double-toast a save-time extraction failure.
- **Fix:** The controller toasts and calls `onExtractionError` (log-only in the bootstrap); `bookmark-page` keeps a toasting handler for injection failures.
- **Files modified:** `extension/src/content/index.ts`
- **Verification:** `test/save-controller.test.mjs#an extraction failure restores the controls, toasts, and sends no partial record`
- **Committed in:** not committed (git prohibited)

**3. [Rule 3 - Blocking] Added controller/toast unit tests**
- **Found during:** Task 3 (Wire controller + index cache)
- **Issue:** The plan's verification was a manual browser matrix, leaving SAVE-03..SAVE-07 without executable proof.
- **Fix:** Injected stubbed sender/extractor/toast/DOM seams and covered every transition plus the double-click guard.
- **Files modified:** `extension/test/save-controller.test.mjs`, `extension/test/toast.test.mjs`
- **Verification:** 8 toast tests + 11 controller tests, all passing
- **Committed in:** not committed (git prohibited)

---

**Total deviations:** 3 (1 missing critical, 2 blocking)
**Impact on plan:** All deviations preserve the PRD contract and make the required behavior provable headlessly. No unbookmark, no rollback, and no Phase 6 hardening work was added.

## Issues Encountered
None that required resolution. The in-flight guard is synchronous by construction (the async body runs its `setSaving(true)` before the first `await`), so the "controls disabled immediately" assertion holds without a flush.

## User Setup Required
None — no external service configuration required.

## Next Phase Readiness
- `SavedTweetContext { article, tweetId, category, savedAt }` and the logged `onSaved` placeholder are the exact seam Phase 5 replaces with the verified native unbookmark click.
- The `warning` toast state is implemented and unused, ready for Phase 5's `Saved to <Category>, but failed to remove from X bookmarks`.
- Human UAT item D7 (real-browser toast rendering/click-through) remains to be confirmed when the unpacked extension is next loaded.
- No blockers.

---
*Phase: 04-save-integration*
*Completed: 2026-09-27*
