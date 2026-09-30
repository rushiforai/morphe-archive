---
phase: 06-hardening
plan: 02
subsystem: testing
tags: [typescript, mutationobserver, dom-hardening, node-test, fake-dom, manual-testing, index-refresh, spa]

# Dependency graph
requires:
  - phase: 06-hardening
    provides: "06-01 backend acceptance/CSV/index/concurrency/process suite (TEST-01..TEST-04), left untouched"
provides:
  - "extension/src/content/hardening.ts: resilient MutationObserver wrapper (re-arm + reschedule), coalescing saved-index refresher, bounded route-leave cleanup"
  - "Hardening guards wired into the live paths: startBookmarksPage, refreshSavedIndexIfStale, stopBookmarksPage, content bootstrap onSaved"
  - "extension/test/hardening.test.mjs: 11 new tests (147 total) for DOM replacement re-injection, observer survival, bounded cleanup, index retry"
  - "docs/MANUAL-TEST-CHECKLIST.md: executable PRD §68 checklist with steps, expected observations and disk inspections"
affects: [phase-6, phase-3, phase-4, phase-5, verify-work]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
# Estimated chars/4 over the realized diff (git is prohibited, so no exact diff).
actuals:
  tokens: 14600
  tasks: 3
  commits: 0

tech-stack:
  added:
    - "No new dependency: the existing dependency-free fake DOM (test/helpers/fake-dom.mjs) is reused"
  patterns:
    - "Observation-preserving observer wrapper: contain throw -> disconnect/re-observe every target -> reschedule a sweep"
    - "Stale-tracked coalescing fetch: concurrent callers share one in-flight promise; a failed load keeps the value stale for exactly one later retry"
    - "Bounded cleanup: one synchronous pass, every named step attempted, per-step failures reported instead of aborting"
    - "Error paths exercised under node --test with console.warn silenced at file scope"

key-files:
  created:
    - extension/src/content/hardening.ts
    - extension/test/hardening.test.mjs
    - docs/MANUAL-TEST-CHECKLIST.md
  modified:
    - extension/src/content/bookmark-page.ts
    - extension/src/content/index.ts

key-decisions:
  - "hardening.ts stays dependency-free and fully injectable so the fake DOM under `node --test` runs the same code as the browser (no cycle with bookmark-page.ts)"
  - "handleMutations no longer carries its own try/catch: the resilient wrapper is now the load-bearing guard, which contains the throw, re-arms observation and reschedules the sweep (so the wrapper is not dead code)"
  - "Added the strict loader fetchSavedIndex() as the page default so a failed entry fetch is distinguishable from an empty index and stays stale; the lenient, never-throwing loadSavedIndexFromServiceWorker() is retained (public + tested) for callers that cannot handle a rejection"
  - "The 'backend became available' retry is wired to onSaved (a confirmed 201 proves reachability) instead of a timer or a per-save fetch; refreshIfStale is a no-op when the entry fetch already succeeded"
  - "Route-leave now also dismisses toasts; previously they were left to auto-dismiss"
  - "Actuals are an estimate: the executor is prohibited from running git, so chars/4 is computed from new-file sizes plus an estimate of the modified-file delta"

patterns-established:
  - "Guard naming/API shape: createResilientObserver / createSavedIndexRefresher / runBoundedCleanup are reusable, injectable and unit-testable in isolation"
  - "Every new guard has both a direct unit test and an integration assertion through startBookmarksPage"
  - "Manual test checklist rows carry Layer (Backend vs Browser), exact commands, expected observation and the on-disk inspection"

requirements-completed: [TEST-05]

coverage:
  - id: D1
    description: "hardening.ts adds an observer-level resilience wrapper (contain throw, re-arm every observed target, reschedule the debounced sweep) and it is wired into the single page observer"
    requirement: "TEST-05"
    verification:
      - kind: unit
        ref: "extension/test/hardening.test.mjs#createResilientObserver re-arms and keeps delivering after a callback throw"
        status: pass
      - kind: integration
        ref: "extension/test/hardening.test.mjs#the page observer survives a throwing mutation callback and reschedules a sweep"
        status: pass
    human_judgment: false
  - id: D2
    description: "Coalescing saved-index refresher plus refreshSavedIndexIfStale(): one index GET per page entry, still stale after a failed fetch, exactly one retry once the backend is confirmed (onSaved), never per tweet"
    requirement: "TEST-05"
    verification:
      - kind: unit
        ref: "extension/test/hardening.test.mjs#createSavedIndexRefresher coalesces concurrent fetches and remembers freshness"
        status: pass
      - kind: unit
        ref: "extension/test/hardening.test.mjs#a failed saved-index fetch stays stale for exactly one retry"
        status: pass
      - kind: integration
        ref: "extension/test/hardening.test.mjs#a stale saved index is re-fetched exactly once once the backend is confirmed (PRD §54)"
        status: pass
    human_judgment: false
  - id: D3
    description: "Bounded route-leave cleanup (disconnect observer, clear sweep timer, remove roots + markers, dismiss toasts, clear saved cache); a throwing step never blocks the remaining steps"
    requirement: "TEST-05"
    verification:
      - kind: unit
        ref: "extension/test/hardening.test.mjs#runBoundedCleanup attempts every step and reports failures"
        status: pass
      - kind: integration
        ref: "extension/test/hardening.test.mjs#route-leave cleanup removes every injected root, marker, and toast"
        status: pass
      - kind: integration
        ref: "extension/test/hardening.test.mjs#a throwing cleanup step never blocks the remaining teardown"
        status: pass
    human_judgment: false
  - id: D4
    description: "DOM-replacement re-injection: an X-replaced fresh article node (same tweet id) gets controls again exactly once, and re-announcement never double-injects"
    requirement: "TEST-05"
    verification:
      - kind: unit
        ref: "extension/test/hardening.test.mjs#DOM replacement: a fresh article node gets controls again exactly once (PRD §64)"
        status: pass
    human_judgment: false
  - id: D5
    description: "docs/MANUAL-TEST-CHECKLIST.md covers every PRD §68 scenario plus the extra hardening, popup, toast and live-reorder scenarios with exact steps, expected observations and disk inspections"
    verification:
      - kind: manual_procedural
        ref: "docs/MANUAL-TEST-CHECKLIST.md (A1-A5, B1-B8, C1-C4, D1-D3, E1)"
        status: unknown
    human_judgment: true
    rationale: "These scenarios require a signed-in X account and real X DOM/SPA behavior in Chrome; automation cannot observe the rendered page, native bookmark control, or popup live reorder."

# Metrics
duration: 14min
completed: 2026-09-27
status: complete
---

# Phase 6: [Hardening, Tests & Docs] Summary

**Extension hardening guards (resilient observer, coalescing index retry, bounded route-leave cleanup) wired into the live page lifecycle, locked by 11 new fake-DOM tests (147 total) plus an executable PRD §68 manual checklist**

## Performance

- **Duration:** ~14 min
- **Started:** 2026-09-27T08:58:00+07:00
- **Completed:** 2026-09-27T09:12:00+07:00
- **Tasks:** 3
- **Files modified:** 5 (3 created, 2 modified)

## Accomplishments
- `extension/src/content/hardening.ts`: three dependency-free, injectable guards — `createResilientObserver` (contain a callback throw, disconnect/re-observe every target, reschedule a sweep), `createSavedIndexRefresher` (coalesced fetch, stale-on-failure, exactly one retry per recovery), and `runBoundedCleanup` (one pass, every step attempted, per-step failure report).
- Wired the guards into the real paths: `startBookmarksPage` now builds the page observer through `createResilientObserver` and fetches the index through the refresher; `handleMutations` delegates its guard to the wrapper; `stopBookmarksPage` tears down via `runBoundedCleanup` and now dismisses toasts; `refreshSavedIndexIfStale` is called from the content bootstrap's `onSaved` (a confirmed `201` is the backend-availability signal).
- `extension/test/hardening.test.mjs`: 11 new tests — direct unit coverage of all three guards plus integration coverage of fresh-node DOM replacement, observer survival with reschedule, root+toast cleanup, a throwing cleanup step, and the stale-index retry flipping an injected control to `✓ Saved`.
- `docs/MANUAL-TEST-CHECKLIST.md`: 22 scenarios (A1–A5 backend/save, B1–B8 popup/index/reload, C1–C4 CSV edge cases, D1–D3 SPA/scroll/re-render, E1 toasts) each with layer, exact steps, expected observation and on-disk inspection commands.

## Task Commits

No commits were made: the executor is explicitly prohibited from running any `git` command. All files are present in the working tree only.

**Plan metadata:** not committed (git prohibited for this plan).

## Files Created/Modified
- `extension/src/content/hardening.ts` - Resilient observer wrapper, coalescing saved-index refresher, bounded cleanup.
- `extension/src/content/bookmark-page.ts` - Wired the three guards into start/stop/refresh; added `fetchSavedIndex()` + `refreshSavedIndexIfStale()`; `handleMutations` now runs behind the resilient wrapper.
- `extension/src/content/index.ts` - `onSaved` now fires the stale-gated index retry after a confirmed `201`.
- `extension/test/hardening.test.mjs` - 11 guard unit + integration tests.
- `docs/MANUAL-TEST-CHECKLIST.md` - Executable PRD §68 + hardening checklist.

## Decisions Made
- **Wrapper made load-bearing.** `handleMutations` previously had its own `try/catch`, which would have made the new wrapper cosmetic. The inner catch was removed; the wrapper's `onError` logs and its `onReschedule` re-arms observation and schedules the debounced sweep. The existing "one bad tweet cannot kill observation" test (a per-article throw, caught earlier in `processArticle`) still passes unchanged.
- **Strict vs lenient index loader.** The default page loader is now `fetchSavedIndex()`, which throws when `/v1/index` is unavailable. That is what lets the refresher distinguish "empty index" from "fetch failed" and stay stale. The lenient `loadSavedIndexFromServiceWorker()` remains exported and tested for callers that must never see a throw.
- **Recovery trigger.** `refreshIfStale()` is invoked at page entry (stale initially) and from `onSaved` (backend proven reachable). If entry succeeded it is a no-op, so the normal path costs zero extra requests and the recovery path costs exactly one.
- **No new dependency.** The existing lightweight fake DOM was sufficient; `jsdom` was not added.

## Deviations from Plan

### Auto-fixed Issues / Plan adjustments

**1. [Rule 3 - Path convention] Tests live in `extension/test/`, not `extension/tests/`**
- **Found during:** Task 1.
- **Issue:** The plan's `files_modified` listed `extension/tests/extractor.test.mjs`, `slug.test.mjs`, `dom-harness.mjs`, but the repository convention (and the executor prompt) is `extension/test/*.test.mjs`; `package.json` runs `node --test "test/*.test.mjs"`.
- **Fix:** Added `extension/test/hardening.test.mjs`; reused `test/helpers/fake-dom.mjs` instead of creating `dom-harness.mjs`.
- **Verification:** `npm test` -> 147 pass / 0 fail.

**2. [Rule 2 - Missing critical] Added the strict loader + retry wiring for the index-refresh guard**
- **Found during:** Task 2.
- **Issue:** The plan asked for an index-refresh helper but did not specify how a failed entry fetch would be detected; the existing lenient loader returns an empty Set on failure, which the refresher would have marked as fresh, defeating the retry.
- **Fix:** Added `fetchSavedIndex()` (throws on failure) as the default and `refreshSavedIndexIfStale()`; wired the retry into `onSaved`.
- **Verification:** `extension/test/hardening.test.mjs#a stale saved index is re-fetched exactly once once the backend is confirmed (PRD §54)`.

**3. [Rule 1 - Coverage gap] Added the fresh-node DOM-replacement test the plan implied but the existing suite only covered for a surviving container**
- **Found during:** Task 1.
- **Fix:** `DOM replacement: a fresh article node gets controls again exactly once (PRD §64)` proves the marker is read from the current node (a tweet-id WeakSet would wrongly suppress re-injection).
- **Verification:** test passes.

---

**Total deviations:** 3 auto-fixed (1 path convention, 1 missing critical, 1 coverage gap).
**Impact on plan:** No production behavior regressed; the plan's Task 1 extractor/slug/double-click coverage already existed from Phases 3–5 (the 136 pre-existing tests), so no duplicate tests were written.

## Issues Encountered
- The 11 new tests deliberately drive error paths, so the guards emitted `console.warn` stack traces during the run; `console.warn` is silenced at file scope in the test file so failures remain readable. No assertions were weakened.
- `pgrep` cannot be trusted to prove no server is running (its own command line matches the pattern); port `43121` being free (`ss -ltn`) is the check used instead.

## Verification Results

```bash
cd "/home/aorus/Project/Twitter Bookmarker/tw-bookmarker-extension/extension"
npm run typecheck    # tsc --noEmit — clean
npm test             # tests 147 | pass 147 | fail 0 | skipped 0
npm run build        # dist/background, dist/content (53.6kb), dist/popup
```

Before this plan: 136 tests. After: **147** (11 new). No pre-existing test changed.

## Automation Limits (report honestly)
- The brittle parts of X's real DOM (actual article recycling, real click of the native bookmark control, popup drag reorder, toast pointer-events on a live page) cannot be proven here. They are enumerated as manual-only in `docs/MANUAL-TEST-CHECKLIST.md` (D1–D3, E1, B6) and are **not** claimed as verified.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- TEST-05 is satisfied: hardening scenarios for SPA navigation, DOM re-render, duplicate race (pre-existing), quoted tweets (pre-existing), backend downtime and index recovery all have automated or executable-manual coverage.
- `make test` now runs 147 extension tests alongside the Go suite; plan 06-03's tooling is the only remaining Phase 6 work.

---
*Phase: 06-hardening*
*Completed: 2026-09-27*
