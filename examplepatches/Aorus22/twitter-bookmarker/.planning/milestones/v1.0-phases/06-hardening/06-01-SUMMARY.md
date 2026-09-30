---
phase: 06-hardening
plan: 01
subsystem: testing
tags: [go, testing, race-detector, encoding-csv, python3, os-exec, signals, graceful-shutdown, index-rebuild, concurrency]

# Dependency graph
requires:
  - phase: 01-go-persistence-layer
    provides: "backend/internal/{api,storage,index,config,logging,model} plus cmd/server main.go"
provides:
  - "backend/internal/api/acceptance_test.go mapping PRD §65 items 1-20 to named tests"
  - "CSV edge-case round-trip plus external python3 csv parser validation"
  - "index rebuild recovery with CSV byte-identity guarantees"
  - "race-clean concurrency proof: 20 duplicate saves -> 1 row, 10 distinct -> 10 rows"
  - "process-level suite: live server, SIGINT/SIGTERM shutdown, port-in-use, storage-dir failure"
affects: [phase-6, phase-4, phase-5]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
actuals:
  tokens: 13251
  tasks: 3
  commits: 0

tech-stack:
  added:
    - "Go standard library testing only: testing, os/exec, syscall, net/http client, encoding/csv"
    - "python3 csv module (strict=True, newline='') as the external CSV parser"
  patterns:
    - "§65 item -> test-name mapping documented at the top of acceptance_test.go"
    - "Table/named-subtest suites so each acceptance criterion is greppable as itemNN_*"
    - "Process tests build the real binary once in TestMain, run it with HOME=t.TempDir(), and assert exit code + log output"
    - "External-parser check prefers python3 csv and falls back to Go encoding/csv with strict FieldsPerRecord"

key-files:
  created:
    - backend/internal/api/acceptance_test.go
    - backend/internal/storage/csv_edge_test.go
    - backend/internal/index/rebuild_test.go
    - backend/internal/storage/concurrency_test.go
    - backend/cmd/server/process_test.go
  modified: []

key-decisions:
  - "No injectable listen address was added: process tests use the production default 127.0.0.1:43121 and t.Skip only if the port is already occupied, so production config stays untouched"
  - "Go's encoding/csv.Reader normalises CRLF to LF on read, so the CRLF case asserts raw CRLF is preserved on disk and the parsed field equals the input with CRLF normalised; python3 (opened with newline='') is the byte-preserving cross-check"
  - "Reused the existing package test helpers (newTestServer, saveReq, dataRows, writeCSVFile, header) rather than duplicating setup"
  - "Index-persistence-failure is proven at both layers: storage (Save returns success + warning + rebuild recovery) and API (POST still returns 201)"

patterns-established:
  - "acceptance_test.go doc comment is the auditable §65 coverage index"
  - "Tests assert external-format compatibility, not just the backend's own reader"
  - "Process tests use a locked stderr buffer and DisableKeepAlives so shutdown assertions are race-free and prompt"

requirements-completed: [TEST-01, TEST-02, TEST-03, TEST-04]

coverage:
  - id: D1
    description: "Acceptance suite maps PRD §65 items 1-20 to named, API-observable tests (health, index, CSV create/append, header-once, normalization, id extraction, UTC saved_at, duplicate 409 same/cross-file, 400 classes, 500 mapping, no categories/settings endpoint)"
    requirement: "TEST-01"
    verification:
      - kind: unit
        ref: "go test ./internal/api/... -race -count=1 -run 'TestPRD65Acceptance|TestPRD65ValidationAndErrorMapping'"
        status: pass
    human_judgment: false
  - id: D2
    description: "CSV edge cases (comma author, emoji author, quoted text, CRLF+LF multiline, CJK/RTL unicode, media-only empty text, long single line) round-trip exactly and parse under python3's strict csv module"
    requirement: "TEST-02"
    verification:
      - kind: unit
        ref: "go test ./internal/storage/... -race -count=1 -run TestCSVEdgeCasesRoundTripAndExternalParse"
        status: pass
    human_judgment: false
  - id: D3
    description: "Index rebuild from two CSVs yields all IDs; a corrupt index.json yields all IDs with CSVs byte-identical; empty dir yields an empty index; a valid index loads as-is without rescanning"
    requirement: "TEST-03"
    verification:
      - kind: unit
        ref: "go test ./internal/index/... -race -count=1 -run 'TestRebuild|TestValidIndexLoadsAsIs'"
        status: pass
    human_judgment: false
  - id: D4
    description: "Concurrency: 20 goroutines saving the same tweet yield exactly 1 success, 19 duplicates and 1 data row; 10 distinct concurrent saves yield 10 rows; race-clean"
    requirement: "TEST-04"
    verification:
      - kind: unit
        ref: "go test ./internal/storage/... -race -count=1 -run 'TestConcurrent'"
        status: pass
    human_judgment: false
  - id: D5
    description: "Process-level behaviors: executable builds and serves health/save/index over the real loopback socket, storage dir auto-created 0700, SIGINT/SIGTERM exit 0 with a clean shutdown log, port-in-use exits non-zero with a clear message, uncreatable storage dir exits non-zero with a clear message"
    requirement: "TEST-01"
    verification:
      - kind: integration
        ref: "go test ./cmd/server/... -race -count=1"
        status: pass
    human_judgment: false
  - id: D6
    description: "Index-persistence failure never rolls back a durable CSV write: Save returns success, logs a warning without leaking tweet text, and a restart rebuilds the index from the CSV"
    requirement: "TEST-01"
    verification:
      - kind: unit
        ref: "go test ./... -race -count=1 -run 'TestSaveSucceedsWhenIndexPersistFailsThenCSVRecoversIndex|TestPRD65Acceptance/item19'"
        status: pass
    human_judgment: false

# Metrics
duration: 6min
completed: 2026-09-27
status: complete
---

# Phase 6: Hardening, Tests & Docs Summary

**Backend acceptance criteria §65 items 1-20 are locked by named, race-clean Go tests spanning unit, external-parser, rebuild, concurrency and real-process levels**

## Performance

- **Duration:** ~6 min
- **Started:** 2026-09-27T01:38:00Z
- **Completed:** 2026-09-27T01:44:00Z
- **Tasks:** 3 (plan tasks) plus the requested process-level suite
- **Files modified:** 5 (all new; no production code changed)

## Accomplishments
- `backend/internal/api/acceptance_test.go`: `TestPRD65Acceptance` (14 item subtests) and `TestPRD65ValidationAndErrorMapping` (400 classes + 500 mapping), with an auditable §65 item -> test map in the file doc comment.
- `backend/internal/storage/csv_edge_test.go`: `TestCSVEdgeCasesRoundTripAndExternalParse` (8 cases) round-trips comma/emoji authors, quoted text, CRLF+LF multiline, CJK/RTL, media-only empty text and a long single line; every file is re-parsed by python3's strict `csv` module (Go strict reader as fallback).
- `backend/internal/index/rebuild_test.go`: 4 tests proving rebuild from two CSVs, corrupt-index recovery with byte-identical CSVs, empty-dir empty index, and valid-index-as-is loading.
- `backend/internal/storage/concurrency_test.go`: 4 tests proving exactly one row for 20 duplicate saves, 10 rows for 10 distinct concurrent saves, per-file separation under contention, and Save success + CSV-based recovery when index persistence fails.
- `backend/cmd/server/process_test.go`: 4 tests (plus a `TestMain` build harness) covering the real executable, SIGINT/SIGTERM graceful shutdown, port-in-use, and storage-directory failure.

## Task Commits

No commits were made: the executor is explicitly prohibited from running any `git` command. All five new files are present in the working tree only.

**Plan metadata:** not committed (git prohibited for this plan).

## Files Created/Modified
- `backend/internal/api/acceptance_test.go` - §65 item-map doc comment + API-observable acceptance suite and validation/error-mapping suite.
- `backend/internal/storage/csv_edge_test.go` - CSV edge-case round-trip plus external python3 parser validation.
- `backend/internal/index/rebuild_test.go` - index rebuild/recovery with CSV byte-identity assertions.
- `backend/internal/storage/concurrency_test.go` - duplicate/distinct concurrency proofs and index-persist-failure recovery.
- `backend/cmd/server/process_test.go` - real-process lifecycle, signal, port-conflict and storage-failure tests.

## Decisions Made
- **No production change for port injection.** The prompt allowed making the address injectable "if needed"; it was not needed. Process tests use the production default `127.0.0.1:43121` and call `t.Skip` only when that port is already held, so `config.Host`/`config.Port`/`config.Addr()` remain the single source of truth.
- **CRLF is asserted honestly.** `encoding/csv.Reader` normalises `\r\n` to `\n` on read (documented Go behavior). The CRLF case therefore asserts (a) the raw file still contains the original `\r\n` bytes, (b) the parsed Go field equals the input with CRLF normalised, and (c) python3, opened with `newline=''`, parses the same file with 6 strict fields. Every other case round-trips byte-for-byte.
- **Reuse over duplication.** New files reuse existing package helpers (`newTestServer`, `saveReq`, `dataRows`, `readAll`, `writeCSVFile`, `header`) instead of re-declaring fixtures.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 2 - Missing] Added `cmd/server/process_test.go`**
- **Found during:** Task 3 (recovery + concurrency) / explicit requirement 5 of the assignment.
- **Issue:** The plan's `files_modified` listed only four files, but the assignment additionally requires process-level proof (executable, signals, port-in-use, storage failure) that Phase 1 had only verified by hand.
- **Fix:** Added a fifth test file in `package main` with a `TestMain` build harness and four process tests.
- **Verification:** `go test ./cmd/server/... -race -count=1 -v` passes.
- **Committed in:** not committed (git prohibited).

**2. [Rule 1 - Bug] Two authoring bugs caught by actually running the suite**
- **Found during:** First `go test ./internal/... -race -count=1`.
- **Issue:** The cross-file concurrency case reused Status IDs across files (colliding with the global duplicate policy), and the long-single-line case miscounted newlines by forgetting the header terminator.
- **Fix:** Assigned globally unique IDs per job; corrected the expected newline count to 2 (header + row terminators).
- **Verification:** Suite is green and stable under `-count=2 -race`.
- **Committed in:** not committed (git prohibited).

**3. [Rule 3 - Formatting] gofmt doc-comment smart-quote rewrite**
- **Found during:** `gofmt -l .`.
- **Issue:** Go 1.19+ gofmt rewrote `''` in a doc comment to a curly quote.
- **Fix:** Reworded the comment to avoid the sequence; `gofmt -l .` now prints nothing.

---

**Total deviations:** 3 auto-fixed (1 missing critical, 1 bug, 1 formatting).
**Impact on plan:** All additions stay inside `backend/` test files. No production behavior was changed and no PRD contradiction was found.

## Issues Encountered
- `encoding/csv` CRLF normalisation is the one place where "parsed fields equal originals exactly" cannot hold literally through Go's reader; solved by asserting raw-byte preservation on disk plus a python3 cross-check, and documented in the test.
- No environment required skipping: python3 3.14.7 was present (used for the external parser) and port 43121 was free, so **zero tests were skipped** in the verification run.

## Verification Results

```bash
cd "/home/aorus/Project/Twitter Bookmarker/tw-bookmarker-extension/backend"
gofmt -l .              # (no output)
go vet ./...            # (no output)
go test ./... -race -count=1
```

```
ok  	twitter-bookmarker/cmd/server	1.605s
ok  	twitter-bookmarker/internal/api	1.103s
ok  	twitter-bookmarker/internal/config	1.011s
ok  	twitter-bookmarker/internal/index	1.019s
?   	twitter-bookmarker/internal/logging	[no test files]
?   	twitter-bookmarker/internal/model	[no test files]
ok  	twitter-bookmarker/internal/storage	1.382s
```

Also re-run with `-count=2` under `-race`: all packages green, no flakes, no skips.

- Top-level test functions: **55** (+ `TestMain` build harness = 56 `func Test` declarations; 40 pre-existing, 15 new).
- Top-level test runs passed: **55**; named subtests passed: **76**; failures: **0**; skips: **0**.

## §65 Item -> Test Mapping

| # | Criterion | Authoritative test |
|---|-----------|--------------------|
| 1 | executable runs manually | `cmd/server.TestProcessLiveServer` |
| 2 | loopback-only bind | `config.TestFixedLoopbackAddress` + `TestProcessLiveServer` (startup log address) |
| 3 | `~/.twitter-bookmarker/` auto-created 0700 | `config.TestEnsureStorageDirCreates0700AndRepairs` + `TestProcessLiveServer` |
| 4 | `GET /health` | `TestPRD65Acceptance/item04_health` |
| 5 | `GET /v1/index` | `TestPRD65Acceptance/item05_index_endpoint` |
| 6 | `POST /v1/bookmarks` creates CSV | `TestPRD65Acceptance/item06_csv_created_when_missing` |
| 7 | header exactly once | `TestPRD65Acceptance/item07_header_written_once` |
| 8 | subsequent saves append | `TestPRD65Acceptance/item08_subsequent_saves_append` |
| 9 | URL normalized | `TestPRD65Acceptance/item09_url_normalized` |
| 10 | Tweet ID extracted | `TestPRD65Acceptance/item10_tweet_id_extracted` |
| 11 | `saved_at` UTC | `TestPRD65Acceptance/item11_saved_at_is_utc` |
| 12 | duplicate 409 (same file) | `TestPRD65Acceptance/item12_duplicate_same_file_409` |
| 13 | duplicate detection across CSVs | `TestPRD65Acceptance/item13_duplicate_cross_file_409` |
| 14 | index rebuildable from CSV | `index.TestRebuildFromTwoCSVsYieldsAllIDs` |
| 15 | malformed index safe | `index.TestRebuildCorruptIndexYieldsAllIDsAndCSVsByteIdentical` |
| 16 | unicode/newline/comma valid | `storage.TestCSVEdgeCasesRoundTripAndExternalParse` |
| 17 | filename traversal rejected | `TestPRD65Acceptance/item17_filename_traversal_rejected` |
| 18 | concurrent duplicate -> one row | `storage.TestConcurrentSameTweetExactlyOneRow` |
| 19 | index-persist failure no rollback | `TestPRD65Acceptance/item19_index_persist_failure_still_201` + `storage.TestSaveSucceedsWhenIndexPersistFailsThenCSVRecoversIndex` |
| 20 | no settings/categories surface | `TestPRD65Acceptance/item20_no_categories_or_settings_surface` |

## Automation Limits (report honestly)
- Item 2's "only loopback" is proven by the fixed config constant and the startup log address, plus the absence of `0.0.0.0`; the tests do not attempt a connection from a non-loopback interface (not reliably possible in this environment).
- Item 16's CRLF sub-case cannot be byte-identical through Go's `encoding/csv` reader by design; raw-byte preservation plus a python3 strict parse is the strongest available proof (see Decisions).

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- TEST-01 through TEST-04 are satisfied with named tests; `go test ./... -race -count=1` is green and deterministic.
- Plans 06-02 (extension hardening / TEST-05) and 06-03 (Makefile/README/checklist / TEST-06) were intentionally not touched.
- The process tests assume the Go toolchain is available at test time (`go build` in `TestMain`); this is inherent to `go test` and consistent with 06-03's `make test` target.

---
*Phase: 06-hardening*
*Completed: 2026-09-27*
