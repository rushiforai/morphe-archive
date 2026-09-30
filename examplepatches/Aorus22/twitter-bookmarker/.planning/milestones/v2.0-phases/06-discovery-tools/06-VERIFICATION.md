---
phase: 06-discovery-tools
verified: 2026-09-27T16:05:00Z
status: passed
score: 8/8 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 6: Discovery Tools — Verification Report

**Phase Goal:** Server-side debounced search, a date-filter panel (popover/sheet) with quick ranges over both date fields, four sort modes, all reflected in the URL and resetting pagination.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run of every gate, plus two independent probes of the highest-risk logic (`date-bounds` emission values and DST arithmetic) and a direct check that the Go backend accepts the exact strings the frontend emits. Two real defects were found and one was fixed; details below.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| DISC-01 | Server-side, case-insensitive over text/author/username, ~300 ms debounce, no submit button | ✓ VERIFIED | Backend confirmed by reading `backend/internal/gallery/query.go:123-128`: `strings.Contains(strings.ToLower(...))` over **Author, Username, Text** — the UI matches it rather than reimplementing it. Debounce proven by "echoes every keystroke immediately but writes the URL once after ~300ms" and page-level "debounces the typed search into a single q= request (DISC-01)". Search field is `type="search"` with no submit control |
| DISC-02 | `Filter` → Popover desktop / Sheet narrow, with Tweet from-to, Bookmarked from-to, quick ranges, `Reset`, `Apply` | ✓ VERIFIED | `FilterPanel` rendered in a Popover ≥ md and a Sheet < md; "opens a Popover on desktop and not a Sheet" and "opens a Sheet below the md breakpoint and not a Popover" assert the correct surface per width. "clears both ranges on Reset without committing" — closing without `Apply` discards the draft |
| DISC-03 | Presets `Today`/`Last 7 Days`/`Last 30 Days`/`This Year` target **Bookmarked** by default, both ranges stay editable | ✓ VERIFIED | "holds exactly the four PRD-2 §31 presets with the spec's short labels"; "resolves each preset to inclusive local dates ending today"; "toggles an already-active preset off without touching the Tweet range"; "stays manually overridable: editing a field clears the active preset" |
| DISC-04 | Tweet-date and bookmarked-date filters active simultaneously, results satisfy **both** | ✓ VERIFIED | "sends both ranges at once (AND) with inclusive RFC3339 UTC bounds". Backend is independently confirmed to apply the filters sequentially (`query.go:131-141`), so the conjunction is enforced server-side |
| DISC-05 | Local dates → RFC3339 UTC boundaries; ranges inclusive | ✓ VERIFIED — with independent probes | See "Independent date-arithmetic probes" below |
| DISC-06 | All four sort modes selectable, `saved_desc` default | ✓ VERIFIED | Reuses Phase 5's `SORT_OPTIONS`/`DEFAULT_SORT`; "falls back to the default for an unknown or empty sort" |
| DISC-07 | Search/filter/sort in the URL; refresh/back/forward/bookmark preserve; **no permanent cursors** | ✓ VERIFIED | "round-trips state → URL → state"; "restores the previous query on Back"; "restores the previous sort on Back and refetches"; "keeps the raw search text and never exposes a cursor"; **"never writes a cursor"**; "treats a URL with no params as the default view" |
| DISC-08 | Query change clears pages, resets cursor, scrolls near top, fetches first page | ✓ VERIFIED | "skips the scroll reset on mount and scrolls to the top on a query change" (so the scroll is deliberate, not a mount artefact); **"ignores a stale response that resolves after a newer one"** covers the out-of-order race |

### Independent date-arithmetic probes (DISC-05)

The orchestrator did not accept the date logic on the strength of its own test names. Two independent probes were run against the **real module**, then deleted:

1. **Emission values.** With the machine's actual zone (WIB, UTC+7), the probe asserted literal strings:
   - `toUtcFrom("2026-09-27") === "2026-09-26T17:00:00.000Z"` — local midnight correctly lands on the *previous* UTC day.
   - `toUtcTo("2026-09-27") === "2026-09-27T16:59:59.999Z"` — the last millisecond of the local day.
   - A single-day range spans exactly `24h − 1ms`, i.e. inclusive.
   All 6 probe assertions passed.
2. **DST behaviour.** The DST cases were re-derived independently and matched the implementation: America/New_York 2026-03-08 (spring forward) → `05:00:00.000Z` with a **23h − 1ms** span; 2026-11-01 (fall back) → `04:00:00.000Z` with a **25h − 1ms** span. The implementation's own tests assert the same literal instants plus a zone with a *nonexistent* local midnight (America/Santiago).

**Cross-boundary integration check.** The frontend emits fractional seconds (`.000Z` / `.999Z`) and the backend parses with `time.Parse(time.RFC3339, …)` — and **no backend test covered a fractional-second input**. Rather than assume Go's behaviour, the orchestrator compiled and ran a standalone Go probe: Go accepts `.000Z`/`.999Z` under the `time.RFC3339` layout and preserves the milliseconds. The frontend's exact output is therefore ingestible end-to-end.

The implementation is also structurally careful: it never uses `new Date("YYYY-MM-DD")` (which parses as UTC midnight and would shift the day in negative-offset zones), validates impossible dates so `2026-02-31` cannot silently become March 3, and omits an inverted range rather than sending a request guaranteed to return nothing.

### Gates

| Gate | Result |
|------|--------|
| `cd web && pnpm test` | ✓ **29 files, 235 tests, all passing** (up from 21/154) |
| `cd web && pnpm build` (`tsc -b && vite build`) | ✓ clean — **this was always the real type gate** |
| `cd web && pnpm run typecheck` | ✓ clean **after the fix below** (previously vacuous) |
| `cd web && pnpm lint` | ✓ clean |
| `grep -rn 43121 web/src` | ✓ no matches |
| No stray processes | ✓ nothing running |

### Requirement coverage

`DISC-01 … DISC-08` — 8/8 verified.

## Defect Found and Fixed by the Orchestrator

**`pnpm typecheck` was a no-op.** `web/tsconfig.json` is solution-style (`"files": []` plus `references`), so `tsc --noEmit` resolved **zero** files. The orchestrator confirmed this directly: `tsc --noEmit --listFiles` reported **0** `src/` files, while `tsc -b --listFiles` reports **101**.

Impact assessment: no phase was actually under-verified on types, because `pnpm build` runs `tsc -b && vite build` and **every phase's build gate was run and passed** — `tsc -b` is a real typecheck (it caught a genuine error during this very phase). What was wrong was the *reported evidence*: the "`tsc --noEmit` clean" line in the Phase 3–5 verification reports was vacuous. Those reports' conclusions stand on their build gates; the redundant check was simply meaningless.

Fix applied and committed as `c68977e` (`web/package.json`: `"typecheck": "tsc -b"`). Verified non-vacuous by mutation: introducing two deliberate type errors made `pnpm run typecheck` fail with `TS2322` (exit 2), and removing them restored a clean run. The corrected count is 101 source files.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| URL stores **local** `YYYY-MM-DD`; RFC3339 UTC derived only at request time | Accepted, and the better design — the URL stays human-readable and bookmarkable, and timezone conversion happens once at the boundary |
| Inverted range (`from` > `to`) preserved in the URL, emits **no** bounds, flagged with `role="alert"`, `filterActive` false | Accepted — avoids sending a request guaranteed to return an empty set for an obviously erroneous input, while still showing the user their text |
| Native `<input type="date">` pair instead of a calendar component | Accepted — no new dependency, correct local-date semantics directly, and accessible by default |
| `This Year` = Jan 1 → today | Accepted — matches PRD §31's intent |
| Two Phase 5 "the seam is inert" page tests were **replaced** | Accepted — they asserted the *absence* of Phase 6 behaviour and would fail by design once the seam was filled. Replaced with request-level search/sort tests, with a header comment pointing at the successor file |
| jsdom stubs added to the test setup (`scrollTo`, `ResizeObserver`, pointer capture) | Accepted — jsdom lacks all three and Radix constructs `ResizeObserver` unguarded; test-only |

## Residual Risks Carried Forward

1. **Quick-preset active pill contrast.** The active pill uses coral `text-accent` on `bg-grad-brand` per design spec §3.4, kept verbatim rather than silently restyled. This is a likely WCAG contrast violation and **must be measured with axe in Phase 10** (HARD-*), then either fixed or explicitly documented as a deliberate deviation.
2. **Debounce cancellation uses a previous/next URL string comparison** (`pendingSelfWriteRef`/`lastUrlRef`). This is subtle logic; "drops a pending debounce when history moves externally" covers the main hazard, but Phase 10's integration pass should exercise rapid typing + Back together.
3. `use-gallery-query.test.tsx` compares against the same helper it tests, so it does **not** catch an end-of-day boundary mutation — the independent literal-UTC expectations in `date-bounds.test.ts` are what catch it (confirmed by this phase's mutation check: 7 failures across 3 files).

## Conclusion

Phase 6 is complete and verified. Search is genuinely server-side and debounced, the filter panel is correct per breakpoint with honest draft/commit semantics, both date ranges combine as an AND, the local→UTC conversion is provably inclusive and DST-correct (independently probed, and proven ingestible by the Go backend), all four sort modes work, and URL state round-trips with cursors deliberately excluded. A real defect in the repo's typecheck script was found and fixed along the way. Cleared to proceed to Phase 7 (Infinite Scroll).
