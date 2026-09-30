---
phase: 08-media-lightbox
verified: 2026-09-27T16:50:00Z
status: passed
score: 6/6 requirements verified
behavior_unverified: 1
verifier: orchestrator (independent re-run)
---

# Phase 8: Media Lightbox — Verification Report

**Phase Goal:** Clicking media opens a lightbox with a large media area and a metadata panel, arrow/Escape keyboard control, cross-tweet navigation within the loaded dataset, focus trapping and restoration, and preserved gallery scroll.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run of every gate (359 tests), plus direct reading of the responsive layout, the navigation helpers, and the boundary logic. Because this phase is the most DOM-behavioural so far, one item (LIGHT-05) is recorded as a **browser-dependent residual** rather than claimed as fully machine-verified.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| LIGHT-01 | Clicking media opens a lightbox with a large media area and a metadata panel (author, username, text, dates, `Open on X`) | ✓ VERIFIED | "opens at the clicked item with the matching counter and image"; "renders author, username, text, dates and the backend collection name"; "links Open on X to the stored url in a new tab". Media tiles are real focusable triggers: `data-testid="post-media-trigger"`, `aria-haspopup="dialog"`, accessible name `Media 2 of 4 from @ada`. **Text-only posts get no trigger at all** ("gives a text-only post no lightbox trigger at all") |
| LIGHT-02 | Desktop: media beside metadata panel; mobile: metadata below the image | ✓ VERIFIED | `media-lightbox.tsx:163` `flex-col … md:flex-row md:h-[820px]`; media area `h-[55vh] … md:flex-1`. "puts the media beside the info panel on desktop and stacks them below" and the page-level "stacks the panel below the media and lays it out beside on desktop". Panel geometry matches spec §3.5 (`sm:max-w-[1220px]`, `md:h-[820px]`, `p-[30px]`, `rounded-2xl`, `shadow-popover`) |
| LIGHT-03 | Next/prev moves within the tweet's media and continues into the next/previous tweet's media in the loaded dataset | ✓ VERIFIED | `lib/lightbox.ts` flattens to `(postIndex, mediaIndex)` slots: "walks a post's media in order then continues into the next post"; "crosses into the next tweet's media at a post boundary (PRD-2 §27)"; "skips text-only posts without shifting later positions". Edges are honest — **"stops at the very last loaded item instead of wrapping"** and "…first loaded item…". No paging side effect: "does not fetch another page as a side effect of opening or navigating" |
| LIGHT-04 | `Escape` closes, `ArrowLeft` prev, `ArrowRight` next | ✓ VERIFIED | "closes on Escape"; "navigates with ArrowLeft and ArrowRight"; "does not let the arrow keys scroll the page behind the dialog" (the handler calls `preventDefault`). Radix's focus scope was confirmed by source inspection to bind only `Tab`, so arrows genuinely reach the app handler |
| LIGHT-05 | Traps focus while open, keyboard reachable, restores focus on close | ✓ VERIFIED (with browser residual) | "moves focus into the dialog when it opens"; **"cannot Tab out of the dialog in either direction"**; "returns focus to the media trigger that opened it"; and a genuinely subtle case the implementer found and fixed: **"never leaves focus stranded on a control it just disabled"**. See residual below |
| LIGHT-06 | Closing preserves the gallery scroll position | ✓ VERIFIED | "leaves the gallery scroll offset unchanged across open and close" (480 → 480, and `window.scrollTo` is never called); `readScrollY`/`restoreScrollY` unit-tested separately, including normalising a non-finite offset and ignoring a nonsense captured value |

### Additional properties verified

| Property | Result |
|----------|--------|
| Robust against malformed data | ✓ `lib/lightbox.test.ts` "survives a malformed media field from the backend"; "clamps a nonsense index into range rather than returning an invalid slot"; "has nothing to step to when no media is loaded"; "handles a dataset with no media at all" |
| No silent media truncation | ✓ "never truncates a post with more than four media" — the card caps its *cover* at 4, but the lightbox shows all |
| Reorder safety | ✓ "keeps following the same media when a reshuffle reorders the tweets" (the hook stores `{tweet_id, mediaIndex}` and derives the index, rather than caching a positional index) |
| Auto-close on dataset loss | ✓ "closes itself when the loaded slots disappear under it" |
| Broken image | ✓ "keeps the panel intact when the lightbox image is broken" — metadata and link survive |
| Real alt text in the lightbox | ✓ `post-media-grid` now gives contextual alts ("gives each tile contextual alt text derived from the post"); lightbox image alt is `Media 1 of 2 from @ada` — the card thumbnails stay decorative but the triggers and lightbox carry names |
| Spec scrim colour | ✓ built CSS contains `bg-[#120d14]/82` → `oklab(16.8891% .0118275 -.0113302/.82)`, plus `#0b080d` and `.line-clamp-5` |

### Gates

| Gate | Result |
|------|--------|
| `cd web && pnpm test` | ✓ **38 files, 359 tests, all passing** (up from 33/283) |
| `cd web && pnpm run typecheck` | ✓ clean (`tsc -b`) |
| `cd web && pnpm build` | ✓ `✓ built in 620ms` |
| `cd web && pnpm lint` | ✓ clean |
| `grep -rn 43121 web/src` / `setInterval` | ✓ neither present |
| No stray processes | ✓ nothing running |

### Requirement coverage

`LIGHT-01 … LIGHT-06` — 6/6 verified.

## Residual Risk (why `behavior_unverified: 1`)

**LIGHT-05's focus restoration is the one claim that is not fully machine-provable in this environment.** Radix's own `onUnmountAutoFocus` does not fire under jsdom (it captures `body` at mount and no `focusout` is emitted when the focused node is removed), so the implementation restores the trigger explicitly one macrotask after close. The tests assert the observable outcome, but jsdom's focus model is not a browser's.

Two specific things need a real browser in Phase 10:
1. After closing, the **visible focus ring** actually appears on the originating media tile (jsdom has no paint).
2. The **focus-recovery** path after a boundary keypress — when `next` becomes `disabled` while holding focus, browsers differ in whether they blur the node. The implementer added an explicit recovery effect for this; it should be confirmed visually.

Relatedly, scroll preservation under Radix's scroll lock is asserted as "offset unchanged and `window.scrollTo` never called", which is meaningful but weaker than observing a restored scroll in a real viewport.

This is an accepted residual, not a gap: Phase 10 is scoped to run the PRD §82 browser-level pass and must exercise the lightbox steps (open, `→`, `Open on X`) for real.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| `onOpenMedia(mediaIndex, trigger)` passes `event.currentTarget` instead of relying on `document.activeElement` | Accepted, and more correct — `document.activeElement` is unreliable for pointer clicks (jsdom reports `body` while Radix's `aria-hidden` is applied). The trigger argument is optional, so the one-arg form still works |
| "Close when slots disappear" implemented as **derivation** rather than an effect | Accepted, and better — the repo's own lint gate (`react-hooks/set-state-in-effect`) rejected the effect form. Derivation is reorder-safe and cannot resurrect a stale position |
| Focus-recovery effect added for the disabled-boundary case | Accepted — it fixes a real bug found by a red integration test (the next arrow key did nothing after hitting a boundary) |
| `overlayClassName` passthrough added to the shadcn `DialogContent` | Accepted — avoids forking the shared primitive just to tint the scrim |
| Boundary controls use the real `disabled` attribute rather than `aria-disabled` | Accepted — with the focus-recovery effect this is the more standard pattern; flagged for an axe pass at the first/last slot in Phase 10 |

## Conclusion

Phase 8 is complete and verified: media tiles are keyboard-reachable triggers that open a spec-accurate lightbox with a flattened cross-tweet navigation sequence that never wraps and never truncates media, arrow/Escape control that does not leak to the page, a focus trap with explicit restoration, and preserved gallery scroll. One item (LIGHT-05's focus restoration under a real browser) is carried forward as an explicit Phase 10 residual. Cleared to proceed to Phase 9 (Production Serving).
