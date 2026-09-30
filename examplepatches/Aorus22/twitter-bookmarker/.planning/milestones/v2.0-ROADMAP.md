# Roadmap: Twitter Bookmarker

## Milestones

- ✅ **v1.0 MVP** — Phases 1-6 (Shipped: 2026-09-27) — archived at `.planning/milestones/v1.0-ROADMAP.md`
- 🚧 **v2.0 Local Web Gallery** — Phases 1-10 (In progress)

## v2.0 Local Web Gallery

**Status:** 🚧 In progress · **Source:** `PRD-2.md` · **Design:** Figma `Gallery Mockups v2 — Editorial`
**Phase numbering:** reset to 1 for this milestone. Each phase below maps 1:1 to the `PRD-2.md` §85 implementation order (roadmap Phase 1 = PRD Phase 2.1, roadmap Phase 10 = PRD Phase 2.10).

### Overview

v2.0 makes the CSV archive browsable. It is built in the PRD's recommended order: prove the read layer first (CSV → collections → posts → filter/search/sort/cursor), expose it over `/api/gallery/*` without touching the frozen `/v1/*` contract, then stand up the `web/` app on the official shadcn Vite template, then build the browsing experience outward from the homepage, the masonry collection view, discovery tools, infinite scroll, and the lightbox, then fold the built app back into the single Go process, and finally harden the edge cases, accessibility, and responsive behaviour.

The backend and the web app are deliberately kept in separate phases so each can be verified on its own: the read layer with Go tests, the HTTP API with acceptance tests against a seeded storage dir, and each frontend slice by building and exercising it against a live backend.

### Phases

**Phase Numbering:**

- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

- [x] **Phase 1: Gallery Read Layer** - A dedicated `backend/internal/gallery/` module that turns CSVs into collection summaries and paginated, filtered, searched, sorted posts (completed 2026-09-27)
- [x] **Phase 2: Gallery HTTP API** - `GET /api/gallery/collections` and `GET /api/gallery/collections/{filename}/posts` with validation, 404/400/500 semantics, and path-traversal rejection, alongside an unchanged `/v1/*` (PRD §2.2; PRD §36–§41, §54) (completed 2026-09-27)
- [x] **Phase 3: Web Scaffold, Theme & API Client** - The `web/` app created with the official shadcn Vite CLI, wired with routing, the v2 Editorial design tokens, light/dark/system theme, the Vite `/api` proxy, and a typed relative-URL API client (PRD §2.3; PRD §13, §14, §55, §72) (completed 2026-09-27)
- [x] **Phase 4: Gallery Homepage** - Collection cards with cover collages, counts, last-bookmarked dates, empty/no-media/broken-image handling, skeletons and retry (PRD §2.4; PRD §16, §17, §38, §59, §61, §62) (completed 2026-09-27)
- [x] **Phase 5: Collection Gallery** - Pinterest-style masonry of post cards with adaptive multi-media grids, text-only cards, full metadata, and Open on X (PRD §2.5; PRD §18–§25, §60, §73) (completed 2026-09-27)
- [x] **Phase 6: Discovery Tools** - Debounced server-side search, combinable tweet/bookmarked date filters with quick ranges, four sort modes, and URL-backed state (PRD §2.6; PRD §28–§33, §76, §77) (completed 2026-09-27)
- [x] **Phase 7: Infinite Scroll** - IntersectionObserver cursor pagination with skeleton and bottom-loader states, dedupe, and refetch on focus (PRD §2.7; PRD §34, §35, §44, §47, §68) (completed 2026-09-27)
- [x] **Phase 8: Media Lightbox** - Large media plus metadata panel, prev/next across the loaded dataset, focus trap, and Escape/arrow keyboard navigation (PRD §2.8; PRD §26, §27, §67) (completed 2026-09-27)
- [x] **Phase 9: Production Serving** - The Go server serves `web/dist` with API precedence, SPA fallback, a proper API 404, graceful missing-dist handling, and Makefile targets (PRD §2.9; PRD §11, §56–§58, §84) (completed 2026-09-27)
- [x] **Phase 10: Hardening, Accessibility & Responsive** - Malformed-data and large-CSV hardening, error/retry UX, responsive columns and Sheet filter, accessibility, and the PRD §82 integration scenario (PRD §2.10; PRD §61, §62, §66, §67, §82) (completed 2026-09-28)

### Phase Details

#### Phase 1: Gallery Read Layer

**Goal**: A self-contained `backend/internal/gallery/` package reads the current CSVs and produces collection summaries plus post pages with search, both date filters, all four sorts, and opaque cursor pagination.
**Depends on**: Nothing (first phase of v2.0; builds on the v1.0 storage layer)
**Requirements**: GAL-01, GAL-02, GAL-03, GAL-04, GAL-05, GAL-06, GAL-07, GAL-08, GAL-09, GAL-10, GAL-11, GAL-12, GAL-13, GAL-14, GAL-15, GAL-16
**Success Criteria** (what must be TRUE):

  1. A seeded storage dir yields one collection per `*.csv` with correct `post_count`, `media_count`, `last_saved_at`, and up to four newest `cover_media`, ordered by `last_saved_at` DESC
  2. Posts carry `tweet_id` derived from the URL, text-only rows are returned with `media: []`, and malformed media JSON or a malformed row is skipped with a warning rather than failing the collection
  3. Search matches `author`/`username`/`text` case-insensitively; tweet-date and bookmarked-date filters combine inclusively; all four sort modes order correctly
  4. Cursor pagination walks the whole collection without gaps or repeats, and re-reading after appending a row surfaces the new post without any restart
  5. Traversal-style filenames (`../x.csv`, `/etc/passwd`, `a/b.csv`, `x.txt`) are rejected

**Plans**: 1 plan

Plans:

- [x] 01-01: Gallery read layer package — CSV discovery, summaries, media parsing, search, date filters, sorts, cursor pagination

#### Phase 2: Gallery HTTP API

**Goal**: The gallery read layer is exposed over read-only `/api/gallery/*` endpoints with the documented response shapes and `400`/`404`/`500` error semantics, while `/health`, `/v1/index`, and `POST /v1/bookmarks` keep their exact v1.0 contracts.
**Depends on**: Phase 1
**Requirements**: API-01, API-02, API-03, API-04, API-05, API-06, API-07
**Success Criteria** (what must be TRUE):

  1. `GET /api/gallery/collections` returns the documented JSON for every valid CSV, including media-less collections
  2. `GET /api/gallery/collections/{filename}/posts` honours `cursor`, `limit`, `q`, `tweet_from`/`tweet_to`, `saved_from`/`saved_to`, and `sort`, returning `items`, `next_cursor`, and `has_more`
  3. `limit` defaults to 30 and is capped at 100; bad values return `400`; unknown collections return `404` in the `{"status":"error","reason":...}` shape without leaking paths
  4. The existing v1.0 endpoint contracts still pass their tests unchanged, and no gallery route mutates user data

**Plans**: TBD

#### Phase 3: Web Scaffold, Theme & API Client

**Goal**: `web/` exists as a shadcn-CLI-generated Vite + React + TypeScript app with the two required routes, the v2 Editorial design tokens wired for light/dark/system, a `/api` dev proxy, and a typed API client that only ever calls relative URLs.
**Depends on**: Phase 2
**Requirements**: WEB-01, WEB-02, WEB-03, WEB-04, WEB-05, WEB-06, WEB-07, WEB-08
**Success Criteria** (what must be TRUE):

  1. `pnpm build` inside `web/` produces `web/dist` and TypeScript typechecks cleanly
  2. `/` and `/collections/:filename` render through React Router with shared navigation chrome, and a bad route shows a not-found state
  3. The theme toggle switches light/dark and defaults to following the system, with the Figma palette and Playfair/Inter typography applied through tokens
  4. The API client contains no hardcoded backend port, and the Vite dev proxy forwards `/api` to `127.0.0.1:43121`

**Plans**: TBD

#### Phase 4: Gallery Homepage

**Goal**: The homepage lists every collection as a card with a cover collage, name, post/media counts, and last-bookmarked date, handling media-less collections, broken images, loading, empty, and error states.
**Depends on**: Phase 3
**Requirements**: HOME-01, HOME-02, HOME-03, HOME-04, HOME-05, HOME-06, HOME-07, HOME-08, HOME-09
**Success Criteria** (what must be TRUE):

  1. Every CSV appears as a card ordered by most recent activity, with counts and last-saved date matching the backend summary
  2. Cover collages adapt to 4+, 3, 1, and 0 media per the PRD rules, and no avatar is ever used as a cover
  3. Clicking a card navigates to the collection route
  4. With no CSVs the "No collections yet" empty state renders; a down backend shows the connection error with a working `Retry`; loading shows skeletons; broken covers degrade without breaking layout
  5. Returning to the tab refetches the homepage

**Plans**: TBD

#### Phase 5: Collection Gallery

**Goal**: Opening a collection renders a responsive Pinterest-style masonry of post cards — adaptive multi-media grids, text-only cards, complete metadata, and an Open on X link — with correct empty and broken-media behaviour.
**Depends on**: Phase 4
**Requirements**: COLL-01, COLL-02, COLL-03, COLL-04, COLL-05, COLL-06, COLL-07, COLL-08, COLL-09, COLL-10, COLL-11
**Success Criteria** (what must be TRUE):

  1. The header shows back navigation, the collection name, and `posts · media` counts above the toolbar
  2. Cards flow in 1/2-3/4-5 columns by viewport with natural, non-uniform heights, and one tweet with four images renders as a single card showing all four
  3. Text-only posts render as compact cards and every card exposes author, username, text, tweet date, saved date, and Open on X with `rel="noopener noreferrer"`
  4. Long text clamps with a `Show more` affordance, images lazy-load straight from `pbs.twimg.com`, broken media degrades gracefully, and a postless collection shows "This collection is empty"

**Plans**: TBD

#### Phase 6: Discovery Tools

**Goal**: The collection page gains debounced server-side search, a filter popover (Sheet on narrow viewports) with tweet-date and bookmarked-date ranges plus quick presets, four sort modes, and URL-backed state that resets pagination on change.
**Depends on**: Phase 5
**Requirements**: DISC-01, DISC-02, DISC-03, DISC-04, DISC-05, DISC-06, DISC-07, DISC-08
**Success Criteria** (what must be TRUE):

  1. Typing in search filters results after ~300 ms with no submit button, matching text, author, and username case-insensitively
  2. Tweet-date and bookmarked-date filters can be applied together and the result satisfies both inclusive ranges, with local pickers converted to RFC3339 UTC boundaries
  3. Quick presets (Today, Last 7 Days, Last 30 Days, This Year) target the bookmarked date and remain manually editable, and `Reset`/`Apply` behave as specified
  4. All four sort modes are selectable with Newest Bookmarked as default; search/filter/sort live in the URL and changing any of them clears pages, resets the cursor, and scrolls near the top

**Plans**: TBD

#### Phase 7: Infinite Scroll

**Goal**: The collection gallery loads 30-post pages through an IntersectionObserver sentinel and an opaque cursor, accumulating pages without duplicates and showing skeletons and a bottom loader instead of blank screens.
**Depends on**: Phase 6
**Requirements**: SCROLL-01, SCROLL-02, SCROLL-03, SCROLL-04, SCROLL-05
**Success Criteria** (what must be TRUE):

  1. Scrolling near the end fetches the next page automatically, with no pagination control and no primary Load More button
  2. Skeletons render on first load and a small bottom loader on subsequent loads; the page is never blank mid-fetch
  3. Appended pages contain no duplicate `tweet_id`s, requests stop when `has_more` is false, and a row appended mid-scroll does not produce obvious repeats
  4. Route entry, filter/search/sort changes, window focus, and manual refresh all refetch without aggressive polling

**Plans**: TBD

#### Phase 8: Media Lightbox

**Goal**: Clicking media opens an accessible lightbox with a large media area and a metadata panel, prev/next navigation across the loaded dataset, focus trapping, and Escape/arrow keyboard control that preserves gallery scroll on close.
**Depends on**: Phase 7
**Requirements**: LIGHT-01, LIGHT-02, LIGHT-03, LIGHT-04, LIGHT-05, LIGHT-06
**Success Criteria** (what must be TRUE):

  1. The lightbox shows the active image large with author, username, text, dates, and Open on X; desktop places metadata beside the media and mobile places it below
  2. Next/previous moves within the tweet's media and continues into the neighbouring tweets' media
  3. Escape closes, ArrowLeft/ArrowRight navigate, focus is trapped while open and restored on close, and all controls are keyboard reachable
  4. Closing the lightbox returns the user to the same gallery scroll position

**Plans**: TBD

#### Phase 9: Production Serving

**Goal**: The single Go process serves the built `web/dist` at `/` with API routes taking precedence, an SPA fallback for client routes, a proper API 404, graceful behaviour when `dist` is missing, and Makefile targets for the web app.
**Depends on**: Phase 8
**Requirements**: PROD-01, PROD-02, PROD-03, PROD-04, PROD-05, PROD-06
**Success Criteria** (what must be TRUE):

  1. `pnpm build` in `web/` followed by running the server serves the gallery at `http://127.0.0.1:43121` with no Vite process
  2. `/api/*`, `/v1/*`, and `/health` are never swallowed by the SPA fallback, and an unknown `/api/*` path returns the API error JSON with `404`
  3. A direct browser refresh on `/collections/linux.csv` serves `index.html` and the route renders
  4. A missing `web/dist` logs a clear message instead of crashing; the Makefile exposes web/dev targets and `make build` still builds the server binary and extension `dist/`

**Plans**: TBD

#### Phase 10: Hardening, Accessibility & Responsive

**Goal**: Lock in the edge cases — malformed data, large CSVs, backend failures with retry, responsive columns and Sheet filtering, accessibility — and prove the PRD §82 integration scenario end-to-end.
**Depends on**: Phase 9
**Requirements**: HARD-01, HARD-02, HARD-03, HARD-04, HARD-05, HARD-06
**Success Criteria** (what must be TRUE):

  1. Automated tests cover malformed media JSON, malformed rows, and a large CSV without taking down a collection or the server
  2. Backend-down and API-error states show the specified messages with a working `Retry`
  3. The layout works on desktop/tablet/mobile with the specified column counts and the filter control becoming a Sheet on narrow viewports
  4. Controls are keyboard reachable with visible focus, images have contextual `alt` text, dialogs trap focus and close on Escape, and contrast is adequate
  5. The §82 integration scenario passes against a seeded storage dir, including a bookmark appended while the server runs appearing after a window-focus refetch

**Plans**: TBD

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Gallery Read Layer | 1/1 | Complete    | 2026-09-27 |
| 2. Gallery HTTP API | 1/1 | Complete    | 2026-09-27 |
| 3. Web Scaffold, Theme & API Client | 1/1 | Complete    | 2026-09-27 |
| 4. Gallery Homepage | 1/1 | Complete    | 2026-09-27 |
| 5. Collection Gallery | 1/1 | Complete    | 2026-09-27 |
| 6. Discovery Tools | 1/1 | Complete    | 2026-09-27 |
| 7. Infinite Scroll | 1/1 | Complete    | 2026-09-27 |
| 8. Media Lightbox | 1/1 | Complete    | 2026-09-27 |
| 9. Production Serving | 1/1 | Complete    | 2026-09-27 |
| 10. Hardening, Accessibility & Responsive | 1/1 | Complete    | 2026-09-28 |
