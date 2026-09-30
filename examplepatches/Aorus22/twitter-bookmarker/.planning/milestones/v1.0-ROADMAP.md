# Roadmap: Twitter Bookmarker

## Milestones

- 🚧 **v1.0 MVP** - Phases 1-6 (in progress)

## v1.0 MVP

## Overview

The product is built in the PRD's recommended order: prove the Go persistence layer first (CSV is the source of truth), then stand up the extension's own configuration surface, then integrate with the X DOM, then wire the save flow through the service worker, then add auto-unbookmark on top of a reliable storage path, and finally harden the edge cases and lock the whole thing down with tests and docs.

## Phases

**Phase Numbering:**

- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [x] **Phase 1: Go Persistence Layer & HTTP API** - Local loopback Go server that writes tweet metadata to per-category CSVs with a rebuildable duplicate index (completed 2026-09-27)
- [x] **Phase 2: Extension Foundation & Settings Popup** - MV3 scaffold, `chrome.storage.local` model, popup category CRUD/colors/ordering, and settings (completed 2026-09-27)
- [x] **Phase 3: X DOM Integration** - Route detection, MutationObserver, tweet extraction, and popover/inline organizer UI on `/i/bookmarks` (completed 2026-09-27)
- [x] **Phase 4: Save Integration** - Content script → service worker messaging, backend HTTP, saving state, saved marker, and toasts (completed 2026-09-27)
- [x] **Phase 5: Auto Unbookmark** - Verified native X unbookmark strictly after a confirmed CSV write (completed 2026-09-27)
- [x] **Phase 6: Hardening, Tests & Docs** - Edge-case hardening, automated tests, build tooling, and documentation (completed 2026-09-27)

## Phase Details

### Phase 1: Go Persistence Layer & HTTP API

**Goal**: A manually runnable Go server binds to `127.0.0.1:43121`, creates `~/.twitter-bookmarker/`, and exposes `/health`, `/v1/index`, and `POST /v1/bookmarks` with validated filenames, canonical URLs, global duplicate detection, valid CSV output, and a rebuildable derived index.
**Depends on**: Nothing (first phase)
**Requirements**: BE-01, BE-02, BE-03, BE-04, BE-05, BE-06, BE-07, BE-08, BE-09, BE-10, BE-11, BE-12, BE-13, BE-14, BE-15, BE-16, BE-17, BE-18
**Success Criteria** (what must be TRUE):

  1. `twitter-bookmarker-server` starts, logs address + storage dir, and serves `GET /health` → `200 {"status":"ok"}`
  2. `POST /v1/bookmarks` creates a category CSV with the exact header and appends a valid row; a second identical tweet returns `409` with no new row
  3. `GET /v1/index` lists saved tweet IDs, and deleting/corrupting `index.json` rebuilds it from the CSVs
  4. Path-traversal filenames are rejected with `400` and the process shuts down cleanly on `Ctrl+C`

**Plans**: 3 plans

Plans:

- [x] 01-01: Backend model, storage layout, and config/startup
- [x] 01-02: CSV store, URL normalization, duplicate index
- [x] 01-03: HTTP API, validation, logging, graceful shutdown

### Phase 2: Extension Foundation & Settings Popup

**Goal**: A Manifest V3 TypeScript extension scaffold with the shared storage model and a popup that manages categories (add/rename/delete/color/reorder), display mode, auto-unbookmark toggle, and backend connection status — all persisted in `chrome.storage.local`.
**Depends on**: Phase 1
**Requirements**: EXT-01, EXT-02, EXT-03, EXT-04, EXT-05, EXT-06, EXT-07, EXT-08, EXT-09, EXT-10, EXT-11, EXT-12
**Success Criteria** (what must be TRUE):

  1. Loading the unpacked extension opens a popup showing backend Connected/Disconnected from `GET /health`
  2. Categories can be added, renamed (filename recomputed), deleted, recolored, and drag-reordered; all changes survive popup close/reopen
  3. Rename never touches the old CSV and delete never issues a backend call
  4. `displayMode` and `unbookmarkAfterSave` toggles persist with defaults `popover` / `false`

**Plans**: 3 plans

Plans:

- [x] 02-01: MV3 scaffold, build pipeline, shared types + storage module
- [x] 02-02: Category manager UI (CRUD, color, drag order, empty state)
- [x] 02-03: Settings, backend status, and storage-change propagation hook

### Phase 3: X DOM Integration

**Goal**: On `https://x.com/i/bookmarks`, a content script observes the timeline, idempotently injects organizer controls into each tweet's action area, extracts container-scoped metadata (excluding quoted text), and renders popover or inline category controls with correct order/colors and a `✓ Saved` state.
**Depends on**: Phase 2
**Requirements**: XI-01, XI-02, XI-03, XI-04, XI-05, XI-06, XI-07, XI-08, XI-09, XI-10, XI-11, XI-12
**Success Criteria** (what must be TRUE):

  1. Organizer controls appear in the tweet action bar on `/i/bookmarks` and never on other routes; SPA navigation in/out behaves correctly
  2. Infinite-scrolled rows get controls exactly once, and previously saved tweets show `✓ Saved`
  3. Popover and inline display modes both honor `order` and show category colors
  4. Quoted tweet text is excluded, media-only tweets yield empty text, and extraction failure produces no partial record

**Plans**: 3 plans

Plans:

- [x] 03-01: Route detection, observer, and tweet discovery
- [x] 03-02: Tweet extractor (scoped selectors, quoted-text exclusion, media-only handling)
- [x] 03-03: Organizer UI (popover, inline, saved state, rerender on storage change)

### Phase 4: Save Integration

**Goal**: Selecting a category disables the tweet's controls, sends `SAVE_TWEET` through the service worker to the backend, and on success marks `✓ Saved`, updates the local cache, and shows a toast — with graceful handling of `409`, `400`, and backend-unavailable errors.
**Depends on**: Phase 3
**Requirements**: SAVE-01, SAVE-02, SAVE-03, SAVE-04, SAVE-05, SAVE-06, SAVE-07
**Success Criteria** (what must be TRUE):

  1. A category click results in exactly one backend request, with controls disabled and showing "Saving..." until it resolves
  2. `201` yields `✓ Saved` plus "Saved to <Category>"; `409` yields `✓ Saved` plus "Already saved" and no new CSV row
  3. Backend-unavailable restores controls and shows "Backend unavailable" without unbookmarking
  4. Toasts render in-page across success/error/warning/info and auto-dismiss

**Plans**: 2 plans

Plans:

- [x] 04-01: Service worker messaging + backend HTTP client
- [x] 04-02: Content save state machine, index cache, and toast system

### Phase 5: Auto Unbookmark

**Goal**: When `unbookmarkAfterSave` is enabled, the extension triggers X's native unbookmark control only after a confirmed `201`, verifies the bookmark state actually changed, and warns without rolling back CSV data on failure.
**Depends on**: Phase 4
**Requirements**: UNB-01, UNB-02, UNB-03
**Success Criteria** (what must be TRUE):

  1. With the setting off, no unbookmark is ever attempted
  2. With the setting on and a successful save, the tweet is removed from X Bookmarks and the CSV row persists
  3. If the unbookmark click fails or the state does not change, a warning toast is shown and CSV/index/saved state remain intact

**Plans**: 2 plans

Plans:

- [x] 05-01: Native unbookmark trigger + state-change verification
- [x] 05-02: Failure handling, warning toast, and invariant guards

### Phase 6: Hardening, Tests & Docs

**Goal**: Lock in every PRD invariant with automated Go tests, cover the extension edge cases, and ship build tooling plus setup/manual-test documentation.
**Depends on**: Phase 5
**Requirements**: TEST-01, TEST-02, TEST-03, TEST-04, TEST-05, TEST-06
**Success Criteria** (what must be TRUE):

  1. `make test` runs the Go suite green, covering CSV edge cases, index rebuild, and duplicate races
  2. Every backend acceptance criterion has a corresponding automated test
  3. Extension hardening scenarios have an executable manual test checklist
  4. `make build` produces the server binary and the loadable extension `dist/`, and the README explains setup + run

**Plans**: 3 plans

Plans:

- [x] 06-01: Backend test suite (API, CSV, index, concurrency)
- [x] 06-02: Extension hardening + manual test checklist
- [x] 06-03: Build tooling, README, and final verification sweep

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3 → 4 → 5 → 6

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Go Persistence Layer & HTTP API | 3/3 | Complete    | 2026-09-27 |
| 2. Extension Foundation & Settings Popup | 3/3 | Complete    | 2026-09-27 |
| 3. X DOM Integration | 3/3 | Complete    | 2026-09-27 |
| 4. Save Integration | 2/2 | Complete    | 2026-09-27 |
| 5. Auto Unbookmark | 2/2 | Complete    | 2026-09-27 |
| 6. Hardening, Tests & Docs | 3/3 | Complete    | 2026-09-27 |
