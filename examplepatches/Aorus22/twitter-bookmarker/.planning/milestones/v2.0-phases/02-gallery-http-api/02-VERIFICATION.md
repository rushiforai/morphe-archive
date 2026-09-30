---
phase: 02-gallery-http-api
verified: 2026-09-27T15:05:00Z
status: passed
score: 7/7 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 2: Gallery HTTP API — Verification Report

**Phase Goal:** The gallery read layer is exposed over read-only `/api/gallery/*` endpoints with the documented response shapes and `400`/`404`/`500` error semantics, while `/health`, `/v1/index`, and `POST /v1/bookmarks` keep their exact v1.0 contracts.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run. The Go suite was re-run by the orchestrator, and `scripts/check-gallery-acceptance.sh` — a harness written by the orchestrator directly from PRD §80, not by the implementing agent — was run against a real server process with a seeded fixture. **48 assertions passed, 0 failed, 2 skipped** (the 2 skips are §80.24/§80.25, which need `web/dist` and belong to Phase 9).

## Goal Achievement

### Requirements

| # | Requirement | Status | Evidence (real HTTP) |
|---|-------------|--------|----------------------|
| API-01 | `GET /api/gallery/collections` returns `{"collections":[…6 fields…]}` for all valid collections | ✓ VERIFIED | 200; exactly `{AI, Design, Linux}` from a dir also holding `index.json`, `linux.csv.bak`, `.hidden.csv`, `notes.txt` — decoys excluded |
| API-02 | posts endpoint accepts `cursor,limit,q,tweet_from,tweet_to,saved_from,saved_to,sort` | ✓ VERIFIED | all eight exercised; lower and upper bounds inclusive and exact on both date fields |
| API-03 | posts response shape, `next_cursor: null` / `has_more: false` at the end | ✓ VERIFIED | shape asserted; terminal page after a 3-page `limit=3` walk is `has_more:false`, `next_cursor:null` |
| API-04 | `post_count`, `media_count`, `last_saved_at`, `cover_media` (≤4) | ✓ VERIFIED | Linux `8 / 13`, cover length 4 newest-first from `a1.jpg`; AI `4 / 3`; Design `0 / 0 / null`; order `linux.csv` first |
| API-05 | malformed JSON and malformed rows never crash the server | ✓ VERIFIED | AI row `not-json` → `media: []`; AI 1-field row skipped; `/health` still 200 afterwards |
| API-06 | errors as `{"status":"error","reason":"…"}`: 400 invalid, 404 unknown, 500 internal | ✓ VERIFIED | 400 on `limit=0/101/abc`, `sort=bogus`, `saved_from=not-a-date`, malformed cursor, 4 traversal forms; 404 unknown collection; 405 on POST |
| API-07 | never expose the storage directory / absolute paths | ✓ VERIFIED | error bodies asserted free of the fixture path; 500 reason is the literal `internal error`, real error logged server-side |

### v1.0 contracts unchanged (PRD §80.1–§80.3)

| Endpoint | Result |
|----------|--------|
| `GET /health` | ✓ 200 `{"status":"ok"}` |
| `GET /v1/index` | ✓ 200 `{"items":{…}}` (unchanged shape) |
| `POST /v1/bookmarks` | ✓ 201, real CSV written, `smoke.csv` then removed by the harness |

### Other acceptance criteria covered

| Criterion | Result |
|-----------|--------|
| §80.18 cursor pagination — no gaps, no repeats | ✓ 8 distinct ids across exactly 3 pages at `limit=3` |
| §80.17 all four sorts | ✓ `saved_desc`/`tweet_desc` → `…001` first; `saved_asc`/`tweet_asc` → `…008` first |
| §80.16 both date filters combine (AND) | ✓ combined 5 ≤ 5 and ≤ 6; an empty window returns `[]`, not a fallback to all |
| §80.22 new CSV data visible without restart | ✓ a row appended while the server ran appeared immediately |
| §80.23 read-only | ✓ POST → 405; `post_count` unchanged after the attempt |
| GAL-15 traversal rejected at the HTTP layer | ✓ `../secret.csv` 404; `..%2F`, `%2e%2e%2f`, `a%2Fb` → 400 |

### Gates

| Gate | Result |
|------|--------|
| `cd backend && go test ./... -race -count=1` | ✓ all 6 test packages ok |
| `gofmt -l backend` | ✓ prints nothing |
| `go vet ./...` | ✓ clean |
| `scripts/check-gallery-acceptance.sh` | ✓ **48 passed / 0 failed / 2 skipped** |
| Zero new external dependencies | ✓ `go.mod`/`go.sum` unchanged |

### Requirement coverage

`API-01 … API-07` — 7/7 verified. Nothing in this phase is deferred, stubbed, or unverified.

## Issues Found and Resolved During Verification

The executing agent ran the harness and reported 43 passed / 2 failed, asserting both failures were harness defects. The orchestrator confirmed **both were correct**, and found a third while fixing them. All three were in the orchestrator's own harness, and all three are now fixed:

1. **§80.2 asserted the wrong `/v1/index` shape.** The harness checked `has("tweets") or has("entries")`. The v1.0 HTTP contract is `{"items":{…}}` (`model.IndexResponse.Items`); `tweets` is the key of the *on-disk* `index.json`. Fixed to assert `has("items")`. (Satisfying the old check would have required breaking the frozen v1.0 contract this phase forbids changing.)
2. **§80.15 used absolute dates against a relative fixture.** The fixture generates timestamps relative to seed time, so the hardcoded `2026-09-15` matched all rows and the assertion "... != 8" failed for the only correct answer. Replaced with a computed cutoff, and upgraded from a vague "not 8, not 0" to exact expected counts for **both** bounds of **both** date fields, plus an empty-window case. This is strictly stronger coverage than before.
3. **`date -d '5 days 12 hours ago'` is not "5.5 days ago".** GNU `date` binds `ago` only to the last item, so it evaluated to now + 5 days − 12 hours — a *future* cutoff, which made the new date assertions fail with `0`/`8`. Fixed to `-5 days -12 hours`.

Additionally, the harness hardcoded port 43121, which the operator's live `make run` dev server owns. Rather than stop that server, the harness now **re-execs itself inside a private network namespace** (`unshare -rn`, loopback up) when the port is busy, and fails loudly only if that isolation is unavailable. The operator's server was never touched. This also means the harness is safe to run at any time, including while the app is in use.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| `NewServer` signature unchanged; the reader is built per request via `gallery.NewFromConfig` | Accepted — satisfies §80.22 (fresh data, no restart) and keeps every v1.0 call site and test untouched |
| Invalid `limit` rejected only through `RawQuery.Parse`; malformed cursor mapped via `errors.As` from the `Posts` error | Accepted — this is the contract Phase 1 verification identified; both paths reach 400 |
| 500 reason is the literal `internal error` | Accepted — required by API-07; the real error is logged |
| No unknown-`/api/*` catch-all | Accepted — correct here; PRD §57 assigns that to the SPA fallback in Phase 9 |

## Conclusion

Phase 2 is complete and verified: the read-only gallery API satisfies PRD §80.1–§80.23 with the frozen v1.0 contracts intact, proven over real HTTP by an independently authored harness. Cleared to proceed to Phase 3 (Web Scaffold, Theme & API Client).
