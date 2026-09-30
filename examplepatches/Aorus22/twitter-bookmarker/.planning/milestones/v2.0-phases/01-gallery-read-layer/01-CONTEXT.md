# Phase 1: Gallery Read Layer - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 1 of 10** (= PRD §85 "Phase 2.1 — Gallery Read Layer")

<domain>
## Phase Boundary

Build a self-contained Go package `backend/internal/gallery/` that turns the existing per-category CSVs into (a) collection summaries and (b) paginated post pages with search, two independent date filters, four sort modes, and opaque cursor pagination.

**In scope:** CSV discovery + reading, media JSON parsing, row-level fault tolerance, `tweet_id` derivation, collection name derivation, summary computation (`post_count`, `media_count`, `last_saved_at`, `cover_media`), search semantics, date-range semantics, sorting, cursor encode/decode, pagination, filename safety at the read boundary.

**Out of scope:** any HTTP handler, route, JSON response envelope, or server wiring — those are Phase 2. This phase ships a library plus tests only. Do **not** touch `backend/internal/api/`, `backend/cmd/server/`, the extension, or `web/`.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2 (do not revisit)

- One `*.csv` file in the storage directory = one collection. Only `*.csv` is considered; `index.json`, `*.csv.bak`, temp files, and dotfiles are never collections (PRD §53).
- Collection display name is derived **from the filename only**: strip `.csv`, replace `-`/`_` runs with a space, title-case each word. `ai-and-llm.csv` → `AI And LLM`, `linux.csv` → `Linux`. No matching against extension category config, no merging of renamed categories (PRD §7, §8).
- Collections with `media_count == 0` are still returned (PRD §9).
- Collection ordering: `last_saved_at` DESC; collections with no valid timestamp sort after those that have one (PRD §38).
- Summary fields: `post_count` = number of bookmark rows; `media_count` = total items across every row's JSON `media` array; `last_saved_at` = maximum `saved_at`; `cover_media` = up to four media URLs from the rows with the newest `saved_at`, newest first (PRD §39, §17).
- CSV parsing uses `encoding/csv` — never manual comma splitting. Must handle commas, quoted fields, multiline text, unicode, emoji (PRD §49).
- Media column is a JSON string array. Invalid JSON ⇒ `media = []` for that row + a warning log; the post still appears as a text card (PRD §50).
- A malformed row is skipped with a warning; parsing continues. Required per-item fields are `url`, `author`, `username`, `tweet_date`, `saved_at`; `text` and `media` may be empty (PRD §51).
- `tweet_id` is derived from the stored URL — no new CSV column (PRD §42).
- Search = normalized lowercase substring match across `author`, `username`, `text`. Trim the query; empty query = no search; no fuzzy search, no full-text index, no client regex (PRD §45).
- Date filters: `tweet_date` range and `saved_at` range, independently settable and combinable, both **inclusive**. The backend makes no timezone assumption about the caller (PRD §29, §32).
- Sort values: `saved_desc` (default), `saved_asc`, `tweet_desc`, `tweet_asc` (PRD §33).
- Cursor is **opaque** and carries the sort key plus `tweet_id` as tie-breaker; public pagination is never a numeric offset (PRD §43).
- Order of operations is fixed: read CSV → parse rows → search → tweet-date filter → saved-date filter → sort → cursor paginate (PRD §46).
- Every call re-reads current CSV state. No persistent cache (PRD §14/§48).
- Gallery parsing/query logic must live in the gallery package, not in HTTP handlers (PRD §71).

### Two CSV layouts must be supported

`internal/storage/csv.go` defines two headers:

- current: `url,media,author,username,tweet_date,saved_at,text` (`storage.Header`)
- legacy: `url,author,username,tweet_date,saved_at,text` (`storage.LegacyHeader`) — files written before the media column existed

The reader must resolve columns **by header name**, so a legacy file (no `media` column) reads as `media = []` rather than misaligning fields. Do not assume a fixed column index.

### Reuse from v1.0 (do not re-implement)

- `storage.ValidateFilename(name string) error` — `^[a-z0-9][a-z0-9-]*\.csv$`
- `storage.SafeJoin(dir, name string) (string, error)` — traversal-safe resolution
- `storage.ExtractTweetID(raw string) (string, error)` / `storage.NormalizeURL(raw string) (canonical, tweetID string, err error)`
- `config.StorageDir() (string, error)` / `config.EnsureStorageDir() (string, error)`
- `logging.Logger` — use its `Slog()` for warnings, or accept a `*slog.Logger`; never log tweet text at info level (v1.0 invariant)

### Agent's Discretion

Package/file split, exact type names, cursor encoding (e.g. base64 of `timestamp|tweet_id`), whether the reader streams or loads per file, and how tests seed CSVs.

</decisions>

<code_context>
## Existing Code Insights

- Module: `github.com/Aorus22/twitter-bookmarker/backend` (see `backend/go.mod`; v1.0 has **zero external dependencies** — keep it that way).
- `internal/storage/csv.go` — writer side already produces the current header and normalizes media via `storage.NormalizeMedia` (max 8, pbs.twimg.com only).
- `internal/storage/filename.go`, `url.go`, `media.go` — validators to reuse.
- `internal/config/config.go` — `StorageDir()` honours `TWITTER_BOOKMARKER_DIR`; tests should point it at a `t.TempDir()`.
- `internal/logging/logging.go` — `logging.Discard()` is available for silent tests.
- Tests: table-driven, `t.TempDir()`, no external services. v1.0 tests are the style reference (`internal/storage/*_test.go`, `internal/api/acceptance_test.go`).
- Suggested layout (PRD §71, not mandatory): `reader.go`, `collection.go`, `query.go`, `cursor.go`, `types.go` inside `backend/internal/gallery/`.

</code_context>

<specifics>
## Specific Ideas

Concrete behaviours the verifier will check:

1. Seed a storage dir with `ai.csv` (3 rows, one with 2 media, one text-only), `linux.csv` (2 rows), `design.csv` (1 row, 0 media), plus `index.json`, `linux.csv.bak`, and `.hidden.csv`.
   → `Collections()` returns exactly 3, named `AI`, `Linux`, `Design`, with correct counts, `Design` present despite `media_count == 0`, and `cover_media` newest-first capped at 4.
2. A row whose `media` cell is `not-json` → that post is returned with `media: []` and a warning is logged.
3. A row missing `saved_at` → skipped, other rows unaffected.
4. A legacy-header file → parsed correctly with `media: []`.
5. `q = "  LiNuX  "` matches a post whose text is `"Linux desktop..."` and one whose username is `@linuxguy`.
6. `tweet_from` + `saved_from` supplied together → only posts satisfying both inclusive ranges.
7. Walking `limit=2` with `next_cursor` through a 5-post collection yields 5 unique posts in `saved_desc` order and ends with `has_more == false, next_cursor == ""`.
8. Appending a row to the CSV and calling again returns the new post — proving no cache.
9. `Posts("../etc/passwd")`, `Posts("/etc/passwd")`, `Posts("a/b.csv")`, `Posts("x.txt")` all error.
10. `go test ./... -race` and `gofmt -l backend` clean, `go vet ./...` clean.

</specifics>

<deferred>
## Deferred Ideas

- mtime-aware summary cache (PRD §69 — explicitly not Phase 2)
- media-type classification (images/videos/links) — no CSV backing
- Any write/mutation path from the gallery

</deferred>
