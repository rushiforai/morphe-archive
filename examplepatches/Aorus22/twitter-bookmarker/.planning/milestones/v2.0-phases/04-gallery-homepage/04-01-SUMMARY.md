---
phase: 04-gallery-homepage
plan: 01
subsystem: web-frontend
tags: [homepage, collection-card, cover-collage, adaptive-layout, product-states, broken-image-fallback, deterministic-placeholder, window-focus-refetch, vitest, jsdom, testing-library, react-router]

# Dependency graph
requires:
  - phase: 03-web-scaffold
    provides: "AppShell + routes, editorial token layer, ThemeProvider, fetchCollections()/ApiError, GalleryCollection type, 11 shadcn primitives"
  - phase: 02-gallery-http-api
    provides: "GET /api/gallery/collections -> {collections:[filename,name,post_count,media_count,last_saved_at,cover_media]}; 400/404/500 as {status:'error',reason}"
  - phase: docs/design
    provides: "phase2-design-spec.md §2 tokens, §3.2 homepage frame 6:16, §3.6 product states, §6 a11y, §7 deliberate deviations"
provides:
  - "GalleryPage: hero + section header + responsive 244x330 collection grid + footer line"
  - "Adaptive CollectionCover collage (4+/3/2/1/0) with full-bleed 245x181 region, 5px gap, r14 tiles"
  - "MediaImage primitive: loading=lazy, decoding=async, onError -> same-box deterministic gradient placeholder"
  - "Product states: MasonrySkeleton (loading), GalleryEmptyState, GalleryErrorState(message + Retry)"
  - "useCollections(): status/collections/error/errorMessage/refetch + window-focus refetch"
  - "Pure helpers in src/lib: selectCoverLayout/sliceCoverMedia, pickPlaceholderGradient, formatLastSaved/formatLocalDate/formatLocalDateTime, formatCollectionMeta/formatCount, orderCollections, PRD copy constants"
  - "vitest 5 + jsdom 30 + @testing-library (react/dom/jest-dom/user-event) runner: web/vitest.config.ts, src/test/setup.ts, pnpm test"
  - "8 test files / 50 tests, all with a mocked fetch"
affects: [phase-5, phase-6, phase-7, phase-8]

actuals:
  tokens: 0
  tasks: 6
  commits: 2

tech-stack:
  added:
    [
      "vitest@5.0.2, jsdom@30.1.1",
      "@testing-library/react@16.3.3, @testing-library/dom@10.4.2, @testing-library/jest-dom@7.0.1, @testing-library/user-event@14.6.7",
      "@types/node bumped 20.19.43 -> 24.19.0 (vitest 5 peer: ^22 || >=24)",
    ]
  patterns:
    - "One image primitive (MediaImage) owns lazy/async/onError; a broken URL becomes a same-size gradient placeholder instead of collapsing the box"
    - "Layout decisions are pure functions (selectCoverLayout, pickPlaceholderGradient) tested in isolation, then consumed by dumb components"
    - "PRD-prescribed copy lives once in src/lib/messages.ts; the API client imports the §61 connection string instead of duplicating it"
    - "Placeholder gradients are applied as inline background-image: var(--grad-ph-*) so no dynamic Tailwind class must survive the class scanner"
    - "useCollections keys its request on a counter; refetch() bumps it, a per-effect cancelled flag drops stale resolutions, and a window focus listener calls refetch()"
    - "Every test stubs global fetch (vi.stubGlobal) and setup.ts unstubs after each test: no network, no server, never the operator's dev-port backend"
    - "Vitest config is separate from vite.config.ts so the build config keeps importing defineConfig from vite"

key-files:
  created:
    - web/vitest.config.ts
    - web/src/test/setup.ts
    - web/src/lib/messages.ts
    - web/src/lib/cover.ts
    - web/src/lib/placeholder.ts
    - web/src/lib/date.ts
    - web/src/lib/collection-meta.ts
    - web/src/lib/collection-order.ts
    - web/src/lib/index.ts
    - web/src/hooks/use-collections.ts
    - web/src/components/gallery/media-image.tsx
    - web/src/components/gallery/collection-cover.tsx
    - web/src/components/gallery/collection-card.tsx
    - web/src/components/gallery/collection-skeleton.tsx
    - web/src/components/gallery/gallery-empty-state.tsx
    - web/src/components/gallery/gallery-error-state.tsx
    - web/src/components/gallery/gallery-hero.tsx
    - web/src/components/gallery/index.ts
    - web/src/lib/{cover,placeholder,date,collection-meta,collection-order}.test.ts
    - web/src/components/gallery/{media-image,collection-card}.test.tsx
    - web/src/pages/gallery-page.test.tsx
  modified:
    - web/package.json
    - web/pnpm-lock.yaml
    - web/src/index.css
    - web/src/lib/api/client.ts
    - web/src/hooks/index.ts
    - web/src/pages/gallery-page.tsx

key-decisions:
  - "Two media uses a `stack` layout (two full-width 88px rows): PRD-2 §17 only names 4+/3/1/0, and this keeps the spec's tile height and a balanced look"
  - "Layout is chosen from the number of usable cover tiles (cover_media length, clamped to 4) rather than media_count, so media_count>0 with an empty or all-broken cover_media still renders the placeholder instead of an empty box"
  - "Card secondary line is the CSV filename: the mockup's description is omitted by spec §7 (no CSV field), and the filename is real data that keeps the slot meaningful without inventing copy"
  - "The meta row is `83 posts · 126 media · Last saved Sep 27` — PRD §16's required last-bookmarked date lives where the mockup's meta text sits, styled Inter Medium 11 muted"
  - "Error copy mapping: transport failure (ApiError.status 0, backend not running) -> exact PRD §61 `Could not connect to Twitter Bookmarker backend`; any other gallery API failure -> the §61 `Could not load this collection` class message; both render Retry"
  - "The hero CTA is a real <a href=\"#collections-grid\"> (keyboard reachable, works without JS) instead of a dead button; the hero caption is derived from real collection/media counts, never invented copy"
  - "One dark-mode token is overridden: .dark { --grad-hero: linear-gradient(135deg,#2a2230,#3a2940) } because the spec's light cream hero would put white --ink text on cream; no new variable name is introduced"
  - "Hero/art radius uses rounded-2xl (24px), which design spec §2.4 defines as the r-2xl 24–26px range, so the raw 26px literal was not added"
  - "orderCollections only partitions timestamp-less collections to the end (stably); it returns the received array untouched when every collection has a date, so the backend's last_saved_at DESC ordering is never second-guessed"
  - "`•••` overflow control omitted (PRD §5 forbids card actions, spec §7); `Recently updated ▾` rendered as a static label (PRD §38 fixes ordering)"
  - "vitest.config.ts is separate from vite.config.ts so the dev/build config keeps importing defineConfig from `vite` while the test config owns its `test` block"

patterns-established:
  - "Phases 5–8 import from @/lib/{cover,placeholder,date,collection-meta,messages,collection-order} and @/components/gallery; no phase re-implements a cover layout, a date format, or the PRD copy"
  - "State components take the message/action as props (GalleryErrorState({message,onRetry})), so Phase 5 reuses them with `Could not load this collection`"
  - "Any new UI claim in this milestone is expected to come with a jsdom test using a mocked fetch; pnpm test is the gate"

requirements-completed: [HOME-01, HOME-02, HOME-03, HOME-04, HOME-05, HOME-06, HOME-07, HOME-08, HOME-09]

coverage:
  - id: D1
    description: "Homepage fetches GET /api/gallery/collections on mount and renders one card per collection inside the hero/section-header/footer frame"
    requirement: "HOME-01"
    verification:
      - kind: unit
        ref: "web/src/pages/gallery-page.test.tsx#GalleryPage — populated > renders the hero, section header, footer and one card per collection (mocked fetch)"
        status: pass
      - kind: e2e
        ref: "cd web && pnpm test -> 8 files / 50 tests pass"
        status: pass
    human_judgment: false
  - id: D2
    description: "Each card shows cover collage, collection name, post count, media count and last bookmarked date"
    requirement: "HOME-02"
    verification:
      - kind: unit
        ref: "collection-card.test.tsx#renders the name, filename, counts and last-saved date; collection-meta.test.ts#renders post count, media count and the last-saved date"
        status: pass
      - kind: unit
        ref: "date.test.ts#renders the PRD-2 §16 meta string with the local month and day; adds the year when the save is not from the current year; null -> No saves yet"
        status: pass
    human_judgment: false
  - id: D3
    description: "Backend last_saved_at DESC order is preserved; only timestamp-less collections are moved last"
    requirement: "HOME-03"
    verification:
      - kind: unit
        ref: "collection-order.test.ts (same-reference when all dated, nulls last, stable within groups)"
        status: pass
      - kind: unit
        ref: "gallery-page.test.tsx#keeps timestamp-less collections last without re-sorting the rest (response [Quiet, Linux, Design] -> DOM [Linux, Design, Quiet])"
        status: pass
    human_judgment: false
  - id: D4
    description: "Card click navigates to /collections/:filename through a real router link, keyboard reachable, filename URL-encoded"
    requirement: "HOME-04"
    verification:
      - kind: unit
        ref: "collection-card.test.tsx#links the whole card to /collections/:filename; #URL-encodes the filename in the href (a b/c.csv -> a%20b%2Fc.csv)"
        status: pass
    human_judgment: false
  - id: D5
    description: "Cover collage follows PRD-2 §17: 4+ quad, 3 balanced, 2 stacked, 1 single, 0 placeholder; never an avatar"
    requirement: "HOME-05"
    verification:
      - kind: unit
        ref: "cover.test.ts#selectCoverLayout for 0/1/2/3/4/9 (kinds placeholder/single/stack/feature/quad, four-tile cap)"
        status: pass
      - kind: unit
        ref: "gallery-page.test.tsx populated: data-cover-layout quad/single + cover-placeholder for the empty collection"
        status: pass
      - kind: unit
        ref: "selectCoverLayout only ever receives cover_media — no avatar field exists on GalleryCollection"
        status: pass
    human_judgment: false
  - id: D6
    description: "Broken or missing remote cover images degrade to a same-box neutral placeholder; the card keeps its size and its link"
    requirement: "HOME-06"
    verification:
      - kind: unit
        ref: "media-image.test.tsx#swaps a broken image for a same-box placeholder; #renders the placeholder immediately for an empty source"
        status: pass
      - kind: unit
        ref: "gallery-page.test.tsx#keeps the card in place when a cover image fails to load (fireEvent.error -> media-placeholder, card/link still present)"
        status: pass
    human_judgment: false
  - id: D7
    description: "Empty, loading and error states render (PRD §35/§59/§61), with a working Retry"
    requirement: "HOME-07"
    verification:
      - kind: unit
        ref: "gallery-page.test.tsx#renders the empty state copy when there are no CSVs; #renders skeleton cards while the request is in flight (role=status, skeleton cards)"
        status: pass
      - kind: unit
        ref: "gallery-page.test.tsx#shows the PRD-2 §61 connection copy on a transport failure and retries (Retry -> second fetch -> cards)"
        status: pass
      - kind: unit
        ref: "gallery-page.test.tsx#falls back to the gallery API copy when the failure is not a transport error"
        status: pass
    human_judgment: false
  - id: D8
    description: "Placeholder gradient is picked deterministically from the collection filename"
    requirement: "HOME-08"
    verification:
      - kind: unit
        ref: "placeholder.test.ts#is deterministic (linux.csv -> violet-pink both times); #distributes different filenames; #index in range; all six --grad-ph-* pairs"
        status: pass
    human_judgment: false
  - id: D9
    description: "Homepage refetches collections when the window regains focus (PRD §47)"
    requirement: "HOME-09"
    verification:
      - kind: unit
        ref: "gallery-page.test.tsx#refetches collections when the window regains focus (1 fetch -> window focus event -> 2 fetches)"
        status: pass
    human_judgment: false

# Metrics
duration: 42min
completed: 2026-09-27
status: complete
---

# Phase 4: Gallery Homepage Summary

**`/` is now a real gallery homepage — hero, static section header, a responsive grid of `244×330` collection cards with adaptive cover collages and PRD-required counts + last-saved dates, all four product states, broken-image degradation, and a window-focus refetch — plus the vitest/jsdom + Testing Library runner and a 50-test mocked-fetch suite the rest of the milestone is gated on.**

## Performance

- **Duration:** ~42 min
- **Completed:** 2026-09-27
- **Tasks:** 6 (test infra, pure helpers, data hook, components, page, tests)
- **Files created:** 26 under `web/`; 6 modified
- **Test suite:** 8 files, 50 tests, all passing (`pnpm test`, 2.6s)

## Accomplishments

- **Test infrastructure, once for the milestone.** `vitest@5.0.2` + `jsdom@30.1.1` + `@testing-library/{react,dom,jest-dom,user-event}`, a separate `web/vitest.config.ts` (`environment: "jsdom"`, `@` alias, react plugin, `src/**/*.test.{ts,tsx}`) and `web/src/test/setup.ts` (jest-dom matchers, RTL cleanup, `vi.unstubAllGlobals()`). `cd web && pnpm test` is the new gate — `Test Files 8 passed (8)`, `Tests 50 passed (50)`.
- **The homepage frame.** `GalleryHero` (`bg-grad-hero`, r-2xl, `shadow-hero`, `p-9` = 36px): coral uppercase eyebrow, Playfair Bold 46 headline (max-w 520), Inter 14 muted body (max-w 510), a `grad-cta` `Explore gallery` CTA that is a real anchor to `#collections-grid`, and a `560×272` `HeroArt` collage assembled from the newest `cover_media` with a real-count caption. Section header `My Collections` (Playfair Bold 28) + `N collections` (Inter Medium 11, baseline-aligned) + the static `Recently updated ▾` label; footer line verbatim from spec §3.2.
- **Collection cards.** `CollectionCard` (`244×330`, `surface`, r20, `border`, `shadow-card`) is one react-router `Link` to `/collections/:filename`, with the full-bleed `245×181` collage, Playfair Bold 22 name, filename secondary line and the meta row `83 posts · 126 media · Last saved Sep 27`. The mockup's `•••` control is omitted — no card action exists.
- **Adaptive covers, extracted and tested.** `selectCoverLayout(mediaCount)` returns `placeholder | single | stack | feature | quad`; `sliceCoverMedia` keeps the four newest (the backend already orders `cover_media` `saved_at` DESC). `CollectionCover` renders the grid (2 tracks, 5px gap, r14 tiles, r20 top corners from the card's `overflow-hidden`), and `MediaImage` swaps any failed/blank image for a same-box deterministic gradient placeholder with a neutral glyph.
- **Deterministic placeholders.** `pickPlaceholderGradient(key)` FNV-1a-hashes the filename into the six `--grad-ph-*` pairs already declared in Phase 3; applied as inline `background-image: var(--grad-ph-*)`, so no new CSS variable and no dynamic Tailwind class.
- **States.** `MasonrySkeleton` (`role="status"`, sr-only "Loading collections…", 8 skeleton cards), `GalleryEmptyState` (exact §59 title + secondary message, gradient state art) and `GalleryErrorState` (exact §61 copy + a real `Retry` button).
- **Data + freshness.** `useCollections()` fetches on mount, exposes `loading|success|error` with `refetch()`, drops stale resolutions with a per-effect `cancelled` flag, applies the nulls-last-only ordering guard, and refetches on `window` `focus` (PRD §47).

## Task Commits

| # | Commit | Subject |
|---|--------|---------|
| 1 | `374fc5c` | `feat(04): build the gallery homepage with adaptive covers, states and a vitest suite` (32 files) |
| 2 | _(this commit)_ | `docs(04): plan and summarize the gallery homepage` |

## Files Created/Modified

**Test infrastructure**
- `web/vitest.config.ts` — jsdom, `@` alias, react plugin, `setupFiles`, `include: ["src/**/*.test.{ts,tsx}"]`
- `web/src/test/setup.ts` — jest-dom matchers, `cleanup()`, `vi.unstubAllGlobals()`, `scrollIntoView` no-op
- `web/package.json` — 6 devDeps + `@types/node@^24`; scripts `test` (`vitest run`) and `test:watch`

**Pure helpers**
- `web/src/lib/messages.ts` — the PRD §59/§61 copy constants (single source of truth)
- `web/src/lib/cover.ts` — `COVER_TILE_LIMIT`, `selectCoverLayout`, `sliceCoverMedia`
- `web/src/lib/placeholder.ts` — `PLACEHOLDER_GRADIENTS`, `placeholderGradientIndex`, `pickPlaceholderGradient`
- `web/src/lib/date.ts` — `NO_SAVES_YET`, `formatLocalDate`, `formatLocalDateTime`, `formatLastSaved`
- `web/src/lib/collection-meta.ts` — `formatCount`, `formatCollectionMeta`
- `web/src/lib/collection-order.ts` — `orderCollections` (nulls last, otherwise untouched)
- `web/src/lib/index.ts`, `web/src/lib/api/client.ts` (imports the shared §61 constant), `web/src/index.css` (dark `--grad-hero` override)

**Data**
- `web/src/hooks/use-collections.ts`, `web/src/hooks/index.ts`

**Components + page**
- `web/src/components/gallery/{media-image,collection-cover,collection-card,collection-skeleton,gallery-empty-state,gallery-error-state,gallery-hero}.tsx`, `index.ts`
- `web/src/pages/gallery-page.tsx` (replaced the Phase 3 placeholder body)

**Tests**
- `web/src/lib/{cover,placeholder,date,collection-meta,collection-order}.test.ts`
- `web/src/components/gallery/{media-image,collection-card}.test.tsx`
- `web/src/pages/gallery-page.test.tsx`

`.planning/phases/04-gallery-homepage/04-01-PLAN.md` is this phase's plan.

## Decisions Made

1. **Two-media layout is `stack`** (two full-width `88px` rows). PRD §17 names 4+/3/1/0 only; stacking keeps the spec's tile height and stays balanced.
2. **Layout follows the usable tiles, not `media_count`.** A collection with `media_count > 0` but an empty (or entirely broken) `cover_media` renders the gradient placeholder instead of an empty collage box.
3. **The secondary card line is the filename.** The mockup's description is omitted (spec §7 has no CSV field for it); the filename is real data and keeps the slot meaningful.
4. **The last-saved date lives in the meta row** exactly where the spec places the meta text: `83 posts · 126 media · Last saved Sep 27`, Inter Medium 11 muted. A `null` timestamp renders `No saves yet`; a save from another year gets a year suffix so it cannot be misread.
5. **Error copy is chosen by failure class.** Transport failure → `Could not connect to Twitter Bookmarker backend`; any other gallery API failure → `Could not load this collection`; both with `Retry`.
6. **The CTA and hero art are real.** `Explore gallery` is an `<a href="#collections-grid">` (keyboard reachable, works with JS off); the hero caption is derived from real collection/media counts; the art reuses `CollectionCover`/`MediaImage`, so a missing or broken image set degrades to gradient tiles.
7. **One dark token override.** `.dark { --grad-hero: … }` — the spec's light cream hero would put white `--ink` text on cream. No new variable name.
8. **Hero radius uses the token scale** (`rounded-2xl` = 24px, within spec §2.4's 24–26px r-2xl range) rather than a raw 26px.
9. **`orderCollections` never re-sorts dated collections** and returns the received array by reference when there is nothing to fix, so PRD §38 ordering stays the backend's.

## Deviations from Plan

| Planned | Actual | Why |
|---------|--------|-----|
| `formatLocalDate` returns `Sep 27` | Same, plus a year suffix when the local year differs from `now` | Prevents an ambiguous "Last saved Sep 27" for an older save; `now` is injectable so it stays deterministic in tests |
| Error message from `ApiError.reason` for every failure | Transport keeps its reason; all other failures render the §61 gallery copy | Matches the phase contract's PRD §61 mapping instead of leaking a client-side "unexpected response" string into the UI |
| `web/src/index.css` not in `files_modified` | Added the dark `--grad-hero` override | The dark frame defines no hero; a light hero panel fails contrast. Recorded in the plan before committing |
| `web/src/lib/collection-order.ts` not in the initial plan | Added (+ test) | The contract allows a nulls-last guard; it needed its own pure, tested home |
| Placeholder glyph via `lucide-react` | Inline SVG in `CollectionCover` | Zero extra dependency surface for a purely decorative mark; lucide is still used for the state art/error icons |

## Issues Encountered

1. **`vitest@5` requires `@types/node ^22 || >=24`; the scaffold had `^20`.** `pnpm peers check` reported the unmet peer, so `@types/node` was bumped to `^24.19.0` (the runtime is Node 24.21.0). `pnpm peers check` is now clean and `pnpm build` still passes.
2. **The first draft's non-transport error path was untestable as written.** `describeError` returned the client's `ApiError.reason` for every failure, so a mocked 500 with an empty reason surfaced `Backend returned an unexpected response (HTTP 500)` rather than the §61 class copy — the planned test would have failed. Fixed by branching on `isNetworkError`, which is also the more PRD-faithful mapping.
3. **jsdom has no `scrollIntoView`.** The hero CTA is an anchor, but `setup.ts` still installs a no-op so a future test can click it safely.
4. **Prettier reordered Tailwind classes** in the new components (the repo's `prettier-plugin-tailwindcss` with `tailwindStylesheet`). All new files were formatted; the pre-existing `src/lib/api/{errors,index}.ts` were already unformatted before this phase and were deliberately left untouched.
5. **`dist/` and the operator's backend were never touched.** `web/dist/` is gitignored and no dev server was started; port 43121 is still owned by the pre-existing `twitter-bookmarker` process (pid 2653626, unchanged).

## Verification Performed

All commands run from `web/` unless noted; every result below was executed, not inferred.

| # | Check | Result |
|---|-------|--------|
| 1 | `pnpm test` | exit 0 — **`Test Files 8 passed (8)`**, **`Tests 50 passed (50)`**, 2.6s. All fetch calls mocked |
| 2 | `pnpm build` | exit 0 — `✓ built in 345ms`; `dist/index.html` + `dist/assets/index-iSaFxYcF.js` 371.42 kB (gzip 120.26 kB), `index-SsBdX3Ar.css` 55.50 kB, 23 font assets |
| 3 | `pnpm exec tsc --noEmit` | exit 0, no output |
| 4 | `pnpm exec tsc -p tsconfig.app.json --noEmit` | exit 0 (explicitly typechecks `src/**`, including the test files) |
| 5 | `pnpm lint` | exit 0, no output |
| 6 | Mutation check (temporarily changed `Last saved ${formatted}` → `Saved ${formatted}`) | 6 tests failed across 4 files (date, collection-meta, collection-card, gallery-page), then restored and green — the suite is not vacuous |
| 7 | `pnpm peers check` | "No peer dependency issues found" |
| 8 | `pnpm exec prettier --check` on the new/changed files | clean (only the two pre-existing Phase 3 api files remain unformatted) |
| 9 | `grep -rn '43121' web/src` | no matches |
| 10 | `grep -rnE '127\.0\.0\.1\|localhost\|http://' web/src` | no matches (only `https://` fixtures in tests) |
| 11 | `pgrep -af '[v]ite\|[p]npm dev'` | no vite/dev server of ours; the only hit is the parent's own polling shell whose command text contains the pattern |
| 12 | `ss -ltnp` port 43121 | still the pre-existing `twitter-bookmarker` pid 2653626 — untouched |
| 13 | `git show --stat 374fc5c` | exactly the 32 intended `web/**` paths; no `.planning/` state file, no `dist/`, no `node_modules` |
| 14 | `git status --short` | only this phase's files plus the orchestrator's pre-existing `.planning/{REQUIREMENTS,ROADMAP,STATE}.md`, `state.json` and untracked `PRD-2.md` (none of which were read or staged) |

## Exported Surface for Phases 5–8

**Pure helpers** (import the module, or `@/lib` for the barrel)
- `@/lib/cover` → `selectCoverLayout(mediaCount): CoverLayout`, `sliceCoverMedia(media): string[]`, `COVER_TILE_LIMIT` (4), types `CoverLayout` (`{kind, tileCount}`), `CoverLayoutKind` (`placeholder|single|stack|feature|quad`)
- `@/lib/placeholder` → `pickPlaceholderGradient(key): PlaceholderGradient` (`{id, cssVar, value}`), `placeholderGradientIndex(key)`, `PLACEHOLDER_GRADIENTS`
- `@/lib/date` → `formatLastSaved(iso|null, {now?, locale?})`, `formatLocalDate`, `formatLocalDateTime`, `NO_SAVES_YET`
- `@/lib/collection-meta` → `formatCollectionMeta(collection, {now?, locale?})`, `formatCount(n, singular, plural?)`, `CollectionMetaSource`
- `@/lib/collection-order` → `orderCollections(collections)`
- `@/lib/messages` → `COULD_NOT_CONNECT_MESSAGE`, `COULD_NOT_LOAD_COLLECTION_MESSAGE`, `NO_COLLECTIONS_TITLE`, `NO_COLLECTIONS_MESSAGE`, `RETRY_LABEL`
- `@/lib` → all of the above plus `cn`

**Hook**
- `@/hooks/use-collections` (also `@/hooks`) → `useCollections(): { collections, status, error, errorMessage, refetch }`; types `CollectionsStatus`, `UseCollectionsResult`

**Components** (`@/components/gallery`, or the module paths)
- `CollectionCover({ media, seed, className })` — adaptive collage; sets `data-cover-layout` and `data-testid="collection-cover"`/`"cover-placeholder"`
- `MediaImage({ src, fallbackSeed, alt?, className?, loading? })` — `data-testid="media-image"` / `"media-placeholder"`
- `CollectionCard({ collection, now? })` — `data-testid="collection-card"`
- `CollectionCardSkeleton`, `MasonrySkeleton({ count? })` — `data-testid="collection-card-skeleton"`, `role="status"` label `Loading collections`
- `GalleryEmptyState()`, `GalleryErrorState({ message, onRetry })` — `data-testid="gallery-empty-state"` / `"gallery-error-state"`
- `GalleryHero({ collections })`, `HeroArt({ media, caption, className? })` — `data-testid="gallery-hero"` / `"hero-art"`

**Test setup**
- Runner entry: `web/vitest.config.ts` (`setupFiles: ./src/test/setup.ts`)
- Setup file: `web/src/test/setup.ts` (jest-dom matchers + RTL cleanup + fetch-stub teardown)
- Script: `cd web && pnpm test` (`vitest run`), `pnpm test:watch`

## Next Phase Readiness

- Phase 5 (collection gallery) can call `fetchPosts(filename, params)`, render `MediaImage` for post media, reuse `GalleryEmptyState` / `GalleryErrorState` (passing `Could not load this collection`) and `formatLocalDateTime` for post metadata, and place a `CollectionCover`/deterministic gradient in the collection header — no new primitives required.
- Phase 6 can add `dropdown-menu`/`calendar` primitives; Phase 7 reuses `MasonrySkeleton`; Phase 8 adds the Dialog lightbox.
- `AppShell`, the theme layer and the API client were not restructured; only `client.ts`'s private unreachable-reason literal was replaced by the shared `@/lib/messages` constant (its exports are unchanged).

---
*Phase: 04-gallery-homepage*
*Completed: 2026-09-27*
