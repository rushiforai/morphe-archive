---
phase: 03-x-dom-integration
plan: 01
subsystem: extension-content
tags: [chrome-mv3, content-script, spa, mutation-observer, route-detection, idempotency, dependency-injection]

# Dependency graph
requires:
  - phase: 02-extension-settings (plan 01)
    provides: "shared/types.ts Store/Category/Settings, shared/constants.ts DEFAULT_SETTINGS, shared/messages.ts GET_SAVED_INDEX contract"
  - phase: 02-extension-settings (plan 03)
    provides: "shared/storage.ts getStore + onStoreChanged for live rerender"
provides:
  - "content/route.ts: pure isBookmarksRoute + watchRoute(onEnter,onLeave) with popstate/pushState/replaceState/interval and a testable env"
  - "content/bookmark-page.ts: startBookmarksPage/stopBookmarksPage, one MutationObserver, addedNodes discovery + debounced sweep, once-per-entry saved Set"
  - "content/index.ts: real bootstrap wiring route -> lifecycle -> storage subscription and the Phase-4 onSelect seam"
  - "Phase-4 state seams: getSavedTweetIds/isTweetSaved/markTweetSaved/markTweetUnsaved/setTweetSaving/refreshBookmarksPage"
affects: [03-x-dom-integration, 04-save-integration, 05-auto-unbookmark, 06-hardening]

# Actuals — chars/4 over route.ts + bookmark-page.ts + index.ts (24,111 chars).
actuals:
  tokens: 6028
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Injectable lifecycle deps (BookmarksPageDeps/RouteEnv) so content-script orchestration is unit-testable without a browser"
    - "Duck-typed isElement(nodeType===1) instead of instanceof Element (cross-realm + fake-DOM safe)"
    - "Marker-before-inject with marker rollback on failure/no-root; sweep self-heals marked-but-rootless articles"
    - "Observer attached before the initial sweep to close the scan/observe gap"

key-files:
  created:
    - extension/src/content/route.ts
    - extension/src/content/bookmark-page.ts
  modified:
    - extension/src/content/index.ts

key-decisions:
  - "watchRoute takes an injectable RouteEnv; browserRouteEnv() is resolved lazily so importing the module in Node never touches window/history"
  - "The injection marker is written BEFORE extraction/injection (XI-04) but removed when nothing was injected or extraction failed, so a later sweep can retry without ever duplicating a root"
  - "The debounced sweep also clears a marker on an article that has no organizer root, self-healing an X DOM wipe that keeps the container node"
  - "loadSavedIndexFromServiceWorker tolerates ok:false, index:null, and thrown messaging errors; startBookmarksPage additionally tolerates a throwing store/index loader so a Phase-2 stub can never block injection"
  - "Idempotency is enforced in two layers: the article marker (bookmark-page) and an update-in-place check in injectOrganizer"
  - "stopBookmarksPage removes every marker as well as every root, so returning to /i/bookmarks re-injects (XI-02)"

patterns-established:
  - "Content-script modules expose a default real implementation plus injectable deps; tests drive the real code path with a fake DOM/observer/timers"
  - "Every observer callback and every per-article processing step is wrapped in try/catch so one malformed tweet cannot kill observation"
  - "The saved index is a single Set<string> built once per route entry; all lookups are Set.has (O(1))"

requirements-completed: [XI-01, XI-02, XI-03, XI-04]

coverage:
  - id: D1
    description: "Organizer activates only on https://x.com/i/bookmarks (and /i/bookmarks/, query strings); enter/leave fire exactly once per SPA transition and returning resumes injection"
    requirement: "XI-01"
    verification:
      - kind: unit
        ref: "test/route.test.mjs#isBookmarksRoute accepts only /i/bookmarks (with trailing slash/query/origin)"
        status: pass
      - kind: unit
        ref: "test/route.test.mjs#isBookmarksRoute rejects every excluded route"
        status: pass
      - kind: unit
        ref: "test/route.test.mjs#watchRoute reports enter/leave exactly once per transition"
        status: pass
      - kind: unit
        ref: "test/route.test.mjs#watchRoute starting off-route reports leave first and resumes on arrival"
        status: pass
    human_judgment: false
  - id: D2
    description: "Route-leave teardown removes roots + markers and disconnects observation, so a return to Bookmarks injects fresh"
    requirement: "XI-02"
    verification:
      - kind: unit
        ref: "test/bookmark-page.test.mjs#stop disconnects, clears timers, and removes roots, markers, and the saved cache"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#removeOrganizer removes one root; removeAllOrganizers clears roots and markers"
        status: pass
    human_judgment: false
  - id: D3
    description: "Exactly one MutationObserver discovers added tweet articles plus a ~120ms debounced sweep; own-root mutations are ignored; the saved index is fetched once per entry with O(1) Set lookup; each article is processed at most once via the marker"
    requirement: "XI-03"
    verification:
      - kind: unit
        ref: "test/bookmark-page.test.mjs#start fetches the index once, injects, and marks saved tweets (XI-03, XI-04, XI-11)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#addedNodes discovery injects immediately and is idempotent; own-root mutations are ignored"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#a newly scrolled-in tweet gets controls exactly once (XI-03)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#a throwing index loader never blocks injection (Phase 2 service worker stub)"
        status: pass
    human_judgment: true
    rationale: "The unit tests prove the single-observer/idempotency machinery against a fake DOM and an injected observer, but XI-03's real promise (X's infinitely scrolling timeline under live DOM churn) can only be signed off by loading dist/ unpacked and scrolling /i/bookmarks in Chrome; no browser was available in this execution."
  - id: D4
    description: "Idempotent injection: marker written before injecting, never a second root, and a fresh/X-re-rendered article node is re-injected exactly once"
    requirement: "XI-04"
    verification:
      - kind: unit
        ref: "test/bookmark-page.test.mjs#the debounced sweep re-injects a tweet whose DOM was wiped (marker logic, XI-04)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#injection is idempotent: a second call updates in place (XI-04)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#a fresh article node with no marker receives controls exactly once (marker logic)"
        status: pass
    human_judgment: false
  - id: D5
    description: "Content script is inert outside /i/bookmarks and never throws into X's page; it re-renders controls on chrome.storage.onChanged"
    requirement: "XI-02"
    verification:
      - kind: other
        ref: "npm run build — dist/content/content.js builds as an iife and the route matcher is bundled"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#refresh adopts new categories and injects previously-skipped tweets (PRD §51)"
        status: pass
    human_judgment: true
    rationale: "Confirms the bundle exists and the refresh path works in isolation, but 'no uncaught exceptions in the page console' and 'inert on Home/Explore' require loading the unpacked extension in Chrome and navigating; not performed in this execution."

# Metrics
duration: 10min
completed: 2026-09-27
status: complete
---

# Phase 3: X DOM Integration — Plan 01 Summary

**SPA route watcher (popstate + patched pushState/replaceState + 500 ms fallback), a single debounced `MutationObserver` discovery loop, and marker-first idempotent injection with a once-per-entry `Set<string>` saved index that tolerates the Phase-2 service-worker stub.**

## Performance

- **Duration:** ~10 min
- **Started:** 2026-09-27T01:38:00Z
- **Completed:** 2026-09-27T01:48:00Z
- **Tasks:** 3
- **Files modified:** 3 (2 created, 1 replaced)

## Accomplishments
- `route.ts` gives a pure, table-testable `isBookmarksRoute` (accepts `/i/bookmarks`, `/i/bookmarks/`, query strings, and full origins; rejects Home/Explore/Notifications/Messages/Profile/status/Lists/Search) and a `watchRoute` that fires `onEnter`/`onLeave` exactly once per transition across `popstate`, patched `history.pushState`/`replaceState`, and a 500 ms `location.href` fallback.
- `bookmark-page.ts` loads the store, fetches the saved index **once** per route entry into a `Set<string>`, attaches exactly **one** observer to `document.body`, and discovers tweets from `addedNodes` plus a ~120 ms debounced sweep of unmarked `article[data-testid="tweet"]` nodes.
- Idempotency is two-layered: the marker is written *before* extraction/injection (XI-04) and removed only when nothing was injected; `injectOrganizer` also updates an existing root in place. The sweep additionally self-heals a marked article whose root X wiped.
- Mutations whose target or added node lives inside `[data-twitter-bookmarker-root]` are ignored, so our own DOM writes never cause work.
- Every observer tick and every per-article step is wrapped in try/catch: one malformed tweet cannot kill observation.
- `stopBookmarksPage` disconnects the observer, cancels the debounce timer, and removes every root **and** every marker so a return to Bookmarks injects fresh (XI-02).
- Phase-4 seams are in place: `getSavedTweetIds`, `isTweetSaved`, `markTweetSaved`, `markTweetUnsaved`, `setTweetSaving`, and `refreshBookmarksPage(store)`.

## Task Commits

No commits were made — this execution was explicitly forbidden from running any `git` command.

**Plan metadata:** not committed (git out of scope).

## Files Created/Modified
- `extension/src/content/route.ts` — `isBookmarksRoute`, `watchRoute`, injectable `RouteEnv`/`browserRouteEnv`
- `extension/src/content/bookmark-page.ts` — `startBookmarksPage`/`stopBookmarksPage`, observer/discovery, saved cache, refresh + Phase-4 seams
- `extension/src/content/index.ts` — real bootstrap: route → lifecycle, storage subscription, logging `onSelect`, console `onExtractionError`

## Decisions Made
- **Observable-before-sweep:** the observer is attached before the initial sweep, so a tweet rendered during the first scan cannot slip through the gap.
- **Marker rollback:** the marker is authoritative for "processed", but it is removed whenever no root resulted (extraction failure, no action bar, zero categories) so a later sweep can retry — the idempotency guarantee is "never two roots", not "never retry".
- **Self-healing sweep:** a marked article without a root has its marker cleared during the sweep, covering an X re-render that keeps the container node.
- **Tolerate the stub worker:** `loadSavedIndexFromServiceWorker` maps `ok:false`/`index:null`/thrown messaging to an empty Set with a warning, and `startBookmarksPage` also tolerates a throwing store loader, so injection is never blocked.
- **Injectable env/deps:** `RouteEnv` and `BookmarksPageDeps` keep the production path intact while making the SPA lifecycle fully unit-testable.

## Deviations from Plan

None — the plan was executed as written, with two robustness additions documented above (observer-before-sweep ordering, self-healing sweep). Both are internal to the planned files and do not change the public contract.

## Issues Encountered
- The hand-built fake DOM's attribute-selector parser initially mishandled `[attr*="v"]` (it dropped the literal `=` after `*`/`^`/`$`), which made every status-link lookup fail. Fixed in the test helper's regex; no production code changed.

## User Setup Required
None.

## Next Phase Readiness
- Phase 4 can replace `index.ts`'s logging `onSelect` and call `setTweetSaving`/`markTweetSaved`/`markTweetUnsaved`; the saved Set and rerender path already exist and are tested.
- Remaining manual UAT for this plan: load `extension/dist` unpacked in Chrome, open `/i/bookmarks`, scroll the timeline (controls appear exactly once per row), SPA-navigate Home → Bookmarks → Profile → Bookmarks, and confirm no duplicate controls/console errors.
- No blockers.

---
*Phase: 03-x-dom-integration*
*Completed: 2026-09-27*
