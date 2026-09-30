---
phase: 07-infinite-scroll
verified: 2026-09-27T16:25:00Z
status: passed
score: 5/5 requirements verified
behavior_unverified: 0
verifier: orchestrator (independent re-run)
---

# Phase 7: Infinite Scroll — Verification Report

**Phase Goal:** The collection gallery pages 30 posts at a time via an `IntersectionObserver` sentinel, accumulating pages without duplicates and stopping on `has_more: false`.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run of every gate (including the corrected real type gate), plus direct reading of the paging constants, the sentinel, and the bottom loader. The suite grew to 283 tests across 33 files.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| SCROLL-01 | 30-post pages via `IntersectionObserver` sentinel near the end; no numbered pagination; no primary "Load More" button | ✓ VERIFIED | `POSTS_PAGE_LIMIT = 30` (`use-posts.ts:46`); `SENTINEL_ROOT_MARGIN = "600px 0px"` (`infinite-sentinel.tsx:25`) so it triggers ~600px early; "observes one target with the 600px-before-the-bottom rootMargin"; "stops observing while disabled and resumes when re-enabled" (no observer leak); "does not render a Load More button or numbered pagination" — and a source-wide grep for `Load More`/`Load more` outside tests returns nothing |
| SCROLL-02 | Initial load → masonry skeletons; later pages → small bottom loader; never blank during a fetch | ✓ VERIFIED | "shows masonry skeletons for the first load and no bottom loader"; **"keeps the loaded posts mounted under a bottom loader while page two loads"** — the key anti-blank assertion; "is compact — a single row, never a full-page skeleton". `GalleryBottomLoader` is one `py-6` row with a `size-6` spinner |
| SCROLL-03 | Pages accumulate without duplicates; `tweet_id` dedupe; mid-scroll appends don't repeat rows | ✓ VERIFIED | `lib/pagination.ts`; "appends a disjoint page in order"; "keeps the first-seen instance and position for an overlapping tweet_id"; **"adds nothing when a page is fully overlapping (the mid-scroll drift case)"**; "dedupes duplicates inside a single incoming page"; "accumulates three pages in order and stops when has_more is false"; page-level "renders an overlapping tweet_id once at its first-seen position" |
| SCROLL-04 | Consume the opaque `next_cursor`; stop when `has_more` is false | ✓ VERIFIED | "returns the opaque cursor verbatim when the backend advertises more" and "does not normalise a cursor with URL-hostile characters" (proving it is treated as opaque); "stops when has_more is false, even if a cursor leaked through"; **"does not loop when has_more is true but next_cursor is null"** and "does not loop on an empty-string cursor"; "ignores a non-string cursor from a malformed backend"; **"coalesces repeated sentinel firings into exactly one in-flight page request"** and "never requests the same cursor twice in a row" |
| SCROLL-05 | Refetch on route entry, filter/sort/search change, window focus, manual refresh; no aggressive polling | ✓ VERIFIED | "refetches the first page when the window regains focus"; "resets to page one on a window focus refetch without duplicating posts"; "drops an in-flight page when the query changes mid-flight"; Phase 6's query-change refetch is preserved. **"never polls: no request is issued without an intersection or focus"** plus `grep -rn setInterval web/src` → no matches |

### Additional properties verified

| Property | Result |
|----------|--------|
| Limit clamped to the backend contract | ✓ `MAX_POSTS_PAGE_LIMIT = 100` with `clampPageLimit`; "keeps the first page size within the API maximum"; "clamps nonsense column counts…" & "clampPageLimit(500) → 100", `NaN` → max |
| a11y: sentinel decorative, loader announced | ✓ "marks the sentinel decorative and the loader a live status (a11y)"; "renders an empty aria-hidden marker, never content"; loader has an implicit `aria-live="polite"` `role="status"`, a visually-hidden `Loading more posts…` label, and an `aria-hidden` spinner |
| Layout stability on append | ✓ "does not move the viewport when a page is appended" (no scroll on `loadMore` — the scroll-to-top remains exclusive to query changes per DISC-08); "keeps the exact masonry measures while pages are appended" |

### Gates

| Gate | Result |
|------|--------|
| `cd web && pnpm test` | ✓ **33 files, 283 tests, all passing** (up from 29/235) |
| `cd web && pnpm run typecheck` | ✓ clean — **the corrected, non-vacuous gate (`tsc -b`)** |
| `cd web && pnpm build` | ✓ `✓ built in 514ms` |
| `cd web && pnpm lint` | ✓ clean |
| `grep -rn 43121 web/src` | ✓ no matches |
| `grep -rn setInterval web/src` | ✓ no matches |
| No stray processes | ✓ nothing running |

### Requirement coverage

`SCROLL-01 … SCROLL-05` — 5/5 verified.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| `has_more: true` with a `null`/empty/non-string cursor stops rather than looping | Accepted, and better than the letter of SCROLL-04 — a malformed backend response must not cause an infinite request loop. Explicitly tested |
| Coalescing repeated sentinel firings into one in-flight request | Accepted — an unguarded observer can fire many times during one fetch; SCROLL-04's intent (one request per cursor) is enforced |
| No scroll movement when appending a page | Accepted — appending below the fold must not yank the viewport; DISC-08's scroll-to-top is scoped to query changes only |
| jsdom `IntersectionObserver` stub added to the test setup | Accepted — jsdom has no `IntersectionObserver`; test-only, alongside Phase 6's `ResizeObserver`/`scrollTo` stubs |

## Process Note

This phase ran against `pnpm run typecheck` (`tsc -b`) rather than the previously-vacuous `tsc --noEmit`, so its type verification is real. Phase 6's defect fix is now the standard gate for the remaining phases.

## Residual Risk

The sentinel uses a 600px `rootMargin`, which is a *product* judgement rather than a spec number. It is comfortable for a 4-column masonry of natural-height cards, but Phase 10's browser pass should confirm that a fast scroll to the bottom on a slow disk doesn't outrun the fetch (leaving a momentary gap above the loader). The "existing posts stay mounted" test covers the no-blank requirement; this is about *pace*, not correctness.

## Conclusion

Phase 7 is complete and verified: paging is sentinel-driven at 30 per page with a 600px pre-trigger, no Load More button or numbered pagination, initial skeletons and a compact live-region bottom loader, `tweet_id` dedupe that survives mid-scroll drift, strict opaque-cursor handling with multiple no-loop guards, and focus/query refetch with no polling. Cleared to proceed to Phase 8 (Media Lightbox).
