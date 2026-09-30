---
phase: 10-hardening
verified: 2026-09-27T17:10:00Z
status: passed
score: 6/6 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 10: Hardening, Accessibility & Responsive — Verification Report

**Phase Goal:** the gallery survives hostile CSV input and hostile volume, fails in a way the user can
recover from without restarting anything, holds up at 390 / 768 / 1440 with a real accessibility floor,
and has the PRD §81/§82 acceptance surface expressed as executable checks instead of prose.

**Verified:** 2026-09-28
**Status:** passed
**Method:** independent orchestrator re-run of every gate, plus purpose-built probes the subagent did
not write and could not have anticipated — a real HTTP load of a 5,000-row collection against the built
binary, a real-browser HARD-02 run that **actually kills the server process**, an independent axe-core
harness (loaded over HTTP, not the subagent's `--stdin` path), the frozen v1.0 `/v1/*` contract probe,
and a filesystem-integrity check on the operator's real vault. No subagent claim was accepted without
reproduction.

---

## Goal Achievement

### Gates

Every gate below was re-run by the orchestrator on the committed tree (`300c5d2`), not quoted from the
subagent's summary.

| # | Gate | Result |
|---|------|--------|
| 1 | `make lint` | **exit 0** — gofmt clean, `go vet ./...` clean, extension `tsc`, web `tsc -b` |
| 2 | `make test` | **exit 0** — Go `./... -race` **6 packages ok**; extension **157/157**; web **40 files / 375 tests** |
| 3 | `make build` | **exit 0** — backend binary + extension `dist/` + web `dist/` |
| 4 | `scripts/check-gallery-acceptance.sh` | **68 passed, 0 failed, 0 skipped** |
| 5 | `scripts/check-web-acceptance.sh` | **89 passed, 0 failed** |
| 6 | `scripts/check-requirement-traceability.sh` | **82 requirements / 82 rows**, all PASS |

`make verify` already composes `verify-http` + `verify-trace` + `verify-web`, so every new gate is
reachable from one target with no Makefile change.

### Additional properties verified independently

These are checks I designed and ran myself, beyond re-running the six gates:

- **HARD-01 at the integration layer, not just the unit layer.** The 5,000-row CSV was driven through
  the **real HTTP API** against the built binary: collection listing answered in **27 ms** with
  `post_count: 5000` / `media_count: 1666` (⌊5000/3⌋, correct), and full cursor pagination returned
  **50 pages × 100 = 5000 items in 1.96 s**, terminated cleanly, and left the server healthy. This
  closes a real gap — the Go test proves the *reader* survives 5,000 rows, but nothing proved the
  *HTTP layer* pages it exactly once without looping on a repeated cursor.
- **HARD-02 with a genuinely dead backend.** The unit tests mock `fetch`, so I killed the actual server
  process: error state appears on refetch (**6/6 passed**) with `role="alert"`, the **exact** PRD §61
  copy `Could not connect to Twitter Bookmarker backend`, a `Retry` control, and — after restarting the
  server — **Retry genuinely recovers** the gallery.
- **HARD-03 breakpoint curve**, measured, not asserted: 1 / 2 / 3 / 4 columns at 390 / 600 / 768 / 900 /
  1100 / 1440 with masonry widths 292 / 616 / 940 / 1264 px, matching `n·292 + (n−1)·32`. Every step
  **grew** without a reload, confirming the Phase 9 masonry deadlock fix still holds.
- **HARD-03 wordmark** at 390 / 640 / 768 / 1440: hidden below `sm`, visible above, accessible name
  `Twitter Bookmarker` preserved at **every** width, and no `Tw…` anywhere.
- **HARD-04 contrast, computed by hand.** `#bf3f2e` on `--surface` / `--bg` / `--surface-warm` =
  **5.22 / 4.64 / 4.97**, and cream-on-accent / white-on-accent = **5.22 / 5.30**; dark theme accent
  6.05–8.10. The old `#f26a5b` measured 2.96 / 2.64 / 2.82 — genuinely failing, not borderline.
- **HARD-04 axe across 8 surface×theme combinations** with my own harness (homepage, collection, open
  lightbox, mobile filter Sheet × light/dark): **zero serious/critical**, against a pre-work baseline of
  1 serious `color-contrast` on the homepage.
- **HARD-06 focus refetch:** appending a row to a live CSV took the collection **8 → 9 cards** after a
  focus event, with a `window` marker surviving to prove **no reload**, and the same process still
  serving — no restart.
- **Frozen v1.0 `/v1/*` contracts: 13/13** — `/health`, 201/409/400 on `POST /v1/bookmarks` with the
  documented body shape, `GET /v1/index` → `{"items":…}`, and the row landing in the CSV.
- **Operator vault integrity:** the real data dir `/home/aorus/Personal/twitter-bookmarker` was **not
  written** during this phase. The only files touched since 21:30 were two git
  `commit-graphs/*` entries from the operator's own maintenance; no CSV was modified.
- **HARD-01 test quality:** the large-CSV test was read line by line to confirm it is not a smoke test —
  5,000 generated rows, `PostCount`/`MediaCount`/`LastSavedAt`/cover-limit assertions, and a 10 s bound
  it clears in 0.09 s.

### Requirement coverage

| Requirement | Evidence | Status |
|---|---|---|
| HARD-01 hostile/large CSV | 5 Go tests green; 5,000 rows over real HTTP, 50 pages, 1.96 s | verified |
| HARD-02 graceful failure + Retry | unit tests **plus** real-browser run with the process killed, 6/6 | verified |
| HARD-03 responsive + wordmark | 1/2/4 cols at 390/768/1440; wordmark fixed; no `Tw…` | verified |
| HARD-04 accessibility floor | axe zero serious/critical on 11 harness surfaces; contrast computed by hand | verified |
| HARD-05 §82 executable | 68-check HTTP scenario incl. steps 1–15, 22–24; F1 checklist; browser steps 16–21 | verified |
| HARD-06 live CSV without restart | 8→9 cards on focus, no reload, same process | verified |

---

## Deviation Log

Deviations **accepted as improvements**, each documented in `10-01-SUMMARY.md`:

1. **11 audited surfaces instead of 4.** The plan said four surfaces × themes; the harness audits eleven,
   adding the 390px homepage and the **open Popover with an active preset**. This deviation is what
   caught defect #2 below — the closed-page pass could not see it. Justified.
2. **Design spec updated alongside the token.** The plan listed only `web/src/index.css`; the spec §2.1
   table was corrected too, so the documented token cannot silently drift from the shipped one. This is
   the right way to deviate from a mockup.
3. **Focus-visibility as a 24-stop Tab walk** rather than a single-element check, which also proves
   keyboard reachability in the same pass.
4. **PRD §82 step 21 is not automated** — opening x.com needs the public internet. It is asserted as the
   canonical `x.com/<user>/status/<id>` href plus `target`/`rel` matching the clicked card, and recorded
   as manual checklist step F1-21. Honestly scoped rather than faked.

---

## Verification Findings

### Bugs the gates caught and fixed

1. **Active nav `color-contrast` (serious).** `--accent` `#f26a5b` measured **2.96:1** as text on
   `#fffdfc`. Found by my independent axe baseline before the subagent's harness existed. Root cause:
   the token was chosen for its fill appearance, not for text or white-on-fill use. Fixed at the token
   (`#bf3f2e`) rather than patched at one call site, so every `text-accent` consumer and the CTA fills
   were lifted together.
2. **`aria-dialog-name` (serious) on the open desktop Popover.** Radix `Popover.Content` is
   `role="dialog"`, but its visible `<h2>` was never linked. **My baseline missed this** because I
   audited the mobile Sheet at 390px and never the Popover at 1440px — the subagent's wider surface list
   caught it. I confirmed the fix independently: the Popover now carries
   `aria-label="Filter your archive"` and reports **0** `aria-dialog-name` violations.
3. **390px wordmark rendered `Tw…`** — a `truncate` span in a flex row narrower than the word. Now
   hidden below `sm` with the logo and an `aria-label` retained, so the brand link keeps its accessible
   name while the visual text is hidden.

### New finding from this verification (open, moderate — does not fail the gate)

**Two moderate landmark violations appear only while the desktop filter Popover is open:**
`landmark-no-duplicate-banner` and `landmark-unique`, both anchored to the page header.

Root cause, confirmed from the DOM: with the Popover open the page contains **three** `<header>`
landmarks — `HEADER.mx-auto` and `HEADER.mt-4` at page level, plus `HEADER.flex` **inside** the
`role="dialog"` Popover. With the Popover closed the page reports **zero** violations.

This does not fail HARD-04, whose bar is zero serious/critical — these are moderate. It is recorded here
rather than reported as clean, and it is outside the subagent's harness because `axe_check` filters to
serious/critical only. Suggested fix: render the Popover panel's `<header>` as a `<div>`, since a
heading does not need a banner landmark inside a dialog. Note the same reasoning is why the harness's
serious/critical-only filter is a reasonable gate but not a complete a11y audit.

---

## Residual Risk

- **Gradient contrast is outside axe.** The active quick-range pill (`bg-grad-brand text-accent`) sits on
  a gradient axe cannot evaluate; measured coral-on-gradient is ≈1.25–2.54:1. It is a deliberate design
  combination, recorded as a residual rather than silently passing. A human design decision is the right
  remedy, not a token change.
- **No real screen-reader pass.** The harness proves names, roles, order, focus trap and axe rules — not
  spoken output. Stated plainly in the summary.
- **Large collections were not audited in-browser.** A >1-page collection was exercised (lightbox counter
  `1 / 121`), but not thousands of rows in the DOM; that bound is covered by HARD-01 in Go and by my
  HTTP pagination probe.
- **Two moderate landmark violations** above, open.
- Browsers were driven headless; no manual visual pass was performed.

### Corrections to earlier orchestrator assumptions

Recorded because they were wrong and were corrected by evidence, not argument:

- **`agent-browser eval` does await promises** in this build. I had assumed it did not and designed
  around it; the subagent probed the behaviour before relying on it and used the async form directly.
- **The operator's dev server must be tracked by port + storage dir, not PID.** Its PID changed when it
  was restarted, and keying on the old PID produced a false "it was killed" alarm.

---

## Conclusion

All six HARD requirements are verified against executable evidence, and every gate the phase claims is
reproducible on the committed tree. `behavior_unverified: 0` — nothing in HARD-01…06 rests on an
unverified assertion. The two moderate landmark violations and the gradient-contrast residual are
recorded as open, non-blocking findings rather than swept up.

Phase 10 is complete; this closes milestone v2.0's final phase.
