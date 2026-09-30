# Phase 6: Hardening, Tests & Docs - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD.md (discuss skipped via workflow.skip_discuss)

<domain>
## Phase Boundary

Close the MVP: lock every backend acceptance criterion with automated tests, exercise the extension edge cases, add repository build tooling, and write setup/run/manual-test documentation.

Source of truth: `PRD.md` sections 52–59, 63–71.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD (do not revisit)

- `make test` must run the Go suite and it must be green.
- CSV edge cases (comma, quote, emoji, unicode, multiline) must be covered.
- Index rebuild from CSV must be covered for missing and corrupted `index.json`.
- Concurrent duplicate requests must produce exactly one row.
- Manual test scenarios from PRD §68 must exist as an executable checklist.
- README must explain setup (build backend, load unpacked extension, create categories) and the invariants.

### Agent's Discretion

- Test file organization and naming.
- Makefile target names beyond `build`/`test`/`clean` (may add `lint`, `fmt`, `run`).
- Whether an extension-level automated harness is added (must not require a real X account).

</decisions>

<code_context>
## Existing Code Insights

By this phase the repo contains:
- `backend/` — Go module, HTTP API, storage, index, tests from Phase 1
- `extension/` — MV3 TypeScript with esbuild build + popup + content script
- `.planning/` — GSD artifacts
No root-level `Makefile` or `README.md` yet.

</code_context>

<specifics>
## Specific Ideas

### Backend acceptance test mapping (PRD §65)

1. executable runs manually → `go build` + smoke test
2. loopback-only bind → assert `config.Host == "127.0.0.1"`
3. `~/.twitter-bookmarker/` auto-created → `EnsureStorageDir`
4. `GET /health` → handler test
5. `GET /v1/index` → handler test
6. `POST /v1/bookmarks` creates CSV → integration test
7. header once → two saves, count header occurrences
8. subsequent saves append → row count
9. URL normalized → table test
10. Tweet ID extracted → table test
11. `saved_at` UTC → parse + `Location == UTC`
12. duplicate → 409
13. cross-file duplicate → 409
14. index rebuild from CSV → test
15. malformed index safe → test
16. unicode/newline/comma valid → csv.Reader round-trip
17. traversal rejected → table test
18. concurrent duplicate → race test
19. index persistence failure does not fail save → test
20. backend stores no settings/categories → API surface test (no such endpoints)

### Extension hardening checklist (PRD §64/§68)

SPA navigation, DOM replacement, duplicate race (double-click), quoted tweets, multiline text, backend downtime, index recovery, browser reload, rename/delete CSV preservation, media-only tweet.

</specifics>

<deferred>
## Deferred Ideas

- CI configuration — not required for a personal tool.
- Publishing to the Chrome Web Store — not in scope.

</deferred>
