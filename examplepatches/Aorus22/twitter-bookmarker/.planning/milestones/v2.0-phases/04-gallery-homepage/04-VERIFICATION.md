---
phase: 04-gallery-homepage
verified: 2026-09-27T15:35:00Z
status: passed
score: 9/9 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 4: Gallery Homepage — Verification Report

**Phase Goal:** The homepage renders every CSV as a collection card with a cover collage, counts, and last-bookmarked date, with empty/no-media/broken-image handling plus skeletons and retry.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run. The orchestrator re-ran the committed test suite, the build, the typecheck, and the linter itself, read the implementation and the exact user-facing copy, and re-validated the layout numbers against Figma. Because this is the first UI phase, the phase was also required to **commit a test runner** — so unlike Phase 3, every behavioural claim here is reproducibly checkable from the repo.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| HOME-01 | Every CSV shown as a card, ordered by most recently saved | ✓ VERIFIED | `collection-order.ts` + test "returns the backend order untouched when every collection has a timestamp" and "moves timestamp-less collections after collections with data (PRD-2 §38)"; rendering test asserts one card per collection |
| HOME-02 | Card shows cover collage, name, post count, media count, last bookmarked date | ✓ VERIFIED | `collection-card.test.tsx` "renders the name, filename, counts and last-saved date (PRD-2 §16)"; the spec's `Last saved …` meta string is produced by `collection-meta.ts` (tested separately, incl. year handling and null timestamps) |
| HOME-03 | Cover = ≤4 newest media `saved_at` DESC; balanced layouts for 4+/3/1; placeholder for 0; never an avatar | ✓ VERIFIED | `cover.ts` + 11 tests: 0 → placeholder, 1 → single full tile, 2 → two full-width, 3 → 2 top + 1 wide bottom, 4 → 2×2, 4+ → capped at four, "keeps the first four entries in backend (saved_at DESC) order", no mutation, non-finite → placeholder. No avatar path exists in the cover code |
| HOME-04 | `media_count === 0` collection still visible with placeholder cover | ✓ VERIFIED | "still renders a card for an empty collection" + "uses the gradient placeholder when there is no media (PRD-2 §17: 0)" |
| HOME-05 | Clicking a card navigates to the collection route | ✓ VERIFIED | "links the whole card to /collections/:filename" and "URL-encodes the filename in the href" — a real router link, so it is keyboard reachable |
| HOME-06 | Empty state "No collections yet" + secondary message | ✓ VERIFIED | `messages.ts` holds the strings verbatim; compared byte-for-byte against PRD-2 lines 1692/1698 (`No collections yet` / `Saved tweets will appear here after you organize them with the extension.`); rendering test asserts the copy |
| HOME-07 | Skeleton cards while loading; failure shows backend-unavailable message + `Retry` | ✓ VERIFIED | "renders skeleton cards while the request is in flight (PRD-2 §35)"; "shows the PRD-2 §61 connection copy on a transport failure and retries"; "falls back to the gallery API copy when the failure is not a transport error". Exact copy `Could not connect to Twitter Bookmarker backend` matches PRD-2 §61; `Retry` label from `messages.ts` |
| HOME-08 | Broken remote cover images degrade to a neutral placeholder without collapsing the layout | ✓ VERIFIED | `media-image.tsx` + "swaps a broken image for a same-box placeholder (PRD-2 §62)", "renders the placeholder immediately for an empty source", "keeps an accessible name when an alt is supplied"; page-level "keeps the card in place when a cover image fails to load" |
| HOME-09 | Homepage refetches when the window regains focus | ✓ VERIFIED | `use-collections.ts:108` adds a `window` `focus` listener (removed on cleanup); "refetches collections when the window regains focus (HOME-09)" dispatches a real `focus` event |

### Gates

| Gate | Result |
|------|--------|
| `cd web && pnpm test` | ✓ **8 files, 50 tests, all passing** (vitest 5.0.2, jsdom) |
| `cd web && pnpm exec tsc --noEmit` | ⚠️ VACUOUS — see note below. The real type gate was `pnpm build` (`tsc -b`), which passed |
| `cd web && pnpm lint` | ✓ exit 0 |
| `cd web && pnpm build` | ✓ `✓ built in 470ms` |
| `grep -rn 43121 web/src` | ✓ no matches |
| No stray processes | ✓ `pgrep -af 'vite\|pnpm dev'` → nothing |

> **Correction (added during Phase 6 verification).** `web/tsconfig.json` is solution-style (`"files": []` plus `references`), so `tsc --noEmit` resolved **zero** source files — `tsc --noEmit --listFiles` reported 0 `src/` files, while `tsc -b --listFiles` reports 101. This row was therefore meaningless. It does not change this phase's conclusion: `pnpm build` runs `tsc -b && vite build` and was run and passed here, and `tsc -b` is a genuine typecheck. The `typecheck` script was corrected to `tsc -b` in commit `c68977e`.

### Requirement coverage

`HOME-01 … HOME-09` — 9/9 verified, all with committed reproducible tests.

## Design Fidelity

The orchestrator re-validated the design spec against Figma (`6:16`, "01 · Gallery / Editorial Desktop") and confirmed every homepage number before accepting this phase: card `244×330 r20`; collage tiles `120×88 r14` at x=0/125, y=0/93 (⇒ 5px gaps, region `245×181`); name at `(18,198)` Playfair Bold 22; meta at `(18,288)` Inter Medium 11; card pitch x = 64/326/588/850/1112 (⇒ 18px gap); content column `1312`; section header at y=466/480; footer at y=938. The grid fits **5 columns** at 1440px.

Two Figma elements were deliberately **not** implemented, both pre-recorded in design spec §7 and re-confirmed here:

- the per-card **description** line (`(18,231)`, e.g. "Commands, tools, and open source.") — CSV has no description column, so rendering it would mean inventing data;
- the `•••` overflow control at `(206,288)` — PRD defines no card action, so it would be dead UI.

A test explicitly asserts the overflow control's absence, so the deviation cannot silently regress.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| Client computes a defensive ordering pass (timestamp-less collections last) even though the backend already orders `last_saved_at DESC` | Accepted — harmless defence-in-depth, and it is what makes HOME-01 verifiable at the component level |
| Vitest + jsdom + Testing Library added as devDependencies | Accepted and required by the orchestrator — this is what converts Phases 4–8 from "unverifiable UI claims" into a reproducible gate. No runtime dependency was added |

## Process Note

Phase 3's behavioural evidence was a throwaway jsdom harness that could not be re-run. This phase fixed that root cause: `web/` now has a committed runner (`vitest`), a setup file, and 50 real tests, so `pnpm test` is a gate the orchestrator (and the milestone audit) can re-run at any time. All subsequent UI phases inherit it, and Phase 10 should extend it rather than start over.

## Conclusion

Phase 4 is complete and verified: the homepage renders every collection with an adaptive cover collage, exact PRD copy for the empty and error states, skeletons, a working retry, safe broken-image degradation, and focus-refetch — all backed by 50 passing committed tests. Cleared to proceed to Phase 5 (Collection Gallery).
