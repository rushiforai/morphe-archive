---
phase: 09-production-serving
verified: 2026-09-27T16:52:00Z
status: passed
score: 6/6 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 9: Production Serving — Verification Report

**Phase Goal:** one Go process serves the whole product. `web/dist` is served at `/`, the API keeps
precedence over static serving, unknown client routes get the SPA shell so a browser refresh
survives, unknown `/api/*` paths get the existing JSON error envelope, a missing `web/dist` degrades
with a clear message instead of crashing, and the root Makefile gains web targets without breaking
the frozen `make build` / `make test` contracts.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run of every gate, plus a purpose-built HTTP probe against the
**built binary** (`backend/bin/twitter-bookmarker-server`, served from the real `web/dist`) inside the
orchestrator's `unshare -rn` harness, and the agent-browser acceptance run. No subagent claim was
taken on trust.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| PROD-01 | One process serves the built `web/dist` at `/` with no Vite process | ✓ VERIFIED | `GET /` → **200** `text/html; charset=utf-8`, `Cache-Control: no-cache`, body contains `<div id="root">`; `GET /health` → 200 JSON; `GET /assets/index-CJndkUqa.js` → **200** `text/javascript` with `public, max-age=31536000, immutable`. The SPA was built by `make build` and served by the Go binary alone — no Vite process existed during the probe |
| PROD-02 | API routing takes precedence; `/api/*`, `/v1/*`, `/health` never fall through to the SPA | ✓ VERIFIED | `GET /api/nope` → **404 `application/json`** (never HTML); `GET /v1/nope` → **404**; `GET /api/gallery/collections` → 200; `GET /health` → 200 with the frozen `{"status":"ok"}`. The JSON envelope is asserted on the body, not just the status |
| PROD-03 | Unknown frontend routes serve `index.html` so a refresh survives | ✓ VERIFIED | `GET /collections/anything.csv` → 200 `text/html` shell; `GET /anything/deep/here` → 200 shell. The two exceptions hold: `GET /assets/does-not-exist.js` → **404** (a miss under the hashed-asset namespace fails loudly) and `GET /favicon-does-not-exist.svg` → **404** (a root-level dotted name is a file). Non-GET is refused: `POST /anything/deep` → **405**, never HTML. `HEAD /` → 200 |
| PROD-04 | Unknown `/api/*` returns the API `404` shape, never `index.html` | ✓ VERIFIED | Body of `GET /api/nope` contains `"status":"error"` and the response is `application/json` — the same envelope as every other API error. Cross-checked by the HTTP gate's `§80.25 unknown /api path returns the error JSON, not HTML` |
| PROD-05 | Missing `web/dist` degrades with a clear message rather than crashing | ✓ VERIFIED | With `TWITTER_BOOKMARKER_WEB_DIR` pointing at a non-existent directory: the process **starts** (it is not required to boot), `GET /` → **503** `text/plain` whose body names the fix (`pnpm build`), the API stays fully functional (`GET /api/gallery/collections` → 200), and exactly **one** actionable WARN is logged: `built web app not found; the API is still available` with `web_dist=…` and `hint="run 'make web' (or cd web && pnpm build), or set TWITTER_BOOKMARKER_WEB_DIR"` |
| PROD-06 | Root Makefile gains web targets; `make build` still produces the binary and extension `dist/` | ✓ VERIFIED | After `make clean`, a fresh **`make build` exited 0** and produced all three: `backend/bin/twitter-bookmarker-server` (10,801,924 B), `extension/dist/manifest.json`, and `web/dist/index.html`. `backend` / `extension` / `web` / `dev-web` / `dev-backend` / `test` / `lint` / `clean` all exist with the repo's `##` doc style. `make lint` (gofmt + `go vet` + extension typecheck + web typecheck) is clean; `make test` runs the Go suite under `-race`, the extension suite, and the web suite |

### Additional properties verified

| Property | Result |
|----------|--------|
| Filesystem containment (PRD-2 §70) | ✓ Raw traversal (`/../etc/passwd`, `/../../etc/passwd`, `//etc/passwd`, `/assets/../../etc/passwd`) is **normalised by `ServeMux` with a 307 to the cleaned path**; following it yields the SPA shell (`spaShell=1`) and **never a file** (`leaked=0` for every variant). Encoded forms (`%2e%2e%2f`, `..%2f`) are refused with **400**. Backslash and null-byte forms → 404. No variant ever returned file contents |
| Cache policy follows the file name | ✓ Hashed `/assets/*` are immutable for a year; `index.html` **and every SPA fallback that serves it** are `no-cache`, so a rebuild is never invisible |
| Frozen v1.0 contracts unmoved | ✓ `/health` → `{"status":"ok"}`; the gallery API still answers; the error envelope is byte-for-byte the `{"status":"error","reason":…}` shape |
| No new dependency | ✓ `go.mod` unchanged — `net/http`, `io/fs`, `os.DirFS`, `path` only |

### Gates

| Gate | Result |
|------|--------|
| `make lint` | ✓ clean (gofmt, `go vet`, extension typecheck, web typecheck) |
| `make test` | ✓ Go suite `-race` ok (6 packages), extension ok, **web 39 files / 372 tests** |
| `make build` | ✓ exit 0 after `make clean`; binary + extension `dist/` + `web/dist/` |
| `bash scripts/check-gallery-acceptance.sh` (PRD §80, HTTP) | ✓ **52 passed, 0 failed, 0 skipped** |
| `bash scripts/check-web-acceptance.sh` (agent-browser) | ✓ **46 passed, 0 failed** |
| `bash scripts/check-requirement-traceability.sh` | ✓ 82 requirements / 82 rows |

### Requirement coverage

`PROD-01 … PROD-06` — 6/6 verified, with no behaviour carried forward as unverified
(`behavior_unverified: 0`). The reason Phase 9 can claim this where Phase 8 could not: production
serving is observable over plain HTTP, so the orchestrator could verify every claim directly against
the built binary rather than relying on jsdom.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| Raw `..` traversal is answered with a **307 redirect to the cleaned path**, not a 404 | Accepted — this is the Go standard library's own `ServeMux` path normalisation, and the security property (no file ever leaves `web/dist`) holds on the redirected request. The must-have's wording ("cleaned before lookup") describes exactly this. Recorded because a reader expecting 404 would otherwise read 307 as a gap |
| A non-GET to an unknown client route is **405**, while `GET /` with a missing dist is **503** | Accepted — 405 because the fallback is GET/HEAD only (never render HTML for a mutation); 503 only for `/` so the pre-SPA plain-404 contract for every other unmatched non-API path is preserved |

## Verification Findings (bugs the gates caught, now fixed)

This phase's verification ran a **real browser against real CSV data** for the first time in the
milestone, and that is what surfaced two defects that the jsdom suites of Phases 5 and 8 could not
see. Both are fixed and guarded; they are recorded here rather than in a phase they did not belong to.

| Finding | Root cause | Fix | Guard |
|---------|-----------|-----|-------|
| Every card and the lightbox rendered the handle as `@@foo` | The extension's `getUsername` stores the sigil (`"@foo"`, and PRD-2 §36 documents the field that way), but `post-card` and `lightbox-info-panel` prepended their own `@`. The jsdom fixtures used bare names (`"tester"`, `"ada"`), which is precisely why 359 passing tests never saw it | `displayHandle()` is now the single normalisation point, accepting both forms and never emitting a bare sigil; all five render sites route through it | 366 tests pass; mutating `displayHandle` back to the buggy form **fails 26 tests across 5 files**; the test fixtures now carry the sigil so a bare-name regression cannot re-hide it |
| The responsive masonry **deadlocked** when the available width grew (a collection opened narrow stayed at 3 columns when the window was widened, until a full reload) | `useMasonryColumns` observed the very `<ul>` it sizes with `max-width`, so the observed `clientWidth` was `min(available, n*292+(n-1)*32)` and could never increase; no resize fired | The hook observes an uncapped wrapper around the `<ul>` and measures before paint (`useLayoutEffect`) | Verified in a real browser: 1280→1440 now reports **4** columns immediately and matches a reload; 6 new hook tests, and a mutation/revert check confirms they fail against the old shape |

Both were found by the newly-added browser gate, not by reading code. That gate is the reason this
phase's verification is stronger than its predecessors'.

## Residual Risk

None outstanding for PROD-01…PROD-06. One **item carried into Phase 10** (not a Phase 9 gap): the app
shell's wordmark truncates to `Tw…` at 390px because the brand is a fixed string in a `truncate`
span. It is a responsive-polish decision (hide the wordmark vs. shrink it) that belongs with the
Figma mobile reference, so it is recorded for HARD-03 rather than changed here.

## Conclusion

Phase 9 is complete and verified. The single Go binary serves the built SPA, the API keeps strict
precedence with its JSON envelope intact, unknown client routes survive a direct refresh while
genuine asset misses fail loudly, a missing build degrades with one actionable warning and a working
API, and `make build` still composes the binary, the extension and the SPA. Cleared to proceed to
Phase 10 (Hardening). The two defects this phase's browser verification exposed have been fixed,
guarded, and re-verified in a real browser.
