---
phase: 06-hardening
plan: 03
subsystem: infra
tags: [makefile, readme, documentation, build-tooling, end-to-end-smoke, csv, index-rebuild, isolated-home]

# Dependency graph
requires:
  - phase: 06-hardening
    provides: "06-02 extension hardening guards + 147-test extension suite and the PRD §68 manual checklist"
  - phase: 06-hardening
    provides: "06-01 backend acceptance suite (TEST-01..TEST-04)"
provides:
  - "Root Makefile: build, test, run, fmt, lint, clean, and an explicit destructive clean-storage"
  - "README.md: what-it-is/not, architecture, requirements, setup + first-run, CSV schema, API semantics, §71 invariants, troubleshooting"
  - "Recorded final verification sweep: make build/test, gofmt, go vet, typecheck, extension tests/build/verify"
  - "Recorded isolated-HOME end-to-end smoke: 201/409/400, strict python3 CSV parse, index, restart-without-index rebuild, clean shutdown"
affects: [phase-6, milestone-close, verify-work]

# Actuals (#2632) — pairs with the plan's `estimate` to calibrate future estimates.
# Estimated chars/4 over the realized diff (git is prohibited, so no exact diff).
actuals:
  tokens: 7300
  tasks: 3
  commits: 0

tech-stack:
  added:
    - "GNU make targets (bash recipes) at the repository root"
  patterns:
    - "Makefile `lint` fails closed: an empty `gofmt -l backend` is enforced in the recipe, not just by eye"
    - "Destructive storage removal is a separate target that prints a loud warning and lists the directory contents before deleting"
    - "End-to-end smoke runs the real built binary against a throwaway `$HOME` (never the user's ~/.twitter-bookmarker)"

key-files:
  created:
    - Makefile
    - README.md
  modified: []

key-decisions:
  - "`make build` runs `npm ci` exactly as specified, so a clean checkout is reproducible; the existing package-lock.json makes it deterministic"
  - "`clean` only removes backend/bin and extension/dist; deleting user CSV/index data requires the separate, loud clean-storage target (PRD §71)"
  - "`make run` does not depend on `build` (which reinstalls npm deps); it errors with guidance when the binary is missing, keeping run fast"
  - "The smoke test used an isolated HOME created with mktemp; the real ~/.twitter-bookmarker did not exist before and was not created"
  - "Actuals are an estimate: the executor is prohibited from running git"

patterns-established:
  - "One root entry point for build/test/lint that works from a clean checkout"
  - "README factual claims cross-checked against code (port 43121, filename regex, slog startup format, CORS scope)"

requirements-completed: [TEST-06]

coverage:
  - id: D1
    description: "Root Makefile with build/test/run/fmt/lint/clean and a separate destructive clean-storage that prints a loud warning and lists ~/.twitter-bookmarker before removing it; clean never touches user data"
    requirement: "TEST-06"
    verification:
      - kind: other
        ref: "make build; make test; make lint; make -n clean; make -n clean-storage"
        status: pass
    human_judgment: false
  - id: D2
    description: "README.md: what it is/not, architecture diagram, requirements, setup + first-run, CSV schema with the PRD §63 example row, API summary with 201/409/400/500, §71 invariants, troubleshooting (backend down, port in use, index rebuild, selector drift) and a link to the checklist"
    requirement: "TEST-06"
    verification:
      - kind: other
        ref: "README.md cross-checked against backend/internal/config/config.go, storage/filename.go, logging/logging.go, manifest permissions; all documented commands were executed during the sweep"
        status: pass
    human_judgment: true
    rationale: "The load-unpacked Chrome step and the first X Bookmarks interaction require a browser session and a signed-in X account; a human must follow docs/MANUAL-TEST-CHECKLIST.md."
  - id: D3
    description: "Isolated-HOME end-to-end smoke of the built server: health 200, POST 201, cross-file duplicate 409, traversal 400, raw CSV + strict python3 parse, GET /v1/index, restart without index.json rebuilds the index, CSV byte count unchanged, SIGINT and SIGTERM exit 0"
    verification:
      - kind: integration
        ref: "isolated-HOME smoke script over ./backend/bin/twitter-bookmarker-server"
        status: pass
    human_judgment: false
  - id: D4
    description: "Full verification gate green: make build, make test (Go -race + 147 extension tests), gofmt -l backend empty, go vet ./..., tsc --noEmit, npm test, npm run build, npm run verify (23 dist checks)"
    requirement: "TEST-06"
    verification:
      - kind: integration
        ref: "make build && make test && gofmt -l backend && (cd backend && go vet ./...) && (cd extension && npm run typecheck && npm test && npm run build && npm run verify)"
        status: pass
    human_judgment: false

# Metrics
duration: 22min
completed: 2026-09-27
status: complete
---

# Phase 6: [Hardening, Tests & Docs] Summary

**Root Makefile and README ship the MVP with a reproducible `make build`/`make test`, a loud explicit `clean-storage`, and a recorded isolated-HOME smoke proving 201/409/400, strict CSV, index rebuild, and clean shutdown**

## Performance

- **Duration:** ~22 min
- **Started:** 2026-09-27T09:00:00+07:00
- **Completed:** 2026-09-27T09:22:00+07:00
- **Tasks:** 3
- **Files modified:** 2 (both created)

## Accomplishments
- `Makefile` (tab-indented, `.PHONY`, `.DEFAULT_GOAL := build`): `build` (Go binary to `backend/bin/twitter-bookmarker-server` + `npm ci && npm run build`), `test` (`go test ./... -race` then `npm test`), `run`, `fmt`, `lint` (fails closed on non-empty `gofmt -l backend`, then `go vet ./...` and `tsc --noEmit`), `clean` (`backend/bin` + `extension/dist` only), and `clean-storage` (loud warning + directory listing before `rm -rf ~/.twitter-bookmarker`).
- `README.md`: purpose and non-goals, extension ↔ loopback Go backend ↔ CSV + derived index architecture, Go ≥ 1.22 / Node ≥ 20 / Chrome requirements, build + run + load-unpacked + first-run path, CSV schema with the PRD §63 example row, API summary (`/health`, `/v1/index`, `POST /v1/bookmarks` with 201/409/400/500), the PRD §71 invariants, development commands, and troubleshooting for backend-down, port-in-use, index corruption/rebuild, and X selector drift (`extension/src/content/selectors.ts`).
- Recorded final sweep and an isolated-HOME smoke that exercised the real built binary end to end.

## Task Commits

No commits were made: the executor is explicitly prohibited from running any `git` command. All files are present in the working tree only.

**Plan metadata:** not committed (git prohibited for this plan).

## Files Created/Modified
- `Makefile` - Root build/test/lint/run/clean tooling with a separate destructive `clean-storage`.
- `README.md` - Setup, architecture, CSV schema, API semantics, invariants, troubleshooting, link to the manual checklist.

## Decisions Made
- **`clean` is safe by construction.** It only removes `backend/bin` and `extension/dist`; user CSVs and `index.json` are removed only by the standalone `clean-storage` target, which prints a prominent warning and lists the directory contents first (PRD §71: CSV is the durable source of truth).
- **`make run` stays fast.** It is not a prerequisite of `build` (which reinstalls npm dependencies); it validates the binary exists and exits non-zero with guidance otherwise.
- **Smoke isolation.** The end-to-end smoke ran with `HOME=$(mktemp -d)`; the real `~/.twitter-bookmarker` did not exist before the sweep and was not created. All smoke temp dirs were removed afterwards.
- **Fact-checked documentation.** The README's port, filename regex, permissions, and startup-log format were verified against `backend/internal/config/config.go`, `backend/internal/storage/filename.go`, `extension/scripts/verify-dist.mjs`, and a live server run; the first draft's invented startup text was corrected to the real `slog` output.

## Deviations from Plan

### Auto-fixed Issues / Plan adjustments

**1. [Rule 1 - Doc accuracy] Corrected the README startup-log example**
- **Found during:** Task 2/3 (live smoke).
- **Issue:** The README initially showed a hand-written `Listening: …` block; the backend actually emits structured `slog` text (`msg="Twitter Bookmarker server started" … listening=127.0.0.1:43121`).
- **Fix:** Replaced it with the real captured output; the same correction was applied to `docs/MANUAL-TEST-CHECKLIST.md` A1.
- **Verification:** captured from the isolated-HOME smoke run.

**2. [Rule 3 - Environment] `pgrep` is unreliable for the "no server left running" check**
- **Found during:** final sweep.
- **Issue:** `pgrep -f twitter-bookmarker-server` matches the checking shell's own command line; `pgrep -x` warns because the process name exceeds 15 characters.
- **Fix:** Used `ss -ltn | grep :43121` (port free) as the authoritative check after both smoke servers had been reaped with `wait` (exit code 0).
- **Verification:** port `43121` free; both server runs exited 0.

---

**Total deviations:** 2 auto-fixed (1 documentation accuracy, 1 environment/verification method).
**Impact on plan:** None on scope; both were correctness fixes to the recorded evidence.

## Issues Encountered
- `npm ci` prints an npm 11 `install-scripts` warning about esbuild's postinstall. It is harmless here: the platform binary resolves and `npm run build` plus `npm run verify` both pass after `npm ci`.
- The first smoke startup logs `index rebuilt from csv files … reason="missing index.json"` even for an empty directory — expected, and it confirms the rebuild path.

## Verification Results

### Required gate — exact commands and observed results

```bash
cd "/home/aorus/Project/Twitter Bookmarker/tw-bookmarker-extension"
make build
make test
gofmt -l backend
cd backend && go vet ./... && cd ..
cd extension && npm run typecheck && npm test && npm run build && npm run verify
```

```text
########## make build ##########
[build] dist/ ready -> .../extension/dist
EXIT=0

########## make test ##########
ok  	twitter-bookmarker/cmd/server	1.645s
ok  	twitter-bookmarker/internal/api	1.115s
ok  	twitter-bookmarker/internal/config	1.013s
ok  	twitter-bookmarker/internal/index	1.020s
?   	twitter-bookmarker/internal/logging	[no test files]
?   	twitter-bookmarker/internal/model	[no test files]
ok  	twitter-bookmarker/internal/storage	1.408s
ℹ tests 147
ℹ pass 147
ℹ fail 0
ℹ skipped 0

########## gofmt -l backend ##########
(no output — clean)

########## go vet ./... ##########
vet OK

########## npm run typecheck ##########
tsc --noEmit (no output — clean)

########## npm run build ##########
[build] dist/ ready -> .../extension/dist

########## npm run verify ##########
All 23 dist checks passed.
```

No failures, no skips, no flakes.

### Isolated-HOME end-to-end smoke (real built binary)

`HOME=$(mktemp -d) ./backend/bin/twitter-bookmarker-server` — never touched
`~/.twitter-bookmarker` (which does not exist on this machine).

```text
[2] GET /health                -> {"status":"ok"}  (HTTP 200)
[3] startup log
    level=INFO msg="index rebuilt from csv files" reason="missing index.json" indexed_tweets=0
    level=INFO msg="Twitter Bookmarker server started" listening=127.0.0.1:43121 storage=/tmp/twb-smoke-home.*/.twitter-bookmarker indexed_tweets=0
[4] storage dir                -> drwx------  .twitter-bookmarker   (created automatically, 0700)
[5] POST /v1/bookmarks         -> HTTP 201
    {"status":"saved","tweet_id":"123456789","url":"https://x.com/foobar/status/123456789","filename":"linux.csv","saved_at":"2026-09-27T02:04:54Z"}
[6] duplicate POST (ai.csv)    -> HTTP 409 {"status":"duplicate","tweet_id":"123456789"}
[7] traversal POST             -> HTTP 400 {"status":"error","reason":"filename must not contain path separators"}
[8] linux.csv (raw)
    url,author,username,tweet_date,saved_at,text
    https://x.com/foobar/status/123456789,"Foo, Bar 🐧",@foobar,2026-09-27T01:10:42Z,2026-09-27T02:04:54Z,"Line one

    Line two"
[9] python3 strict csv         -> rows: 2; header/6 fields exact; text keeps "\n\n"; ai.csv exists: False
[10] GET /v1/index             -> one entry for 123456789 -> linux.csv
[11] SIGINT                    -> server exit code 0; log "shutdown signal received; draining requests"
[12] rm index.json + restart
[13] restart log               -> msg="index rebuilt from csv files" reason="missing index.json" indexed_tweets=1
[14] rebuilt index             -> same tweet id present again
[15] csv byte count            -> 170 (unchanged by the rebuild)
[16] SIGTERM                   -> server exit code 0
No server left running (port 43121 free)
```

## Automation Limits (report honestly)
- **Not verified automatically, listed as residual manual checks:** loading `extension/dist` unpacked in Chrome, the real `https://x.com/i/bookmarks` interactions (organizer injection, native unbookmark, toast pointer-events, popup drag reorder, SPA route changes, infinite scroll). These are enumerated in `docs/MANUAL-TEST-CHECKLIST.md` (A1–A5, B6, B7, C1–C4, D1–D3, E1) and are deliberately **not** claimed as passing.
- The smoke proves the backend half end to end and proves the extension build/verify pipeline, but it cannot drive a browser.

## User Setup Required
None - no external service configuration required.

## Next Phase Readiness
- TEST-06 is satisfied: the repository ships build tooling, a README with setup + run instructions, and a manual test checklist.
- The full Phase 6 gate is green: `make build`, `make test`, `gofmt -l backend` (empty), `go vet ./...`, `tsc --noEmit`, 147 extension tests, `npm run build`, 23 dist checks, and the isolated-HOME smoke.
- All three Phase 6 plans (06-01, 06-02, 06-03) are complete; the milestone is ready for verify-work and close.

---
*Phase: 06-hardening*
*Completed: 2026-09-27*
