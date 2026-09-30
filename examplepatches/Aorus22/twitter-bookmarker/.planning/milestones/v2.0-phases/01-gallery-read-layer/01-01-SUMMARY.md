---
phase: 01-gallery-read-layer
plan: 01
subsystem: gallery-read-layer
tags: [go, encoding-csv, gallery, collections, cursor-pagination, search, date-filters, sorting, fault-tolerance, path-safety]

# Dependency graph
requires:
  - phase: 01-go-persistence-layer
    provides: "storage.ValidateFilename/SafeJoin/ExtractTweetID/NormalizeURL, storage.Header + LegacyHeader, config.StorageDir, logging.Logger"
provides:
  - "Transport-free gallery.Reader over the storage directory (New / NewFromConfig / Dir)"
  - "Reader.Collections summarising every *.csv as a Collection (post_count, media_count, last_saved_at, cover_media) ordered by last_saved_at DESC"
  - "Reader.Posts with trimmed case-insensitive search, inclusive tweet/saved date ranges, four sort modes and opaque cursor pagination"
  - "RawQuery.Parse / Query.Normalize returning *storage.ValidationError for invalid sort/limit/date values (API-04 → 400)"
  - "gallery.ErrCollectionNotFound sentinel (API-05 → 404)"
  - "Opaque base64 cursor carrying <RFC3339Nano sort timestamp>|<tweet_id>"
affects: [phase-2, phase-4, phase-5, phase-7]

actuals:
  tokens: 0
  tasks: 4
  commits: 1

tech-stack:
  added: ["Go standard library only: encoding/csv, encoding/json, encoding/base64, io, io/fs, os, sort, strconv, strings, time, unicode"]
  patterns:
    - "Columns resolved by header name with a -1 sentinel, so current and legacy layouts share one parser"
    - "Per-row validation returns a reason string; the reader logs it and skips, never aborting the file"
    - "Total sort order = (sort timestamp, tweet_id); the cursor is that exact pair, so pagination is stable under appends"
    - "RawQuery owns the strict HTTP rule (limit=0 → 400); Query.Normalize owns the programmatic defaults"

key-files:
  created:
    - backend/internal/gallery/types.go
    - backend/internal/gallery/reader.go
    - backend/internal/gallery/collection.go
    - backend/internal/gallery/query.go
    - backend/internal/gallery/cursor.go
    - backend/internal/gallery/reader_test.go
    - backend/internal/gallery/collection_test.go
    - backend/internal/gallery/query_test.go
    - backend/internal/gallery/cursor_test.go
  modified: []

key-decisions:
  - "Reused *storage.ValidationError rather than inventing a gallery error type, so the v1.0 API error mapper already yields 400 (API-04)"
  - "tweet_date/saved_at are parsed for filtering/sorting and re-emitted as UTC RFC3339; unparseable timestamps are treated as malformed rows"
  - "tweet_desc/tweet_asc use tweet_date; saved_desc/saved_asc use saved_at; leading desc modes reverse the tweet_id tie-break too"
  - "Collection display name title-cases each word, with ai/llm as the only PRD §7 initialism exceptions (ai-and-llm.csv → AI And LLM)"
  - "Every syntactically valid *.csv is a collection even when its header is unrecognised (it reads as 0 posts with one warning)"
  - "Entry must be a regular file, so symlinks/directories named *.csv are never collections"
  - "A missing storage directory is an empty gallery, not an error"

patterns-established:
  - "Read layer caches nothing: Collections and Posts re-open the CSVs on every call"
  - "One unreadable file or malformed row logs a warning and is skipped; the rest of the archive still serves"

requirements-completed: [GAL-01, GAL-02, GAL-03, GAL-04, GAL-05, GAL-06, GAL-07, GAL-08, GAL-09, GAL-10, GAL-11, GAL-12, GAL-13, GAL-14, GAL-15, GAL-16]

coverage:
  - id: D1
    description: "Only valid *.csv regular files become collections; index.json, *.csv.bak, temp files, dotfiles, directories and symlinks never do"
    requirement: "GAL-01"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestCollectionsDiscoverySummariesAndOrdering"
        status: pass
    human_judgment: false
  - id: D2
    description: "Display name derived from the filename only (ai-and-llm.csv → AI And LLM, linux.csv → Linux)"
    requirement: "GAL-02"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/collection_test.go#TestDisplayName"
        status: pass
    human_judgment: false
  - id: D3
    description: "Collections ordered by last_saved_at DESC with timestamp-less collections last and filename tie-break"
    requirement: "GAL-03"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestCollectionsDiscoverySummariesAndOrdering"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestCollectionsEmptyAndTimestampLessSortLast"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/collection_test.go#TestCollectionsOrderingTieBreaksDeterministically"
        status: pass
    human_judgment: false
  - id: D4
    description: "post_count, media_count, last_saved_at (max saved_at) and cover_media (up to 4 newest-first); media-less collections returned"
    requirement: "GAL-04"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestCollectionsDiscoverySummariesAndOrdering"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestCollectionsCoverMediaNewestFirstCappedAtFour"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestCollectionsEmptyAndTimestampLessSortLast"
        status: pass
    human_judgment: false
  - id: D5
    description: "encoding/csv parsing with columns resolved by header name for both current and legacy headers, including commas/quotes/newlines/unicode/emoji"
    requirement: "GAL-05"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsLegacyHeaderYieldsEmptyMedia"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsCSVEdgeCharactersRoundTrip"
        status: pass
    human_judgment: false
  - id: D6
    description: "Malformed media JSON yields media = [] plus a warning; the post is still returned as a text card"
    requirement: "GAL-06"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsMalformedMediaJSONBecomesEmptyAndWarns"
        status: pass
    human_judgment: false
  - id: D7
    description: "Malformed rows (missing required field, wrong field count, unparseable timestamp/url) skipped with a warning while the file keeps parsing"
    requirement: "GAL-07"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsMalformedRowsAreSkippedWithWarnings"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsUnknownHeaderReadsAsEmptyCollection"
        status: pass
    human_judgment: false
  - id: D8
    description: "tweet_id derived from the stored URL through storage.NormalizeURL/ExtractTweetID, with no new CSV column; url returned canonical"
    requirement: "GAL-08"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsMalformedRowsAreSkippedWithWarnings"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/cursor_test.go#TestCursorIsOpaqueAndCarriesSortKeyPlusTweetID"
        status: pass
    human_judgment: false
  - id: D9
    description: "Trimmed case-insensitive substring search over author/username/text; empty query means no search"
    requirement: "GAL-09"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/query_test.go#TestSearchIsTrimmedCaseInsensitiveSubstring"
        status: pass
    human_judgment: false
  - id: D10
    description: "Tweet-date and saved-date ranges independent, combinable and inclusive, with no caller timezone assumption"
    requirement: "GAL-10"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/query_test.go#TestDateFiltersAreIndependentCombinableAndInclusive"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/query_test.go#TestRawQueryParseDefaultsAndValidation"
        status: pass
    human_judgment: false
  - id: D11
    description: "Four sort modes with saved_desc default and a tweet_id tie-break"
    requirement: "GAL-11"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/query_test.go#TestSortModes"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/query_test.go#TestSortTieBreakIsTweetID"
        status: pass
    human_judgment: false
  - id: D12
    description: "Opaque base64 cursor carrying sort timestamp + tweet_id, stable under mid-scroll appends, never a numeric offset"
    requirement: "GAL-12"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/cursor_test.go#TestCursorIsOpaqueAndCarriesSortKeyPlusTweetID"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/cursor_test.go#TestCursorWalkCoversEveryPostExactlyOnce"
        status: pass
      - kind: unit
        ref: "backend/internal/gallery/cursor_test.go#TestCursorStaysStableWhenARowIsAppendedMidScroll"
        status: pass
    human_judgment: false
  - id: D13
    description: "Search, both date filters and sort all applied before cursor pagination"
    requirement: "GAL-13"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/query_test.go#TestOrderOfOperationsFiltersBeforePagination"
        status: pass
    human_judgment: false
  - id: D14
    description: "Every call re-reads the CSV; a row appended while the reader is alive is visible immediately"
    requirement: "GAL-14"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestEveryCallRereadsTheCSVWithoutCache"
        status: pass
    human_judgment: false
  - id: D15
    description: "storage.ValidateFilename + storage.SafeJoin at the read boundary; ../, /, \\, ~ and non-.csv names error"
    requirement: "GAL-15"
    verification:
      - kind: unit
        ref: "backend/internal/gallery/reader_test.go#TestPostsRejectsTraversalAndNonCSVNames"
        status: pass
    human_judgment: false
  - id: D16
    description: "All gallery parsing/query logic lives in backend/internal/gallery with no HTTP or server wiring"
    requirement: "GAL-16"
    verification:
      - kind: unit
        ref: "grep -R 'net/http' backend/internal/gallery => none; git status shows no api/cmd/server/extension/web changes"
        status: pass
    human_judgment: false

# Metrics
duration: 30min
completed: 2026-09-27
status: complete
---

# Phase 1 Plan 1: Gallery Read Layer Summary

**A transport-free `backend/internal/gallery` package that discovers every valid `*.csv` as a collection, summarises it, and serves searched, date-filtered, sorted, cursor-paginated posts without ever caching.**

## Performance

- **Duration:** 30 min
- **Completed:** 2026-09-27
- **Tasks:** 4
- **Files created:** 9 (1,968 lines)

## Accomplishments

- `Reader.Collections` discovers only regular files matching `^[a-z0-9][a-z0-9-]*\.csv$` (so `index.json`, `*.csv.bak`, temp files, dotfiles, directories and symlinks are excluded) and returns one `Collection` per file with `post_count`, `media_count`, `last_saved_at` (max `saved_at`, UTC) and `cover_media` (up to four URLs from the newest-`saved_at` rows, newest first). Media-less and timestamp-less collections are still returned and sort last.
- `displayName` contract is exact: `ai-and-llm.csv` → `AI And LLM`, `linux.csv` → `Linux`, `linux-stuff.csv` → `Linux Stuff`; no category-config matching and no merging.
- One parser handles both layouts by resolving columns by header name (with a UTF-8 BOM guard): the current `url,media,author,username,tweet_date,saved_at,text` and the legacy six-column header, where the absent `media` column reads as `[]`.
- Fault tolerance is per-row and per-file: malformed media JSON → `media: []` + warning; a blank required field, wrong field count, non-RFC3339 timestamp or non-tweet URL → row skipped + warning; an unreadable file → skipped + warning. No single row or file can hide the rest of the archive.
- `tweet_id` is derived from the stored URL via `storage.NormalizeURL`/`ExtractTweetID` (no new CSV column); the returned `url` is the canonical form.
- `Reader.Posts` applies read → parse → search → tweet filter → saved filter → sort → cursor paginate. Search is trimmed, case-insensitive substring over author/username/text; both date ranges are inclusive, independent and combinable; four sort modes are supported with `saved_desc` default; the cursor is opaque base64 of `<RFC3339Nano timestamp>|<tweet_id>` and the walk has no gaps or repeats, even when rows are appended mid-scroll.
- `RawQuery.Parse` / `Query.Normalize` return `*storage.ValidationError` for an unknown sort, a non-integer/`<1`/`>100` limit and non-RFC3339 dates; an absent limit defaults to 30 while an explicit `limit=0` is rejected (matching the orchestrator's §80.19 expectation). A valid-but-absent collection wraps `ErrCollectionNotFound`.

## Test command and observed result

```
cd backend && go test ./... -race -count=1
ok  	twitter-bookmarker/cmd/server	1.607s
ok  	twitter-bookmarker/internal/api	1.131s
ok  	twitter-bookmarker/internal/config	1.016s
ok  	twitter-bookmarker/internal/gallery	1.047s
ok  	twitter-bookmarker/internal/index	1.021s
?   	twitter-bookmarker/internal/logging	[no test files]
?   	twitter-bookmarker/internal/model	[no test files]
ok  	twitter-bookmarker/internal/storage	1.418s
```

- `go test ./internal/gallery/ -cover` → `coverage: 92.8% of statements`
- 91 passing test cases/subtests in the gallery package
- `go vet ./...` → clean (`VET_OK`)
- `gofmt -l backend` → prints nothing
- `grep -R "net/http" backend/internal/gallery` → no matches

## Files Created

- `backend/internal/gallery/types.go` (109) — `Collection`, `Post`, `SortMode`, `Query`, `RawQuery`, `Page`, `ErrCollectionNotFound`, limits
- `backend/internal/gallery/reader.go` (331) — `Reader`, `New`/`NewFromConfig`/`Dir`, discovery, header resolution, row/media parsing, warnings, `Collections`
- `backend/internal/gallery/collection.go` (128) — `DisplayName`, summary computation, cover flattening, `last_saved_at` ordering
- `backend/internal/gallery/query.go` (207) — `RawQuery.Parse`, `Query.Normalize`, `Posts`, filters, sorting, pagination
- `backend/internal/gallery/cursor.go` (91) — `sortKey`, `keyOf`, `cmpKeys`, `encodeCursor`/`decodeCursor`
- `backend/internal/gallery/reader_test.go` (537) — seeding helpers + discovery/summary/fault-tolerance/legacy/freshness/traversal tests
- `backend/internal/gallery/collection_test.go` (62) — `DisplayName` table + ordering tie-breaks
- `backend/internal/gallery/query_test.go` (301) — search, combined date ranges, sort modes, limit/raw-query validation, order of operations
- `backend/internal/gallery/cursor_test.go` (202) — cursor opacity, full walks for every sort mode, exact-multiple termination, append-drift stability, malformed cursors

## Decisions Made

- **Error taxonomy reuse:** invalid query values return `*storage.ValidationError`, so phase 2 maps them to 400 with the mapper the v1.0 API already owns (PRD §54, API-04). `ErrCollectionNotFound` is a `gallery` sentinel for the 404 path.
- **`limit` semantics split by entry point:** `RawQuery.Parse` rejects an explicit `0`, `<1` or `>100`; `Query.Normalize` treats a programmatic zero as "use `DefaultLimit` (30)". This satisfies both "default 30" and the orchestrator's `limit=0 → 400`.
- **Timestamp normalization:** `tweet_date`/`saved_at` are parsed for ordering/filtering and re-emitted as UTC RFC3339; a non-RFC3339 timestamp is treated as a malformed row (otherwise it could not be ordered or filtered).
- **Display-name initialisms:** only `ai` and `llm` are upper-cased (the two tokens named by the PRD §7 contract); every other word is ordinary title case, so `os.csv` → `Os`.
- **Unrecognised header ⇒ empty collection:** PRD §7 says one `*.csv` is one collection, so a file with no gallery columns is still returned with 0 posts and a single warning rather than hidden.
- **Missing storage directory ⇒ empty gallery** (200-shaped), not an error; an unreadable directory still errors.
- **`Page` carries no JSON tags:** phase 2 owns the `{items,next_cursor,has_more}` envelope and the `null` terminal cursor.

## Deviations from Plan

- **Module path:** the actual `backend/go.mod` module is `twitter-bookmarker` (not `github.com/Aorus22/twitter-bookmarker/backend` as the task prompt stated). Imports follow the real module path.
- **Added `NewFromConfig`:** a convenience constructor over `config.StorageDir()` in addition to `New(dir, log)`; phase 2 may construct per request so `TWITTER_BOOKMARKER_DIR` is always honoured.
- **Extended the malformed-row definition:** unparseable `tweet_date`/`saved_at`/`url` are skipped too, not just missing/blank fields (necessary for correct sort, filter and `tweet_id` derivation).
- **Canonical output URL:** the stored URL is normalized before being returned, guaranteeing the returned `url` and `tweet_id` agree.

## Issues Encountered

Independent-probe findings in the orchestrator's phase-2 acceptance harness (reported to the orchestrator; **not** modified here):

1. `scripts/seed-gallery-fixture.sh` emits invalid CSV for the `media` column — the JSON's inner quotes are not CSV-escaped (they need doubling). With `encoding/csv`, its rows become 8/9/10-field records, so a correct reader skips them as malformed: the fixture yields Linux `post_count=4` / `media_count=2` and `q=wayland` → 0, instead of 8 / 13 / 2.
2. `scripts/check-gallery-acceptance.sh:179-182` inverts `sort=tweet_desc`: it expects the oldest-posted tweet first (`...001`, `t 20`) whereas the PRD's "newest posted first" is `...008` (`t 13`).

Verified against a correctly-escaped copy of the same fixture: Linux 8 posts / 13 media / cover 4 newest-first starting `a1.jpg`, AI 4 posts (short row skipped), Design 0/0/null, collection order `linux.csv` first, names `{AI,Design,Linux}`, `q=wayland` → 2, `q=LINUXGUY` → 4, `saved_asc` first `...008`, cursor walk `limit=3` → 8 distinct in 3 pages.

## Next Phase Readiness

Phase 2 can be a thin transport: build `gallery.RawQuery` from `r.URL.Query()`, call `RawQuery.Parse` then `Reader.Posts`, and `Reader.Collections` for the homepage. `*storage.ValidationError` → 400 and `errors.Is(err, gallery.ErrCollectionNotFound)` → 404 already line up with the v1.0 mapper.

---

*Phase: 01-gallery-read-layer*
*Completed: 2026-09-27*
