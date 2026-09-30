---
phase: 06-discovery-tools
plan: 01
subsystem: web-frontend
tags: [search-debounce, url-query-state, use-search-params, date-range-filter, quick-presets, popover, sheet, responsive-breakpoint, local-to-utc-conversion, dst-boundaries, inclusive-end-of-day, request-key-reset, scroll-reset, stale-response-guard, vitest, jsdom, testing-library]

# Dependency graph
requires:
  - phase: 05-collection-gallery
    provides: "CollectionPage shell (header/toolbar/masonry/content-state region), CollectionToolbar props contract, SORT_OPTIONS + DEFAULT_SORT (saved_desc), selectPostsViewState + CollectionFilterEmptyState (`Clear filters`), usePosts(filename, options) with q/sort/tweet_from/tweet_to/saved_from/saved_to, pickPlaceholderGradient, formatLocalFullDate, and the mocked-fetch test runner"
  - phase: 03-web-scaffold
    provides: "React Router 7 routes + AppShell, editorial token layer (r-sm 12 / r-xl 20 / r-pill, grad-brand, shadow-popover, surface/surface-warm/ink/muted/border/accent), Radix `radix-ui` + shadcn Popover/Sheet wrappers, fetchPosts()/fetchCollections() through one `toQueryString` that never hardcodes a host"
  - phase: 02-gallery-http-api
    provides: "Server-side discovery semantics: trimmed case-insensitive substring search over author/username/text, independent AND-combinable inclusive date ranges (`!Before(from)` / `!After(to)`), the four sort modes, and `time.Parse(time.RFC3339)` for the bound params"
  - phase: docs/design
    provides: "phase2-design-spec.md §3.4 frame 6:236 measurement table, §2 tokens, §5 gradients, §6 a11y, §7 deviations"
provides:
  - "web/src/lib/date-bounds.ts: strict local YYYY-MM-DD parsing + local→RFC3339 UTC conversion (from → 00:00:00.000, to → 23:59:59.999), inverted-range detection, and the `Jan 1, 2026 → Sep 27, 2026` summary formatter"
  - "web/src/lib/gallery-query.ts: GalleryQuery + defensive parseGalleryQuery / serializeGalleryQuery / galleryQueryKey / datesFromQuery / applyFilterDates / hasActiveDateFilters / hasActiveQuery / galleryQueryToPostsParams — the URL ⇄ request-params boundary"
  - "web/src/lib/filter-presets.ts: QUICK_RANGE_PRESETS (Today / Last 7 Days / Last 30 Days / This Year), resolvePresetRange, activePresetFor, applyPresetToDates — Bookmarked-range-only, always overridable, click-again-to-clear"
  - "web/src/lib/scroll.ts: scrollNearTop() (window.scrollTo({top:0,left:0,behavior:'auto'})) for PRD-2 §77"
  - "web/src/hooks/use-gallery-query.ts: {query, search, setSearch, setSort, applyFilters, clearFilters, filterActive, hasActiveQuery, queryKey, requestParams} over useSearchParams — 300 ms debounced replace-on-type, push on sort/Apply/Clear, external-navigation cancels a pending debounce"
  - "web/src/hooks/use-media-query.ts: useIsDesktop() at the 768px md breakpoint (matchMedia when present, window.innerWidth fallback) + DESKTOP_MEDIA_QUERY/DESKTOP_MIN_WIDTH"
  - "usePosts(filename, options) now keys every resolution by `[filename, limit, sort, q, tweet_from, tweet_to, saved_from, saved_to]`: a query change synchronously yields loading / no posts / null cursor / no error, and a stale slower response can never land"
  - "web/src/components/gallery/{date-range-filter,filter-panel,filter-control}.tsx: labelled native date-input pair with the spec's 346×42 r12 surface-warm field and inline inverted-range alert; the 390-wide r20 panel (title/subtitle/3 sections/4 pills/Reset/Apply); and the Filter control — Popover ≥ md, Sheet < md, draft re-seeded from committed state on every open"
  - "CollectionToolbar gains `filterControl?: ReactNode` so Phase 6 supplies the real trigger in the built-in button's place, keeping Phase 5's default button and tests intact"
  - "CollectionPage is fully URL-driven: filter/sort/search commits, both date ranges, EmptyState vs FilterEmptyState, Clear filters, and the query-change scroll reset (mount skipped)"
  - "8 new test files / 78 new tests plus 3 tests added to existing files (29 files / 235 tests total, up from 21 / 154)"
affects: [phase-7, phase-8, phase-9, phase-10]

actuals:
  tokens: 0
  tasks: 7
  commits: 2

tech-stack:
  added: []
  patterns:
    - "The URL is the model, not a mirror: useSearchParams is the only storage for q/sort/dates, so Back/Forward, reload and a shared link are the same code path; components never hold committed discovery state"
    - "Local calendar dates live in the URL (`saved_from=2026-09-20`), RFC3339 UTC instants are derived only at request time — the conversion has exactly one home and one test file"
    - "Inclusive end-of-day convention: `to` is local 23:59:59.999, never next-day midnight, because the backend compares with `!After(to)` (<=); proven on both 2026 US DST transition days with explicit UTC expectations"
    - "Defensive parsing: parseGalleryQuery never throws on a hand-edited URL — unknown sort falls back to saved_desc, impossible dates (2026-02-31) are dropped, and no param is ever written with an undefined/blank value"
    - "Draft-vs-committed split: the filter panel edits a draft seeded when its surface opens and discarded on close without Apply; the trigger's active dot reflects only the committed query"
    - "Debounce cancellation: a `pendingSelfWriteRef` marks our own replace-writes so an external history move can cancel a pending debounce instead of re-committing a stale keystroke"
    - "Query-keyed request state: usePosts stamps every resolution with the requestKey it answered and returns a neutral loading state whenever the stamp is stale, so the view can never show page 1 of the previous query"
    - "One panel, two surfaces: FilterPanel is shared verbatim by the desktop Popover and the narrow Sheet, so the two cannot drift"
    - "No new dependency: the date inputs are native `<input type=\"date\">` and the sort control stays Phase 5's native `<select>` (SORT_OPTIONS labels), so the panel needs no styling library"
    - "Every test stubs global fetch through the shared URL-routing helper; Radix's ResizeObserver/pointer-capture gaps are filled with inert stubs in setup.ts so the mocked surfaces render in jsdom"

key-files:
  created:
    - web/src/lib/date-bounds.ts
    - web/src/lib/gallery-query.ts
    - web/src/lib/filter-presets.ts
    - web/src/lib/scroll.ts
    - web/src/hooks/use-gallery-query.ts
    - web/src/hooks/use-media-query.ts
    - web/src/components/gallery/date-range-filter.tsx
    - web/src/components/gallery/filter-panel.tsx
    - web/src/components/gallery/filter-control.tsx
    - web/src/lib/date-bounds.test.ts
    - web/src/lib/gallery-query.test.ts
    - web/src/lib/filter-presets.test.ts
    - web/src/hooks/use-gallery-query.test.tsx
    - web/src/hooks/use-media-query.test.tsx
    - web/src/components/gallery/date-range-filter.test.tsx
    - web/src/components/gallery/filter-control.test.tsx
    - web/src/pages/collection-page-discovery.test.tsx
  modified:
    - web/src/pages/collection-page.tsx
    - web/src/pages/collection-page.test.tsx
    - web/src/components/gallery/collection-toolbar.tsx
    - web/src/components/gallery/collection-toolbar.test.tsx
    - web/src/components/gallery/index.ts
    - web/src/hooks/use-posts.ts
    - web/src/hooks/use-posts.test.tsx
    - web/src/hooks/index.ts
    - web/src/lib/messages.ts
    - web/src/lib/index.ts
    - web/src/test/setup.ts

key-decisions:
  - "The URL stores local `YYYY-MM-DD` dates, not UTC instants: the user picks calendar days in their zone, so the URL stays readable/reloadable and the zone conversion happens once, at request time"
  - "An inverted range (from > to) is kept in the URL so it can be edited, emits **no** bounds and shows an inline `role=\"alert\"`, so `filterActive` is false for it and the request never carries a range the backend would answer with a guaranteed-empty set"
  - "Native `<input type=\"date\">` pair rather than a calendar library — zero new dependencies, real keyboard entry and the platform's own validation; the visual specification is met by wrapping them in the spec's 346×42 r12 surface-warm field"
  - "Quick presets target the **Bookmarked** range only (Today = today..today, This Year = Jan 1..today); the active pill is derived by exact comparison, so editing a field afterwards simply clears the pill instead of fighting the lock, and clicking the active pill clears the range"
  - "The sort control stays Phase 5's native `<select>` reusing SORT_OPTIONS/sortLabel — the mockup has no sort dropdown to match, and the PRD only requires the four modes be selectable"
  - "`serializeGalleryQuery` always writes `sort` (even the default) and never writes a cursor: sort is the one mode the design spec's panel does not contain, so making it explicit keeps the URL self-describing and keeps paging state out of history"
  - "`q` is stored raw (only trimmed when deriving the API param) so a typed trailing space is not swallowed by the input echo resyncing from the URL"
  - "Desktop is the default when `window.matchMedia` is unavailable (jsdom), with a `window.innerWidth` fallback; the breakpoint constant is the 768px `md` from the spec"
  - "`usePosts` keeps returning loading when its request key changes and drops any resolution whose key no longer matches — the guard lives in the hook so the page cannot show mismatched content"

patterns-established:
  - "Phase 7 seam: `useGalleryQuery().requestParams` + `queryKey` are the exact inputs a `loadMore` needs; `usePosts` already exposes nextCursor/hasMore and the reset-by-key rule means appending pages only has to extend the current key's page list"
  - "Phase 8 seam: the discovery panel and the lightbox never overlap — PostCard/PostMediaGrid are untouched, so wrapping post media in a lightbox trigger needs no change here"
  - "Phase 9 seam: nothing in this phase starts a server, reads a host or a port; the request layer is the Phase 3 client, so serving changes stay in the serving phase"
  - "Phase 10 seam: the quick-preset active pill uses coral `text-accent` on `bg-grad-brand` (design spec §3.4, kept verbatim) — flagged for the hardening phase's axe/contrast pass rather than silently restyled"

requirements-completed: [DISC-01, DISC-02, DISC-03, DISC-04, DISC-05, DISC-06, DISC-07, DISC-08]

coverage:
  - id: DISC-01
    description: "Server-side search: typed text reaches the API as `q` after a ~300 ms debounce with no submit button, echoing immediately in the input and never filtering the loaded array client-side"
    verification:
      - kind: unit
        ref: "web/src/hooks/use-gallery-query.test.tsx#useGalleryQuery — debounced search (DISC-01) > echoes every keystroke immediately but writes the URL once after ~300ms"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-gallery-query.test.tsx#useGalleryQuery — debounced search (DISC-01) > keeps an explicit sort chosen while the search debounce is pending"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — search (DISC-01) > debounces the typed text into one request and into the URL"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page.test.tsx#CollectionPage — discovery wiring (DISC-01, DISC-06) > debounces the typed search into a single q= request (DISC-01)"
        status: pass
      - kind: unit
        ref: "web/src/lib/gallery-query.test.ts#gallery-query — request params (DISC-01, DISC-04, DISC-05) > sends search as q and sort as sort, with limit"
        status: pass
    human_judgment: false
  - id: DISC-02
    description: "`Filter` opens a Popover ≥ md and a Sheet < md; the panel is 390 wide r20 with title/subtitle/section labels, four labelled manually-editable date fields, Reset and Apply; no submit button"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/filter-control.test.tsx#FilterControl — surface by breakpoint (DISC-02, PRD-2 §30/§66) > opens a Popover on desktop and not a Sheet"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/filter-control.test.tsx#FilterControl — surface by breakpoint (DISC-02, PRD-2 §30/§66) > opens a Sheet below the md breakpoint and not a Popover"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/filter-control.test.tsx#FilterControl — design spec §3.4 contents (DISC-02) > renders the title, subtitle, sections, four fields, pills and actions"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/filter-control.test.tsx#FilterControl — draft semantics (DISC-02) > stages edits and commits them only on Apply"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/filter-control.test.tsx#FilterControl — draft semantics (DISC-02) > discards the draft when the surface is closed without Apply"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — filter panel (DISC-02, DISC-03, DISC-06) > applies a manual Bookmarked range to the URL and the request"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-media-query.test.tsx#useIsDesktop — innerWidth fallback (no matchMedia) > treats a viewport below the 768px md breakpoint as narrow"
        status: pass
    human_judgment: false
  - id: DISC-03
    description: "Quick presets Today / Last 7 Days / Last 30 Days / This Year set the Bookmarked-date range only and leave both ranges editable afterwards"
    verification:
      - kind: unit
        ref: "web/src/lib/filter-presets.test.ts#filter-presets — resolved ranges > resolves each preset to inclusive local dates ending today"
        status: pass
      - kind: unit
        ref: "web/src/lib/filter-presets.test.ts#filter-presets — applied to the draft (DISC-03) > seeds the Bookmarked range and leaves the Tweet range untouched"
        status: pass
      - kind: unit
        ref: "web/src/lib/filter-presets.test.ts#filter-presets — applied to the draft (DISC-03) > stays manually overridable: editing a field clears the active preset"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/filter-control.test.tsx#FilterControl — quick presets (DISC-03) > seeds the Bookmarked range, leaves Tweet date, and stays editable"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — filter panel (DISC-02, DISC-03, DISC-06) > seeds the Bookmarked range from a quick preset"
        status: pass
    human_judgment: false
  - id: DISC-04
    description: "Tweet-date and Bookmarked-date filters can be active at the same time; the request carries both param pairs so the backend ANDs them"
    verification:
      - kind: unit
        ref: "web/src/lib/gallery-query.test.ts#gallery-query — request params (DISC-01, DISC-04, DISC-05) > sends both ranges at once (AND) with inclusive RFC3339 UTC bounds"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — URL drives the request (DISC-01, DISC-04, DISC-05, DISC-07) > sends the query, sort and both inclusive date ranges read from the URL"
        status: pass
    human_judgment: false
  - id: DISC-05
    description: "Local YYYY-MM-DD selections convert to RFC3339 UTC instants (from → local 00:00:00.000, to → local 23:59:59.999), including DST transition days and inverted/cleared fields"
    verification:
      - kind: unit
        ref: "web/src/lib/date-bounds.test.ts#date-bounds — inclusive boundaries (DISC-05) > maps from to local 00:00:00.000 and to to local 23:59:59.999"
        status: pass
      - kind: unit
        ref: "web/src/lib/date-bounds.test.ts#date-bounds — DST transition days (DISC-05) > covers the whole spring-forward local day (America/New_York 2026-03-08)"
        status: pass
      - kind: unit
        ref: "web/src/lib/date-bounds.test.ts#date-bounds — DST transition days (DISC-05) > covers the whole fall-back local day (America/New_York 2026-11-01)"
        status: pass
      - kind: unit
        ref: "web/src/lib/date-bounds.test.ts#date-bounds — inverted ranges (DISC-05) > flags from > to and emits no bounds at all"
        status: pass
      - kind: unit
        ref: "web/src/lib/date-bounds.test.ts#date-bounds — parsing > accepts real calendar dates and rejects malformed or impossible ones"
        status: pass
    human_judgment: false
  - id: DISC-06
    description: "All four sort modes are selectable (saved_desc default, saved_asc, tweet_desc, tweet_asc) and a sort change is a history push that refetches"
    verification:
      - kind: unit
        ref: "web/src/lib/gallery-query.test.ts#gallery-query — defensive URL parsing (DISC-07) > accepts each of the four PRD-2 §33 sort modes"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-gallery-query.test.tsx#useGalleryQuery — filter and sort commits (DISC-02, DISC-06) > makes all four sort modes selectable with saved_desc the default"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — sort (DISC-06) > pushes the chosen sort into the URL and refetches with it"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — sort (DISC-06) > restores the previous sort on Back and refetches"
        status: pass
    human_judgment: false
  - id: DISC-07
    description: "Search, filter and sort live in the URL query string; parsing is defensive; the cursor is never written; typing replaces while Apply/sort/Clear push; Back/Forward restores state and refetches"
    verification:
      - kind: unit
        ref: "web/src/lib/gallery-query.test.ts#gallery-query — defensive URL parsing (DISC-07) > ignores malformed dates instead of crashing"
        status: pass
      - kind: unit
        ref: "web/src/lib/gallery-query.test.ts#gallery-query — serialisation (DISC-07) > never writes a cursor"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-gallery-query.test.tsx#useGalleryQuery — URL is the source of truth (DISC-07) > restores the previous query on Back"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-gallery-query.test.tsx#useGalleryQuery — URL is the source of truth (DISC-07) > drops a pending debounce when history moves externally"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — URL drives the request (DISC-01, DISC-04, DISC-05, DISC-07) > shows the active dot for a filtered URL without any interaction"
        status: pass
    human_judgment: false
  - id: DISC-08
    description: "A search/filter/sort change immediately returns the post view to loading with no posts and a null cursor, scrolls near the top and fetches page 1; a stale slower response can never land"
    verification:
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — a query change resets the pages (PRD-2 §77, DISC-08) > shows loading with no posts and no cursor the moment the query changes"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-posts.test.tsx#usePosts — a query change resets the pages (PRD-2 §77, DISC-08) > ignores a stale response that resolves after a newer one"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — empty states and reset (DISC-08, PRD-2 §77) > shows the filter-no-match state with a working Clear filters"
        status: pass
      - kind: unit
        ref: "web/src/pages/collection-page-discovery.test.tsx#CollectionPage — empty states and reset (DISC-08, PRD-2 §77) > skips the scroll reset on mount and scrolls to the top on a query change"
        status: pass
    human_judgment: false

# Metrics
duration: 45min
completed: 2026-09-27
status: complete
commits:
  - 523707e docs(06): plan discovery tools (DISC-01..08)
  - 5ace14b feat(06): add discovery tools — URL query state, filter panel, date bounds
---

# Phase 6: Discovery Tools Summary

**The collection route is now fully discoverable through its URL: a 300 ms-debounced server-side search, a `Filter` control that is a Popover on desktop and a Sheet on narrow viewports (390-wide panel, manual Tweet/Bookmarked date ranges, four quick presets, Reset/Apply), all four sort modes, and a local→RFC3339 UTC date conversion with an inclusive end-of-day — every change cancels the previous page, resets the scroll and refetches, and Back/Forward restore the exact view.**

## Performance

- **Duration:** ~45 min
- **Completed:** 2026-09-27
- **Tasks:** 7 (plan → pure helpers → hooks → components → page wiring → tests → docs)
- **Files:** 28 in the implementation commit (17 created, 11 modified), 3,220 insertions
- **Machine:** `TZ` unset → resolved `Asia/Jakarta` (UTC+7, no DST), `date` = Sun Sep 27 2026 WIB

## Accomplishments

- **URL query state (DISC-07, DISC-06).** `useGalleryQuery` owns `q`/`sort`/`tweet_from`/`tweet_to`/`saved_from`/`saved_to` in `useSearchParams` and returns `{query, search, setSearch, setSort, applyFilters, clearFilters, filterActive, hasActiveQuery, queryKey, requestParams}`. Typing writes with `replace: true`; Apply/sort/Clear `push`. `parseGalleryQuery` never throws on a hand-edited URL (unknown sort → `saved_desc`, `2026-02-31` dropped, no params → the default view) and `serializeGalleryQuery` always writes `sort`, omits an empty `q`, and never writes a cursor.
- **Debounced search (DISC-01).** `setSearch` echoes the keystroke immediately in the controlled input and commits **one** write 300 ms after the last keystroke (`SEARCH_DEBOUNCE_MS`). The draft is bound to the URL string it was typed against, so an external history move cancels the pending debounce instead of re-committing a stale value; a sort chosen while the debounce is pending is preserved (the commit patches the current query rather than a captured one). There is no submit button and no client-side filtering of the loaded array — `q` goes to the API.
- **Filter control (DISC-02, DISC-03).** `FilterControl` renders the Phase 5 trigger markup and swaps the surface on `useIsDesktop()`: `Popover` at/above the 768px `md` breakpoint, `Sheet` (right) below it — both wrapping the **same** `FilterPanel`, so they cannot drift. The panel is `390` wide, `r20`, `surface`, padding `22`, `shadow-popover`, with Playfair Bold 24 `Filter your archive`, Inter 11 muted `Mix posted and bookmarked dates together.`, Inter SemiBold 11 section labels, four explicitly labelled native date inputs inside the spec's `346×42 r12 surface-warm` field, four quick pills, `Reset` (78×40) and `Apply` (92×40 `bg-grad-brand`). Edits are staged in a draft seeded on every open and discarded when the surface closes without Apply.
- **Quick presets (DISC-03).** `Today` / `Last 7 Days` / `Last 30 Days` / `This Year` (displayed `Today` / `7 days` / `30 days` / `This year`) set the **Bookmarked** range only, leaving the Tweet range untouched. The active pill is derived by exact comparison, so a manual edit afterwards just clears it, and clicking the active pill clears the range.
- **Date conversion (DISC-04, DISC-05).** `date-bounds.ts` parses strict local `YYYY-MM-DD` (rejecting `2026-2-1`, `2026-02-31`, `2023-02-29`) and emits `from` → local `00:00:00.000`, `to` → local `23:59:59.999` as RFC3339 UTC, so the backend's inclusive `<=` covers the whole final day. It never uses `new Date("YYYY-MM-DD")` (UTC-midnight parsing would shift the day in negative-offset zones). Both ranges are emitted together and the backend ANDs them; cleared fields are omitted; an inverted range is preserved in the URL for editing but emits no bounds and shows an inline `role="alert"`.
- **Sort (DISC-06).** All four `SORT_OPTIONS` modes are selectable through Phase 5's native `<select>` (`saved_desc` default); a change is a history push that produces a new request with the mode.
- **Query-keyed reset (DISC-08).** `usePosts` now stamps every resolution with the request key it answered and returns `loading` / `[]` / `null` cursor / no error whenever the stamp is stale, so the moment the query changes the previous page disappears, the cursor resets, and a slower earlier response can never land. The page scrolls near the top (`window.scrollTo({top:0,left:0,behavior:'auto'})`) on every query change after mount, and the `No posts match your filters` / `Clear filters` branch is now reachable end-to-end.
- **Toolbar seam closed (DISC-02).** `CollectionToolbar` gained `filterControl?: ReactNode`, so the real trigger sits in the button's place while the built-in button, its `onFilterClick` and its tests all still work.
- **Tests.** 8 new files / 78 new tests plus 3 tests added to existing files: **29 files / 235 tests, up from 21 / 154**. All against a mocked `fetch`; `src/test/setup.ts` gained a `window.scrollTo` no-op and inert `ResizeObserver`/pointer-capture stubs so Radix's surfaces render in jsdom.

## Task Commits

| Commit | Subject |
|--------|---------|
| `523707e` | `docs(06): plan discovery tools (DISC-01..08)` |
| `5ace14b` | `feat(06): add discovery tools — URL query state, filter panel, date bounds` |

Both made with `gsd-tools query commit … --files <explicit paths>` (`committed: true`). The summary is committed separately with `docs(06): summarize discovery tools`.

## Files Created/Modified

**Created (17)**
- Helpers: `web/src/lib/{date-bounds,gallery-query,filter-presets,scroll}.ts`
- Hooks: `web/src/hooks/{use-gallery-query,use-media-query}.ts`
- Components: `web/src/components/gallery/{date-range-filter,filter-panel,filter-control}.tsx`
- Tests: `web/src/lib/{date-bounds,gallery-query,filter-presets}.test.ts`, `web/src/hooks/{use-gallery-query,use-media-query}.test.tsx`, `web/src/components/gallery/{date-range-filter,filter-control}.test.tsx`, `web/src/pages/collection-page-discovery.test.tsx`

**Modified (11)**
- `web/src/pages/collection-page.tsx` — URL-driven query/filters/sort, Clear filters, scroll reset
- `web/src/pages/collection-page.test.tsx` — the two obsolete "seam is inert" tests replaced by request-level search/sort tests (+ helper)
- `web/src/components/gallery/collection-toolbar.tsx` — optional `filterControl`, updated seam docs
- `web/src/components/gallery/collection-toolbar.test.tsx` — the `filterControl` override test
- `web/src/components/gallery/index.ts` — new component exports
- `web/src/hooks/use-posts.ts` — request-keyed state, stale-resolution guard
- `web/src/hooks/use-posts.test.tsx` — reset-on-query-change and the out-of-order race
- `web/src/hooks/index.ts` — new hook exports
- `web/src/lib/messages.ts` — panel/field/preset/alert copy constants
- `web/src/lib/index.ts` — new module re-exports
- `web/src/test/setup.ts` — `scrollTo` no-op + Radix jsdom stubs

## Decisions Made

All plan decisions were kept; the load-bearing ones:

1. **The URL stores local `YYYY-MM-DD` dates, not UTC instants.** The user picks calendar days in their own zone; the URL stays readable, reloadable and shareable, and the zone conversion lives in exactly one pure module invoked at request time. RFC3339 UTC appears only in the request.
2. **Inverted range: keep it, flag it, send nothing.** `from > to` is preserved in the URL (so the user can fix it in place), emits no bounds, and shows `From must be on or before To.` as an inline `role="alert"`; `filterActive` is therefore false for it. Silently swapping the bounds or sending a guaranteed-empty range were both worse.
3. **Native `<input type="date">` pair, no new dependency.** Real keyboard entry and platform validation; the design spec's field is met by the wrapper (dimensions, `surface-warm`, radius, `→` separator, summary line).
4. **Presets are a starting point, not a lock.** They write the Bookmarked range, the active pill is derived by comparison, editing clears it, and clicking the active pill clears the range. `This Year` means Jan 1 of the current local year → today.
5. **Sort stays Phase 5's native `<select>`** reusing `SORT_OPTIONS`/`sortLabel`; the mockup has no sort dropdown, and the PRD requires only that the four modes be selectable.
6. **`serializeGalleryQuery` always writes `sort` and never a cursor.** Sort is the only discovery mode with no panel control, so its presence makes the URL self-describing; the cursor is request state, not navigation state.
7. **`q` is stored raw, trimmed only for the API param.** Trimming at commit time would swallow a typed trailing space when the input echo resyncs from the URL.
8. **Desktop is the default when `matchMedia` is unavailable**, with a `window.innerWidth` fallback; the breakpoint is the spec's 768px `md`.

## Deviations from Plan

1. **[Recorded decision, not a surprise] The two Phase 5 "the seam is inert" page tests were replaced, not kept.** `"does not fake filtering…"` and `"sends the default sort and does not resend when the sort control changes"` asserted the *absence* of Phase 6 behaviour and would now fail by design. They were replaced in place by request-level equivalents (`debounces the typed search into a single q= request`, `pushes a new request when the sort control changes`), and the file's header comment points at `collection-page-discovery.test.tsx` for the full flow.
2. **[Added scope, justified] One test added to `collection-toolbar.test.tsx`** for the new `filterControl` prop, so the seam that Phase 6 depends on is pinned rather than assumed.
3. **[Incidental] `src/test/setup.ts` gained a `window.scrollTo` no-op and inert `ResizeObserver` / `hasPointerCapture` stubs.** jsdom implements neither and Radix's Popper observes content size; the stubs are inert and the tests that care assert the real calls. No production behaviour is affected.
4. **[Discovery, left unfixed deliberately] The `typecheck` npm script is a no-op.** `web/tsconfig.json` is solution-style (`"files": []` + `references`), so `tsc --noEmit` (the `typecheck` script) resolves zero input files and always exits 0. The real check is `tsc -b`, which `pnpm build` runs — and it caught a genuine error during this phase (`process` referenced in a test, now removed). `web/package.json` was outside this plan's declared file list, so the script was left alone and the finding is reported here for Phase 9/10; **use `pnpm build`, not `pnpm typecheck`, as the type gate.**

**Total deviations:** 4, none blocking. Impact on plan: none on requirements; one pre-existing tooling defect surfaced and documented.

## Issues Encountered

- **`process` in a test broke `tsc -b`.** The DST tests needed to switch `TZ`; writing `process.env.TZ` compiled under vitest but failed the build because `tsconfig.app.json` has `types: ["vite/client"]` and no Node globals. Fixed by using vitest's `vi.stubEnv("TZ", zone)` + `vi.unstubAllEnvs()` in a `finally`, which keeps the file free of Node globals and still triggers Node's runtime zone re-read (verified: it changed the resolved zone for `new Date`).
- **`tsc --noEmit` was silently green.** It passed while `tsc -b` failed, which is how the no-op `typecheck` script was discovered — reported above rather than papered over.
- **Radix surfaces crashed in jsdom.** `@radix-ui/react-use-size` constructs `ResizeObserver` unguarded and jsdom has none; the Sheet also needs pointer-capture stubs. Added inert stubs in `setup.ts`.
- **The whitespace-trimming hazard.** Committing a trimmed `q` while the input echo resyncs from the URL would swallow a typed trailing space; fixed by keeping `q` raw in the URL and trimming only when deriving the request param.
- **Lint (React 19 `set-state-in-effect`).** Avoided by design: the search draft is bound to the URL string it was typed against (no setState in an effect body) and `useIsDesktop` only sets state from an event callback.
- **One discovery test initially asserted too much** (`every` posts request has no `saved_from`, which ignored the legitimate first request that read the filter *from* the URL); scoped to the requests issued after the reset.

## User Setup Required

None. No new dependency, no environment variable, no server. `web/src` contains no port literal (`grep -rn '43121' web/src` → no matches), nothing in this phase starts or stops a process, and every test mocks `fetch` (`pgrep -af '[v]ite|[p]npm dev'` → nothing).

## Next Phase Readiness

- **Phase 7 (Infinite Scroll).** `useGalleryQuery().requestParams` and `.queryKey` are exactly what a `loadMore` needs; `usePosts` already exposes `nextCursor`/`hasMore` and already guarantees that any query change resets to page 1 with a null cursor, so appending pages only has to extend the current key's list. The cursor is deliberately absent from the URL, so paging introduces no history entries.
- **Phase 8 (Media Lightbox).** `PostCard`/`PostMediaGrid`/`MediaImage` were not touched; the discovery panel and the sheet/popover stack are separate surfaces, so a lightbox can wrap post media without interaction with this phase.
- **Phase 9 (Production Serving).** No host, port or process coupling was added anywhere in `web/src`; the request layer is still the Phase 3 client, so serving changes remain confined to that phase.
- **Phase 10 (Hardening).** Two items to pick up there: (1) the quick-preset **active pill uses coral `text-accent` on `bg-grad-brand`** per design spec §3.4 — kept verbatim because the spec is authoritative, but it is the most likely axe/contrast finding in this panel and should be measured, not silently restyled; (2) the debounce cancellation relies on string-comparing the previous URL with the new one (`pendingSelfWriteRef`/`lastUrlRef`) — proven by the Back test, but a future writer that mutates params without changing the string could defeat it. The `typecheck` no-op above also belongs to the hardening phase.
- **Fragile-but-covered:** `usePosts`' stale-response guard is tested with an out-of-order resolution (newer first, stale second), and the DST expectations are literal UTC strings in `date-bounds.test.ts` rather than values derived from the implementation; a mutation that moved the end boundary to next-day midnight failed **7 tests across 3 files** and was restored.

---
*Phase: 06-discovery-tools*
*Completed: 2026-09-27*
