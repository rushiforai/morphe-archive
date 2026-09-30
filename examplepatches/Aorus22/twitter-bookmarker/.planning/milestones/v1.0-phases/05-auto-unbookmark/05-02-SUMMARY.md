---
phase: 05-auto-unbookmark
plan: 02
subsystem: ui
tags: [chrome-extension, content-script, settings-gate, invariant, toast, save-controller]

# Dependency graph
requires:
  - phase: 05-auto-unbookmark
    provides: "`unbookmarkTweet` verified trigger (plan 05-01)"
  - phase: 04-save-integration
    provides: save controller `201` branch, `onSaved` hook seam, toast system, `markTweetSaved`
provides:
  - "`createSavedHook` — the settings-gated post-success unbookmark hook in `content/index.ts`"
  - "`unbookmarkFailedToast` — the exact PRD §38 warning copy"
  - "Async-safe `onSaved` handling that releases the in-flight guard independently of the unbookmark await"
affects: [05-auto-unbookmark, 06-hardening-tests-docs]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
actuals:
  tokens: 6200
  tasks: 2
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Gate-first post-success hook: settings read before any native control is touched"
    - "Fire-and-forget async hook: ordering guarantees survive a ~2s destructive verification"

key-files:
  created:
    - extension/test/auto-unbookmark.test.mjs
  modified:
    - extension/src/content/index.ts
    - extension/src/content/save-controller.ts

key-decisions:
  - "The `unbookmarkAfterSave` gate lives in the `onSaved` hook in `index.ts` and returns before any DOM work when off"
  - "`onSaved` may return a promise, but the controller deliberately does not await it"
  - "A verification throw is treated like a `failed` verification: warn, never roll back, never rethrow"
  - "Bootstrap is guarded on `chrome` + `document` so `index.ts` is importable by `node --test`"

patterns-established:
  - "Invariant comment at the `201` branch documenting that the CSV-success → unbookmark-failure window never alters persisted state"
  - "Testable post-success hook factory injected with settings/unbookmark/toast deps"

requirements-completed: [UNB-03]

# Coverage metadata (#1602)
coverage:
  - id: D1
    description: "With `unbookmarkAfterSave=false` the hook returns before any bookmark-control interaction (no query, no observer, no click)"
    requirement: UNB-01
    verification:
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#unbookmarkAfterSave=false performs ZERO bookmark-control interaction (UNB-01)"
        status: pass
    human_judgment: false
  - id: D2
    description: "With `unbookmarkAfterSave=true` the hook invokes the unbookmark path exactly once and reads live settings so a mid-session toggle is honored"
    requirement: UNB-01
    verification:
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#unbookmarkAfterSave=true invokes the unbookmark path exactly once (UNB-01)"
        status: pass
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#the gate reads live settings, so a mid-session toggle is honored"
        status: pass
    human_judgment: false
  - id: D3
    description: "The hook is reachable only from the save controller's confirmed-`201` branch — `409` and every failure response never invoke it"
    requirement: UNB-01
    verification:
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#only a confirmed 201 invokes the post-success hook (UNB-01, PRD §41)"
        status: pass
      - kind: other
        ref: "grep: `options.onSaved(` appears once, inside `if (response.ok && response.result)` in src/content/save-controller.ts"
        status: pass
    human_judgment: false
  - id: D4
    description: "A `failed` (or throwing) verification emits exactly `Saved to <Category>, but failed to remove from X bookmarks` and leaves `✓ Saved`, the CSV, and the index intact"
    requirement: UNB-03
    verification:
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#a 'failed' verification emits the exact PRD §38 warning toast (UNB-03)"
        status: pass
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#201 + failed unbookmark keeps '✓ Saved' and the CSV success toast (UNB-03)"
        status: pass
    human_judgment: false
  - id: D5
    description: "Ordering across the await boundary: success toast precedes the warning, controls are never re-enabled, and the in-flight guard is released independently of a pending unbookmark"
    verification:
      - kind: unit
        ref: "test/auto-unbookmark.test.mjs#a pending unbookmark never holds the in-flight guard hostage"
        status: pass
    human_judgment: false
  - id: D6
    description: "Live matrix on a real x.com session: setting off leaves the tweet bookmarked; setting on removes it; a forced failure shows the warning while `linux.csv` keeps its row"
    requirement: UNB-03
    verification: []
    human_judgment: true
    rationale: "Browser-only end-to-end behavior (X's DOM, the real service worker, and a running Go backend) cannot be exercised by the Node fake-DOM suite."

# Metrics
duration: 25min
completed: 2026-09-27
status: complete
---

# Phase 5 Plan 02: Failure handling, warning toast, and invariant guards Summary

**Auto-unbookmark is gated in the `201`-only `onSaved` hook, verified, and invariant-safe: a failed removal warns with the exact PRD §38 copy while CSV, index, and `✓ Saved` stay untouched, and the in-flight guard is released without awaiting the destructive click.**

## Performance

- **Duration:** 25 min
- **Started:** 2026-09-27T01:34:00Z
- **Completed:** 2026-09-27T01:59:00Z
- **Tasks:** 2
- **Files modified:** 3 (2 source modified, 1 test created)

## Accomplishments
- Replaced the Phase 4 logged no-op `onSaved` in `content/index.ts` with `createSavedHook`: the `unbookmarkAfterSave` check is the first statement, so the setting off path touches nothing.
- On `"failed"` (or an unexpected throw) it emits `showToast("warning", "Saved to <Category>, but failed to remove from X bookmarks")` and changes nothing else.
- `content/save-controller.ts` now types `onSaved` as `void | Promise<void>` and fires it without awaiting, swallowing any rejection; `setSaved` and the success toast still run first, and `inFlight.delete` stays in `finally`.
- Added an invariant comment at the `201` branch: the window between CSV success and unbookmark failure must never alter persisted state.
- Guarded `bootstrap()` behind `typeof chrome !== "undefined" && typeof document !== "undefined"` so `index.ts` is safely importable under `node --test`.

## Task Commits

Each task was committed atomically:

_No commits were made — this run was explicitly prohibited from running any `git` command. All work is in the working tree._

## Files Created/Modified
- `extension/src/content/index.ts` — `createSavedHook`, `unbookmarkFailedToast`, gated `onSaved`, guarded bootstrap.
- `extension/src/content/save-controller.ts` — async-safe `onSaved` (fire-and-forget) + ordering/invariant comments.
- `extension/test/auto-unbookmark.test.mjs` — 8 tests: gate off/on, live settings, exact warning, throwing verification, `201`-only hook reachability (409 + 3 failure classes), end-to-end failed/successful removal, and guard release.

## Decisions Made
- **Gate in the hook, not the controller**: keeps `save-controller.ts` free of unbookmark policy and matches the PRD's single post-success seam.
- **Never await the hook in the controller**: a ~2 s verification must not delay `✓ Saved` or hold the in-flight guard; the plan's ordering requirement drove this.
- **Throw == failure**: an unexpected verification error produces the same warning toast rather than a silent skip, while never escaping.
- **Bootstrap guard instead of a test-only re-export shim**: keeps the production content script unchanged in behavior and makes the gate unit-testable.

## Deviations from Plan

**1. [Interface] `onSaved` return type widened to `void | Promise<void>`**
- **Found during:** Task 1 (gate + invoke)
- **Issue:** The hook is now async, and the controller needed to distinguish "returned a promise" from "returned nothing" to attach a rejection handler.
- **Fix:** Widened the hook type and added an explicit thenable check with a `.catch`.
- **Files modified:** `extension/src/content/save-controller.ts`
- **Verification:** `npm run typecheck` passes; existing SAVE tests unchanged and green.
- **Committed in:** n/a (no commits in this run)

**2. [Test seam] `createSavedHook` exported from `index.ts` + bootstrap guard**
- **Found during:** Task 1 verification
- **Issue:** The required gate tests must import the hook, but `index.ts` ran `bootstrap()` at module load.
- **Fix:** Extracted the hook into an exported factory and guarded bootstrap on the extension globals.
- **Verification:** `test/auto-unbookmark.test.mjs` imports `index.ts` with no page lifecycle or noisy warnings.
- **Committed in:** n/a (no commits in this run)

---

**Total deviations:** 2 auto-fixed (1 interface completeness, 1 testability)
**Impact on plan:** Both are additive and behavior-preserving; no PRD requirement was weakened.

## Issues Encountered
- The existing `save-controller.test.mjs` harness passes an `onSaved` that returns a number; the new thenable check must be robust to non-promise returns. Covered by the unchanged SAVE tests plus the new gate tests.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- Phase 5 requirements UNB-01..UNB-03 are implemented and unit-covered; full extension gate is green (`typecheck`, 136 tests, `build`, `verify`).
- Phase 6 owns the browser-only UAT checklist item (setting-off/on matrix with a live backend) and broader hardening.

---
*Phase: 05-auto-unbookmark*
*Completed: 2026-09-27*
