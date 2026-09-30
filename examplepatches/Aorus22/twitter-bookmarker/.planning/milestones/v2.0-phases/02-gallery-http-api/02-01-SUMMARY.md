---
phase: 02-gallery-http-api
plan: 01
subsystem: gallery-http-api
tags: [go, net-http, serve-mux, gallery, http-api, query-validation, cursor-pagination, error-sanitisation, read-only]

# Dependency graph
requires:
  - phase: 01-gallery-read-layer
    provides: "gallery.Reader (NewFromConfig/Collections/Posts), RawQuery.Parse/Query.Normalize, Page, Collection/Post JSON tags, ErrCollectionNotFound"
  - phase: 01-go-persistence-layer
    provides: "storage.ValidationError, model.ErrorResponse, config.StorageDir/TWITTER_BOOKMARKER_DIR, logging.Logger"
provides:
  - "GET /api/gallery/collections -> {\"collections\":[{filename,name,post_count,media_count,last_saved_at,cover_media}]}"
  - "GET /api/gallery/collections/{filename}/posts -> {\"items\":[{tweet_id,url,media,author,username,tweet_date,saved_at,text}],\"next_cursor\":string|null,\"has_more\":bool}"
  - "Query params cursor/limit/q/tweet_from/tweet_to/saved_from/saved_to/sort; limit default 30, max 100"
  - "Error mapping: invalid query or malformed cursor -> 400, unknown collection -> 404, internal -> sanitised 500"
  - "Per-request gallery.NewFromConfig(log), so TWITTER_BOOKMARKER_DIR and appended CSVs are honoured without a restart"
  - "Automatic 405 from Go 1.22 method+path patterns: the gallery API cannot be written to"
affects: [phase-3, phase-4, phase-5, phase-6, phase-7, phase-8]

actuals:
  tokens: 0
  tasks: 4
  commits: 2

tech-stack:
  added: ["Go standard library only: net/http (existing mux), errors, encoding/json"]
  patterns:
    - "Thin transport: handlers only build RawQuery, call the read layer and map errors; no gallery logic in internal/api"
    - "RawQuery.Parse is the single HTTP validation entry point, so an explicit limit=0 is a 400 while an absent limit defaults to 30"
    - "errors.As(*storage.ValidationError) is applied to BOTH the Parse error and the Posts error, because a malformed cursor only surfaces from Posts"
    - "Pointer next_cursor: a JSON *string encodes as null at the end of a collection, never \"\""
    - "500 reasons are fixed strings; the real error (which may embed an *os.PathError with the absolute storage path) goes to logging.Logger only"

key-files:
  created:
    - backend/internal/api/gallery.go
    - backend/internal/api/gallery_test.go
  modified:
    - backend/internal/api/server.go

key-decisions:
  - "No NewServer signature change: the gallery reader is resolved per request through gallery.NewFromConfig, keeping every v1.0 call site and test untouched while still honouring a changed TWITTER_BOOKMARKER_DIR"
  - "The filename path value is passed to the read layer verbatim (never re-decoded or cleaned); %2e%2e%2f arrives as ../ via r.PathValue and is rejected by storage.SafeJoin as 400"
  - "DTOs reuse gallery.Collection/gallery.Post (whose JSON tags are the PRD contract) inside a small api-owned envelope, with defensive nil->[] normalisation for media/cover_media/items"
  - "404 uses a fixed reason (\"collection not found\"); no filename or directory is echoed"
  - "No unknown-/api catch-all was added: Phase 9 owns unknown-API 404 routing precedence"

patterns-established:
  - "Every gallery response body is asserted against raw JSON bytes in tests, not only decoded fields, because null-vs-[] and path leakage are wire-level contracts"
  - "Handler tests seed t.TempDir() + t.Setenv(TWITTER_BOOKMARKER_DIR) and never depend on an external fixture"

requirements-completed: [API-01, API-02, API-03, API-04, API-05, API-06, API-07]

coverage:
  - id: D1
    description: "GET /api/gallery/collections is available and reads the storage dir live on every request"
    requirement: "API-01"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryCollectionsEndpoint"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.4, §80.22"
        status: pass
    human_judgment: false
  - id: D2
    description: "Collections response carries filename,name,post_count,media_count,last_saved_at(null for empty),cover_media <= 4 newest-first; decoys excluded; last_saved_at DESC ordering"
    requirement: "API-02"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryCollectionsEndpoint"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.5-§80.10"
        status: pass
    human_judgment: false
  - id: D3
    description: "GET .../{filename}/posts returns the 8-field post objects plus next_cursor and has_more; media is always [] and never null; terminal page is next_cursor:null / has_more:false"
    requirement: "API-03"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryPostsHappyPath"
        status: pass
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryPostsLimitBehaviour"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.11-§80.13"
        status: pass
    human_judgment: false
  - id: D4
    description: "limit default 30 / max 100; limit=0, <1, >100, non-numeric, unknown sort and unparseable dates are 400; a malformed cursor is also 400 from the Posts step"
    requirement: "API-04"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryPostsValidation"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.19"
        status: pass
    human_judgment: false
  - id: D5
    description: "Unknown collection is 404 with the {status,reason} envelope; traversal and non-CSV slugs are 400 and never read a file"
    requirement: "API-05"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryPostsUnknownCollectionIs404"
        status: pass
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryRejectsTraversalAndBadFilenames"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.20"
        status: pass
    human_judgment: false
  - id: D6
    description: "Search is case-insensitive over author/username/text; tweet and saved date ranges are inclusive and combinable; four sort modes reorder correctly"
    requirement: "API-06"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryPostsSearchAndDateFilters"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.14, §80.16-§80.17"
        status: pass
    human_judgment: false
  - id: D7
    description: "Opaque cursor walk yields every post exactly once across pages and terminates with a null cursor; the API is read-only (405 on non-GET, no file mutation) and 500 bodies never leak the storage path"
    requirement: "API-07"
    verification:
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryCursorWalk"
        status: pass
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryRejectsWrites"
        status: pass
      - kind: unit
        ref: "backend/internal/api/gallery_test.go#TestGalleryInternalErrorIsSanitisedAndLogged"
        status: pass
      - kind: e2e
        ref: "scripts/check-gallery-acceptance.sh §80.18, §80.21, §80.23"
        status: pass
    human_judgment: false

# Metrics
duration: 25min
completed: 2026-09-27
status: complete
---

# Phase 2 Plan 1: Gallery HTTP API Summary

**Two read-only `/api/gallery/*` endpoints wired into the existing mux: a thin transport over the Phase 1 read layer with the exact PRD-2 §37/§41 JSON shapes, §40 query validation and §54 error semantics, while `/health`, `/v1/index` and `POST /v1/bookmarks` stay byte-for-byte unchanged.**

## Performance

- **Duration:** 25 min
- **Completed:** 2026-09-27
- **Tasks:** 4
- **Files created:** 2 (957 lines) · **modified:** 1 (+4 lines)

## Accomplishments

- `GET /api/gallery/collections` returns exactly `{"collections":[{"filename","name","post_count","media_count","last_saved_at","cover_media"}]}` from a live re-read of `TWITTER_BOOKMARKER_DIR`; decoys (`index.json`, `*.csv.bak`, dotfiles, `*.txt`) never appear, `last_saved_at` is `null` for an empty CSV, and `cover_media` is capped at four newest-first URLs.
- `GET /api/gallery/collections/{filename}/posts` returns `{"items":[8 fields],"next_cursor":string|null,"has_more":bool}` with `saved_desc` default ordering; `media` is always `[]` and the terminal page is exactly `next_cursor:null, has_more:false`.
- Query validation lives entirely in `gallery.RawQuery.Parse()`: an **absent** limit defaults to 30, while `limit=0`, `<1`, `>100`, non-numeric and a fractional value are 400; unknown `sort` and non-RFC3339 dates are 400; `limit=` and `limit=100` stay 200.
- A **malformed cursor** is caught as `*storage.ValidationError` with `errors.As` from the `Reader.Posts` error (not only from `Parse`) and mapped to 400 — pinned by three cursor cases (non-base64, no `|` separator, bad timestamp).
- Traversal is rejected without decoding it in the handler: `..%2F`, `%2e%2e%2f`, `%5C`, `a%2Fb.csv`, `x.txt` and `Linux.csv` all reach `storage.SafeJoin` as decoded path values and return 400; raw `../` is cleaned/redirected by the stdlib mux and ultimately 404s, never reads a file.
- Error bodies are exactly `{"status":"error","reason":"..."}`: 400 invalid query, 404 `collection not found`, 500 `internal error`. A 500 forced by pointing the storage dir at a regular file proves the absolute path reaches `logging.Logger` but **not** the response body.
- Non-GET methods on both routes return 405 automatically (Go 1.22 method+path patterns), and the test asserts the seeded CSV is byte-identical and no file was created afterwards — the gallery is strictly read-only.
- `NewServer`'s signature did not change: listeners are resolved per request via `gallery.NewFromConfig(s.log)` (a no-I/O constructor), so `TWITTER_BOOKMARKER_DIR` changes and CSVs appended while the server runs are visible immediately.
- The v1.0 contracts are untouched: `handleHealth`, `handleIndex` and `handleSave` are unchanged, and a regression test exercises all three alongside the new routes.

## Test command and observed result

```
cd backend && go test ./... -race -count=1
ok  	twitter-bookmarker/cmd/server	1.549s
ok  	twitter-bookmarker/internal/api	1.156s
ok  	twitter-bookmarker/internal/config	1.015s
ok  	twitter-bookmarker/internal/gallery	1.050s
ok  	twitter-bookmarker/internal/index	1.022s
?   	twitter-bookmarker/internal/logging	[no test files]
?   	twitter-bookmarker/internal/model	[no test files]
ok  	twitter-bookmarker/internal/storage	1.384s
```

- `gofmt -l backend` → prints nothing
- `cd backend && go vet ./...` → clean
- 56 gallery test cases (top-level + subtests) all pass; the pre-existing v1.0 acceptance tests pass unchanged

## Acceptance harness (`scripts/check-gallery-acceptance.sh`)

The script hardcodes port 43121, which the operator's live `make run` dev server already holds, so it was run inside an isolated network namespace (`unshare -rn`, loopback brought up) rather than stopping that server.

```
passed 43, failed 2, skipped 2
  SKIP  §80.24 / serves web/dist (web/dist not built yet)
  SKIP  §80.25 SPA deep route + unknown-API 404 (web/dist not built yet)
  FAIL  §80.2 /v1/index returns the v1 index shape
  FAIL  §80.15 tweet_from filter applied  (got 8 of 8)
```

Both failures are **harness bugs**, not implementation regressions; the harness was not edited.

1. **§80.2 “/v1/index returns the v1 index shape”.** The check is
   `jq -r 'has("tweets") or has("entries") or (type=="array")'`, but the v1.0 endpoint's contract is `{"items":{...}}` — `model.IndexResponse.Items` is tagged `json:"items"` (`backend/internal/model/tweet.go:53`). The `tweets` key belongs to the on-disk `index.json` (`model.IndexFile`), which the harness appears to have conflated with the HTTP response. Proof it is pre-existing and unrelated to this phase: the operator's still-running server built **before** this change returns `{"items":{...}}` (`jq keys` → `["items"]`), and `TestIndexEmptyShape` asserts `"items":{}`. “Fixing” it would require renaming the v1.0 response key, violating the phase's absolute no-contract-change rule.
2. **§80.15 “tweet_from filter applied”.** The check requires a count that is neither 8 nor 0 for `tweet_from=2026-09-15T00:00:00Z`, but `scripts/seed-gallery-fixture.sh` generates timestamps **relative to now**: on 2026-09-27 the linux rows span `tweet_date` 2026-09-19…2026-09-26, so every row is newer than the probe date and 8/8 is the only correct answer. An independent real-HTTP probe with in-range boundaries shows the filter is correct: `tweet_from=2026-09-23` → 4 rows, `2026-09-24` → 3 rows, `2026-09-15` → 8 rows, `2026-09-99…` → 400. The harness date (and/or the fixture’s relative timestamps) needs adjusting.

## Files Created

- `backend/internal/api/gallery.go` (161) — `galleryCollectionsResponse`/`galleryPostsResponse`, `handleGalleryCollections`, `handleGalleryPosts`, and the three error mappers (`writeGalleryQueryError`, `writeGalleryPostsError`, `writeGalleryInternalError`)
- `backend/internal/api/gallery_test.go` (796) — 12 top-level tests / 56 cases: collections shape+ordering+decoys, empty gallery, posts shape/default limit/media-`[]`, limit bounds, 18-case validation table, search+date+sort table, 3-page cursor walk, 404, 405+read-only, 8-case traversal table, 500 sanitisation+logging, v1.0 regression

## Files Modified

- `backend/internal/api/server.go` (+4) — the two `GET /api/gallery/*` route registrations and their comment

## Decisions Made

- **No dependency injection:** the reader is rebuilt per request from `config.StorageDir()` instead of being threaded through `NewServer`. This keeps every existing call site and v1.0 test untouched and directly satisfies “no cache / new data visible without restart”; the constructor performs no I/O.
- **Reuse the read layer's types:** the handlers embed `gallery.Collection`/`gallery.Post` (their JSON tags are the PRD contract) in api-owned envelopes, normalising `nil` to `[]` defensively even though the read layer already guarantees non-nil slices.
- **Cursor nullability:** `NextCursor *string`, set only when the read layer produced a non-empty cursor, so an exhausted page encodes `null` rather than `""`.
- **Sanitised 500 only:** every unexpected error returns the literal reason `internal error`; the error object is logged with `FilesystemError`, because `readRows` wraps `*os.PathError` values that contain the absolute CSV path.
- **No unknown-gallery-subpath catch-all:** Phase 9 owns unknown-API 404 semantics; an unmatched gallery path simply 404s from the mux.

## Deviations from Plan

- **Requirement-ID mapping** is inferred from the phase context (API-04 = query validation, API-05 = 404) since `REQUIREMENTS.md` is orchestrator-owned and out of bounds for this phase; the remaining IDs are assigned collections-endpoint / collections-summary / posts-shape / filters-sort / cursor+read-only as recorded in `coverage`.
- **Acceptance harness run under `unshare -rn`** (isolated netns) instead of freeing port 43121, to avoid terminating the operator's live `make run` server. Same binary, same fixture, same assertions — only the network namespace differs.

## Issues Encountered

- `httptest.NewRequest` panics on a raw space in the request target; the `q=Shell Pilled` case is encoded as `q=Shell%20Pilled`. (A test-authoring issue, not a product one.)
- First draft of `writeGalleryInternalError` omitted its `http.ResponseWriter` parameter; caught by the compiler before any test run.

## Next Phase Readiness

Phase 3 (web scaffold) can consume the API as-is:

- `GET /api/gallery/collections` → `{"collections":[{filename:string, name:string, post_count:number, media_count:number, last_saved_at:string|null, cover_media:string[]}]}`
- `GET /api/gallery/collections/{filename}/posts?cursor&limit&q&tweet_from&tweet_to&saved_from&saved_to&sort` → `{"items":[{tweet_id,url,media:string[],author,username,tweet_date,saved_at,text}], next_cursor:string|null, has_more:boolean}`
- Errors: `{"status":"error","reason":string}` with 400 / 404 / 500; non-GET → 405.
- Relative paths only (`/api/gallery/...`) — the Vite proxy targets `http://127.0.0.1:43121` (PRD §55).

The two harness failures above should be corrected in the harness (or the fixture) before the orchestrator uses `check-gallery-acceptance.sh` as a green gate.

---

*Phase: 02-gallery-http-api*
*Completed: 2026-09-27*
