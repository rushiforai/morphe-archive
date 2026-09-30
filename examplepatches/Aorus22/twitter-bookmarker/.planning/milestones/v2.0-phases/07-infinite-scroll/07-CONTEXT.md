# Phase 7: Infinite Scroll - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 7 of 10** (= PRD §85 "Phase 2.7 — Infinite Scroll")

<domain>
## Phase Boundary

Turn the collection gallery into a cursor-paginated infinite scroller: an IntersectionObserver sentinel requests the next page of 30 as the user approaches the end, pages accumulate without duplicates, skeletons cover the first load and a small bottom loader covers subsequent loads, and the view refetches on route entry, query change, window focus, and manual refresh.

**In scope:** `InfiniteLoader`, cursor consumption, page accumulation + dedupe, the loading/skeleton/end states, and the window-focus refetch policy.

**Out of scope:** the lightbox (Phase 8) and anything that changes the query semantics (Phase 6 owns those).

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- No numbered pagination and no "Load More" button as the primary flow — IntersectionObserver-driven
  infinite scroll only (PRD §34).
- Recommended page size **30**; the API's maximum `limit` is 100 (PRD §34). The client sends
  `limit=30`.
- The frontend consumes the **opaque** `next_cursor` and must not depend on its internal contents
  (PRD §43).
- Request the next page when the user nears the end of the gallery (PRD §34).
- Initial collection load → **masonry skeleton cards**; infinite loading → a **small loader at the
  bottom**; never a blank page during a fetch (PRD §35).
- Appended pages must not produce obvious repeated rows when new bookmarks were appended mid-scroll;
  the cursor is sort-key based. As a defensive measure the frontend also dedupes by `tweet_id`
  (PRD §44).
- Refetch triggers: collection route open, user refresh, filter change, sort change, search change,
  and window refocus after being backgrounded. **No aggressive polling** (PRD §47, §78).
- The page is not allowed to load an entire collection into the browser at once (PRD §68).

### Implementation notes

- Use an `IntersectionObserver` on a sentinel element placed after the last card; a generous
  `rootMargin` (e.g. `600px`) makes the next page start before the user hits the bottom.
- Guard against duplicate in-flight requests (a ref/flag) and against requesting when
  `has_more === false`.
- When the query changes, discard the accumulated pages and cursor atomically — a stale in-flight
  response for the previous query must never be appended to the new list. Track a request generation
  or key the accumulation by the serialized query.
- Keep the accumulated list in a hook (e.g. `useCollectionPosts`) so Phase 8's lightbox can read the
  same loaded dataset for cross-tweet navigation.

</decisions>

<code_context>
## Existing Code Insights

- Phase 5/6 delivered the masonry, post cards, toolbar behaviour, and the URL-backed query state.
  The query-state hook is the single source of truth for search/filter/sort; the posts hook must
  re-run when it changes.
- API: `GET /api/gallery/collections/{filename}/posts?...&limit=30&cursor=<opaque>` →
  `{items, next_cursor, has_more}`; at the end `next_cursor` is JSON `null` and `has_more` false.
- The masonry implementation matters here: appending cards must not reflow the whole column layout
  in a way that loses scroll position. CSS columns reflow on append; if that proves janky, prefer the
  existing layout but verify scroll anchoring, or switch to a measured absolute layout.
- `MasonrySkeleton` from Phase 4 is the skeleton primitive; extend it to produce a variable-height
  masonry skeleton for the first load.

</code_context>

<specifics>
## Specific Ideas

1. Seed a collection with 75 posts. First load fetches 30; scrolling near the bottom fetches 30 more,
   then 15; the loader disappears and no further requests are made.
2. The DOM contains each `tweet_id` exactly once even if the backend returns an overlapping item
   (simulate by appending a new row between page 1 and page 2 while `saved_desc` — the new row must
   not duplicate an existing card).
3. First load shows masonry skeletons and no blank frame; subsequent loads show only the bottom
   loader; the existing cards stay interactive.
4. Changing the search query mid-scroll resets to page 1 and a late response from the old query is
   discarded (no mixed results).
5. Backgrounding and refocusing the tab issues a refetch; nothing polls on a timer.
6. A collection with fewer than 30 posts shows no bottom loader after the first load.
7. `pnpm build` still succeeds and typechecks.

</specifics>

<deferred>
## Deferred Ideas

- Virtualized rendering for very large loaded sets (not required for a personal dataset)
- Prefetching the next page eagerly on idle

</deferred>
