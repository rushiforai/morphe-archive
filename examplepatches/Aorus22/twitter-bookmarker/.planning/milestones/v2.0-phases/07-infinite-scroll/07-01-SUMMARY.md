---
phase: 07-infinite-scroll
plan: 01
subsystem: web-frontend
tags: [infinite-scroll, intersection-observer, cursor-pagination, opaque-cursor, page-accumulation, tweet-id-dedupe, bottom-loader, masonry-skeleton, window-focus-refetch, no-polling, react19, vitest, jsdom, testing-library]

# Dependency graph
requires:
  - phase: 06-discovery-tools
    provides: "usePosts(filename, requestParams) with query-keyed state ({posts,status,error,errorMessage,collection,nextCursor,hasMore,refetch}), useGalleryQuery().queryKey/requestParams, the URL-backed discovery reset, and the mocked-fetch/jsdom test runner (scrollTo + ResizeObserver + pointer-capture stubs)"
  - phase: 05-collection-gallery
    provides: "CollectionPage content-state region + selectPostsViewState, GalleryMasonry (292 card / 32 column gap / 22 row gap, natural heights), PostCard, MasonrySkeleton, GalleryErrorState/CollectionEmptyState/CollectionFilterEmptyState"
  - phase: 03-web-scaffold
    provides: "fetchPosts()/fetchCollections() through one relative-URL client that never hardcodes a host, and the GalleryPostsResponse DTO with the opaque next_cursor"
provides:
  - "web/src/lib/pagination.ts: MAX_POSTS_PAGE_LIMIT (100) + clampPageLimit, resolveNextPage (has_more/next_cursor defensive stop), mergeUniquePosts (tweet_id dedupe that keeps the first-seen instance and position)"
  - "web/src/components/gallery/infinite-sentinel.tsx: InfiniteSentinel({onIntersect, disabled?, rootMargin?, className?}) with SENTINEL_ROOT_MARGIN = '600px 0px' — aria-hidden decorative marker that observes itself and calls the latest callback"
  - "web/src/components/gallery/gallery-bottom-loader.tsx: GalleryBottomLoader({label?, className?}) — role=status live row with an sr-only label and an aria-hidden spinner"
  - "usePosts(...) now accumulates pages: posts is the full deduped loaded list, plus isLoadingMore and loadMore; a monotonic request generation discards an in-flight page that a query change or refetch superseded; limit is clamped to the API maximum"
  - "web/src/test/intersection-observer.ts: MockIntersectionObserver with instances/latest()/observedCount/emit(), installed globally by src/test/setup.ts and reset per test"
  - "CollectionPage renders <GalleryMasonry> + (isLoadingMore ? GalleryBottomLoader) + InfiniteSentinel(disabled={!hasMore}), so appends never hide loaded cards"
affects: [phase-8, phase-9, phase-10]

actuals:
  tokens: 0
  tasks: 6
  commits: 3

tech-stack:
  added: []
  patterns:
    - "Paging is an extension of usePosts, not a second hook: the accumulated list, cursor, hasMore, in-flight flag and stale guard live in one state machine keyed by the same request signature Phase 6 introduced"
    - "Two guards, two jobs: the React request key decides what the view renders (a query change yields loading/[]/null cursor synchronously), while a monotonic request generation decides whether a resolving page may be appended at all"
    - "Opaque cursor consumption: the string is echoed into `cursor=` verbatim (URL-encoded by URLSearchParams), never parsed; the same cursor is refused twice in a row and `has_more:true` with no usable cursor is treated as the end"
    - "Dedupe as a pure list function: mergeUniquePosts iterates existing first and appends only unseen tweet_ids, so a mid-scroll CSV append that shifts the sort-key window cannot double-render or reorder a card"
    - "Decorative trigger, announced loader: the sentinel is aria-hidden and empty; only the bottom loader is a role=status live region with a visually-hidden label"
    - "Callback-through-ref observer: onIntersect is read from a ref inside the observer callback, so appending a page never recreates the observer and never captures a stale closure"
    - "No timer-driven refetch: window focus and Retry bump a request id; nothing schedules an interval, proven by a fake-timer test in which 120 s of wall-clock time issues zero requests"
    - "jsdom's missing IntersectionObserver is filled by a controllable stub, not a no-op, so the sentinel can be driven deterministically with emit(true)"

key-files:
  created:
    - web/src/lib/pagination.ts
    - web/src/lib/pagination.test.ts
    - web/src/components/gallery/infinite-sentinel.tsx
    - web/src/components/gallery/infinite-sentinel.test.tsx
    - web/src/components/gallery/gallery-bottom-loader.tsx
    - web/src/components/gallery/gallery-bottom-loader.test.tsx
    - web/src/pages/collection-page-paging.test.tsx
    - web/src/test/intersection-observer.ts
  modified:
    - web/src/hooks/use-posts.ts
    - web/src/hooks/use-posts.test.tsx
    - web/src/components/gallery/index.ts
    - web/src/lib/index.ts
    - web/src/lib/messages.ts
    - web/src/pages/collection-page.tsx
    - web/src/test/setup.ts

key-decisions:
  - "loadMore lives in usePosts rather than a new useCollectionPosts hook: the cursor, the request key and the reset rule are already there, and the Phase 8 lightbox seam is simply usePosts(...).posts (the accumulated dataset held by CollectionPage)"
  - "A monotonic generation counter, bumped at the start of every page-1 request, is the stale-page guard — the React request key alone cannot tell an in-flight page from a same-key focus refetch"
  - "resolveNextPage owns the defensive stop in one pure place: has_more false stops, and so does has_more true with a null/non-string/empty cursor, so a malformed backend cannot loop the sentinel"
  - "loadMore also refuses a cursor identical to the last one it requested, adding a second loop guard that survives a backend repeating a cursor"
  - "clampPageLimit caps any caller-supplied limit at the PRD §34 maximum of 100, so the client cannot exceed the backend contract even if a future caller asks for 500"
  - "The sentinel stays mounted but disabled at the end of the list: the observer effect disconnects, which is observable in tests and keeps layout stable"
  - "A failed page request is non-fatal: loaded cards stay, the loader clears, and the next intersection retries the same cursor"
  - "First-load skeleton vs append loader: only status==='loading' (the query/first-page reset) shows MasonrySkeleton; an append keeps status==='success' and adds only the bottom loader"

patterns-established:
  - "Phase 8 seam: the accumulated list is `usePosts(filename, requestParams).posts`; CollectionPage owns it, so the lightbox should be rendered by CollectionPage with that array (and its index within it) as props to navigate across tweet boundaries in the loaded dataset"
  - "Phase 9 seam: no host, port or process coupling was added; paging uses the same relative-URL fetchPosts client"
  - "Phase 10 seam: the bottom loader's spinner uses border-t-accent on surface — a decorative graphic, but the hardening pass should still axe the live region and the appended-state contrast"

requirements-completed: [SCROLL-01, SCROLL-02, SCROLL-03, SCROLL-04, SCROLL-05]

coverage:
  - id: SCROLL-01
    description: "Sentinel-driven paging at 30 per page: an IntersectionObserver on a marker after the last card requests the next page with a 600px rootMargin, the API limit stays within 1..100, and there is no numbered pagination and no primary Load More button (PRD-2 §34)"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/infinite-sentinel.test.tsx#InfiniteSentinel — decorative trigger (SCROLL-01, a11y) > observes one target with the 600px-before-the-bottom rootMargin"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/infinite-sentinel.test.tsx#InfiniteSentinel — decorative trigger (SCROLL-01, a11y) > fires onIntersect for an intersecting entry"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — cursor paging (SCROLL-01, SCROLL-03, SCROLL-04) > appends the next page in order and echoes the opaque cursor verbatim"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — cursor paging (SCROLL-01, SCROLL-03, SCROLL-04) > keeps the first page size within the API maximum"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — sentinel-driven accumulation (SCROLL-01, SCROLL-03, SCROLL-04) > accumulates three pages in order and stops when has_more is false"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — first-load and page-load affordances (SCROLL-02) > does not render a Load More button or numbered pagination"
        status: pass
    human_judgment: false
  - id: SCROLL-02
    description: "Initial collection load shows masonry skeleton cards; subsequent page loads show a small bottom loader; already-loaded posts stay mounted so the page is never blank during a fetch (PRD-2 §35)"
    verification:
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — first-load and page-load affordances (SCROLL-02) > shows masonry skeletons for the first load and no bottom loader"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — first-load and page-load affordances (SCROLL-02) > keeps the loaded posts mounted under a bottom loader while page two loads"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/gallery-bottom-loader.test.tsx#GalleryBottomLoader — polite bottom status (SCROLL-02, a11y) > is compact — a single row, never a full-page skeleton"
        status: pass
    human_judgment: false
  - id: SCROLL-03
    description: "Pages accumulate in order; earlier posts are never dropped or reordered; an overlapping tweet_id from a mid-scroll CSV append is deduped defensively and the first-seen instance keeps its position (PRD-2 §44)"
    verification:
      - kind: unit
        ref: "web/src/lib/pagination.test.ts#mergeUniquePosts — defensive tweet_id dedupe (SCROLL-03, PRD-2 §44) > keeps the first-seen instance and position for an overlapping tweet_id"
        status: pass
      - kind: unit
        ref: "web/src/lib/pagination.test.ts#mergeUniquePosts — defensive tweet_id dedupe (SCROLL-03, PRD-2 §44) > adds nothing when a page is fully overlapping (the mid-scroll drift case)"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — cursor paging (SCROLL-01, SCROLL-03, SCROLL-04) > does not render an overlapping tweet_id twice and keeps its first position"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — sentinel-driven accumulation (SCROLL-01, SCROLL-03, SCROLL-04) > renders an overlapping tweet_id once at its first-seen position"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — sentinel-driven accumulation (SCROLL-01, SCROLL-03, SCROLL-04) > accumulates three pages in order and stops when has_more is false"
        status: pass
    human_judgment: false
  - id: SCROLL-04
    description: "next_cursor is consumed verbatim as an opaque string; paging stops at has_more:false and at has_more:true with a null cursor; the same cursor is never requested twice in a row, so repeated sentinel firings during one in-flight request produce exactly one additional request (PRD-2 §43)"
    verification:
      - kind: unit
        ref: "web/src/lib/pagination.test.ts#resolveNextPage — the cursor contract (SCROLL-04, PRD-2 §43) > does not normalise a cursor with URL-hostile characters"
        status: pass
      - kind: unit
        ref: "web/src/lib/pagination.test.ts#resolveNextPage — the cursor contract (SCROLL-04, PRD-2 §43) > stops when has_more is false, even if a cursor leaked through"
        status: pass
      - kind: unit
        ref: "web/src/lib/pagination.test.ts#resolveNextPage — the cursor contract (SCROLL-04, PRD-2 §43) > does not loop when has_more is true but next_cursor is null"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — cursor paging (SCROLL-01, SCROLL-03, SCROLL-04) > coalesces repeated sentinel firings into exactly one in-flight page request"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — cursor paging (SCROLL-01, SCROLL-03, SCROLL-04) > never requests the same cursor twice in a row"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — sentinel-driven accumulation (SCROLL-01, SCROLL-03, SCROLL-04) > requests exactly one extra page for repeated sentinel firings in flight"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — sentinel-driven accumulation (SCROLL-01, SCROLL-03, SCROLL-04) > does not loop when has_more is true with a null cursor"
        status: pass
    human_judgment: false
  - id: SCROLL-05
    description: "Refetch on route entry, filter/sort/search change, window focus and manual refresh; no timer-driven polling; a refetch resets paging to page one and clears accumulated pages (PRD-2 §47/§78, DISC-08)"
    verification:
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — refresh resets paging, nothing polls (SCROLL-05) > resets to page one on a window focus refetch without duplicating posts"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — refresh resets paging, nothing polls (SCROLL-05) > issues no request when wall-clock timers advance"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — cursor paging (SCROLL-01, SCROLL-03, SCROLL-04) > drops an in-flight page when the query changes mid-flight"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — refetch policy (SCROLL-05) > resets to page one on window focus without duplicating posts"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — refetch policy (SCROLL-05) > never polls: no request is issued without an intersection or focus"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-paging.test.tsx#CollectionPage — refetch policy (SCROLL-05) > does not move the viewport when a page is appended"
        status: pass
    human_judgment: false

# Metrics
duration: 40min
completed: 2026-09-27
status: complete
commits:
  - 7fe6e92 docs(07): plan infinite scroll (SCROLL-01..05)
  - aaeb171 feat(07): add infinite scroll — sentinel paging, dedupe, bottom loader
---

# Phase 7: Infinite Scroll Summary

**The collection gallery now pages itself: an `IntersectionObserver` sentinel 600px above the bottom
requests the next 30 posts with the backend's opaque `next_cursor`, pages accumulate in order with a
defensive `tweet_id` dedupe, the first load is skeleton-covered while later loads show only a compact
`role="status"` bottom row under the still-mounted cards, and the view refetches on route entry, query
change, window focus and Retry with no polling timer and no viewport jump.**

## Performance

- **Duration:** ~40 min
- **Completed:** 2026-09-27
- **Tasks:** 6 (plan → pure pagination helpers → observer stub + components → hook paging → page wiring → tests)
- **Files:** 15 in the implementation commit (8 created, 7 modified)
- **Machine:** `TZ` unset → resolved `Asia/Jakarta` (UTC+7); `date` = Sun Sep 27 2026 WIB

## Accomplishments

- **Sentinel paging (SCROLL-01).** `InfiniteSentinel` is an `aria-hidden`, empty, zero-height marker
  rendered after the masonry. Its observer uses `rootMargin: "600px 0px"`, so the next page starts
  before the user reaches the bottom. It never re-observes on re-render (the callback is read from a
  ref) and it disconnects whenever `disabled` is true — which `CollectionPage` sets from `!hasMore`.
  There is no numbered pagination and no `Load More` button; the page size stays 30 by default and
  `clampPageLimit` caps any caller at the API's `100`.
- **Loading affordances (SCROLL-02).** The first load shows `MasonrySkeleton` (`Loading posts`).
  A page load keeps `status === "success"`, so `viewState` stays `posts`, every already-rendered card
  stays mounted and interactive, and only `GalleryBottomLoader` appears below them. The loader is a
  polite live region (`role="status"` with an `sr-only` label); its spinner is `aria-hidden`.
- **Accumulation + dedupe (SCROLL-03).** `usePosts` now returns the accumulated list. Appends run
  through `mergeUniquePosts(existing, incoming)`, which preserves `existing` order exactly and skips
  any `tweet_id` already present — so the documented mid-scroll CSV-append drift cannot render a card
  twice or move it. A fully-overlapping page adds nothing.
- **Opaque cursor contract (SCROLL-04).** `resolveNextPage` turns `{next_cursor, has_more}` into the
  stop/continue decision in one pure place: `has_more: false` stops, and `has_more: true` with a
  null/non-string/empty cursor also stops. `loadMore` additionally refuses while a page is in flight
  and refuses a cursor identical to the last one requested, so repeated sentinel firings during one
  request produce exactly one additional request and a cursor-repeating backend cannot loop.
- **Refetch policy (SCROLL-05).** Window focus and `Retry` bump the hook's request id, which starts a
  fresh page-1 request and resets paging/cursor; the monotonic request *generation* discards any page
  that was in flight when the reset happened, including a query change mid-flight. No timer is
  scheduled anywhere: the suite proves 120 s of wall-clock time issues zero requests.
- **Accessibility + layout.** The sentinel is decorative and unannounced; the loader is the announced
  affordance. `loadMore` never scrolls — the only `scrollNearTop()` remains the query-change effect
  (DISC-08) — and the masonry measures are untouched (292-wide cards, 32px column gap, 22px row gap,
  natural heights).
- **Tests.** Four new files / 38 new tests plus 10 added to `use-posts.test.tsx`: **33 files / 283
  tests, up from 29 / 235** (+4 files / +48 tests). All against a mocked `fetch`; the only new test
  infrastructure is the controllable `IntersectionObserver` stub.

## Task Commits

| Commit | Subject |
|--------|---------|
| `7fe6e92` | `docs(07): plan infinite scroll (SCROLL-01..05)` |
| `aaeb171` | `feat(07): add infinite scroll — sentinel paging, dedupe, bottom loader` |

Both made with `gsd-tools query commit … --files <explicit paths>` (`committed: true`). The summary is
committed separately with `docs(07): summarize infinite scroll`.

## Files Created/Modified

**Created (8)**
- `web/src/lib/pagination.ts` — `mergeUniquePosts`, `resolveNextPage`, `clampPageLimit`, `MAX_POSTS_PAGE_LIMIT`
- `web/src/lib/pagination.test.ts` — 14 pure tests (cursor verbatim, stop conditions, dedupe position, limit clamp)
- `web/src/components/gallery/infinite-sentinel.tsx` — `InfiniteSentinel`, `SENTINEL_ROOT_MARGIN`
- `web/src/components/gallery/infinite-sentinel.test.tsx` — 7 tests (aria-hidden, rootMargin, emit, disable, latest callback)
- `web/src/components/gallery/gallery-bottom-loader.tsx` — `GalleryBottomLoader`
- `web/src/components/gallery/gallery-bottom-loader.test.tsx` — 5 tests (role=status, sr-only label, decorative spinner)
- `web/src/pages/collection-page-paging.test.tsx` — 12 integration tests (skeleton/loader, coalescing, three-page order, dedupe, end stop, focus reset, no scroll, no polling)
- `web/src/test/intersection-observer.ts` — `MockIntersectionObserver` + install/reset helpers

**Modified (7)**
- `web/src/hooks/use-posts.ts` — accumulated `posts`, `isLoadingMore`, `loadMore`, generation-guarded append, limit clamp
- `web/src/hooks/use-posts.test.tsx` — 10 new tests (append/opaque cursor, limit cap, end stop, null-cursor stop, coalescing, dedupe, repeated cursor, stale-page drop, focus reset, fake-timer no-polling)
- `web/src/pages/collection-page.tsx` — `loadMore`/`hasMore`/`isLoadingMore` wiring, bottom loader + sentinel, `LOADING_POSTS_LABEL`
- `web/src/components/gallery/index.ts` — sentinel/loader exports
- `web/src/lib/index.ts` — `pagination` export
- `web/src/lib/messages.ts` — `LOADING_POSTS_LABEL`, `LOADING_MORE_POSTS_LABEL`
- `web/src/test/setup.ts` — install `MockIntersectionObserver`, reset it in `afterEach`

## Decisions Made

All plan decisions were kept; the load-bearing ones:

1. **Paging is an extension of `usePosts`, not a second hook.** The cursor, request key and reset rule
   already lived there, so `loadMore`/`isLoadingMore`/accumulated `posts` fit without a new state
   machine. The Phase 8 seam is therefore `usePosts(...).posts` — the array `CollectionPage` already
   holds.
2. **A monotonic request generation, separate from the request key.** The key decides what the view
   renders; the generation decides whether a resolving page may be appended. Without it, a page in
   flight across a same-key focus refetch could append to the freshly reset list.
3. **The defensive stop lives in `resolveNextPage`.** `has_more: true` with a null cursor normalises to
   `hasMore: false`, which also disables the sentinel — the loop cannot start, rather than merely being
   unlikely.
4. **Second loop guard: no repeated cursor.** `lastRequestedCursorRef` refuses an identical cursor even
   if the backend keeps claiming `has_more`. The hook is then stuck at that cursor by design (no spin).
5. **A failed page is non-fatal.** Loaded cards stay, the loader clears, and the next intersection
   retries the same cursor — better than an error state that discards a good page.
6. **Sentinel mounted-but-disabled at the end.** Keeps layout stable and makes the disconnect
   observable in tests (`observedCount === 0`).
7. **`clampPageLimit` enforces the API maximum.** `limit: 500` becomes `limit=100`, so the client cannot
   violate PRD-2 §34 even if a future caller misconfigures it.

## Deviations from Plan

1. **[Scope note] No `useCollectionPosts` hook was introduced.** The context suggested that name as an
   example ("e.g."); the plan chose to extend `usePosts` because the hook already owned the key/cursor
   state. The exported accumulated surface is `usePosts(...).posts`, documented for Phase 8.
2. **[Test-only] `src/test/setup.ts` installs the `IntersectionObserver` stub unconditionally**, not
   only when the global is missing. jsdom does not implement it, and forcing the stub makes the suite
   deterministic if a future jsdom adds a real (untriggerable) implementation.
3. **[Adjusted during implementation] The a11y page test resolves a deferred second page.** With an
   immediately-resolved page 2 the loader had already disappeared by assertion time; the test now holds
   the response pending so the `role="status"` row is genuinely mid-fetch.
4. **[Process] A `setInterval` mention in a code comment was reworded** so `grep -rn 'setInterval'
   web/src` returns no matches — the grep is part of the phase's evidence and should not have to
   distinguish a comment from a timer.

**Total deviations:** 4, none blocking and none changing a requirement.

## Issues Encountered

- **`MockIntersectionObserver.latest()` is `undefined` when the sentinel starts disabled.** The
  end-of-list test originally asserted `latest()?.observedCount === 0`; because `has_more` was already
  false at mount, no observer was ever constructed. The assertion now checks that *no* observer has
  observed targets, which holds whether or not one exists.
- **An immediately-resolved page 2 hides the loader before the assertion.** `stubGalleryFetch` plus
  `act` flush the append synchronously; the loader-visible assertion needs a pending promise. The
  "existing posts stay mounted" test already did this; the a11y test was aligned with it.
- **`vi.spyOn(window, "setTimeout")` / `setInterval` cannot prove the absence of polling.**
  Testing-library's `waitFor` itself schedules timers, so a spy-based assertion fails for the wrong
  reason. The proof is a fake-timer test (installed before render) in which 120 s of advancement issues
  zero requests — a real interval would have fired.

## User Setup Required

None. No new dependency, no environment variable, no server. `grep -rn '43121' web/src` → no matches,
`grep -rn 'setInterval' web/src` → no matches, and `pgrep -af 'vite|pnpm dev'` → nothing.

## Next Phase Readiness

- **Phase 8 (Media Lightbox).** The accumulated dataset is exactly `usePosts(filename, requestParams).posts`
  as held by `CollectionPage`; the lightbox should be rendered by `CollectionPage` and receive that
  array (plus the active index) as props, so `←`/`→` navigation crosses tweet boundaries within the
  loaded pages. Post media components were not touched, so wrapping them in a lightbox trigger needs no
  change here.
- **Phase 9 (Production Serving).** Paging uses the same relative-URL `fetchPosts` client; no host, port
  or process was introduced, so serving/SPA-fallback work stays in that phase.
- **Phase 10 (Hardening).** The loader's spinner is decorative; the hardening pass should still run axe
  against the appended state and confirm the live region announces once per append rather than
  repeatedly. Large-dataset virtualization remains deliberately deferred (PRD-2 §68 forbids loading the
  whole collection at once, which cursor paging already satisfies).
- **Fragile-but-covered:** the generation guard is proven by the "drops an in-flight page when the query
  changes mid-flight" test and the focus-reset test; the mutation check on the `has_more` stop condition
  failed **6 tests across 3 files** and the dedupe mutation failed **5 tests across 3 files**, both
  restored to a green 33/283.

---

*Phase: 07-infinite-scroll*
*Completed: 2026-09-27*
