# Phase 5: Collection Gallery - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 5 of 10** (= PRD §85 "Phase 2.5 — Collection Gallery")

<domain>
## Phase Boundary

Make `/collections/:filename` render a real collection: header (back link, name, counts), the toolbar shell (search/filter/sort controls present but wired in Phase 6), and a responsive Pinterest-style masonry of post cards with adaptive multi-media grids, text-only cards, complete metadata, and Open on X.

**In scope:** `CollectionPage`, `GalleryMasonry`, `PostCard`, `PostMediaGrid`, `TextPostCard`, `GalleryToolbar` (visual + props only), the single-page posts fetch, and the empty-collection / broken-media states.

**Out of scope:** debounced search, date filters, quick ranges, sorting behaviour and URL state (Phase 6); infinite scroll and cursor consumption (Phase 7); lightbox (Phase 8); production serving (Phase 9). This phase loads the first page only.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Header shows `← Gallery` back navigation, the collection name, and `N posts · M media`; then `[ Search… ] [ Filter ] [ Sort ]` (PRD §18). Use the collection summary endpoint to get counts without loading posts (the posts response has no totals — either fetch `/collections` and find the row, or add a summary lookup; **do not** add a new backend endpoint without noting it).
- The gallery unit is the **tweet/post**, not the image: a tweet with four images is one card (PRD §19).
- All media of a post must be visible; default layouts: 1 single, 2 split, 3 adaptive 2/1, 4+ compact grid. Never show only the first image (PRD §20).
- Masonry: desktop 4–5 columns, medium 2–3, small 1. Card height follows natural content/media aspect ratio; cards must **not** have uniform height. Pinterest feel over grid symmetry (PRD §21, §66). Note the PRD says **1 column on small** even though the Figma mobile frame shows 2.
- Text-only posts (`media: []`) render as compact cards with no artificial image placeholder (PRD §22). This design renders them with a typographic gradient "quote panel" — that is the chosen design treatment (design spec §7) and is not an image placeholder.
- Every card exposes author, username, tweet text, tweet date, bookmark date, and `Open on X` (PRD §23).
- `Open on X` opens the stored `url` in a new tab with `target="_blank" rel="noopener noreferrer"` (PRD §24).
- Images load directly from the stored `pbs.twimg.com` URL — no proxy, download, or cache — and use native lazy loading (PRD §25, §68).
- Long text uses a controlled clamp plus `Show more` (PRD §23).
- A valid but empty collection → `This collection is empty`; a collection whose fetch fails → `Could not load this collection` with `Retry` (PRD §60, §61).
- Broken media → neutral placeholder; metadata and `Open on X` stay available; the card must not collapse (PRD §62).
- Default sort is `saved_desc` (Newest Bookmarked) (PRD §18, §33) — Phase 5 sends it; Phase 6 exposes the control.

### Visual spec

`docs/design/phase2-design-spec.md` §3.3 (frame `6:121`): post cards `292` wide, r18, `surface` +
hairline `border`, soft shadow, `10px` padding; media tiles r14; avatar `28×28` r14; author Inter
SemiBold 11; username Inter Regular 9 muted; body Inter Regular 11; meta `Mar 12, 2026 · Saved Apr 3`
Inter Regular 9 muted; `Open on X ↗` Inter SemiBold 10. Masonry columns `292` wide with `32px`
horizontal gap and roughly `24px` vertical gap. Text-only cards use a gradient quote panel with
Playfair Regular 22 text, clamped.

Implementation note: real CSS masonry must not use a fixed row height — use CSS `columns` with
`break-inside: avoid`, or a measured JS masonry. Either is acceptable; verify cards keep natural
heights and no card splits across a column break.

</decisions>

<code_context>
## Existing Code Insights

- Phase 4 delivered `CollectionCard`/`CollectionCover`, the reusable lazy+error `MediaImage`
  primitive, the date formatter in `src/lib/`, and the collections data hook. Reuse them.
- API: `GET /api/gallery/collections/{filename}/posts?limit=30&sort=saved_desc` →
  `{items: GalleryPost[], next_cursor, has_more}`. Phase 5 consumes `items` only (Phase 7 adds cursors).
- `media: string[]` is always an array, never null.
- Avatars: the CSV has no avatar URL, so render the design's deterministic gradient circle seeded
  from `username` (design spec §5).
- The toolbar in this phase should already accept `search`/`filter`/`sort` props and emit change
  callbacks with correct types, so Phase 6 only has to add behaviour — but do not implement
  debouncing, date logic, or URL sync yet.

</code_context>

<specifics>
## Specific Ideas

1. Seed `linux.csv` with: a 4-media tweet, a 2-media tweet, a 1-media tweet, a 3-media tweet, and
   two text-only tweets. The page renders 6 cards; the 4-media card shows 4 images in one card.
2. Resize to ≤640px → 1 column; 640–1024 → 2–3; ≥1280 → 4–5. Cards keep non-uniform heights.
3. Every card's `Open on X` is an `<a>` with the correct `href`, `target="_blank"`,
   `rel="noopener noreferrer"`.
4. A long tweet clamps and reveals `Show more`; expanding shows the rest.
5. An empty `design.csv` → `This collection is empty`; a request for a nonexistent collection →
   `Could not load this collection` + `Retry`.
6. Point one media URL at an unreachable host → the card keeps its layout, shows a neutral
   placeholder, and its metadata + link still work.
7. Images have `loading="lazy"` and contextual `alt` text (author/tweet-derived); decorative tiles
   are `alt=""` + `aria-hidden`.
8. `pnpm build` still succeeds and typechecks.

</specifics>

<deferred>
## Deferred Ideas

- Debounced search, date filters, quick presets, sort behaviour, URL state (Phase 6)
- Cursor pagination + IntersectionObserver (Phase 7)
- Lightbox (Phase 8)

</deferred>
