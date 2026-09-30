# Milestones

## v2.0 Local Web Gallery (Shipped: 2026-09-28)

**Phases completed:** 10 phases, 10 plans, 46 tasks

**Key accomplishments:**

- A dedicated `backend/internal/gallery/` read layer turns the CSV archive into collection summaries and filtered, searched, sorted, cursor-paginated posts — resolving columns **by name** so the frozen writer's column order is not load-bearing, and indexing the media JSON array into `media_count` and up-to-four cover images.
- `GET /api/gallery/collections` and `GET /api/gallery/collections/{filename}/posts` with strict validation, 404/400/500 semantics, path-traversal rejection, and read-only guarantees — added **without touching** the frozen `/v1/*` extension contract (independently probed 13/13).
- A buildable Vite 8 + React 19 + TypeScript + Tailwind 4 + shadcn `web/` app carrying the v2 Editorial token layer, a system-aware light/dark theme, the three required routes inside a persistent shell, self-hosted Playfair Display + Inter, the `/api` dev proxy, and a typed relative-URL gallery API client.
- `/` is now a real gallery homepage — hero, static section header, a responsive grid of `244×330` collection cards with adaptive cover collages and PRD-required counts + last-saved dates, all four product states, broken-image degradation, and a window-focus refetch — plus the vitest/jsdom + Testing Library runner and a 50-test mocked-fetch suite the rest of the milestone is gated on.
- `/collections/:filename` is now a real gallery: a deterministic 96×96 gradient header, the present-but-inert toolbar, and a responsive CSS-multi-column Pinterest masonry of 292-wide post cards — adaptive multi-media grids, text-only quote panels, full metadata, `Open on X`, clamp + `Show more`, broken-media degradation, and three distinct empty/error states — backed by a first-page `usePosts` hook already shaped for Phase 7 cursors.
- The collection route is now fully discoverable through its URL: a 300 ms-debounced server-side search, a `Filter` control that is a Popover on desktop and a Sheet on narrow viewports (390-wide panel, manual Tweet/Bookmarked date ranges, four quick presets, Reset/Apply), all four sort modes, and a local→RFC3339 UTC date conversion with an inclusive end-of-day — every change cancels the previous page, resets the scroll and refetches, and Back/Forward restore the exact view.
- Infinite scroll through an IntersectionObserver sentinel and opaque cursors: 30-post pages accumulate with no duplicate `tweet_id`s, skeletons and a bottom loader replace blank screens, and the walk terminates exactly when `has_more` goes false.
- An accessible media lightbox: large media with a metadata panel (beside on desktop, below on mobile), prev/next that continues across neighbouring tweets, a focus trap, Escape + arrow navigation, focus restoration to the originating tile, and preserved gallery scroll on close.
- One Go process now serves the whole product — `web/dist` at `/` with API precedence over the SPA fallback, a direct browser refresh on a deep route served by `index.html`, a JSON 404 for unknown `/api/*`, and graceful missing-dist degradation instead of a crash.
- Hardening and a real accessibility floor: a 5,000-row CSV proven to page correctly over HTTP (50 pages in 1.96 s), error/retry UX that recovers without restarting anything, responsive 1/2/3/4-column masonry from 390 to 1440, an axe clean bill across 11 surface×theme audits, and the PRD §82 integration scenario expressed as executable checks rather than prose.

**Bugs found and fixed during verification:**

- **Doubled `@` handle** — the CSV stores the username with its `@` sigil and five render sites prepended another, producing `@@handle`; fixed with a single `displayHandle()` boundary (reverting it fails 26 tests across 5 files).
- **Masonry column deadlock** — the column hook observed the very element it width-capped, so 1280→1440 could never grow past 3 columns; fixed with an uncapped wrapper plus `useLayoutEffect`.
- **Active nav contrast** — `--accent` `#f26a5b` measured 2.96:1 as text; darkened to `#bf3f2e`, lifting every `text-accent` consumer and CTA fill to 4.64–5.30:1.
- **`aria-dialog-name`** — the desktop filter Popover is `role="dialog"` but its heading was never linked; fixed with an accessible name.
- **390px wordmark truncation** — the brand rendered `Tw…`; now hidden below `sm` with the accessible name preserved.

**Audit:** 82/82 requirements satisfied across three independent sources, 10/10 phases verified, 11/11 cross-phase connections wired, 0 blockers. Archive: `.planning/milestones/v2.0-MILESTONE-AUDIT.md`.

**Open tech debt:** two moderate landmark violations while the desktop filter Popover is open; the gradient-contrast quick-range pill axe cannot evaluate; no real screen-reader pass; PRD §82 step 21 (opening the original tweet) documented as a manual step.

---

## v1.0 MVP (Shipped: 2026-09-27)

**Phases completed:** 6 phases, 16 plans, 45 tasks

**Key accomplishments:**

- Standard-library-only Go module with fixed loopback config, 0700 storage-dir bootstrap, PRD-exact domain model, structured slog logging, and a draining SIGINT/SIGTERM lifecycle.
- Safe-filename + canonical-URL validation, synchronous encoding/csv header-once append, and a rebuildable in-memory duplicate index guarded by one global mutex.
- Loopback HTTP API with strict JSON decoding and the exact 201/409/400/500 contract, wired end-to-end into a signal-draining server binary.
- Manifest V3 TypeScript scaffold with an esbuild pipeline, a single-key `chrome.storage.local` store, PRD-exact slug generation, and the storage/message APIs every later phase consumes.
- Framework-free popup Categories section: add with name+color, inline rename that visibly retargets the CSV filename, exact-copy delete confirmation, per-row color, drag-reorder, and the empty state — all persisted to `chrome.storage.local` with zero backend traffic.
- Popup settings and status layer: a timeout-guarded `GET /health` probe with Retry, persisted auto-unbookmark and Popover/Inline controls with PRD defaults, and a bootstrap that rerenders the popup from `chrome.storage.onChanged` without a reload.
- SPA route watcher (popstate + patched pushState/replaceState + 500 ms fallback), a single debounced `MutationObserver` discovery loop, and marker-first idempotent injection with a once-per-entry `Set<string>` saved index that tolerates the Phase-2 service-worker stub.
- One selector module for all X DOM coupling plus a container-scoped `TweetExtractor` that excludes quoted text, yields `text === ""` for media-only tweets, and returns a typed per-field failure instead of a partial record.
- Popover and inline organizer UI in the tweet action bar: single-open popover with ordered colour-coded categories, an exact `✓ Saved` state with no category name, a 400 ms double-click guard, and in-place rerender on category/settings/saved-set changes.
- Service worker became the extension's single backend HTTP client: typed `HEALTH_CHECK` / `GET_SAVED_INDEX` / `SAVE_TWEET` messages now drive real `GET /health`, `GET /v1/index`, and `POST /v1/bookmarks` calls with every failure normalized to `backend_unavailable` / `invalid_request` / `internal`.
- Clicking a category now runs a guarded per-tweet save state machine that disables the controls, sends one `SAVE_TWEET`, and lands on `✓ Saved` + a stacked toast for 201/409 while failures restore the controls with `Backend unavailable` / `Could not save tweet`.
- `unbookmarkTweet` clicks X's native bookmark control and only reports success when a scoped MutationObserver (or the ~2s deadline) observes `removeBookmark` → `bookmark` or the row detaching — never on the click alone.
- Auto-unbookmark is gated in the `201`-only `onSaved` hook, verified, and invariant-safe: a failed removal warns with the exact PRD §38 copy while CSV, index, and `✓ Saved` stay untouched, and the in-flight guard is released without awaiting the destructive click.
- Backend acceptance criteria §65 items 1-20 are locked by named, race-clean Go tests spanning unit, external-parser, rebuild, concurrency and real-process levels
- Extension hardening guards (resilient observer, coalescing index retry, bounded route-leave cleanup) wired into the live page lifecycle, locked by 11 new fake-DOM tests (147 total) plus an executable PRD §68 manual checklist
- Root Makefile and README ship the MVP with a reproducible `make build`/`make test`, a loud explicit `clean-storage`, and a recorded isolated-HOME smoke proving 201/409/400, strict CSV, index rebuild, and clean shutdown

---
