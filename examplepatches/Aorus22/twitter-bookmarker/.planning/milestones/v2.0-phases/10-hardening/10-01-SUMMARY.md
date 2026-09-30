---
phase: 10-hardening
plan: 01
subsystem: hardening-accessibility-responsive
tags: [go, testing, fault-tolerance, csv-reader, react, vitest, tailwind, wcag, axe-core, aria, focus-management, responsive, agent-browser, acceptance-harness, prd-82]

# Dependency graph
requires:
  - phase: 01-go-persistence-layer
    provides: "the CSV-on-disk contract (url,media,author,username,tweet_date,saved_at,text) and the legacy six-column header this phase keeps readable"
  - phase: 02-gallery-http-api
    provides: "the frozen /api/gallery read API and the reader whose fault tolerance HARD-01 pins"
  - phase: 07-navigation-shell
    provides: "app-shell, the search/filter toolbar and the theme provider that HARD-03/HARD-04 audit"
  - phase: 08-media-lightbox
    provides: "the lightbox dialog (focus trap, arrows, Escape, author-derived alt) that HARD-04 verifies"
  - phase: 09-production-serving
    provides: "the static SPA serving and the seeded acceptance harness that §82 runs against"
provides:
  - "backend/internal/gallery/hardening_test.go — malformed media, mid-file malformed row, legacy header, 5,000-row bound, no-panic corpus"
  - "web/src/index.css + docs/design/phase2-design-spec.md — light --accent darkened to #bf3f2e for WCAG AA"
  - "web/src/app/app-shell.tsx — wordmark hidden below sm with the logo and an accessible brand-link name"
  - "web/src/components/gallery/filter-control.tsx — the desktop filter Popover is named (aria-dialog-name)"
  - "scripts/check-web-acceptance.sh — 768px case, wordmark contract, axe-core on 11 surfaces, keyboard/focus/dialog checks, §82 steps 16–21, live-CSV focus refetch"
  - "scripts/check-gallery-acceptance.sh — the explicit §82 HTTP scenario (steps 1–15, 22–24)"
  - "docs/MANUAL-TEST-CHECKLIST.md — the F1 §82 checklist; README.md — the Phase 2 workflow and gallery URLs"
affects: []

actuals:
  tokens: 0
  tasks: 8
  commits: 8

tech-stack:
  added: ["axe-core 4.13.0 as a web devDependency (harness only; not shipped to users)"]
  patterns:
    - "Inject axe as a classic script over `agent-browser eval --stdin`, not argv: the 580 KB payload exceeds the exec argument limit and fails with 'Argument list too long'. `axe.run` returns a promise and this agent-browser build awaits it, so a single async IIFE reads the violations."
    - "Assert a11y property-by-property in the real browser: the harness runs axe on 11 surfaces (homepage 390/1440 + dark, collection light/dark, the open Popover with an active preset light/dark, the open lightbox light/dark, the mobile Sheet light/dark) and separately walks 24 Tab stops asserting a visible ring on each."
    - "Wait out `transition-all` before sampling focus: shadcn Buttons transition `box-shadow`, so the ring custom property is correct immediately but the composited box-shadow is still interpolating. Sampling after ~250ms makes the check deterministic."
    - "HARD-06 as a real browser behaviour: append a CSV row out-of-band, dispatch a window focus event, and poll for the new card — the freshness claim is proven end-to-end rather than unit-mocked."
    - "Contrast fixed at the token, not the call-site: one --accent change clears every text-accent usage and white-on-accent, and lifts --ring; the design spec records the value with a Phase-10 note."

key-files:
  created:
    - backend/internal/gallery/hardening_test.go
    - web/src/app/app-shell.test.tsx
    - .planning/phases/10-hardening/10-01-PLAN.md
    - .planning/phases/10-hardening/10-01-SUMMARY.md
  modified:
    - web/src/index.css
    - web/src/app/app-shell.tsx
    - web/src/components/gallery/filter-control.tsx
    - web/src/pages/collection-page.test.tsx
    - web/src/pages/gallery-page.test.tsx
    - web/package.json
    - web/pnpm-lock.yaml
    - scripts/check-gallery-acceptance.sh
    - scripts/check-web-acceptance.sh
    - docs/MANUAL-TEST-CHECKLIST.md
    - docs/design/phase2-design-spec.md
    - README.md

key-decisions:
  - "Fix contrast on the --accent token itself (#f26a5b -> #bf3f2e) instead of adding a one-off text colour: one change clears the active nav link, every small `text-accent` (eyebrow, date-range error, Show-more toggle), white text on an accent fill, and the focus ring. The design spec §2.1 is updated in the same commit."
  - "Name the desktop filter Popover from FILTER_TITLE rather than linking the panel's visible <h2>: the panel is shared with the mobile Sheet (whose Radix Dialog already owns the name via SheetTitle), so the surface owner names its own dialog and the panel stays presentational."
  - "Hide the wordmark below `sm` and keep the logo, per the phase brief; do not shrink the font. The link keeps `aria-label=\"Twitter Bookmarker\"`, so the accessible name survives at every width."
  - "Assert a visible focus ring via the composited box-shadow/outline, but wait for the Button transition to settle; checking the raw `--tw-ring-shadow` custom property was rejected as brittle."
  - "Keep HARD-01 in a new `package gallery_test` file rather than extending the existing in-package tests: the four required behaviours belong together as a fault-tolerance suite, and the exported API is enough to express all of them."
  - "The §82 HTTP section reuses the seeded fixture instead of reseeding: the scenario is about the sequence being executable, and the existing §80 checks already pin the raw numbers."
  - "make verify already composes verify-http + verify-trace + verify-web, so every new gate (including the §82 section, the axe run and the focus-refetch check) is reachable through it with no Makefile change."

patterns-established:
  - "An accessibility regression is now a harness failure, not a review comment: `check-web-acceptance.sh` fails on any serious/critical axe violation on any audited surface."
  - "A performance claim about the reader (a 5,000-row CSV) is pinned with a wall-clock bound in the Go suite."
  - "PRD integration scenarios are executable: the §82 steps are split by layer (HTTP vs browser) and the manual checklist mirrors the same numbering."

requirements-completed: [HARD-01, HARD-02, HARD-03, HARD-04, HARD-05, HARD-06]

coverage:
  HARD-01:
    - "TestHardeningMalformedMediaRowDoesNotTakeDownTheCollection"
    - "TestHardeningMalformedRowInTheMiddleIsSkipped"
    - "TestHardeningLegacyHeaderStillReads"
    - "TestHardeningLargeCSVSummaryAndPagedQueryComplete"
    - "TestHardeningReaderNeverPanics"
  HARD-02:
    - "collection-page.test.tsx — transport failure then Retry recovers (second request issued)"
    - "gallery-page.test.tsx — 500 falls back to the load copy, Retry recovers"
  HARD-03:
    - "check-web-acceptance.sh — 390/768/1440 columns, Sheet vs Popover, wordmark hidden/visible/untruncated"
    - "app-shell.test.tsx — wordmark class contract + accessible name"
  HARD-04:
    - "check-web-acceptance.sh — axe on 11 surfaces, 24-Tab-stop ring walk, alt, focus trap, arrows, Escape"
    - "web/src/index.css + filter-control.tsx — the two violations found were fixed"
  HARD-05:
    - "check-gallery-acceptance.sh §82 (steps 1–15, 22–24) and check-web-acceptance.sh §82 (16–21)"
    - "docs/MANUAL-TEST-CHECKLIST.md §4 F1"
  HARD-06:
    - "check-web-acceptance.sh — append to design.csv, dispatch focus, assert the new card"
---

# Phase 10: Hardening, Accessibility & Responsive — Summary

**Outcome:** all six requirements (HARD-01…HARD-06) ship green. The work is tests,
harness wiring, two real defects fixed, and documentation; no product feature was
added. `.planning/ROADMAP.md`, `STATE.md`, `REQUIREMENTS.md`, `PROJECT.md`,
`state.json` and `PRD-2.md` were not touched, and no `10-VERIFICATION.md` was
created.

## Gates (exact output)

| # | Gate | Result |
| --- | --- | --- |
| 1 | `make lint` | exit 0 — `gofmt` clean, `go vet ./...` clean, extension `tsc --noEmit` clean, web `tsc -b` clean |
| 2 | `make test` | exit 0 — Go `./... -race`: **6 packages ok** (128 top-level test funcs, incl. 5 new); extension **157/157**; web **40 files / 375 tests** |
| 3 | `make build` | exit 0 — backend binary + extension `dist/` + web `dist/` (`index-B7grOBqm.js`, 473.88 kB) |
| 4 | `bash scripts/check-gallery-acceptance.sh` | **68 passed, 0 failed, 0 skipped** (was 52; +16 §82 checks) |
| 5 | `bash scripts/check-web-acceptance.sh` | **89 passed, 0 failed** (was ~50; +axe/keyboard/§82/HARD-06) |
| 6 | `bash scripts/check-requirement-traceability.sh` | all checks PASS — 82 requirements, 82 rows, phase 10 claims exactly its 6 |

`make verify` = `verify-http` + `verify-trace` + `verify-web`, i.e. gates 4, 6 and 5
in order; no Makefile change was needed to cover the new checks.

## What each requirement got

### HARD-01 — backend hardening tests
`backend/internal/gallery/hardening_test.go` (`package gallery_test`, 5 tests):
- a malformed `media` cell still returns the post (degrades to a text card) and the
  collection survives;
- a malformed row mid-file is skipped while the rows before and after read;
- the legacy six-column header still reads;
- a generated **5,000-row** CSV answers `Collections()` (head/tail counts) and a
  paginated `Posts()` query (second page head) inside a 10 s bound — it runs in
  well under 1 s;
- a hostile corpus (empty, header-only, binary, NUL, unterminated quote, duplicate
  columns, no header, ragged rows, 1 MiB field, BOM, CRLF, `javascript:` URL,
  negative date) never panics (`recover()` guard on every call).

### HARD-02 — error + Retry UX
Extended, not duplicated: `collection-page.test.tsx` now rejects the first request
and proves Retry issues a second one that recovers; `gallery-page.test.tsx` proves a
500 shows the load copy and Retry recovers. The connection copy (`Could not connect
to Twitter Bookmarker backend`) was already covered by an existing test.

### HARD-03 — responsive + wordmark
The harness asserts 1/2/4 columns at 390/768/1440, Sheet at 390 vs Popover at 1440,
and the fixed wordmark: `display:none` at 390 with no `Tw…` anywhere, visible and
`scrollWidth <= clientWidth` at 1440, logo present at both, `aria-label` preserved.

### HARD-04 — accessibility
- `axe-core 4.13.0` added as a web devDependency.
- `check-web-acceptance.sh` injects it and asserts **zero serious/critical
  violations on 11 surfaces** (all green).
- A 24-Tab-stop walk asserts every stop paints a visible ring and that search,
  filter, sort, media tiles and Open-on-X are all reachable.
- Media tiles carry an author-derived `aria-label`; the lightbox image carries an
  author-derived `alt`; the dialog moves focus in, traps Tab, navigates with arrows,
  closes on Escape and restores focus to the originating tile.
- **Two real violations were found and fixed** (below).

### HARD-05 — PRD §82 executable
- `check-gallery-acceptance.sh`: explicit `§82` section, steps 1–15 and 22–24
  (backend healthy, the three seeded CSVs, the homepage list, Linux's 8 posts with
  the 4-media and text-only tweets, search `wayland`, the Last-7-Days window,
  combined ranges, Newest Posted, the next-page cursor, and an extension-style save
  that appears on the next read with no restart).
- `check-web-acceptance.sh`: steps 16–21 labelled and asserted (image → lightbox →
  ArrowRight → ArrowLeft → canonical Open-on-X href matching the clicked card).
- `docs/MANUAL-TEST-CHECKLIST.md`: new §4 **F1** with the 24 steps, expected results,
  the keyboard and responsive sub-checks, and an F1 sign-off line.

### HARD-06 — live CSV + window-focus refetch
The browser harness appends a real row to `design.csv` while the server runs, proves
it is **not** shown before a refetch trigger, dispatches a `window` `focus` event,
and polls until the new card appears — with no backend restart. The hooks already
listened for `focus`, so this was a proof (not a fix).

## Bugs found and fixed

1. **Active nav link failed `color-contrast` (serious).** Light `--accent` `#f26a5b`
   as text on `#fffdfc` is **2.96:1** (needs 4.5:1). Root cause: the token was chosen
   for its fill appearance, not for text/white-on-fill. Fixed at the token:
   `--accent: #bf3f2e` → **5.22** on `--surface`, **4.64** on `--bg`, **4.97** on
   `--surface-warm`, and **5.22** for `#fffdfc` on accent. Design spec §2.1 updated.
2. **Open desktop Filter Popover had no accessible name (`aria-dialog-name`,
   serious).** Radix `Popover.Content` is `role="dialog"`; the panel's visible `<h2>`
   was never linked. Root cause: the Popover surface owner never named its dialog,
   while the Sheet did (via `SheetTitle`). Fixed in `filter-control.tsx` with
   `aria-label={FILTER_TITLE}`.
3. **The 390px wordmark rendered `Tw…`.** Root cause: a `truncate` span inside a flex
   row narrower than the word. Fixed by hiding it below `sm` (logo stays,
   `aria-label` keeps the accessible name).

Harness-only defects fixed while wiring the new checks (not product bugs): the
`trap_ok` comparison type, and sampling a Button's focus ring before its
`transition-all` had settled.

## Deviations from Plan

- The plan said "audit four surfaces in both themes"; the shipped harness audits
  **11 surfaces** (four surfaces × themes, plus the 390px homepage and the open
  Popover with an active preset). The open Popover was added because it is where
  defect #2 lived and the first axe pass on the *closed* page could not see it.
- The plan listed the `--accent` change in `web/src/index.css` only; the design spec
  §2.1 table was updated too, so the documented token matches the shipped one.
- The plan's "focus-visibility" check was implemented as a 24-stop Tab walk plus a
  per-stop ring assertion, which also covers keyboard reachability in one pass.
- `app-shell.test.tsx` stubs `window.matchMedia` locally (in `beforeEach`) rather
  than in the global setup, to keep `use-media-query.test.tsx`'s no-`matchMedia`
  fallback assertion meaningful.
- The §82 browser step 21 ("the original tweet opens") is asserted as the canonical
  `x.com/<user>/status/<id>` href plus `target`/`rel`, matching the card that was
  clicked. The actual tab opening needs the public internet and remains a documented
  manual step (checklist F1 step 21).

## Issues Encountered

- **`agent-browser eval "$(cat axe.min.js)"` fails with exit 126** ("Argument list
  too long") — the 580 KB payload exceeds the exec limit. Resolved with
  `eval --stdin`, which has no such limit.
- **`agent-browser` does await promises in this build** — verified with an async
  probe before relying on it, contrary to the earlier assumption; the async IIFE form
  is used directly and no polling fallback was needed.
- **Port 43121 is owned by the operator's `make run`.** It was never stopped or
  started: both acceptance scripts re-exec themselves under `unshare -rn` when the
  port is busy, and that behaviour is preserved.
- **`axe-core` colour-contrast cannot evaluate gradient backgrounds**, so the active
  quick-range pill (`bg-grad-brand text-accent`) is outside the automated check. It
  remains a design-intended combination; measured coral-on-gradient is low
  (≈1.25–2.54:1) and is recorded here as a known, deliberate residual rather than
  silently "clean".

## Not verified / limitations

- A real screen-reader pass (VoiceOver/NVDA) was not run; the harness proves names,
  roles, focus order and axe rules, not spoken output.
- The PRD §82 step 21 external navigation (x.com in a new tab) is not automated.
- The 1440px homepage and the mobile Sheet audits use the seeded `batch.csv`; a
  collection with >1 page of images was also exercised (the lightbox counter read
  `1 / 121`), but a collection with thousands of rows was not audited in-browser
  (the reader bound is covered by HARD-01 in Go).

## Files Created/Modified

Created: `backend/internal/gallery/hardening_test.go`,
`web/src/app/app-shell.test.tsx`, this plan and summary.
Modified: `web/src/index.css`, `web/src/app/app-shell.tsx`,
`web/src/components/gallery/filter-control.tsx`,
`web/src/pages/collection-page.test.tsx`, `web/src/pages/gallery-page.test.tsx`,
`web/package.json`, `web/pnpm-lock.yaml`, `scripts/check-gallery-acceptance.sh`,
`scripts/check-web-acceptance.sh`, `docs/MANUAL-TEST-CHECKLIST.md`,
`docs/design/phase2-design-spec.md`, `README.md`.

## Task Commits

| Commit | Scope |
| --- | --- |
| `4c654c3` | `test(gallery)`: HARD-01 hardening tests |
| `0e713de` | `fix(web)`: contrast + popover name + wordmark (HARD-03/04) |
| `fbbb407` | `test(web)`: Retry recovery + wordmark contract (HARD-02/03) |
| `b0eb4db` | `test(web)`: axe-core devDependency (HARD-04) |
| `7d5ab65` | `test(scripts)`: §82 HTTP scenario (HARD-05) |
| `d1ba601` | `docs(10)`: plan |
| `5042c0b` | `docs(10)`: README Phase 2 workflow + §82 checklist (HARD-05) |
| `8fb2d1f` | `test(scripts)`: browser a11y/responsive/live-CSV harness (HARD-03/04/06) |

## User Setup Required

`cd web && pnpm install` on a fresh clone (axe-core is a devDependency used only by
the acceptance harness). `make build` before `make verify`, because the browser
harness serves the SPA from `web/dist` and does not build it.

## Next Phase Readiness

- Milestone v2.0 is feature-complete and every gate is green; the remaining
  orchestrator-owned artifact is `10-VERIFICATION.md`.
- The a11y gate is now permanent: any future serious/critical axe violation on the
  audited surfaces fails `make verify`.
- Fragility to keep in mind: the browser harness depends on the seeded fixture server
  and the media stub; it re-execs under `unshare -rn` when port 43121 is busy, so it
  can always run beside the operator's dev server.
