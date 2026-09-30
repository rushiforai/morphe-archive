# Phase 4: Gallery Homepage - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 4 of 10** (= PRD §85 "Phase 2.4 — Homepage")

<domain>
## Phase Boundary

Make `/` a real gallery homepage: fetch `GET /api/gallery/collections` and render every CSV as a collection card with an adaptive cover collage, collection name, post count, media count, and last-bookmarked date — plus loading skeletons, the empty state, the backend-unavailable error with Retry, and graceful broken-image handling.

**In scope:** `GalleryPage`, `CollectionCard`, `CollectionCover`, `MasonrySkeleton`, `GalleryEmptyState`, `GalleryErrorState`, the collections data hook, and window-focus refetch.

**Out of scope:** the collection detail page contents (Phase 5), search/filter/sort (Phase 6), infinite scroll (Phase 7), lightbox (Phase 8), production serving (Phase 9).

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Homepage lists all collections with default ordering `last_saved_at DESC`; collections with no valid timestamp come after those with data (PRD §16, §38). Ordering is the backend's; do not re-sort client-side except to keep nulls last.
- Each card shows: cover collage, collection name, post count, media count, **last bookmarked date** (PRD §16). The design mockup omits the date and shows a description instead — the date is required and the description is impossible (no CSV field), so render the meta row as e.g. `83 posts · 126 media · Last saved Sep 27`.
- Cover collage uses at most the four newest media by `saved_at DESC` (already provided as `cover_media`): 4+ → 2×2; 3 → visually balanced (wide + two, or two + wide); 1 → single full-bleed image; 0 → placeholder collection art. **Never use an avatar as cover** (PRD §17).
- Collections with `media_count === 0` must still render, with a placeholder cover (PRD §9).
- Clicking a card navigates to `/collections/{filename}` (PRD §16).
- No CSVs → `No collections yet` + `Saved tweets will appear here after you organize them with the extension.` No error illustration (PRD §59).
- Backend unavailable → `Could not connect to Twitter Bookmarker backend`; gallery API error → `Could not load this collection`-class messaging with a `Retry` action. No OS notifications (PRD §61).
- Loading shows skeleton cards, never a blank page (PRD §35).
- Broken remote images must not collapse the card; show a neutral placeholder (PRD §62).
- The homepage refetches on window focus (PRD §47, §78). No aggressive polling.
- Empty collections (valid CSV, 0 posts) still appear as cards with `0 posts · 0 media`.

### Visual spec

Follow `docs/design/phase2-design-spec.md` §3.2 exactly (frame `6:16`):
page gutter 64px / max width 1312px; hero `1312×320` r26 with eyebrow, Playfair Bold 46 headline,
Inter Regular 14 body, `Explore gallery` CTA, and a hero art collage; section header `My Collections`
(Playfair Bold 28) + `N collections` (Inter Medium 11 muted) + a static `Recently updated` label;
collection cards `244×330` r20 with a full-bleed 2×2 collage (`120×88` tiles, r14, 5px gap), name at
Playfair Bold 22, meta Inter Medium 11 muted; footer line `Local-only · Powered by your CSV archive ·
No cloud, no algorithmic feed`.

**Omitted by decision** (design spec §7): the collection description line, the card `•••` menu, and
the homepage hero search field. The `Explore gallery` CTA should be a real in-page action
(scroll to the collections grid), not a dead link.

</decisions>

<code_context>
## Existing Code Insights

- Phase 3 delivered the app shell, routes, token layer, and `src/lib/api/` client + `src/types/`.
  Read `docs/design/phase2-design-spec.md` and the phase 3 SUMMARY before starting.
- API: `GET /api/gallery/collections` → `{collections: GalleryCollection[]}`; errors
  `{status:"error",reason}` with 400/404/500. `last_saved_at` may be `null`.
- Dates: storage is UTC/RFC3339; render in the browser's local timezone (PRD §32). A shared
  date-formatting helper belongs in `src/lib/` and will be reused by Phases 5–8 — put it there now.
- Image handling: native `loading="lazy"`, `decoding="async"`, and an `onError` fallback to a
  neutral placeholder belong in a small reusable `<MediaImage>`-style primitive — Phase 5 needs the
  same behaviour, so build it once here (or extract it if Phase 3 already provided it).
- Hash a stable key (`filename`) to pick a deterministic placeholder gradient pair (design spec §2.6).

</code_context>

<specifics>
## Specific Ideas

1. Seed a storage dir with 3 CSVs (one with ≥4 media, one with 1 media, one with 0 media) and run
   the backend; `/` renders 3 cards in `last_saved_at` DESC order with correct counts and dates.
2. The 4-media card renders a 2×2 collage using the four newest media, newest first; the 1-media
   card renders one full tile; the 0-media card renders the placeholder and is still clickable.
3. With an empty storage dir, `No collections yet` and the secondary message render.
4. With the backend stopped, the connection message plus a working `Retry` render; starting the
   backend and clicking `Retry` loads the collections.
5. Point one `cover_media` URL at an unreachable host → that tile shows a neutral placeholder and
   the card keeps its size.
6. Returning focus to the window refetches (observable via a network log or a counter).
7. `pnpm build` still succeeds and typechecks.

</specifics>

<deferred>
## Deferred Ideas

- Manual refresh button (PRD §78: not required)
- Collection card overflow actions (no PRD action exists)
- mtime-aware summary cache (PRD §69: not Phase 2)

</deferred>
