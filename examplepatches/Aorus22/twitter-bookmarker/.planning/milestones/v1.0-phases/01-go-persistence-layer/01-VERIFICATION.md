---
phase: 01-go-persistence-layer
verified: 2026-09-27T01:40:00Z
status: passed
score: 18/18 must-haves verified
behavior_unverified: 0
---

# Phase 1: Go Persistence Layer & HTTP API — Verification Report

**Phase Goal:** A manually runnable Go server binds to `127.0.0.1:43121`, creates `~/.twitter-bookmarker/`, and exposes `/health`, `/v1/index`, and `POST /v1/bookmarks` with validated filenames, canonical URLs, global duplicate detection, valid CSV output, and a rebuildable derived index.

**Verified:** 2026-09-27 (independent re-run by orchestrator)
**Status:** passed

## Goal Achievement

### Observable Truths

| # | Truth | Status | Evidence |
|---|-------|--------|----------|
| 1 | Server starts, binds loopback-only on the fixed port | ✓ VERIFIED | `internal/config/config.go` single `Port = 43121` + `Host = "127.0.0.1"`; binary starts and serves; second instance exits 1 with "port 43121 is already in use" |
| 2 | Storage dir auto-created 0700, clear error on failure | ✓ VERIFIED | Startup created `drwx------`; `HOME=<regular file>` exits 1 with a clear storage error |
| 3 | `GET /health` → 200 `{"status":"ok"}` | ✓ VERIFIED | Live curl + handler test |
| 4 | `POST /v1/bookmarks` creates CSV, header once, appends rows | ✓ VERIFIED | Live smoke: header byte-exact `url,author,username,tweet_date,saved_at,text` + one row; second distinct save appends; header-once test |
| 5 | URL normalized, ID extracted | ✓ VERIFIED | `https://x.com/foo/status/123?s=20` → `https://x.com/foo/status/123`, id `123`; table tests |
| 6 | `saved_at` backend-generated UTC | ✓ VERIFIED | `time.Now().UTC().Format(time.RFC3339)`; test parses and asserts UTC |
| 7 | Global cross-file duplicate → 409, no second row | ✓ VERIFIED | Live: second POST to `ai.csv` with same id → 409, `ai.csv` not created |
| 8 | `GET /v1/index` lists saved IDs with url/filename/saved_at | ✓ VERIFIED | Live response matched PRD shape exactly |
| 9 | Index rebuilds from CSV when missing/corrupt/empty | ✓ VERIFIED | `rm index.json` and corrupt index both logged "index rebuilt from csv files"; index lists the id again |
| 10 | Filename traversal rejected 400 | ✓ VERIFIED | Table test covers `../x.csv`, `/etc/passwd`, `~/x.csv`, `a/b.csv`, `Linux.csv`, `foo.txt` |
| 11 | CSV valid for comma/quote/emoji/unicode/newline | ✓ VERIFIED | `encoding/csv` round-trip tests (`csv_edge` cases in `csv_test.go`) |
| 12 | Concurrency: parallel duplicate → one row | ✓ VERIFIED | `-race` concurrency test: 1 success + 19 duplicates, exactly 1 row |
| 13 | Index persist failure does not fail save | ✓ VERIFIED | Test asserts 201 + warning path |
| 14 | Structured logging without tweet text | ✓ VERIFIED | `TestSaveLogsIdentifierButNeverTweetText` |
| 15 | Graceful shutdown on SIGINT/SIGTERM | ✓ VERIFIED | Live `kill -INT` → exit 0, "draining requests" |
| 16 | Clear errors for port-in-use / storage failure | ✓ VERIFIED | Live checks, exit 1 |
| 17 | Invalid payloads → 400; no category/settings storage | ✓ VERIFIED | Handler table tests; `GET /v1/categories` → 404 test |
| 18 | Zero external Go dependencies | ✓ VERIFIED | `go.mod` has no `require`; `go list -m all` = main module only |

**Score:** 18/18 truths verified

### Required Artifacts

| Artifact | Expected | Status | Details |
|----------|----------|--------|---------|
| `backend/go.mod` | module + go directive, no deps | ✓ EXISTS + SUBSTANTIVE | `module twitter-bookmarker`, `go 1.22` |
| `backend/cmd/server/main.go` | lifecycle wiring | ✓ EXISTS + SUBSTANTIVE | `run() error`, explicit `net.Listen`, signal drain |
| `backend/internal/model/tweet.go` | PRD-exact JSON types | ✓ EXISTS + SUBSTANTIVE | all request/response types |
| `backend/internal/config/config.go` | constant host/port + storage dir | ✓ EXISTS + SUBSTANTIVE | 127.0.0.1, 43121, 0700 |
| `backend/internal/logging/logging.go` | PRD §56 events | ✓ EXISTS + SUBSTANTIVE | no tweet text |
| `backend/internal/storage/{filename,url,csv,errors}.go` | persistence | ✓ EXISTS + SUBSTANTIVE | validation, normalization, csv, typed errors |
| `backend/internal/index/index.go` | derived index | ✓ EXISTS + SUBSTANTIVE | load/rebuild/atomic persist |
| `backend/internal/api/{server,handlers}.go` | HTTP contract | ✓ EXISTS + SUBSTANTIVE | exact status codes |
| Test files (6) | acceptance coverage | ✓ EXISTS + SUBSTANTIVE | 40 test functions green under `-race` |

**Artifacts:** 9/9 verified

### Key Link Verification

| From | To | Via | Status | Details |
|------|----|-----|--------|---------|
| `main.go` | `storage.Store` / `index.Index` | constructor wiring | ✓ WIRED | concrete impls passed through interfaces |
| `api.Server` | `storage.Store.Save` | handler call | ✓ WIRED | 201/409/400/500 mapped |
| `storage.Store.Save` | CSV file | `encoding/csv` + `os.OpenFile` | ✓ WIRED | header + append, fsync |
| `storage.Store.Save` | `index.Persist` | best-effort after CSV | ✓ WIRED | warning only on failure |

**Wiring:** 4/4 connections verified

## Requirements Coverage

| Requirement | Status | Evidence |
|-------------|--------|----------|
| BE-01 bind loopback | ✓ SATISFIED | config constants + live |
| BE-02 storage dir 0700 | ✓ SATISFIED | live + test |
| BE-03 health | ✓ SATISFIED | live + test |
| BE-04 CSV create/header/append | ✓ SATISFIED | live + test |
| BE-05 URL normalization | ✓ SATISFIED | table test |
| BE-06 tweet ID extraction | ✓ SATISFIED | table test |
| BE-07 saved_at UTC | ✓ SATISFIED | test |
| BE-08 global duplicate 409 | ✓ SATISFIED | live + test |
| BE-09 index endpoint | ✓ SATISFIED | live + test |
| BE-10 index rebuild | ✓ SATISFIED | live + test |
| BE-11 filename validation | ✓ SATISFIED | table test |
| BE-12 CSV edge cases | ✓ SATISFIED | csv tests |
| BE-13 concurrency | ✓ SATISFIED | race test |
| BE-14 index persist best-effort | ✓ SATISFIED | test |
| BE-15 logging | ✓ SATISFIED | test |
| BE-16 graceful shutdown | ✓ SATISFIED | live |
| BE-17 clear startup errors | ✓ SATISFIED | live |
| BE-18 validation + no config storage | ✓ SATISFIED | handler tests |

**Coverage:** 18/18 requirements satisfied

## Verification Commands (orchestrator re-run)

```
cd backend
gofmt -l .                    → (empty)
go vet ./...                  → ok
go test ./... -race -count=1  → ok api/config/index/storage (race clean)
```
Live smoke (isolated HOME): health ok; POST 201; duplicate 409; CSV header exact; index correct; SIGINT exit 0.

## Residual Notes

- Startup banner is emitted as one structured `slog` record (fields: server, listening, storage, indexed_tweets) rather than the PRD's multi-line illustration. All required fields are present.
- SIGINT/SIGTERM drain and startup-failure exits were verified by executing the binary; plan 06-01 will codify them as Go tests.
- `twitter.com` URLs are accepted at the backend and normalized to `x.com` (extension still only runs on `x.com`).
