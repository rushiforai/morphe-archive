---
phase: 01-go-persistence-layer
plan: 02
subsystem: persistence
tags: [go, encoding-csv, duplicate-index, url-normalization, filename-validation, concurrency, mutex, atomic-write]

# Dependency graph
requires:
  - phase: 01-go-persistence-layer
    provides: "Go module, domain model, storage-dir bootstrap"
provides:
  - "Filename validation (^[a-z0-9][a-z0-9-]*\\.csv$) plus SafeJoin containment"
  - "URL canonicalization to https://x.com/<user>/status/<id> and numeric Status ID extraction"
  - "Synchronous CSV header-once + append writes via encoding/csv"
  - "Global in-memory duplicate index with load/rebuild/persist and atomic index.json writes"
  - "One global write mutex making concurrent duplicate saves produce exactly one row"
  - "Index-persistence failure tolerance: CSV success is never rolled back"
affects: [01-03, phase-2, phase-4, phase-6]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
actuals:
  tokens: 10581
  tasks: 4
  commits: 0

tech-stack:
  added: ["Go standard library only: encoding/csv, encoding/json, net/url, regexp, sync, os, path/filepath"]
  patterns:
    - "Store.save critical section: validate → lock → lookup → append → in-memory index → best-effort persist → 201"
    - "IndexStore interface in storage (no import cycle) with index.Index as the real implementation"
    - "Atomic index write: CreateTemp in the same dir → fsync → rename over index.json"
    - "Typed errors: *ValidationError → 400, *DuplicateError (+ ErrDuplicate sentinel) → 409, else 500"

key-files:
  created:
    - backend/internal/storage/filename.go
    - backend/internal/storage/url.go
    - backend/internal/storage/errors.go
    - backend/internal/storage/csv.go
    - backend/internal/index/index.go
    - backend/internal/storage/filename_test.go
    - backend/internal/storage/url_test.go
    - backend/internal/storage/csv_test.go
    - backend/internal/index/index_test.go
  modified: []

key-decisions:
  - "storage declares an IndexStore interface instead of importing index, breaking the storage<->index cycle while keeping one global write path"
  - "Filename validation is regex + explicit traversal/separator/NUL/~ checks + filepath.Clean equality (defense in depth)"
  - "twitter.com/www.twitter.com normalized to x.com; scheme upgraded to https; query/fragment always stripped"
  - "safe-status fallback: a /status/<id> URL without a username segment canonicalizes to https://x.com/i/status/<id>"
  - "Rebuild reader uses FieldsPerRecord=-1 + LazyQuotes so one malformed row cannot lose the rest of a CSV"
  - "saved_at and tweet_date are both stored as UTC RFC3339; tweet_date offsets are converted, not preserved"

patterns-established:
  - "CSV is authority: Persist errors are logged and swallowed; the in-memory index is still updated"
  - "Rebuild is driven purely by scanning valid *.csv names; index.json is never used to rewrite CSV"

requirements-completed: [BE-04, BE-05, BE-06, BE-08, BE-10, BE-11, BE-12, BE-13, BE-14]

coverage:
  - id: D1
    description: "CSV created with the exact header url,author,username,tweet_date,saved_at,text written once, then rows appended"
    requirement: "BE-04"
    verification:
      - kind: unit
        ref: "backend/internal/storage/csv_test.go#TestSaveWritesHeaderOnceThenAppends"
        status: pass
      - kind: e2e
        ref: "cat $TMPHOME/.twitter-bookmarker/linux.csv -> header line byte-exact"
        status: pass
    human_judgment: false
  - id: D2
    description: "Tweet URLs canonicalized to https://x.com/<user>/status/<id> with query and fragment stripped"
    requirement: "BE-05"
    verification:
      - kind: unit
        ref: "backend/internal/storage/url_test.go#TestNormalizeURL"
        status: pass
    human_judgment: false
  - id: D3
    description: "Numeric Tweet Status ID extracted and validated from the URL"
    requirement: "BE-06"
    verification:
      - kind: unit
        ref: "backend/internal/storage/url_test.go#TestExtractTweetID"
        status: pass
    human_judgment: false
  - id: D4
    description: "Global duplicate Status ID rejected with no second append, including across different CSV files"
    requirement: "BE-08"
    verification:
      - kind: unit
        ref: "backend/internal/storage/csv_test.go#TestDuplicateRejectedGlobally"
        status: pass
      - kind: integration
        ref: "backend/internal/api/handlers_test.go#TestSaveDuplicateReturns409"
        status: pass
    human_judgment: false
  - id: D5
    description: "Index loaded when valid and rebuilt from all CSVs when missing/malformed/empty"
    requirement: "BE-10"
    verification:
      - kind: unit
        ref: "backend/internal/index/index_test.go#TestLoadOrRebuildMissingIndexRebuildsFromCSV"
        status: pass
      - kind: unit
        ref: "backend/internal/index/index_test.go#TestLoadOrRebuildCorruptIndexRebuildsFromCSV"
        status: pass
      - kind: unit
        ref: "backend/internal/index/index_test.go#TestLoadOrRebuildEmptyDir"
        status: pass
      - kind: e2e
        ref: "rm index.json / corrupt index.json then restart -> GET /v1/index lists id 123 again"
        status: pass
    human_judgment: false
  - id: D6
    description: "Filename validated against ^[a-z0-9][a-z0-9-]*\\.csv$; traversal (/ \\ .. ~ NUL, absolute) rejected; SafeJoin cannot escape the storage dir"
    requirement: "BE-11"
    verification:
      - kind: unit
        ref: "backend/internal/storage/filename_test.go#TestValidateFilename"
        status: pass
      - kind: unit
        ref: "backend/internal/storage/filename_test.go#TestSafeJoinStaysInsideDir"
        status: pass
      - kind: unit
        ref: "backend/internal/storage/filename_test.go#TestBackendDoesNotSlugFilenames"
        status: pass
    human_judgment: false
  - id: D7
    description: "CSV output valid for commas, quotes, emoji, unicode and embedded newlines via encoding/csv"
    requirement: "BE-12"
    verification:
      - kind: unit
        ref: "backend/internal/storage/csv_test.go#TestCSVRoundTripSpecialCharacters"
        status: pass
      - kind: unit
        ref: "backend/internal/index/index_test.go#TestRebuildHandlesMultilineCommasAndEmoji"
        status: pass
    human_judgment: false
  - id: D8
    description: "Concurrent duplicate saves produce exactly one row (global write mutex)"
    requirement: "BE-13"
    verification:
      - kind: unit
        ref: "go test ./internal/storage/... -race -run TestConcurrentDuplicateSavesProduceExactlyOneRow"
        status: pass
    human_judgment: false
  - id: D9
    description: "A successful CSV append is still success when index.json persistence fails (warning logged, in-memory index updated)"
    requirement: "BE-14"
    verification:
      - kind: unit
        ref: "backend/internal/storage/csv_test.go#TestIndexPersistFailureDoesNotFailSave"
        status: pass
    human_judgment: false

# Metrics
duration: 7min
completed: 2026-09-27
status: complete
---

# Phase 1: Go Persistence Layer & HTTP API Summary

**Safe-filename + canonical-URL validation, synchronous encoding/csv header-once append, and a rebuildable in-memory duplicate index guarded by one global mutex.**

## Performance

- **Duration:** 7 min
- **Started:** 2026-09-27T01:31:00Z
- **Completed:** 2026-09-27T01:38:00Z
- **Tasks:** 4
- **Files modified:** 9

## Accomplishments
- `storage.ValidateFilename` rejects every PRD §8/§52 traversal shape plus regex violations; `SafeJoin` additionally asserts the joined path never escapes the storage dir
- `storage.NormalizeURL` turns `https://x.com/foo/status/123?s=20#x` into `https://x.com/foo/status/123` with id `123`; `twitter.com` hosts normalize to `x.com`, schemes upgrade to https, query/fragment vanish, and non-numeric/absent status IDs error
- `storage.Store.Save` runs the full critical section under one `sync.Mutex` and writes the exact header once per file, then appends 6-column rows with `encoding/csv`; text may be empty (media-only) while author/username/tweet_date/url are required
- `tweet_date` is parsed as RFC3339 and re-emitted as UTC; `saved_at` is backend-generated UTC RFC3339
- `index.LoadOrRebuild` implements PRD §23 cases A–D and `Persist` is atomic (CreateTemp in the same dir → fsync → rename)
- CSV success survives index-persistence failure: warning logged, in-memory index updated, caller still gets success

## Task Commits

Not committed by the executor — per the orchestrator's instructions the executor must not run `git`; the orchestrator commits plan artifacts.

## Files Created/Modified
- `backend/internal/storage/filename.go` — `ValidateFilename`, `SafeJoin`, `FilenamePattern`
- `backend/internal/storage/url.go` — `NormalizeURL`, `ExtractTweetID`
- `backend/internal/storage/errors.go` — `ValidationError`, `DuplicateError`, `ErrDuplicate`
- `backend/internal/storage/csv.go` — `Store`, `Header`, `IsHeaderRecord`, `IndexStore`, global-mutex `Save`
- `backend/internal/index/index.go` — `Index`, `LoadOrRebuild`, rebuild/Persist
- `backend/internal/storage/filename_test.go`, `url_test.go`, `csv_test.go` — validation tables, round-trip, duplicates, concurrency, persist-failure, log-redaction
- `backend/internal/index/index_test.go` — missing/corrupt/empty rebuild, valid load, atomic persist round-trip

## Decisions Made
- Broke the potential `storage` ⇄ `index` import cycle with a small `storage.IndexStore` interface; `index.Index` remains the sole implementation and there is still exactly one write path
- Filename validation is layered: explicit `/`, `\`, `..`, `~`, NUL and absolute checks, `filepath.Base`/`Clean` equality, then the full-match regex — redundant on purpose
- Rebuild uses `FieldsPerRecord = -1` and `LazyQuotes = true` and validates each URL before inserting, so a single malformed row can never discard an otherwise healthy CSV
- `IsHeaderRecord` lets rebuild skip a real header while still ingesting headerless CSVs
- `index.json` is written atomically and a failed rename is reported to the caller, which the Store downgrades to a warning by design

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] `index.LoadOrRebuild` takes `*logging.Logger`, not `*slog.Logger`**
- **Found during:** Task 3 (Index load / rebuild / persist)
- **Issue:** The plan sketched `LoadOrRebuild(dir string, log *slog.Logger)`, but the logging package owns the PRD §56 index-rebuild event. Passing raw slog would have split log shapes across packages.
- **Fix:** `index` imports `internal/logging` and calls `log.IndexRebuild(dir, reason, count)` / `log.FilesystemError(...)`.
- **Files modified:** `backend/internal/index/index.go`
- **Verification:** rebuild reasons ("missing index.json", "malformed index.json") appear in the smoke-test log; `go vet ./...` clean.
- **Committed in:** n/a (orchestrator commits)

**2. [Rule 3 - Blocking] `storage.Store` depends on an `IndexStore` interface, not `*index.Index`**
- **Found during:** Task 4 (CSV store with concurrency protection)
- **Issue:** `index` must import `storage` (for `ExtractTweetID`/`ValidateFilename` during rebuild) while `storage.Store` needed `index.Index` — a direct import cycle.
- **Fix:** Declared `type IndexStore interface { Lookup; Add; Persist }` in `storage`; `index.Index` satisfies it structurally.
- **Files modified:** `backend/internal/storage/csv.go`
- **Verification:** `go build ./...` and `go test ./... -race` pass; integration is exercised through real `index.Index` instances in storage tests.
- **Committed in:** n/a (orchestrator commits)

---

**Total deviations:** 2 auto-fixed (2 blocking)
**Impact on plan:** Both are structural necessities for a compiling, cycle-free package graph. Behavior and acceptance criteria are unchanged.

## Issues Encountered
None.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- `Store.Save` and `Index.All/Lookup` are the exact seams the API layer consumes in 01-03
- Every backend acceptance criterion in PRD §65 (1–19) now has a passing automated test; the extension phases can treat CSV + index as stable

---
*Phase: 01-go-persistence-layer*
*Completed: 2026-09-27*
