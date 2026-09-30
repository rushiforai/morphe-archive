---
phase: 05-collection-gallery
verified: 2026-09-27T15:50:00Z
status: passed
score: 11/11 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 5: Collection Gallery — Verification Report

**Phase Goal:** The collection route renders a Pinterest-style masonry of tweet cards — multi-media, text-only, lazy-loaded, with `Show more`, `Open on X`, and the empty/no-match states — under a header and search/filter/sort toolbar.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run of the committed gate (now 154 tests), plus the build/typecheck/lint gates, plus direct reading of the implementation and byte-comparison of every PRD-prescribed string. Post-card and masonry measurements were re-validated against Figma frames `6:121` / `6:236` / `6:594` before the phase was accepted.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| COLL-01 | Header: back link, name, `posts · media` counts, search/filter/sort toolbar | ✓ VERIFIED | `collection-toolbar.tsx` + `collection-toolbar.test.tsx`; header reuses `formatCollectionMeta`/`formatCount`. The mockup's description line is omitted per spec §7. **Toolbar is present but its behaviour is Phase 6's scope** — see the seam note below |
| COLL-02 | Masonry: 1 col small, 2–3 medium, 4–5 desktop; natural heights | ✓ VERIFIED | `lib/masonry.ts` + 4 tests: "returns 1 column on small viewports", "returns 2–3 columns on medium viewports", "returns 4–5 columns on desktop viewports", "gives 4 columns at the 1440px frame's 1312px content column"; column counts are clamped into range. Heights are content-driven, not equalised |
| COLL-03 | Unit is the tweet, not the image | ✓ VERIFIED | "renders the tweet as exactly one card per post, media count and all" |
| COLL-04 | Multi-media shows **all** media, adaptive 1 / 2 split / 3 as 2/1 / 4+ grid | ✓ VERIFIED | `lib/post-media.ts` + `post-media-grid.tsx`; **"renders every media beyond four — 5 and 6 are never truncated"** is the key anti-regression test. Phase 4's cover cap of four must not leak into post cards — it does not |
| COLL-05 | Text-only posts render as compact text cards, no artificial image placeholder | ✓ VERIFIED | `post-card.tsx:41` `isTextOnly = post.media.length === 0`, branching to the quote panel and rendering no media grid (`:83`); test asserts expanding quote text inside the panel |
| COLL-06 | Every card shows author, username, text, tweet date, bookmark date, `Open on X` | ✓ VERIFIED | "shows author, username, text, both dates and Open on X (COLL-06)" |
| COLL-07 | `Open on X` → stored `url`, `target="_blank"`, `rel="noopener noreferrer"` | ✓ VERIFIED | "links Open on X to the stored url in a new tab (COLL-07, PRD-2 §24)" asserts all three |
| COLL-08 | Controlled clamp with `Show more`, not aggressive truncation | ✓ VERIFIED | `lib/post-text.ts`; "clamps long text and expands it in place with Show more (COLL-08)" and "shows no Show more for a short tweet" (so the affordance is not unconditional) |
| COLL-09 | Native lazy loading, direct `pbs.twimg.com` URL (no proxy/download/cache) | ✓ VERIFIED | `media-image.tsx:58-59` `loading={loading}` + `decoding="async"`; "loads every tile lazily from the stored pbs.twimg.com URL". No rewriting path exists — `post-media-grid.tsx:21-22` documents the URL is used verbatim |
| COLL-10 | Postless → "This collection is empty"; zero filter results → "No posts match your filters" + `Clear filters` | ✓ VERIFIED | Both strings in `messages.ts` and compared byte-for-byte against PRD-2 lines 1710/1716/1722. Held as **two distinct states**: "renders the filter-no-match copy with a Clear filters action" and its negative twin "does not render the filter-no-match copy or a Clear filters action" for the postless case |
| COLL-11 | Broken remote media → neutral placeholder, metadata and `Open on X` intact, card not collapsed | ✓ VERIFIED | "still shows the full metadata row and Open on X" under a broken-media scenario; reuses Phase 4's same-box `MediaImage` |

### Gates

| Gate | Result |
|------|--------|
| `cd web && pnpm test` | ✓ **21 files, 154 tests, all passing** (up from 8/50 in Phase 4) |
| `cd web && pnpm exec tsc --noEmit` | ⚠️ VACUOUS — see note below. The real type gate was `pnpm build` (`tsc -b`), which passed |
| `cd web && pnpm lint` | ✓ clean |
| `cd web && pnpm build` | ✓ `✓ built in 638ms` |
| `grep -rn 43121 web/src` | ✓ no matches |
| No stray processes | ✓ nothing running |

> **Correction (added during Phase 6 verification).** `web/tsconfig.json` is solution-style (`"files": []` plus `references`), so `tsc --noEmit` resolved **zero** source files — `tsc --noEmit --listFiles` reported 0 `src/` files, while `tsc -b --listFiles` reports 101. This row was therefore meaningless. It does not change this phase's conclusion: `pnpm build` runs `tsc -b && vite build` and was run and passed here, and `tsc -b` is a genuine typecheck. The `typecheck` script was corrected to `tsc -b` in commit `c68977e`.

### Requirement coverage

`COLL-01 … COLL-11` — 11/11 verified.

## Design Fidelity

Masonry and post-card numbers were validated node-for-node against Figma before acceptance: 4 columns of `292`-wide cards at x = 64/388/712/1036 → **32px** horizontal gap; vertical rhythm 448→970 (500-tall card) and 448→1035 (565-tall card) → **22px** vertical gap; card `r18` with padding `10`; media region `272` wide `r14` with adaptive heights (mockup 130/185/260); quote panel `272×210` `r14`; header back link @11 at `(64,112)`, icon `96×96 r24`, title Playfair Bold 38 at x=184, meta @11 at y=236; toolbar controls `440×40`/`86×40`/`150×40` all `r12` at y=292.

Deliberate omissions (design spec §7, re-confirmed against Figma and now **pinned by tests** so they cannot silently reappear): the media-type pills at y=350 and topic pills at y=394, and the header description line at y=198. The mockup's pills have no backend equivalent — the API exposes no media-type or topic dimension.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| Toolbar renders and holds local/controlled state but does not yet alter the query | Accepted — COLL-01 requires the toolbar's *presence*; Phase 6 (DISC-*) owns its *behaviour*. The seam is real, not decorative: the toolbar already accepts filter/clear callbacks and "invokes the filter callback and marks the active state" / "invokes the clear-filters callback (Phase 6 resets the query)" are already tested, so Phase 6 supplies handlers rather than restructuring the component |
| Posts hook fetches the first page only | Accepted — Phase 7 (SCROLL-*) owns cursor pagination; the hook is shaped so paging is an addition, not a rewrite |
| `collection-sort.ts` exists ahead of Phase 6 | Accepted — sorting is defined and unit-tested now; Phase 6 wires it to the URL/query |

## Process Note

The test count grew 50 → 154 while the production bundle grew only ~12 kB gzip, so test infrastructure is not leaking into the shipped artifact. Note for Phase 9/10: vitest reports jsdom created 21 times (~40s of the 8.3s wall time is environment setup) — if the suite grows much further, consider `pool: 'vmThreads'`. Not a correctness issue.

## Conclusion

Phase 5 is complete and verified: the collection route renders a responsive masonry of tweet-unit cards with all media displayed adaptively, text-only and broken-media degradation, a controlled clamp with `Show more`, a correct `Open on X` link, and two distinct empty states with exact PRD copy — backed by 154 passing committed tests. Cleared to proceed to Phase 6 (Discovery Tools).
