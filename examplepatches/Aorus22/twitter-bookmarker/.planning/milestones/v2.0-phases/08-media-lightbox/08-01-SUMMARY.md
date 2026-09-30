---
phase: 08-media-lightbox
plan: 01
subsystem: web-frontend
tags: [lightbox, radix-dialog, focus-trap, focus-restoration, scroll-preservation, keyboard-navigation, flattened-media-sequence, cross-tweet-navigation, aria-haspopup-dialog, roving-boundaries, react19, vitest, jsdom, testing-library]

# Dependency graph
requires:
  - phase: 07-infinite-scroll
    provides: "usePosts(filename, requestParams).posts — the accumulated, deduped loaded list — plus nextCursor/hasMore/isLoadingMore/loadMore and the mocked-fetch/jsdom runner"
  - phase: 06-discovery-tools
    provides: "usePosts query-keyed state ({posts,status,collection,...}) and useGalleryQuery().queryKey/requestParams, whose reset rule the lightbox leans on to close itself"
  - phase: 05-collection-gallery
    provides: "CollectionPage content-state region, GalleryMasonry, PostCard, PostMediaGrid (adaptive 1-4+ layouts, MediaImage broken-image placeholder), ClampedPostText, formatPostMeta, describeAlt"
  - phase: 03-web-scaffold
    provides: "shadcn/Radix ui/dialog primitive (DialogContent/DialogTitle/DialogDescription) and the relative-URL fetch client with no hardcoded host"
provides:
  - "web/src/lib/lightbox.ts: MediaSlot { postIndex, mediaIndex } + flattenMediaSlots / findSlotIndex / slotAt / stepSlotIndex (clamped, never wraps, -1 when empty) / isFirstSlot / isLastSlot"
  - "web/src/lib/scroll.ts: readScrollY() and restoreScrollY(offset) — guarded, and a no-op when the offset is already correct — alongside the Phase 6 scrollNearTop"
  - "web/src/hooks/use-media-lightbox.ts: useMediaLightbox(posts) -> { index: number|null, total, open(postIndex, mediaIndex, trigger?), close, goPrev, goNext }, storing the selected media's identity (tweet_id + mediaIndex) and deriving the flattened position, with deferred focus restoration + scroll restore on close"
  - "web/src/components/gallery/media-lightbox.tsx: MediaLightbox({ posts, index, collectionName, onPrev, onNext, onClose, now? }) — controlled Radix dialog, media area, counter, prev/next"
  - "web/src/components/gallery/lightbox-info-panel.tsx: LightboxInfoPanel({ post, collectionName, onClose, now? }) — close, author, @username, clamped text, three meta lines, Open on X"
  - "web/src/components/gallery/post-media-grid.tsx: optional onOpenMedia(mediaIndex, trigger) turns every tile into a named <button aria-haspopup=\"dialog\"> trigger with a decorative inner image; without it the Phase 5 static grid is byte-identical"
  - "web/src/lib/post-text.ts: PostTextVariant ('body' | 'quote' | 'lightbox') + LIGHTBOX_TEXT_CLAMP_CLASS (line-clamp-5); web/src/lib/post-meta.ts: formatLightboxMeta(post, collectionName, { now }) -> { posted, saved, collection }"
  - "web/src/lib/messages.ts: LIGHTBOX_PREVIOUS_LABEL / LIGHTBOX_NEXT_LABEL / LIGHTBOX_CLOSE_LABEL / LIGHTBOX_TITLE_PREFIX / LIGHTBOX_KEYBOARD_HINT / POSTED_META_LABEL / SAVED_META_LABEL / COLLECTION_META_LABEL / formatLightboxCounter(current, total)"
  - "web/src/components/ui/dialog.tsx: DialogContent gained an `overlayClassName` passthrough (scrim tint without duplicating the primitive)"
affects: [phase-9, phase-10]

actuals:
  tokens: 0
  tasks: 6
  commits: 3

tech-stack:
  added: []
  patterns:
    - "One flattened sequence as the navigation model: posts[i].media[j] -> slot k, so prev/next walk the rest of a tweet and then continue into the next loaded tweet with no per-post bookkeeping; text-only posts contribute zero slots and therefore cannot shift a later position"
    - "Selection by identity, position by derivation: the hook stores {tweet_id, mediaIndex} and derives the flattened index from the current list, so a query change closes the lightbox by construction (the identity stops resolving), a later page can never resurrect a stale position, and a reshuffle keeps the same media"
    - "Boundary honesty in one pure place: stepSlotIndex clamps (never wraps) and returns -1 for an empty sequence, so the disabled control and the navigation target can never disagree"
    - "Presentational dialog, controller hook: MediaLightbox derives slot/counter/boundaries from posts+index with the same pure helpers the hook uses; the caller owns the index"
    - "Trigger element passed explicitly, not read from document.activeElement: onOpenMedia(mediaIndex, event.currentTarget) survives browsers that do not focus a button on click and the jsdom case where Radix's aria-hidden sibling hiding makes activeElement report body"
    - "Deferred restore after the modal tears down: close() clears the index and, on the next macrotask, focuses the stored trigger with preventScroll and calls restoreScrollY — one macrotask after Radix releases its body scroll lock"
    - "Focus never stranded on a control it just disabled: an effect re-homes focus to an enabled control when the active media changes and the active element is body/a disabled button, because a browser blurs a disabled control and Radix's focus trap ignores a blur with a null relatedTarget"
    - "Decorative card thumbnail, real dialog alt: inside a trigger the tile image is alt=\"\" so the accessible name lives only on the button; the lightbox image keeps an author-derived alt because it is the dialog's primary content"
    - "Counter for both audiences: visible text `2 / 4` with role=\"status\" and aria-label=\"Media 2 of 4\""

key-files:
  created:
    - web/src/lib/lightbox.ts
    - web/src/lib/lightbox.test.ts
    - web/src/lib/scroll.test.ts
    - web/src/hooks/use-media-lightbox.ts
    - web/src/hooks/use-media-lightbox.test.tsx
    - web/src/components/gallery/lightbox-info-panel.tsx
    - web/src/components/gallery/media-lightbox.tsx
    - web/src/components/gallery/media-lightbox.test.tsx
    - web/src/pages/collection-page-lightbox.test.tsx
  modified:
    - web/src/lib/scroll.ts
    - web/src/lib/post-text.ts
    - web/src/lib/post-meta.ts
    - web/src/lib/messages.ts
    - web/src/lib/index.ts
    - web/src/hooks/index.ts
    - web/src/components/ui/dialog.tsx
    - web/src/components/gallery/clamped-post-text.tsx
    - web/src/components/gallery/post-media-grid.tsx
    - web/src/components/gallery/post-media-grid.test.tsx
    - web/src/components/gallery/post-card.tsx
    - web/src/components/gallery/index.ts
    - web/src/pages/collection-page.tsx

key-decisions:
  - "The lightbox navigates a flattened (postIndex, mediaIndex) sequence, not a per-post cursor: PRD-2 §27's 'walk the tweet, then the next tweet' is exactly one clamped increment over flattenMediaSlots(usePosts(...).posts)"
  - "Tiles only become buttons when onOpenMedia is provided: the real page always passes it, while the standalone/static grid keeps its alt-bearing images — so all 283 pre-Phase-8 tests and the Phase 5 alt contract survive untouched"
  - "The hook stores the selection as identity (tweet_id + mediaIndex) and derives the index: this is what closes a stale lightbox on a query change without a setState-in-effect (the react-hooks lint rule rejects the effect version) and what keeps the lightbox on the same image across a reorder"
  - "The trigger element is handed to open() (onOpenMedia's second argument) rather than read from document.activeElement: a pointer click does not focus a button in every browser, and jsdom reports body while Radix's aria-hidden sibling hiding is applied — the explicit element makes restoration deterministic and testable"
  - "Radix owns Escape and the focus trap; the arrow keys are handled on the dialog content with preventDefault (Radix binds only Tab, so arrows always reach the handler) and are never a global listener"
  - "The counter is role=\"status\" with aria-label='Media n of total' so assistive tech hears the total while the visual stays `n / total`"
  - "The scrim is set through a new overlayClassName passthrough on the shadcn DialogContent rather than forking the primitive"
  - "lightbox text clamping reuses ClampedPostText with a new `lightbox` variant (line-clamp-5, 13px/1.4 ink) instead of a second clamp implementation"
  - "No host, port or timer was introduced: no /posts fetch is issued by opening or navigating (proved by a request-count assertion), and nothing polls"

patterns-established:
  - "Phase 9 seam: nothing in this phase touches serving, hosts or processes — the lightbox renders inside the existing SPA route and the fetch client is untouched"
  - "Phase 10 seam (testids/names to reuse verbatim): open trigger data-testid=\"post-media-trigger\" (+ data-media-index, aria-haspopup=\"dialog\", name `Media 2 of 4 from @ada` / `Media from @ada`); dialog data-testid=\"media-lightbox\" (role=dialog, name `Post media by <author> (@<username>)`, described by the arrow/Escape hint); counter data-testid=\"lightbox-counter\" (text `2 / 4`); prev data-testid=\"lightbox-prev\" (name `Previous media`); next data-testid=\"lightbox-next\" (name `Next media`); close data-testid=\"lightbox-close\" (name `Close lightbox`); image data-testid=\"media-image\" (real src + author-derived alt); meta data-testid=\"lightbox-posted\" / \"lightbox-saved\" / \"lightbox-collection\"; link data-testid=\"lightbox-open-on-x\"; panel data-testid=\"lightbox-info\"; media area data-testid=\"lightbox-media-area\""
  - "Phase 10 seam (hardening targets): the disabled-at-boundary controls stay focusable-by-recovery rather than aria-disabled, the scrim is a raw `#120d14`-at-82% arbitrary value that must stay verified in the built CSS, and axe should re-run against the open dialog plus the boundary state"

requirements-completed: [LIGHT-01, LIGHT-02, LIGHT-03, LIGHT-04, LIGHT-05, LIGHT-06]

coverage:
  - id: LIGHT-01
    description: "Clicking any media opens the lightbox at that exact item: contained large image, `n / total` counter matching the clicked (postIndex, mediaIndex), and a metadata panel with author, @username, clamped text + Show more, both dates, the backend DisplayName and a real `Open on X ↗` anchor (PRD-2 §26/§67)"
    verification:
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — opening the lightbox at the clicked media (LIGHT-01) > opens at the clicked item with the matching counter and image"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — opening the lightbox at the clicked media (LIGHT-01) > gives a text-only post no lightbox trigger at all"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — metadata panel (LIGHT-01/LIGHT-02) > renders author, username, text, dates and the backend collection name"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — metadata panel (LIGHT-01/LIGHT-02) > links Open on X to the stored url in a new tab"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — metadata panel (LIGHT-01/LIGHT-02) > clamps long panel text with a working Show more"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-media-grid.test.tsx#PostMediaGrid — lightbox triggers (LIGHT-01) > renders each tile as a named button, not a bare image"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-media-grid.test.tsx#PostMediaGrid — lightbox triggers (LIGHT-01) > moves the name onto the trigger and makes the inner image decorative"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-media-grid.test.tsx#PostMediaGrid — lightbox triggers (LIGHT-01) > stays a static, non-interactive grid when no handler is provided"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/media-lightbox.test.tsx#MediaLightbox — clamp and broken media (LIGHT-01) > keeps the panel intact when the lightbox image is broken"
        status: pass
    human_judgment: false
  - id: LIGHT-02
    description: "Design-spec shell: 1220×820 r24 surface panel with shadow-popover, 800×760 r20 near-black contained media area, 330×760 r20 surface-warm info panel at inset 30, full-viewport #120d14-at-82% scrim; flex-col below md with the info panel stacked under a ~55vh media area (design spec §3.5)"
    verification:
      - kind: unit
        ref: "web/src/components/gallery/media-lightbox.test.tsx#MediaLightbox — responsive structure and scrim (LIGHT-02) > puts the media beside the info panel on desktop and stacks them below"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/media-lightbox.test.tsx#MediaLightbox — responsive structure and scrim (LIGHT-02) > tints the scrim with the spec colour"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — responsive lightbox structure (LIGHT-02) > stacks the panel below the media and lays it out beside on desktop"
        status: pass
      - kind: build
        ref: "pnpm build then grep dist/assets/index-*.css for 120d14 -> .bg-\\[\\#120d14\\]\\/82{background-color:oklab(16.8891% .0118275 -.0113302/.82)}"
        status: pass
    human_judgment: false
  - id: LIGHT-03
    description: "Prev/next walk the flattened media sequence of the accumulated loaded posts: all media of the current tweet, then the neighbouring tweet's media; text-only posts contribute no slot; the first/last loaded slots are honest clamps (disabled, no wrap) and navigation never fetches another page (PRD-2 §27)"
    verification:
      - kind: unit
        ref: "web/src/lib/lightbox.test.ts#stepSlotIndex — boundaries are clamps, not wraps (LIGHT-03) > crosses into the next tweet's media at a post boundary (PRD-2 §27)"
        status: pass
      - kind: unit
        ref: "web/src/lib/lightbox.test.ts#flattenMediaSlots — the flattened sequence (LIGHT-03) > skips text-only posts without shifting later positions"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-media-lightbox.test.tsx#useMediaLightbox — flattening and opening (LIGHT-03) > continues a tweet's media in the next loaded tweet after the last one"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-media-lightbox.test.tsx#useMediaLightbox — boundaries (LIGHT-03) > does not wrap past the last loaded item"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — navigation across tweets (LIGHT-03) > walks the current tweet then continues into the next tweet's media"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — navigation across tweets (LIGHT-03) > disables next at the last loaded item and keeps it a no-op"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — navigation across tweets (LIGHT-03) > does not fetch another page as a side effect of opening or navigating"
        status: pass
    human_judgment: false
  - id: LIGHT-04
    description: "Keyboard control: Escape closes, ArrowLeft goes previous, ArrowRight goes next, handled on the dialog content (never a global listener) and not swallowed by the Radix primitive (PRD-2 §27/§67)"
    verification:
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — keyboard control (LIGHT-04) > navigates with ArrowLeft and ArrowRight"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — keyboard control (LIGHT-04) > closes on Escape"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — keyboard control (LIGHT-04) > closes from the panel's × control"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/media-lightbox.test.tsx#MediaLightbox — keyboard (LIGHT-04) > does not let the arrow keys scroll the page behind the dialog"
        status: pass
      - kind: unit
        ref: "web/src/components/gallery/post-media-grid.test.tsx#PostMediaGrid — lightbox triggers (LIGHT-01) > opens from the keyboard with Enter and Space"
        status: pass
      - kind: source
        ref: "node_modules/@radix-ui/react-focus-scope/dist/index.mjs — binds only Tab (getTabbableEdges/preventDefault); no arrow key is intercepted, so ArrowLeft/ArrowRight reach the dialog handler"
        status: pass
    human_judgment: false
  - id: LIGHT-05
    description: "Focus is trapped inside the dialog while open (Tab/Shift+Tab cycle among its controls), moves into it on open, is never stranded on a boundary-disabled control, and returns to the media trigger that opened it on close (PRD-2 §67)"
    verification:
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — focus management (LIGHT-05) > moves focus into the dialog when it opens"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — focus management (LIGHT-05) > cannot Tab out of the dialog in either direction"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — focus management (LIGHT-05) > never leaves focus stranded on a control it just disabled"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — focus management (LIGHT-05) > returns focus to the media trigger that opened it"
        status: pass
    human_judgment: true
    human_judgment_note: "The trap/return mechanics are asserted in jsdom; the real-browser feel (visible ring after a boundary keypress, restoration when the browser does not focus a clicked button) still merits a human pass."
  - id: LIGHT-06
    description: "Closing preserves the gallery scroll offset: the offset captured on open is restored after Radix releases its body scroll lock, so the gallery never jumps to the top (PRD-2 §77)"
    verification:
      - kind: unit
        ref: "web/src/lib/scroll.test.ts#restoreScrollY (LIGHT-06) > writes the captured offset back when the page drifted"
        status: pass
      - kind: unit
        ref: "web/src/lib/scroll.test.ts#restoreScrollY (LIGHT-06) > is a no-op when the offset is already correct"
        status: pass
      - kind: unit
        ref: "web/src/hooks/use-media-lightbox.test.tsx#useMediaLightbox — lifecycle (LIGHT-03/LIGHT-06) > captures the gallery offset on open and restores it after close"
        status: pass
      - kind: integration
        ref: "web/src/pages/collection-page-lightbox.test.tsx#CollectionPage — scroll preservation (LIGHT-06) > leaves the gallery scroll offset unchanged across open and close"
        status: pass
    human_judgment: false

# Metrics
duration: 95min
completed: 2026-09-27
status: complete
commits:
  - e69ec8a docs(08): add Phase 8 media lightbox plan
  - d6a8cef feat(08): add media lightbox with cross-tweet navigation and focus/scroll restoration
---

# Phase 8: Media Lightbox Summary

**Media in the collection gallery is now openable — by mouse and by keyboard — into a controlled Radix
dialog that shows the image contained and large beside (or, below `md`, under) a metadata panel, steps
through one flattened `(post, media)` sequence that walks the rest of a tweet and then continues into
the next loaded tweet, clamps honestly at the loaded edges without ever fetching a page, answers
`Escape`/`←`/`→`, traps focus while open, returns focus to the exact tile that opened it, and leaves the
gallery scroll offset where it was.**

## Performance

- **Duration:** ~1 h 35 min (plan → pure helpers → controller hook → presentational components → page wiring → tests → gates)
- **Completed:** 2026-09-27
- **Tasks:** 6
- **Files:** 22 in the implementation commit (9 created, 13 modified)
- **Tests:** 38 files / 359 tests, up from 33 / 283 (**+5 files / +76 tests**)
- **Machine:** `TZ` unset → resolved `Asia/Jakarta` (UTC+7); `date` = Sun Sep 27 2026 WIB

## Accomplishments

- **Open at the clicked item (LIGHT-01).** Every tile in `PostMediaGrid` becomes a real
  `<button type="button" data-media-index aria-haspopup="dialog">` whose accessible name is the same
  author-derived string the alt used to carry (`Media 2 of 4 from @ada`), with the inner image made
  decorative. `open(postIndex, mediaIndex, trigger)` resolves that pair to its flattened position and
  no-ops when it does not exist, so a text-only post simply has nothing to click. The panel shows
  author, `@username`, the post text clamped to five lines with a working `Show more`, `Posted <date>` /
  `Saved <date>` / `Collection <DisplayName>` — never the filename — and an `Open on X ↗` anchor with
  `target="_blank" rel="noopener noreferrer"`.
- **The design-spec shell (LIGHT-02).** `1220×820` r24 `surface` + `shadow-popover` at 30px inset,
  an `800×760` r20 near-black contained media area, a `330×760` r20 `surface-warm` panel at 22px
  padding, and a full-viewport `#120d14`-at-82% scrim — verified in the **built CSS**, not just in the
  class attribute. Below `md` the panel is `flex-col`: ~55vh contained media with the info stacked
  under it.
- **One flattened sequence (LIGHT-03).** `flattenMediaSlots` turns `posts[i].media[j]` into slot `k`;
  `stepSlotIndex` clamps and never wraps. So `←`/`→` walk the rest of the current tweet and then enter
  the neighbouring tweet's media, text-only posts contribute zero slots (and cannot shift a later
  position), the first/last loaded slots disable their control, and neither opening nor navigating ever
  issues a `/posts` request — asserted by request count, not by inspection.
- **Keyboard (LIGHT-04).** `Escape` and the focus trap come from Radix; `ArrowLeft`/`ArrowRight` are
  handled on the dialog content with `preventDefault` so the page behind cannot scroll. Radix's
  `FocusScope` intercepts only `Tab` (read from source), so the arrows always reach the handler.
- **Focus (LIGHT-05).** Focus enters the dialog on open, `Tab`/`Shift+Tab` cannot leave it in either
  direction, and closing returns focus to the trigger that opened it. The trigger is captured as
  `event.currentTarget` in the tile's click handler rather than read from `document.activeElement` —
  which is what makes restoration deterministic both in jsdom and in browsers that do not focus a
  clicked button.
- **A hole found and closed.** Reaching a boundary disables the button that had focus; a browser then
  blurs it and Radix's focus trap ignores a blur with a null `relatedTarget`, so the *next* arrow key
  went nowhere. An effect now re-homes focus onto an enabled control whenever the active media changes
  and focus is on `body`/a disabled button. The regression test fails without it.
- **Scroll (LIGHT-06).** The offset is captured on open; `close()` clears the index and, one macrotask
  later (after Radix releases its body scroll lock and its trap), focuses the stored trigger with
  `preventScroll: true` and restores the offset. `restoreScrollY` is a no-op when the offset is already
  correct, so the healthy path never calls `window.scrollTo` at all.
- **Tests.** Five new files (69 tests) plus 7 added to `post-media-grid.test.tsx`. Everything runs
  headless against a mocked, URL-routed `fetch`; no server, no network, no new dependency.

## Task Commits

| Commit | Subject |
|--------|---------|
| `e69ec8a` | `docs(08): add Phase 8 media lightbox plan` |
| `d6a8cef` | `feat(08): add media lightbox with cross-tweet navigation and focus/scroll restoration` |

Both made with `gsd-tools query commit … --files <explicit paths>` (`committed: true`); the summary is
committed separately with `docs(08): summarize media lightbox`.

## Files Created/Modified

**Created (9)**
- `web/src/lib/lightbox.ts` — `MediaSlot`, `flattenMediaSlots`, `findSlotIndex`, `slotAt`, `stepSlotIndex`, `isFirstSlot`, `isLastSlot`
- `web/src/lib/lightbox.test.ts` — 16 pure tests (flatten order, text-only skip, >4 media, malformed `media`, lookup misses, clamps, cross-tweet step)
- `web/src/lib/scroll.test.ts` — 6 tests (`readScrollY` normalisation, `restoreScrollY` writes/no-ops/ignores nonsense, `scrollNearTop` unchanged)
- `web/src/hooks/use-media-lightbox.ts` — the controller hook (identity selection → derived index, deferred focus + scroll restore)
- `web/src/hooks/use-media-lightbox.test.tsx` — 10 tests (total, open, cross-tweet step, no-op, both boundaries, close, self-close on shrink, follow on reorder, offset capture/restore)
- `web/src/components/gallery/lightbox-info-panel.tsx` — `LightboxInfoPanel` + `LightboxInfoPanelProps`
- `web/src/components/gallery/media-lightbox.tsx` — `MediaLightbox` + `MediaLightboxProps` (dialog, media area, counter, controls, arrow handler, focus recovery)
- `web/src/components/gallery/media-lightbox.test.tsx` — 18 component tests (contents, flattening, meta lines, accessible name/description, counter, control names, both disabled boundaries, clicks, arrows, Escape, no-scroll, responsive classes, scrim, clamp, broken image)
- `web/src/pages/collection-page-lightbox.test.tsx` — 19 integration tests (open at item, text-only has no trigger, cross-tweet walk, no wrap, no extra fetch, arrows, Escape, × close, focus in/trap/not-stranded/returned, scroll unchanged, metadata, Open on X, clamp + Show more, responsive structure)

**Modified (13)**
- `web/src/lib/scroll.ts` — `readScrollY` / `restoreScrollY` (guarded; no-op when already correct)
- `web/src/lib/post-text.ts` — `PostTextVariant`, `LIGHTBOX_TEXT_CLAMP_CLASS`
- `web/src/lib/post-meta.ts` — `LightboxMetaLines` + `formatLightboxMeta`
- `web/src/lib/messages.ts` — lightbox labels, meta labels, `formatLightboxCounter`
- `web/src/lib/index.ts` — `lightbox` export
- `web/src/hooks/index.ts` — `useMediaLightbox` + `UseMediaLightboxResult`
- `web/src/components/ui/dialog.tsx` — `overlayClassName` passthrough on `DialogContent`
- `web/src/components/gallery/clamped-post-text.tsx` — `lightbox` variant rendering
- `web/src/components/gallery/post-media-grid.tsx` — `onOpenMedia(mediaIndex, trigger)` triggers
- `web/src/components/gallery/post-media-grid.test.tsx` — 7 new trigger tests (named button, decorative image, click index+trigger, Enter/Space, geometry preserved, placeholder inside the trigger, static without a handler)
- `web/src/components/gallery/post-card.tsx` — `onOpenMedia` passthrough
- `web/src/components/gallery/index.ts` — `MediaLightbox` / `LightboxInfoPanel` exports
- `web/src/pages/collection-page.tsx` — `useMediaLightbox(posts)`, per-card `onOpenMedia`, `<MediaLightbox … />`

## Decisions Made

All plan decisions were kept; the load-bearing ones:

1. **A flattened sequence, not per-post cursors.** `stepSlotIndex` over `flattenMediaSlots(posts)` makes
   "walk the tweet, then the next tweet" one clamped increment, and makes text-only posts structurally
   incapable of producing a broken index.
2. **Tiles only become triggers when `onOpenMedia` is provided.** The real page always passes it; the
   standalone grid keeps its alt-bearing images, so the entire pre-Phase-8 suite and the Phase 5 alt
   contract stayed green while the interactive path gained a real, named button.
3. **Selection by identity, position by derivation.** The hook stores `{tweet_id, mediaIndex}` and
   derives the flattened index. This is what closed the stale-lightbox case *without* a
   `setState`-in-effect (which the `react-hooks/set-state-in-effect` rule rejects) and it keeps the
   lightbox on the same image across a reorder — a strictly better outcome than storing a position.
4. **The trigger element is passed explicitly.** `onOpenMedia(mediaIndex, event.currentTarget)` →
   `open(postIndex, mediaIndex, trigger)` removes all dependence on `document.activeElement`, which is
   unreliable for pointer clicks and *provably* reports `body` in jsdom while Radix's aria-hidden
   sibling hiding is applied.
5. **Radix owns Escape and the trap; we own the arrows.** Handled on the dialog content with
   `preventDefault` — never a global key listener — and Radix binds only `Tab`.
6. **The counter serves both audiences.** Visible `2 / 4`, `role="status"`, `aria-label="Media 2 of 4"`.
7. **`overlayClassName` on the shadcn primitive instead of forking it**, and a `lightbox` variant on
   `ClampedPostText` instead of a second clamp implementation.
8. **No host, port or timer.** No `/posts` request is issued by opening or navigating (asserted by
   request count), `grep -rn 'setInterval' web/src` is empty, and no server was started.

## Deviations from Plan

1. **[Interface] `onOpenMedia` takes the trigger element as a second argument.** The plan wrote
   `onOpenMedia(mediaIndex)`. Focus restoration cannot depend on `document.activeElement` (see
   Decisions 4), so the tile hands back `event.currentTarget`. `PostCard`'s prop and
   `useMediaLightbox.open` gained the same optional third/second argument; omitting it remains valid
   (the hook then simply does not move focus).
2. **[Interface] "closes when the loaded slots disappear" moved from an effect to derivation.** The
   plan's `must_haves` described a guard in the hook. The effect form was rejected by the project's own
   lint gate (`react-hooks/set-state-in-effect`), so the hook now stores identity and derives the
   position: the same behaviour, no effect, and no chance of a stale position being resurrected.
3. **[Added] A focus-recovery effect in `MediaLightbox`** for the boundary case (a browser blurs a
   control it just disabled, and the trap ignores a null-`relatedTarget` blur). This was not in the
   plan; it was found by the integration test going red and is covered by its own regression test.
4. **[Added] `overlayClassName` on `DialogContent`.** One optional prop on the shared primitive
   replaces duplicating `DialogContent` for a scrim tint.
5. **[Test-only] jsdom keeps reporting a just-disabled button as `document.activeElement`**, so
   `user-event` refused to dispatch the following key press. The recovery effect therefore also treats
   "active element is a disabled button" as lost focus, which is a harmless superset of the
   real-browser case.

**Total deviations:** 5, none blocking and none changing a requirement.

## Issues Encountered

- **Radix's own focus restoration does not fire in jsdom.** The dialog unmounted with focus on `body`,
  so the plan's "focus returns to the trigger" was red. Root cause: radix captures
  `document.activeElement` at mount, and jsdom reports `body` while Radix's `aria-hidden` sibling hiding
  is applied (and it does not fire `focusout` when the focused node is removed). Fixed by capturing the
  trigger explicitly in the tile's click handler and restoring it ourselves one macrotask after close —
  which also removes the dependency in real browsers.
- **`user.keyboard` sent the following arrow key to a disabled button.** After two `ArrowRight`s the
  focused `next` button became `disabled`; jsdom still reported it as the active element, and
  `user-event` will not dispatch keyboard events to a disabled control, so `ArrowLeft` was a no-op.
  Fixed with the focus-recovery effect; the same scenario in a real browser would have blurred the
  button, which the same effect now also handles.
- **The lint gate rejected the planned shrink guard.** `react-hooks/set-state-in-effect` flagged the
  "close when slots shrink" effect as an error. Rewrote the hook around identity + derivation, which is
  simultaneously lint-clean, reorder-safe and resurrection-proof.
- **`screen.findByTestId("post-card")` matched three cards** in one integration test; switched to
  `findAllByTestId`.
- **An early `renderPage` helper had a nonsense ternary** left over from an aborted override idea
  (`routes.collections ? LINUX : LINUX`); removed before the first green run.

## User Setup Required

None. No new dependency, no environment variable, no server. `grep -rn '43121' web/src` → no matches,
`grep -rn 'setInterval' web/src` → no matches, `pgrep -af 'vite|pnpm dev'` → nothing.

## Next Phase Readiness

- **Phase 9 (Production Serving).** Nothing in this phase touches serving: the lightbox renders inside
  the existing SPA route, uses the same relative-URL `fetchPosts` client, and added no host, port or
  process coupling. The scrim and the dialog portal are client-side only, so SPA fallback work is
  unaffected.
- **Phase 10 (Hardening).** The exported surface and the exact testids/accessible names are listed in
  `patterns-established` so the hardening pass can target them without re-deriving the DOM. Two things
  deserve attention there: (a) the boundary controls use the real `disabled` attribute plus focus
  recovery rather than `aria-disabled`, so axe and a keyboard user should both be re-checked at the
  first/last slot; (b) the scrim is an arbitrary `bg-[#120d14]/82` value — it is present in the built
  CSS today (`oklab(16.8891% .0118275 -.0113302/.82)`), and that grep should stay part of the build
  evidence. Native `<dialog>`-style async closing, zoom/pan, and video remain intentionally out of
  scope (context §Out of scope).
- **Human judgement still owed (LIGHT-05).** The trap and the restoration are asserted in jsdom, but the
  real-browser feel — the visible focus ring after a boundary key press and restoration when a browser
  declines to focus a clicked button — is worth one manual pass.
- **Mutation check performed.** Temporarily clamping `step` to the current tweet made exactly 4 tests
  fail across 2 files (`continues a tweet's media in the next loaded tweet after the last one`, `walks
  the current tweet then continues into the next tweet's media`, `navigates with ArrowLeft and
  ArrowRight`, `never leaves focus stranded on a control it just disabled`); restored immediately and
  re-verified green.
