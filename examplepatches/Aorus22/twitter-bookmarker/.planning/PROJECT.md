# Twitter Bookmarker

## What This Is

Twitter Bookmarker is a Chrome Extension (Manifest V3) plus a small local Go HTTP server that lets a single user categorize tweets on `https://x.com/i/bookmarks`. Clicking a category on a bookmarked tweet extracts the tweet metadata and writes it into one SQLite database, `~/.twitter-bookmarker/tw-bookmarker.db`. Optionally, the tweet is removed from X Bookmarks after the database write is confirmed.

Phase 2 adds a **local web gallery**: the same Go server also serves a web app that turns the database into a browsable, searchable, filterable Pinterest-style media gallery. The extension still does the collecting; the database is still the source of truth. The `/api/gallery/*` API is strictly read-only and GET-only; curation — moving a post between folders and soft-deleting it — lives on the bookmark resource (`PUT /v1/bookmarks/{tweet_id}/collection`, `DELETE /v1/bookmarks/{tweet_id}`), never in the gallery API.

## Core Value

A categorized tweet is durably persisted to the SQLite database before anything else happens — the database is the single source of truth, and nothing is ever unbookmarked from X before the write succeeds (synchronous, `synchronous=FULL`, fsynced at commit). The `/api/gallery/*` API is a pure read-only projection of that database and may never become a second source of truth; there is no derived index and no cache. Mutations live on the bookmark resource, never in the gallery API.

## Requirements

### Validated

Shipped and verified in v1.0 (58/58 requirements, audit passed 2026-09-27). Do not re-implement or regress:

- [x] Local Go backend with loopback-only HTTP API and SQLite persistence (`/health`, `/v1/index`, `POST /v1/bookmarks`)
- [x] Chrome MV3 extension popup for category CRUD, colors, ordering, and settings
- [x] Content script that detects `/i/bookmarks` tweets and injects organizer UI
- [x] Save flow: content script → service worker → backend → database
- [x] Optional auto-unbookmark after confirmed database success
- [x] Hardening: SPA navigation, DOM churn, duplicate races, index recovery
- [x] Media URLs captured per bookmark and stored in the `media` JSON column (JSON array)
- [x] `TWITTER_BOOKMARKER_DIR` relocates the storage directory
- [x] Go test suite (`-race`) + extension Node test suite + Makefile build/test/lint

### Validated in v2.0 (Local Web Gallery)

Shipped and verified in v2.0 (82/82 requirements, audit passed 2026-09-28). Do not re-implement or regress. Archive: `.planning/milestones/v2.0-REQUIREMENTS.md`.

- [x] Gallery read layer: SQLite reader, collection discovery, summaries, media parsing, filter, search, sort, cursor pagination
- [x] `GET /api/gallery/collections` and `GET /api/gallery/collections/{slug}/posts` with validation, path-traversal rejection, and read-only semantics
- [x] `web/` app scaffolded with the official shadcn Vite CLI (Vite + React + TypeScript), routing, theme, Vite `/api` proxy, typed API client
- [x] Gallery homepage: collection cards with cover collage, name, post/media counts, last bookmarked date, empty/no-media placeholders
- [x] Collection page: Pinterest-style masonry, multi-media post grids, text-only posts, full metadata, Open on X
- [x] Discovery: debounced server-side search, tweet-date and bookmarked-date filters (combinable), quick ranges, four sort modes, URL query state
- [x] Infinite scroll via IntersectionObserver with opaque cursor pagination and dedupe
- [x] Media lightbox with metadata panel, prev/next, and Escape/arrow keyboard navigation
- [x] Production: Go serves `web/dist` with API precedence over SPA fallback; Makefile targets
- [x] Hardening: broken media, malformed media JSON, malformed rows, empty/error/loading states, window-focus refetch, responsive layout, accessibility, dark/light/system theme

### Active

No active milestone. v2.0 shipped 2026-09-28 and is archived. Start the next milestone with
`$gsd-new-milestone`, which redefines requirements from a fresh PRD before planning. Tech debt
carried forward is recorded in `.planning/milestones/v2.0-MILESTONE-AUDIT.md` and listed in
`.planning/STATE.md` under Deferred Items.

**post-v2.0 curation (done, not yet committed):** soft delete plus move between existing folders —
`DELETE /v1/bookmarks/{tweet_id}` moves the row into `deleted_bookmarks`, and
`PUT /v1/bookmarks/{tweet_id}/collection` re-files it — with SQLite schema version 2 and the web
kebab (⋮) `Move to folder` / `Delete bookmark` UI. Implemented and locally verified (Go packages pass,
46 web test files / 496 tests, gallery acceptance 116/116, web acceptance 146/146, traceability 82/82)
but not yet committed; the working tree shows it as modified/untracked files. See Current State.

### Out of Scope

Explicitly excluded by the PRDs (do not re-add):

From `PRD.md` (v1.0):

- Dashboard, search, filtering, database viewer/editor from the extension — not core to the categorize→persist job
- Move tweet between categories, undo, import, export — adds state the database already owns (moving a post between folders was later superseded by the post-v2.0 curation feature — see Active; undo, import, and export remain out of scope)
- Cloud sync, multi-device sync, authentication, accounts, remote backend — single-user local tool
- Quoted tweet text, image/video download — only parent text and media URLs are persisted
- Keyboard shortcuts, category icons, favorites, automatic/AI classification — not required for MVP
- Official Twitter/X API — the extension works off the rendered DOM only
- Support for pages other than `/i/bookmarks`, legacy `twitter.com`, or mobile browsers
- Server-side database/queue/worker/Docker/Kubernetes infrastructure — the embedded local SQLite file is not a server

From `PRD-2.md` (v2.0):

- Editing stored bookmark content, category management, renaming collections, syncing category names from the extension (PRD-2 also excluded deleting and moving bookmarks, but that part was superseded by the post-v2.0 curation feature — see Active)
- Authentication, accounts, multi-user, cloud hosting, cloud storage
- Downloading media, local media archiving, media proxy, video playback
- Editing tweet metadata, notes, AI tagging/search, recommendations
- Adding bookmarks from the gallery, modifying X bookmarks from the gallery
- Websockets / live streaming updates
- **A second source of truth** — a separate index/cache, a server-side database, or an export mirror. The embedded SQLite database *is* the single source of truth; what stays excluded is a second store beside it
- Figma-only affordances with no stored-schema backing: collection description lines, topic/tag chips (`Terminal ×`, `Linux Tips ×`), media-type chips (`Images`/`Videos`/`Links`/`Text`), homepage hero search, and the `Explore` nav destination

## Context

- Single user, personal use, Linux + Chrome/Chromium.
- Backend runs manually (`twitter-bookmarker-server`); no systemd service, no auto-start.
- X is an SPA, so route changes and infinitely loaded timeline rows are handled with `MutationObserver`.
- X DOM structure is unstable; all selector logic is encapsulated in one extractor module.
- Category definitions and settings live only in `chrome.storage.local`; the backend never owns them.
- Collection names live on the `collections` row (the extension sends the typed name with each save) and fall back to `model.DeriveName(slug)` when a save omits one. A collection's key is its `slug`, derived by the extension from the folder name — not a filename. The backend never matches stored collections to extension category config, and never merges renamed categories.
- The database schema is at version 2 (`PRAGMA user_version`). Version 1: `collections(id, slug UNIQUE, name, created_at)` and `bookmarks(tweet_id PRIMARY KEY, collection_id, url, author, username, tweet_date, saved_at, text, media)`. Version 2 adds `deleted_bookmarks(id INTEGER PRIMARY KEY, tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media, deleted_at)` plus the `deleted_bookmarks_by_tweet` index; it deliberately has no foreign key to `collections` (deleting a folder must not erase the audit trail). `tweet_id` is derived from `url` and is globally unique. Starting the server upgrades a version-1 database in place, in one transaction, rewriting no row; a database whose shape does not match its `user_version` stamp is refused. The full contract is `docs/design/sqlite-migration.md`.
- Timestamps are UTC/RFC3339 in storage; the web app renders them in the browser's local timezone and converts local date-range boundaries back to UTC before calling the API.
- **Design authority for the web app**: Figma file `Twitter Bookmarker — Phase 2 Gallery Mockups` (key `RAxDbIIUbz2mtNJtXXuDGQ`), page **`Gallery Mockups v2 — Editorial`** (chosen by the user over the page-1 neutral variant). Exact tokens, layout numbers, and component specs are captured in `docs/design/phase2-design-spec.md`.

## Constraints

- **Tech stack (extension)**: Chrome Extension Manifest V3, TypeScript, plain DOM APIs, no frontend framework.
- **Tech stack (backend)**: Go, `net/http`, `database/sql` with the pure-Go `modernc.org/sqlite` driver. Built with `CGO_ENABLED=0`, so the binary is static and links no C SQLite.
- **Tech stack (web)**: Vite + React + TypeScript + shadcn/ui, `pnpm`, React Router, Tailwind. Scaffolded with the official shadcn CLI, not hand-rolled config.
- **Persistence**: one SQLite database, `tw-bookmarker.db`, under `~/.twitter-bookmarker/` (`$TWITTER_BOOKMARKER_DIR` overrides the directory), created mode `0600` with `journal_mode=DELETE` and `synchronous=FULL` — never WAL, because that directory is a git repository. It is the only file the server owns; CSV is no longer the source of truth (there is no CSV anywhere in the running system — the old files were moved to a `backup/` folder by a migration script that lives in the data repository), there is no derived `index.json`, and there is no second store. The gallery has no cache that can hide fresh data (a fresh read-only connection per request).
- **Security**: Backend binds `127.0.0.1` only; collection slugs must match `^[a-z0-9][a-z0-9-]*$`; no path traversal; no absolute home paths in error bodies; no arbitrary filesystem endpoint; the `/api/gallery/*` API is strictly read-only and GET-only (requirement API-07), re-asserted by `scripts/check-gallery-acceptance.sh` after curation has run — the mutating endpoints live on `/v1/bookmarks/{tweet_id}`, so that guarantee never had to be weakened.
- **Performance**: Backend reads one collection's rows per request from SQLite (personal dataset, local machine); filtering, search, sort and the cursor stay in Go over those rows. The frontend must never load a whole collection at once — server-side filter/search/sort plus cursor pagination plus native image lazy loading.
- **Simplicity**: No infrastructure beyond the extension + Go server + one SQLite database + built static `web/dist`. No separate index, cache, queue, or external service.
- **Compatibility**: Existing `/health`, `/v1/index`, and `POST /v1/bookmarks` contracts cannot break. The extension is not migrated to the gallery API.

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Tweet Status ID as global duplicate key (not full URL) | Usernames can change; status IDs are stable | ✓ v1.0 |
| Backend never stores categories or settings | Keeps backend stateless re: user config; extension owns config | ✓ v1.0 |
| Rename changes only the extension's category config | Old bookmark rows must never be lost or migrated implicitly | ✓ v1.0 |
| Delete removes the category from extension storage only | Stored bookmark rows and `/v1/index` entries must survive | ✓ v1.0 |
| Save write is synchronous under a global write mutex | Guarantees no pending unpersisted bookmark on shutdown | ✓ v1.0 |
| Unbookmark only after HTTP 201 | Protects against data loss when the database write fails | ✓ v1.0 |
| `saved_at` is generated by the backend in UTC | Backend is the authority for persistence time | ✓ v1.0 |
| One collection = one slug, with a stored display name; no merge on rename | The database is the authority; implicitly merging renamed categories would invent history the data does not contain | ✓ v2.0 |
| Gallery API lives under `/api/gallery/*`, separate from `/v1/*` | Keeps the frozen extension contract untouched and lets gallery responses evolve freely | ✓ v2.0 |
| Opaque cursor pagination (sort key + tweet ID tie-breaker), never public page offsets | Stable infinite scroll while the database grows underneath the reader | ✓ v2.0 |
| Gallery reads current database state per request (fresh read-only connection); no persistent cache | A bookmark saved by the extension must appear without restarting the backend | ✓ v2.0 |
| `tweet_id` derived from the canonical URL and used as the primary key | Preserves the extension's write path; the database now enforces global uniqueness | ✓ v2.0 |
| Web app built to Figma page `Gallery Mockups v2 — Editorial`, warm editorial palette, Playfair Display + Inter | User selected this direction over the page-1 neutral shadcn variant | ✓ v2.0 |
| Text-only posts render the design's typographic "quote panel" instead of a fake image placeholder | Matches the selected design; PRD §22 only says an artificial placeholder is unnecessary, and the panel keeps masonry rhythm without implying media exists | ✓ v2.0 |
| Dark-mode muted text is lightened from the mockup's `#746b72` | The mockup value is ~3:1 on the dark surface and fails PRD §67's adequate-contrast requirement | ✓ v2.0 |
| Storage migrated from one CSV per category + derived `index.json` to one SQLite database (`tw-bookmarker.db`, schema version 1; curation later raises it to version 2) | One file, one schema, a real primary key; removes the derived index as a second source of truth. The one-time CSV→SQLite migration lives in the data repository (`Scripts/migrate_to_sqlite.py`), not the backend | ✓ post-v2.0 |
| A deleted bookmark is *moved* into `deleted_bookmarks`, never flagged in place | Keeps `bookmarks` exactly the live set, so no read path needs a filter it could forget; the trash row is kept after a restore so the action stays auditable | ✓ post-v2.0 (uncommitted) |
| Curation endpoints live on the bookmark resource (`DELETE /v1/bookmarks/{tweet_id}`, `PUT /v1/bookmarks/{tweet_id}/collection`) | Keeps `/api/gallery/*` strictly read-only and GET-only (API-07) instead of weakening that guarantee with a mutating gallery route | ✓ post-v2.0 (uncommitted) |
| Schema version 2 adds `deleted_bookmarks` with its own `id` primary key and no foreign key to `collections`; recovery is manual SQL | Repeated save/delete cycles are each logged, deleting a folder cannot erase the audit trail, and a restore stays auditable — no undo button hiding state | ✓ post-v2.0 (uncommitted) |

## Current State

**Both milestones are shipped.** v1.0 (MVP extension + backend, 58/58 requirements) shipped 2026-09-27; v2.0 (Local Web Gallery, 82/82 requirements) shipped 2026-09-28. There is no active milestone.

The product today is one Go binary that both stores bookmarks and serves the gallery, plus the MV3 extension that writes them. Storage is a single SQLite database (`docs/design/sqlite-migration.md`); the CSV→SQLite migration is complete, and the backend has no CSV awareness. `make build` produces the server binary, the loadable extension, and `web/dist`; `make run` serves everything from `127.0.0.1:43121`; `make verify` runs the HTTP, traceability, browser and extension-dist acceptance gates.

**Uncommitted work — post-v2.0 curation.** Since the storage migration was committed (`69da7ce`), curation has landed in the working tree but is not yet committed: soft delete (`DELETE /v1/bookmarks/{tweet_id}` → 200 `{status, tweet_id, recoverable}`, the row moved into `deleted_bookmarks`) and move between existing folders (`PUT /v1/bookmarks/{tweet_id}/collection` → 200 `{status, tweet_id, slug}`), SQLite schema version 2, and the web kebab (⋮) menu with `Move to folder` / `Delete bookmark`, a destructive confirmation dialog, and a folder picker that excludes the post's current folder, requires the target to exist, and shows each folder's post count. The gallery API stays strictly read-only and GET-only (API-07). Recovery is deliberately manual SQL (`INSERT INTO bookmarks (…) SELECT … FROM deleted_bookmarks WHERE id = <id>;`), and the trash row is kept afterwards so a restore is auditable. Verified: all Go packages pass (`make test`), 46 web test files / 496 tests, `scripts/check-gallery-acceptance.sh` 116/116, `scripts/check-web-acceptance.sh` 146/146, `scripts/check-requirement-traceability.sh` 82/82.

**Next milestone:** commit the curation work, then run `$gsd-new-milestone` to define fresh requirements from a new PRD; phase numbering continues at **Phase 11**. Open tech debt — two moderate landmark violations while the desktop filter Popover is open, the gradient-contrast combination axe cannot evaluate, the absence of a real screen-reader pass, and a known `--out` argument bug in the browser acceptance script — is recorded in `.planning/milestones/v2.0-MILESTONE-AUDIT.md` and in `.planning/STATE.md` under Deferred Items.

---

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `$gsd-transition`):
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone** (via `$gsd-complete-milestone`):
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-09-28 — post-v2.0 curation (schema v2 soft delete + move between folders + web kebab menu) implemented and verified but not yet committed; storage migrated to one SQLite database (schema v1, commit `69da7ce`); both milestones shipped and archived; no active milestone*
