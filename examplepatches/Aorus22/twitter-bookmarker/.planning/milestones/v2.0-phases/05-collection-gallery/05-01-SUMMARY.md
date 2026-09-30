---
phase: 05-collection-gallery
plan: 01
subsystem: web-frontend
tags: [collection-page, pinterest-masonry, css-multi-column, post-card, multi-media-grid, text-only-quote-panel, controlled-clamp, lazy-images, deterministic-gradient, product-states, cursor-ready-hook, vitest, jsdom, testing-library]

# Dependency graph
requires:
  - phase: 04-gallery-homepage
    provides: "MediaImage (loading=lazy + same-box onError placeholder), MasonrySkeleton, GalleryEmptyState/GalleryErrorState, pickPlaceholderGradient, formatCount/formatCollectionMeta, formatLocalDate, PRD copy constants, vitest/jsdom/@testing-library runner + mocked-fetch teardown"
  - phase: 03-web-scaffold
    provides: "AppShell + routes, editorial token layer (r-sm/md/lg, shadow-post, grad-ph-*), fetchPosts()/fetchCollections()/ApiError, GalleryPost/GalleryCollection/GallerySort types, shadcn Button"
  - phase: 02-gallery-http-api
    provides: "GET /api/gallery/collections/{filename}/posts?limit&sort -> {items,next_cursor,has_more}; GET /api/gallery/collections summary rows; 404/500 as {status,reason}"
  - phase: docs/design
    provides: "phase2-design-spec.md §3.3 frame 6:121 measurement table, §2 tokens, §3.6 state cards, §5 frontend-derived gradients, §6 a11y, §7 deviations"
provides:
  - "CollectionPage: back link + 96x96 r24 deterministic gradient icon + Playfair Bold 38 title + `186 posts ◫ 220 media` + toolbar + one content state"
  - "GalleryMasonry: CSS multi-column Pinterest masonry, natural card heights, break-inside avoid, 32px column gap, 22px row rhythm, container capped at n*292+(n-1)*32"
  - "columnsForWidth(width) breakpoint helper (1 / 2 / 3 / 4 / 5) + useMasonryColumns(containerRef) container-measuring hook"
  - "PostCard: r18 surface/border/shadow-post, 292 wide, media region 272 r14, 28x28 r14 gradient avatar, author/username/body/meta/Open on X"
  - "PostMediaGrid: 1 single natural aspect / 2 split / 3 wide+2 / 4+ 2-column compact grid; every media URL rendered; 6px gaps; r14"
  - "TextPostCard: 272x~210 r14 deterministic gradient quote panel, Playfair Regular 22 at 18/24, 50% ink scrim, no img"
  - "ClampedPostText: Show more/Show less with aria-expanded expanding in place; only long text clamps"
  - "CollectionToolbar props contract for Phase 6 (search/onSearchChange, filterActive/onFilterClick, sort/onSortChange) + SORT_OPTIONS (4 modes, saved_desc default)"
  - "CollectionEmptyState (`This collection is empty`) and CollectionFilterEmptyState (`No posts match your filters` + `Clear filters`), plus selectPostsViewState()"
  - "usePosts(filename, options): first page limit=30&sort=saved_desc + summary join, {posts,status,error,errorMessage,collection,nextCursor,hasMore,refetch}, window-focus refetch, cursor fields pre-wired for Phase 7"
  - "13 new test files / 104 new tests on the existing runner (21 files / 154 tests total)"
affects: [phase-6, phase-7, phase-8, phase-10]

actuals:
  tokens: 0
  tasks: 5
  commits: 2

tech-stack:
  added: []
  patterns:
    - "Layout decisions are pure functions (columnsForWidth, masonryContainerWidth, selectMediaLayout, isLongPostText, selectPostsViewState, formatPostMeta, formatCollectionCounts, sortLabel) tested in isolation, then consumed by dumb components"
    - "CSS multi-column masonry: columnCount + break-inside: avoid; the container max-width is n*292+(n-1)*32 so a column is exactly the Figma card width at every breakpoint"
    - "Breakpoints are exact-fit on the measured *container* width (616/940/1264/1588), never the viewport, so the shell's gutters/1312 cap are already accounted for and 292-wide cards cannot overflow"
    - "The tweet is the card unit: PostMediaGrid maps the whole media array, never a slice, so no media is silently truncated"
    - "One image primitive (MediaImage) owns loading=lazy, decoding=async and onError -> same-box gradient placeholder; post media never proxies/rewrites the stored pbs.twimg.com URL"
    - "Controlled clamp via a deterministic character threshold (jsdom has no layout to measure overflow against), so short tweets get no dead Show more"
    - "Phase seams are presentational: the toolbar takes props/callbacks and the page's *applied* filter value can never become non-default, so the filter-no-match state is rendered and tested without faking filtering"
    - "Cursor fields (nextCursor/hasMore) live in usePosts state from day one; Phase 7 only appends items and advances the cursor"
    - "Summary-only failure degrades gracefully: posts still render, the header falls back to the filename with no counts"
    - "Every test stubs global fetch through one URL-routing helper; setup.ts unstubs after each test: no network, no server, never the operator's dev-port backend"
    - "Dynamic Tailwind classes are never built from a number (line-clamp class strings are literals) so the class scanner always emits them"

key-files:
  created:
    - web/src/lib/masonry.ts
    - web/src/lib/post-media.ts
    - web/src/lib/post-text.ts
    - web/src/lib/post-meta.ts
    - web/src/lib/posts-state.ts
    - web/src/lib/collection-sort.ts
    - web/src/lib/error-message.ts
    - web/src/hooks/use-posts.ts
    - web/src/hooks/use-masonry-columns.ts
    - web/src/components/gallery/gallery-masonry.tsx
    - web/src/components/gallery/clamped-post-text.tsx
    - web/src/components/gallery/post-media-grid.tsx
    - web/src/components/gallery/text-post-card.tsx
    - web/src/components/gallery/post-card.tsx
    - web/src/components/gallery/collection-toolbar.tsx
    - web/src/components/gallery/gallery-state-card.tsx
    - web/src/components/gallery/collection-empty-state.tsx
    - web/src/components/gallery/collection-filter-empty-state.tsx
    - web/src/test/fixtures.ts
  modified:
    - web/src/pages/collection-page.tsx
    - web/src/components/gallery/index.ts
    - web/src/components/gallery/collection-skeleton.tsx
    - web/src/lib/messages.ts
    - web/src/lib/date.ts
    - web/src/lib/collection-meta.ts
    - web/src/lib/index.ts
    - web/src/hooks/use-collections.ts
    - web/src/hooks/index.ts

key-decisions:
  - "Masonry is CSS multi-column (columnCount + break-inside: avoid) — the design spec's first suggested implementation — with the column count from a pure helper; children are wrapped in <li> with a 22px bottom margin"
  - "Column breakpoints are exact-fit on the available container width, measured from the masonry element (ResizeObserver + resize, window.innerWidth fallback for jsdom). 1440px -> 1312 content column -> 4 columns; the shell's 1312 cap makes 5 columns unreachable in practice but still mapped (PRD-2 §21 allows 4-5)"
  - "The toolbar->masonry gap collapses with the omitted pill block: masonry origin y=448 sits below the media-type (y=350) and topic (y=394) pill rows spec §7 omits, so the first card row starts 24px after the toolbar instead of leaving a 116px hole. Every masonry measurement (292 card, 32/22 gaps, natural heights, r18/r14) is unchanged"
  - "The filter-no-match state is not faked: Phase 5 cannot honestly reach zero results because of filters without a server-side query, so the branch is driven by an applied-filters value that stays default and is covered by selectPostsViewState + CollectionFilterEmptyState tests"
  - "Text-only posts render the quote panel in the media slot and no separate body paragraph, so the tweet text is never duplicated; the clamp + Show more live inside the panel"
  - "The clamp threshold is a character count (200) because jsdom/SSR cannot measure rendered overflow; the pure function makes the affordance deterministic and testable"
  - "A 50% ink scrim sits over the quote gradient so Playfair Regular 22 white text clears WCAG AA on all six placeholder pairs, including the light sand->sage and gold->blue"
  - "The collection header meta is `N posts ◫ M media` (formatCollectionCounts) — no last-saved date and no description line; the homepage card keeps the §16 `· Last saved` form"
  - "Post meta reuses the Phase 4 date helpers: the tweet date always carries its year (new formatLocalFullDate) so it matches the mockup's `Mar 12, 2026`, while the bookmark date stays the year-aware `Saved Apr 3`"
  - "Avatar gradient is seeded from username and the icon/gradients from filename/tweet_id — the CSV carries no colour or avatar data (spec §5)"

patterns-established:
  - "Phase 6 seam: CollectionToolbar is presentational and the page owns draft search/sort state; Phase 6 supplies debounced search, FilterPopover/FilterSheet, SortSelect and URL state against the same props, and Clear filters starts resetting the applied query"
  - "Phase 7 seam: usePosts already returns nextCursor/hasMore and the masonry already accepts a `columns` override; Phase 7 adds loadMore + the IntersectionObserver sentinel"
  - "Phase 8 seam: post media tiles are deliberately not links yet, so the lightbox can wrap PostMediaGrid without changing the card"

requirements-completed:
  [COLL-01, COLL-02, COLL-03, COLL-04, COLL-05, COLL-06, COLL-07, COLL-08, COLL-09, COLL-10, COLL-11]

coverage:
  - id: COLL-01
    description: "Header (back link, 96x96 r24 deterministic gradient icon, Playfair Bold 38 title, `186 posts ◫ 220 media`) + toolbar shell (440/86/150 wide, 40 tall) + no description line and no pills"
    verification:
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#CollectionPage — header > renders the back link, deterministic icon, title and counts meta"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders the toolbar with all three controls"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#omits the media-type and topic pills (design spec §7)"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#omits the mockup's collection description line (design spec §7)"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/collection-toolbar.test.tsx#renders the 440/86/150-wide 40-tall controls"
        status: pass
    human_judgment: false
  - id: COLL-02
    description: "Pinterest masonry with natural per-card heights (CSS multi-column, break-inside avoid, no equalised row grid)"
    verification:
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders one card per tweet inside a natural-height masonry"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-card.test.tsx#renders the tweet as exactly one card per post, media count and all"
        status: pass
    human_judgment: false
  - id: COLL-03
    description: "Responsive 1 / 2–3 / 4–5 columns from a pure columnsForWidth(width); 4 columns at 1440px with 292-wide cards and 32/22 gaps"
    verification:
      - kind: unit
        ref: "web/src/lib/masonry.test.ts#columnsForWidth (PRD-2 §21/§66) (9 assertions incl. 616/940/1264/1588 and overflow guard)"
        status: pass
      - kind: unit
        ref: "web/src/lib/masonry.test.ts#gives 4 columns at the 1440px frame's 1312px content column"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#recomputes the column count when the viewport resizes (COLL-03)"
        status: pass
    human_judgment: false
  - id: COLL-04
    description: "Adaptive multi-media layouts 1/2/3/4+ rendering every media URL, all tiles r14 with 6px gaps"
    verification:
      - kind: unit
        ref: "web/src/lib/post-media.test.ts#selectMediaLayout (PRD-2 §20, design spec §3.3)"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-media-grid.test.tsx#renders every media beyond four — 5 and 6 are never truncated"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders all four images of a four-media tweet in one card (COLL-04)"
        status: pass
    human_judgment: false
  - id: COLL-05
    description: "Text-only (media: []) renders the gradient quote panel and no img / no grey placeholder"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/post-card.test.tsx#renders the gradient quote panel and no img at all"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders a text-only post's quote panel without any img (COLL-05)"
        status: pass
    human_judgment: false
  - id: COLL-06
    description: "Every card shows author, username, tweet text, tweet date, bookmark date and Open on X"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/post-card.test.tsx#shows author, username, text, both dates and Open on X (COLL-06)"
        status: pass
      - kind: unit
        ref: "web/src/lib/post-meta.test.ts#formatPostMeta (PRD-2 §23, design spec §3.3)"
        status: pass
    human_judgment: false
  - id: COLL-07
    description: "Open on X is an <a> to the stored url with target=_blank rel=noopener noreferrer, and the tweet URL is never image-only"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/post-card.test.tsx#links Open on X to the stored url in a new tab (COLL-07, PRD-2 §24)"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#makes every Open on X a safe new-tab link (COLL-07)"
        status: pass
    human_judgment: false
  - id: COLL-08
    description: "Controlled clamp with a working Show more that expands in place"
    verification:
      - kind: unit
        ref: "web/src/lib/post-text.test.ts#isLongPostText (COLL-08)"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-card.test.tsx#clamps long text and expands it in place with Show more (COLL-08)"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#clamps long text with a working Show more (COLL-08)"
        status: pass
    human_judgment: false
  - id: COLL-09
    description: "Images use loading=lazy + decoding=async and load the stored pbs.twimg.com URL verbatim (no proxy/download/cache/rewrite)"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/post-media-grid.test.tsx#loads every tile lazily from the stored pbs.twimg.com URL"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#loads every image lazily from an unrewritten pbs.twimg.com URL (COLL-09)"
        status: pass
    human_judgment: false
  - id: COLL-10
    description: "Three distinct states: postless `This collection is empty`, filter-zero `No posts match your filters` + Clear filters, and error/not-found `Could not load this collection` + Retry; loading keeps MasonrySkeleton"
    verification:
      - kind: unit
        ref: "web/src/lib/posts-state.test.ts#selectPostsViewState (COLL-10)"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/collection-states.test.tsx#renders the exact postless-collection copy"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/collection-states.test.tsx#renders the filter-no-match copy with a Clear filters action"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders This collection is empty for a valid postless collection"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders Could not load this collection with a working Retry"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#renders the skeleton while the first page is in flight"
        status: pass
    human_judgment: false
  - id: COLL-11
    description: "Broken remote media degrades to the same-box neutral placeholder while metadata and Open on X stay in the DOM and the layout stays intact"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/post-card.test.tsx#keeps the card intact when a remote image is broken (COLL-11, PRD-2 §62)"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#keeps metadata and the link when a remote image is broken (COLL-11)"
        status: pass
    human_judgment: false

# Metrics
duration: 24min
completed: 2026-09-27
status: complete
commits:
  - f76cca4 docs(05): plan the collection gallery (COLL-01..11)
  - 13eaed3 feat(05): build the collection gallery with masonry, post cards and product states
---

# Phase 5: Collection Gallery Summary

**`/collections/:filename` is now a real gallery: a deterministic 96×96 gradient header, the present-but-inert toolbar, and a responsive CSS-multi-column Pinterest masonry of 292-wide post cards — adaptive multi-media grids, text-only quote panels, full metadata, `Open on X`, clamp + `Show more`, broken-media degradation, and three distinct empty/error states — backed by a first-page `usePosts` hook already shaped for Phase 7 cursors.**

## Performance

- **Duration:** ~24 min
- **Completed:** 2026-09-27
- **Tasks:** 5 (plan → pure helpers → hooks → components → page + tests)
- **Files:** 43 in the implementation commit (18 created, 9 modified) + 2 docs

## Accomplishments

- **Header (COLL-01).** `← Collections` (Inter Medium 11 → `/`), a `96×96` `r24` icon whose `--grad-ph-*` value comes from `pickPlaceholderGradient(filename)`, the title at Playfair Bold 38 (`28px` on small) and `186 posts ◫ 220 media` from `formatCollectionCounts`. The mockup's description line, media-type pills and topic pills are all omitted per spec §7, each with an asserting test so the deviation cannot silently regress.
- **Masonry (COLL-02, COLL-03).** `GalleryMasonry` is a `<ul>` with `columnCount` + `columnGap: 32px` and `max-width: n*292 + (n-1)*32`; each child is an `<li>` with `break-inside: avoid` and a 22px bottom margin, so card heights are natural and no card splits across a column break. `columnsForWidth(width)` maps 1/2/3/4/5 columns at exact-fit container widths (616/940/1264/1588) and `useMasonryColumns` measures the element (ResizeObserver + resize, `window.innerWidth` fallback). 1440px → 1312 content column → **4 columns, 292-wide cards**, verified in jsdom by resizing from 1024 (3 columns, 940px) to 1440 (4 columns, 1264px).
- **Post card (COLL-04…COLL-07, COLL-11).** `PostCard` is `292` wide, `r18`, `surface`/`border`/`shadow-post`, `10px` padding. The media region is `272` wide `r14` and every URL of the post is rendered (the tweet is the unit): 1 natural-aspect tile with a 160px floor, 2 side by side, 3 wide-over-two, 4+ a 2-column compact grid, 6px gaps. Avatars are a `28×28` `r14` gradient seeded from `username`. `Open on X ↗` is a real `<a href={post.url} target="_blank" rel="noopener noreferrer">`, so the tweet URL is always reachable as text.
- **Text-only (COLL-05) and clamp (COLL-08).** `TextPostCard` renders the `272×~210` `r14` gradient quote panel with a 50% ink scrim (AA on all six placeholder pairs) and Playfair Regular 22 at 18/24 padding; a text-only card contains **no `<img>` at all**. `ClampedPostText` clamps text past 200 characters with `line-clamp-5` and a real `Show more`/`Show less` button that expands in place (`aria-expanded`); short tweets are not clamped and get no dead affordance.
- **Images (COLL-09).** All post media goes through the Phase 4 `MediaImage`, so every tile is `loading="lazy"` + `decoding="async"` with contextual alt text, the stored `https://pbs.twimg.com/...` URL is used verbatim, and a broken URL swaps in a same-box gradient placeholder while the author, text, dates and `Open on X` stay in the DOM (COLL-11).
- **States (COLL-10).** `selectPostsViewState(status, count, filtersActive)` keeps five outcomes distinct; the page renders `MasonrySkeleton` (`Loading posts`), `GalleryErrorState` + `Retry`, `This collection is empty`, `No posts match your filters` + `Clear filters`, or the masonry — never one shared "empty".
- **Data hook.** `usePosts(filename, options)` issues `…/posts?limit=30&sort=saved_desc` plus the existing collections list for the header summary (**no new endpoint**), returns `{posts,status,error,errorMessage,collection,nextCursor,hasMore,refetch}`, refetches on window focus (PRD §47/§78), drops stale resolutions, and degrades gracefully when only the summary fails.
- **Tests.** 13 new files / 104 new tests, all against a mocked `fetch`; the runner stays exactly one (`cd web && pnpm test`).

## Task Commits

| Commit | Subject |
|--------|---------|
| `f76cca4` | `docs(05): plan the collection gallery (COLL-01..11)` |
| `13eaed3` | `feat(05): build the collection gallery with masonry, post cards and product states` |

Both made with `gsd-tools query commit … --files <explicit paths>` (`committed: true`). The summary is committed separately with `docs(05): summarize the collection gallery`.

## Files Created/Modified

**Created (18)**
- Helpers: `web/src/lib/{masonry,post-media,post-text,post-meta,posts-state,collection-sort,error-message}.ts`
- Hooks: `web/src/hooks/{use-posts,use-masonry-columns}.ts`
- Components: `web/src/components/gallery/{gallery-masonry,clamped-post-text,post-media-grid,text-post-card,post-card,collection-toolbar,gallery-state-card,collection-empty-state,collection-filter-empty-state}.tsx`
- Tests/fixtures: `web/src/test/fixtures.ts` + 13 test files

**Modified (9)**
- `web/src/pages/collection-page.tsx` — the real header/toolbar/masonry page (placeholder replaced)
- `web/src/components/gallery/index.ts` — new exports
- `web/src/components/gallery/collection-skeleton.tsx` — optional `label` prop (`Loading posts`), default unchanged
- `web/src/lib/{messages,date,collection-meta,index}.ts` — new copy constants, `formatLocalFullDate`, `formatCollectionCounts`, barrels
- `web/src/hooks/{use-collections,index}.ts` — the shared `describeGalleryError`, new hook exports

## Decisions Made

All seven up-front decisions in the plan were kept; the load-bearing ones:

1. **CSS multi-column masonry** with the container capped at the exact card measure, so a column is 292 wide at every breakpoint rather than flexing.
2. **Container-width, exact-fit breakpoints** (not viewport width) — the shell's 64px gutters and 1312 cap are already accounted for, so no intermediate viewport can overflow a 292-wide card. The 1312 cap means 5 columns is unreachable on this page; the helper still maps it (PRD §21 allows 4–5).
3. **The toolbar→masonry gap collapses with the omitted pill block.** The frame's masonry origin (y=448) is downstream of the media-type (y=350) and topic (y=394) rows that spec §7 removes; keeping a 116px hole would be an artefact of deleted content, so the first card row starts 24px after the toolbar. **All masonry measurements are unchanged** (292 card, 32/22 gaps, natural heights, r18 media/r14 tiles).
4. **No faked filtering.** The filter-no-match branch is driven by an *applied* filter value that Phase 5 never sets; the page test proves typing in the search box changes nothing (no request, no hidden posts, no filter copy), and the state itself is covered by `posts-state.test.ts` + `collection-states.test.tsx`.
5. **Text-only quote panel replaces both the media region and the body paragraph**, so the tweet text is never duplicated.
6. **Character-threshold clamp** as the only deterministic rule available without a layout engine.
7. **50% ink scrim** on the quote panel for AA contrast across all six gradients.

Also recorded: the header meta uses `◫` (`formatCollectionCounts`) with no last-saved date and no description; post meta always carries the tweet date's year (`formatLocalFullDate`) to match the mockup's `Mar 12, 2026` while the bookmark date stays short.

## Deviations from Plan

1. **[Recorded decision, not a surprise] Masonry origin.** The plan already flagged that the y=448 origin collapses with the omitted pills; implemented as `mt-6` after the toolbar. Documented in the component, the page and here so the orchestrator can accept or reject it explicitly.
2. **[Added scope, justified] The filter-no-match state is tested at the component/selector level, not through a page-only UI path.** The delegated brief asks for the state and its action to be rendered and tested; without a server-side query, the only honest page-level trigger is an applied filter value Phase 5 cannot set. Rather than mislabel an empty collection as "filtered", the state is exercised by `selectPostsViewState` (5 cases) and `CollectionFilterEmptyState` (3 cases) and the page proves the two states stay apart.
3. **[Incidental] Optional `label` prop on `MasonrySkeleton`.** Needed so the collection page announces `Loading posts` instead of `Loading collections`; the default is unchanged and the Phase 4 homepage tests still pass.
4. **[Incidental] `describeGalleryError` extracted** from `use-collections.ts` into `web/src/lib/error-message.ts` so both hooks share one §61 mapping; the collections hook's behaviour is unchanged (its tests still pass).

**Total deviations:** 4, none blocking. Impact on plan: none on requirements; the only visual judgement call is the toolbar→masonry gap.

## Issues Encountered

- Three lint errors surfaced the strict React 19 rules and were fixed rather than suppressed: an unused import; `useMasonryColumns` reading a ref during render (the initial state now measures the viewport, and the element is measured in the effect); and `usePosts` calling `setState` synchronously in the effect body for a missing filename (now derived into the return value).
- Initially `ClampedPostText` applied `line-clamp-5` even to short text; changed so a short tweet carries no clamp at all, which also keeps the test honest.

## User Setup Required

None. No new dependency, no environment variable, no server. The backend remains the operator's on their dev port; `web/src` contains no port literal and every test mocks `fetch`.

## Next Phase Readiness

- **Phase 6 (Discovery Tools).** `CollectionToolbar` already exposes the exact `search`/`onSearchChange`, `filterActive`/`onFilterClick`, `sort`/`onSortChange` contract, `SORT_OPTIONS` holds the four PRD §33 modes, `usePosts` already accepts `q`/`sort`/`tweet_from`/`tweet_to`/`saved_from`/`saved_to`, and `selectPostsViewState` + `CollectionFilterEmptyState` are wired. Phase 6 replaces the page's draft-state handlers, sets the applied query and makes `Clear filters` reset it — no component rewrite.
- **Phase 7 (Infinite Scroll).** `usePosts` returns `nextCursor`/`hasMore`; Phase 7 adds `loadMore` (append `items`, advance the cursor) and an `InfiniteLoader` sentinel; `GalleryMasonry` already accepts a `columns` override if the sentinel needs to span columns.
- **Phase 8 (Lightbox).** Post media tiles are deliberately not links yet, so `MediaLightbox` can wrap `PostMediaGrid` without changing `PostCard` or breaking the `Open on X` text path.
- **Phase 10 (Hardening).** The suite is the gate: `cd web && pnpm test` → 21 files / 154 tests; `pnpm build`, `pnpm exec tsc --noEmit` and `pnpm lint` are clean; no `43121` under `web/src`.

---
*Phase: 05-collection-gallery*
*Completed: 2026-09-27*
