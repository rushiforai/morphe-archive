---
phase: 05-auto-unbookmark
plan: 01
subsystem: ui
tags: [chrome-extension, content-script, mutationobserver, dom, unbookmark, verification]

# Dependency graph
requires:
  - phase: 04-save-integration
    provides: save controller with the post-success `onSaved` hook, toast system, and container-scoped selectors
  - phase: 03-x-dom-integration
    provides: X selector cascade (`BOOKMARK_BUTTON` / `UNBOOKMARK_BUTTON`) and the tweet fixture DOM surface
provides:
  - "`unbookmarkTweet(article)` with typed `"removed" | "failed"` outcome"
  - "Scoped MutationObserver + ~2s timeout state-change verification (never click-only)"
  - "Fake-observer test seam and the Phase 5 unbookmark unit tests"
affects: [05-auto-unbookmark, 06-hardening-tests-docs]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
actuals:
  tokens: 4000
  tasks: 1
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Destructive DOM action returns a typed outcome, never throws, and is verified by observation"
    - "Structural dependency injection (observer/timer factories) instead of global MutationObserver coupling"

key-files:
  created:
    - extension/src/content/unbookmark.ts
    - extension/test/unbookmark.test.mjs
    - extension/test/helpers/fake-observer.mjs
  modified: []

key-decisions:
  - "Prefer the action bar as the control scope, then the article, so a moved control is still found"
  - "Treat `removeBookmark` -> `bookmark` OR article detach as the only positive success evidence; 'both controls gone' stays failure"
  - "Refuse to click an already-unbookmarked (`bookmark`) control, because clicking it would add a bookmark"
  - "Use plain `element.click()` and skip synthetic pointerdown/pointerup, to avoid any chance of a double toggle"

patterns-established:
  - "Verified destructive action: click + observe + timeout, with observer/timer cleanup in `finally`"
  - "`MutationObserverLike`/factory seam so Node fake-DOM tests need no browser globals"

requirements-completed: [UNB-01, UNB-02]

# Coverage metadata (#1602)
coverage:
  - id: D1
    description: "`unbookmarkTweet` locates the native bookmark control, refuses to click when not bookmarked, dispatches the native click, and reports `removed` only when the control flips to `[data-testid=\"bookmark\"]`"
    requirement: UNB-02
    verification:
      - kind: unit
        ref: "test/unbookmark.test.mjs#returns 'removed' when the control flips to the unbookmarked representation (UNB-02)"
        status: pass
      - kind: unit
        ref: "test/unbookmark.test.mjs#an already-unbookmarked tweet is never clicked and still reports 'removed'"
        status: pass
    human_judgment: false
  - id: D2
    description: "`unbookmarkTweet` reports `removed` when X detaches the article from the document, and `failed` after the ~2s deadline when nothing changes; the observer is disconnected and the timer cleared"
    requirement: UNB-02
    verification:
      - kind: unit
        ref: "test/unbookmark.test.mjs#returns 'removed' when the article detaches from the document (UNB-02)"
        status: pass
      - kind: unit
        ref: "test/unbookmark.test.mjs#returns 'failed' after the timeout when the state never changes (UNB-02)"
        status: pass
      - kind: unit
        ref: "test/unbookmark.test.mjs#the verification budget is the documented ~2s"
        status: pass
    human_judgment: false
  - id: D3
    description: "The module never throws into X's page: a missing control, a detached tweet, a throwing click, and a throwing observer all resolve a typed outcome"
    verification:
      - kind: unit
        ref: "test/unbookmark.test.mjs#a throwing native click resolves 'failed', disconnects, and never rejects"
        status: pass
      - kind: unit
        ref: "test/unbookmark.test.mjs#a tweet with no native bookmark control reports 'failed' without throwing"
        status: pass
    human_judgment: false
  - id: D4
    description: "Real X DOM behavior: the actual `removeBookmark` control responds to the synthetic click and the tweet leaves the /i/bookmarks timeline within ~2s"
    requirement: UNB-02
    verification: []
    human_judgment: true
    rationale: "Requires a live x.com session; the fake DOM cannot prove X's React handler accepts the synthetic click or how X mutates its DOM on unbookmark."

# Metrics
duration: 25min
completed: 2026-09-27
status: complete
---

# Phase 5 Plan 01: Native unbookmark trigger + state-change verification Summary

**`unbookmarkTweet` clicks X's native bookmark control and only reports success when a scoped MutationObserver (or the ~2s deadline) observes `removeBookmark` → `bookmark` or the row detaching — never on the click alone.**

## Performance

- **Duration:** 25 min
- **Started:** 2026-09-27T01:34:00Z
- **Completed:** 2026-09-27T01:59:00Z
- **Tasks:** 1
- **Files modified:** 3 (1 source created, 2 tests created)

## Accomplishments
- Added `content/unbookmark.ts` with `unbookmarkTweet(article): Promise<"removed" | "failed">`.
- Control discovery prefers the article's action bar, falling back to the article, via the existing selector cascade.
- Pre-click state is recorded and enforced: an already-unbookmarked tweet is never clicked (a click would re-bookmark it).
- Verification is observation-based (UNB-02): success requires the unbookmarked representation to appear or the article to detach; a click with no state change is `failed` after the deadline.
- Observer and timer are disconnected/cleared in `finally`; the function never throws and never rolls anything back.

## Task Commits

Each task was committed atomically:

_No commits were made — this run was explicitly prohibited from running any `git` command. All work is in the working tree._

## Files Created/Modified
- `extension/src/content/unbookmark.ts` — the trigger + verified state-change module.
- `extension/test/unbookmark.test.mjs` — 9 tests covering flip, detach, timeout, pre-click state, missing control, detached tweet, throwing click, throwing observer, and the timeout constant.
- `extension/test/helpers/fake-observer.mjs` — structural `MutationObserver` stand-in with on-demand trigger.

## Decisions Made
- **Action bar first, article second** for the control scope: keeps the lookup tweet-scoped while tolerating a moved control.
- **Positive evidence only**: `[data-testid="bookmark"]` present (and no `removeBookmark`) or `!article.isConnected`; "both gone" is not evidence and stays `failed`.
- **No pointer-event prelude**: dispatching synthetic `pointerdown`/`pointerup` risks double-handling on X; `.click()` is the native entry point the PRD asks for.
- **Timeout doubles as final verification**: the deadline callback re-evaluates state before settling `failed`, so the module is correct even when `MutationObserver` is unavailable.

## Deviations from Plan

**1. [Plan wording] Pointer/MouseEvent fallback omitted**
- **Found during:** Task 1 (unbookmark trigger)
- **Issue:** Plan 05-01 suggested "add `pointerdown`/`pointerup` + `MouseEvent` fallback if needed for X's handlers".
- **Fix:** Implemented a plain `element.click()`, matching the task brief's "dispatch a real click". Synthetic pointer events were judged a double-toggle risk with no PRD requirement.
- **Verification:** Unit tests assert exactly one click listener invocation; the built content bundle contains the unbookmark logic.
- **Committed in:** n/a (no commits in this run)

---

**Total deviations:** 1 (plan-wording simplification)
**Impact on plan:** No scope change; the observable contract (click + verified change) is unchanged.

## Issues Encountered
- The fake DOM has no `MutationObserver`, so the module took an injected observer/timer seam. This is now also the test seam, keeping the timeout test at ~10 ms.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- 05-02 wires this module into the `201`-only `onSaved` hook with the settings gate and warning toast.
- Residual browser-only UAT: confirm on a real `/i/bookmarks` tweet that the synthetic click removes the bookmark within ~2 s, and that clearance of the row is accepted as success.

---
*Phase: 05-auto-unbookmark*
*Completed: 2026-09-27*
