---
phase: 01-gallery-read-layer
verified: 2026-09-27T14:55:00Z
status: passed
score: 16/16 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 1: Gallery Read Layer — Verification Report

**Phase Goal:** A self-contained `backend/internal/gallery/` package that reads the current CSVs and produces collection summaries plus post pages with search, both date filters, all four sorts, and opaque cursor pagination.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run — the package's own suite plus a separate throwaway probe package (since deleted) that imported `internal/gallery` and asserted the PRD-2 §80 expectations against the shared `scripts/seed-gallery-fixture.sh` fixture. The probe deliberately lived outside the package under test so it could not be satisfied by the package's own assumptions.

## Goal Achievement

### Observable Truths

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| 1 | GAL-01 only `*.csv` discovered as collections | ✓ VERIFIED | Probe: exactly 3 collections `{AI, Design, Linux}` from a dir also containing `index.json`, `linux.csv.bak`, `.hidden.csv`, `notes.txt` |
| 2 | GAL-02 name from filename, no category matching | ✓ VERIFIED | `Linux` / `AI` / `Design`; `DisplayName` is filename-only; `ai`/`llm` initialisms handled |
| 3 | GAL-03 ordered by `last_saved_at` DESC, empties last | ✓ VERIFIED | `linux.csv` first (newest save); `design.csv` (`last_saved_at: null`) sorts after populated collections |
| 4 | GAL-04 counts + `cover_media` correct | ✓ VERIFIED | Linux `8 posts / 13 media`, cover length 4 newest-first starting `a1.jpg`; AI `4 / 3`; Design `0 / 0 / null` |
| 5 | GAL-05 `encoding/csv`, quoted/unicode/multiline safe | ✓ VERIFIED | Fixture uses quoted JSON + em-dashes; package tests cover commas/quotes/emoji/newlines; `reader.go` sets `FieldsPerRecord = -1` so a short row does not abort the file |
| 6 | GAL-06 malformed media JSON → `[]` + warning | ✓ VERIFIED | AI row `...002` (`not-json`) returns `media == []` and is counted as 0 media; server/file parsing continues |
| 7 | GAL-07 malformed row skipped, parsing continues | ✓ VERIFIED | AI 1-field row `...004` skipped; AI still returns its other 4 posts |
| 8 | GAL-08 `tweet_id` derived from URL, no new column | ✓ VERIFIED | `tweet_id` equals the status id; CSV header untouched (`url,media,author,username,tweet_date,saved_at,text`) |
| 9 | GAL-09 search semantics | ✓ VERIFIED | `q=wayland` → 2 (text); `q="  LiNuXgUy  "` → 4 (username, trimmed, case-insensitive) |
| 10 | GAL-10 both date ranges, inclusive, combinable | ✓ VERIFIED | `saved_from` + `tweet_from` combined returns only rows satisfying both |
| 11 | GAL-11 four sort modes | ✓ VERIFIED | `saved_asc` first `...008`; `tweet_desc` first `...001`; `tweet_asc` first `...008`; default `saved_desc` first `...001` |
| 12 | GAL-12 opaque cursor, no public offsets | ✓ VERIFIED | Cursor is base64 `RFC3339Nano\|tweet_id`; no offset is accepted or emitted |
| 13 | GAL-13 filter/search/sort before pagination | ✓ VERIFIED | `query.go` orders read → parse → search → tweet filter → saved filter → sort → paginate; `limit=3` walk filters identically per page |
| 14 | GAL-14 no cache; fresh data visible | ✓ VERIFIED | Probe appended a row to `design.csv` with the reader alive → immediately returned 1 post, no restart |
| 15 | GAL-15 traversal rejected | ✓ VERIFIED | `../secret.csv`, `/etc/passwd`, `a/b.csv`, `x.txt`, `Linux.csv`, `~/x.csv` all error; unknown collection → `ErrCollectionNotFound` |
| 16 | GAL-16 logic in its own module, not handlers | ✓ VERIFIED | `grep -R net/http backend/internal/gallery` → none; `internal/api/`, `cmd/server/`, `extension/`, `web/` untouched by the phase |

### Gates

| Gate | Result |
|------|--------|
| `cd backend && go test ./... -race -count=1` | ✓ all packages `ok` (gallery `1.07s`) |
| Independent probe package (5 tests, 16 assertions) | ✓ all pass, then deleted |
| `gofmt -l backend` | ✓ prints nothing |
| `go vet ./...` | ✓ clean |
| Zero new external dependencies | ✓ `go.mod` unchanged |

### Requirement coverage

`GAL-01 … GAL-16` — 16/16 verified. No requirement in this phase is deferred, stubbed, or unverified.

## Issues Found and Resolved During Verification

Two defects in the **orchestrator's own Phase 2 harness** were found by the executing agent and fixed before this phase was accepted. They are recorded here because they would otherwise have produced false failures in Phase 2:

1. `scripts/seed-gallery-fixture.sh` emitted **invalid CSV** for the `media` column — the JSON's inner quotes were not doubled through the shell heredoc, so `encoding/csv` produced 8/9/10-field records and a correct reader skipped them (Linux would have read as 4 posts / 2 media, `q=wayland` → 0). **Fixed** by generating the fixture with python3's `csv.writer`, which quotes correctly. Re-validated: Linux 8 rows / 13 media, AI 5 rows with exactly one intentional 1-field row, Design header-only.
2. The fixture's tweet dates ran opposite to the intended sort expectations, and `check-gallery-acceptance.sh` consequently expected `sort=tweet_desc` to start with the *oldest* post. **Fixed** in the fixture: tweet_date and saved_at now both run newest (row 1) → oldest (row 8), so `saved_desc`/`tweet_desc` → `…001` and `saved_asc`/`tweet_asc` → `…008`, matching PRD §33 and the checker.

The independent probe also clarified one contract detail now recorded for Phase 2: a **malformed cursor is rejected by `Reader.Posts`, not by `RawQuery.Parse`** — it surfaces as `*storage.ValidationError` and must therefore be mapped to `400` from the `Posts` error, not only from parse errors. `limit=0` is likewise only rejected through `RawQuery.Parse` (an absent limit defaults to 30), so the HTTP layer must build queries via `RawQuery.Parse`.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| `limit=0` rejected by `RawQuery.Parse`; absent limit defaults to 30 | Accepted — satisfies both the "default 30" contract and PRD §80.19 |
| Unparseable `tweet_date`/`saved_at` and non-tweet URLs treated as malformed rows (skipped) | Accepted — consistent with GAL-07 required-field semantics |
| Unrecognised-header `*.csv` still appears as a 0-post collection with a warning | Accepted — "one CSV = one collection" is the stronger invariant |
| Missing storage dir → empty gallery, not an error | Accepted — keeps the homepage empty-state reachable |
| `DisplayName` initialism exceptions limited to `ai`/`llm` | Accepted — PRD §7 example only requires `ai-and-llm.csv` → `AI And LLM` |

## Conclusion

Phase 1 is complete and verified. `backend/internal/gallery/` provides the read layer Phase 2 consumes, with no transport coupling. Cleared to proceed to Phase 2 (Gallery HTTP API).
