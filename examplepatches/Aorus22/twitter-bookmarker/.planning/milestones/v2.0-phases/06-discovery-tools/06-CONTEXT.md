# Phase 6: Discovery Tools - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 6 of 10** (= PRD §85 "Phase 2.6 — Discovery Tools")

<domain>
## Phase Boundary

Wire the collection toolbar to the backend: debounced server-side search, a filter control (Popover on desktop, Sheet on narrow viewports) with tweet-date and bookmarked-date ranges plus quick presets, four sort modes, and URL query-parameter state that resets pagination whenever it changes.

**In scope:** `SearchInput`, `FilterPopover`/`FilterSheet`, `DateRangeFilter`, `SortSelect`, the query-state hook (URL ↔ state), date-boundary conversion, and reset-pages/scroll-to-top behaviour on change.

**Out of scope:** the cursor/IntersectionObserver mechanics (Phase 7) — this phase may keep loading only the first page, but the query-state change must trigger a refetch of page 1. Lightbox is Phase 8.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Search is **server-side**, case-insensitive, covers `text`, `author`, and `username`, debounces at
  ~300 ms, and has no submit button (PRD §28). The backend already implements the matching.
- Two independent date filters: **Tweet date** (`tweet_date`) and **Bookmarked date** (`saved_at`).
  Both may be active at once and the result must satisfy both (PRD §29).
- The `Filter` control opens a **Popover on desktop** and a **Sheet/Drawer on narrow viewports**
  (PRD §30, §66). Content: Tweet Date From/To, Bookmarked Date From/To, Quick Range, `Reset`,
  `Apply` (PRD §30).
- Quick presets: `Today`, `Last 7 Days`, `Last 30 Days`, `This Year`. They apply to the
  **Bookmarked Date** by default because the gallery primarily represents when bookmarks were
  collected; both ranges stay manually editable (PRD §31).
- Timestamps are UTC/RFC3339 in storage and rendered in the browser's local timezone. When the user
  picks a local date (`2026-09-27`), convert the **start** boundary to local 00:00:00 → RFC3339 UTC
  and the **end** boundary to local 23:59:59.999 → RFC3339 UTC before sending. Ranges are inclusive;
  the backend makes no timezone assumptions (PRD §32). This conversion is the highest-risk part of
  the phase — unit-test it, including a DST-boundary date.
- Four sort modes with API values `saved_desc` (default), `saved_asc`, `tweet_desc`, `tweet_asc`,
  surfaced as Newest Bookmarked / Oldest Bookmarked / Newest Posted / Oldest Posted (PRD §33).
- Search, filter, and sort state live in the **URL query string** so refresh and back/forward work
  and links are shareable; the cursor is **not** stored permanently in the URL (PRD §76).
- On any search/filter/sort change: clear current pages, reset the cursor, scroll near the top, and
  fetch the first page (PRD §77).
- Filter application should follow the design: edits are staged in the popover and committed on
  `Apply`; `Reset` clears both ranges and the presets.
- The backend expects `q`, `tweet_from`, `tweet_to`, `saved_from`, `saved_to`, `sort`, `limit`,
  `cursor`. Invalid values return `400` — the frontend must never send garbage; omit empty params
  entirely.

### Visual spec

`docs/design/phase2-design-spec.md` §3.4 (frame `6:236`): popover `390×470` r20 `surface` with
shadow-popover, padding 22; title `Filter your archive` Playfair Bold 24; subtitle Inter Regular 11
muted; section labels Inter SemiBold 11; date fields `346×42` r12 `surface-warm` showing
`Jan 1, 2026 → Sep 27, 2026`; quick pills 32 tall, r-pill, inactive `surface-warm` + Medium 11 muted,
active gradient + SemiBold 11 coral; `Reset` `78×40` r12; `Apply` `92×40` r12 gradient + white
SemiBold 11.

</decisions>

<code_context>
## Existing Code Insights

- Phase 5 delivered `GalleryToolbar` with typed props/callbacks and the single-page fetch. This
  phase gives those props behaviour and introduces the query-state hook.
- Keep a single source of truth for query state (the URL) and derive the request params from it —
  avoid duplicating state between React state and the URL.
- Use `useSearchParams` from React Router; when writing, replace history entries for debounced
  keystrokes (`replace: true`) so typing does not flood the back stack, but push for explicit
  Apply/sort changes.
- The existing `Filter` button and `Sort: Newest ▾` control from Phase 5 are the anchors for the
  Popover and the Select/Dropdown.
- An "active filters" affordance is useful (e.g. a count badge on `Filter`) — optional but keep it
  consistent with the design's pill style.

</code_context>

<specifics>
## Specific Ideas

1. Typing `wayland` filters the grid after ~300 ms with exactly one request; clearing it restores
   the full list. Matching is case-insensitive and also matches author/username (`@linuxguy`).
2. Selecting Tweet Date `2026-01-01 → 2026-09-01` and Bookmarked Date `2026-09-20 → 2026-09-27`
   returns only posts inside **both** ranges; the request sends UTC RFC3339 boundaries derived from
   local dates.
3. `Today` / `Last 7 Days` / `Last 30 Days` / `This Year` set the bookmarked range; the tweet range
   is untouched; the fields remain editable afterwards.
4. The URL updates to include `q`, `sort`, `saved_from`, `saved_to`, `tweet_from`, `tweet_to` as
   applicable; reloading the page restores the exact filtered view; back/forward step through
   changes.
5. Changing any of search/filter/sort clears loaded pages, resets the cursor, and scrolls near the
   top before the first-page fetch resolves.
6. All four sort modes produce visibly different orders consistent with the API values.
7. `limit` is not user-editable; the client sends the Phase 7 page size.
8. A unit test covers local-date → UTC boundary conversion, including a DST transition date.
9. `pnpm build` still succeeds and typechecks.

</specifics>

<deferred>
## Deferred Ideas

- Media-type / tag chips (no CSV backing — design spec §7)
- Saved filter presets, "last used filters" persistence
- Manual refresh button (PRD §78)

</deferred>
