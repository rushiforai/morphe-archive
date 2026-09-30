# Phase 8: Media Lightbox - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 8 of 10** (= PRD §85 "Phase 2.8 — Lightbox")

<domain>
## Phase Boundary

Clicking media in a post card opens an accessible lightbox: a large media area beside a metadata panel (below it on mobile), prev/next navigation across the loaded dataset, keyboard control (Escape / ArrowLeft / ArrowRight), focus trapping and restoration, and preserved gallery scroll position on close.

**In scope:** `MediaLightbox`, `LightboxInfoPanel`, media click wiring on `PostCard`/`PostMediaGrid`, the lightbox state/controller hook, keyboard handling, focus management, and scroll preservation.

**Out of scope:** changing the loaded dataset or pagination (Phase 7); adding new backend endpoints.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Clicking media opens the lightbox; default design is a large media area plus a metadata panel
  (PRD §26). Desktop: large media area + metadata panel beside it. Mobile: metadata below the image.
- The panel shows post info: author, username, text, dates, `Open on X` (PRD §26).
- Navigation: next/previous image **within the tweet**, and after the last media of a tweet,
  navigation may continue into the next tweet's media in the **loaded** gallery dataset (PRD §27).
  Model the lightbox over a flattened list of `(post, mediaIndex)` entries derived from the currently
  loaded posts.
- Keyboard: `Escape` closes, `ArrowLeft` previous, `ArrowRight` next (PRD §27).
- Accessibility (PRD §67): Dialog/lightbox focus trap, Escape closes, arrow navigation, keyboard
  reachable controls, images have author/tweet-based `alt` fallbacks, and the tweet URL must remain
  reachable as text — not only via a clickable image.
- Closing the lightbox should preserve the gallery scroll position as closely as possible (PRD §77).
- Media loads directly from the stored `pbs.twimg.com` URL; no proxy or download (PRD §25).

### Visual spec

`docs/design/phase2-design-spec.md` §3.5 (frame `6:373`): scrim `#120d14` at 82%; panel `1220×820`
centered, r24, `surface`, shadow-popover; media area `800×760` inset 30, r20, near-black backdrop,
active image contained, prev/next at the left/right edges, `n / total` counter; info panel `330×760`
at x=860, r20, `surface-warm`, padding 22, with `×` close top-right (Inter Medium 22), author
Inter SemiBold 13, `@username` Inter Regular 10 muted, text Inter Regular 13 (clamped + `Show more`),
meta Inter Regular 10 muted as three lines (`Posted …` / `Saved …` / `Collection …`), and an
`Open on X ↗` button `286×42` r12 pinned near the bottom. Mobile: media on top (~55vh, contained),
panel stacked below.

Use a real focus trap (Radix Dialog, already available via shadcn, provides one) rather than a
hand-rolled one. Ensure the trap wraps both the media controls and the info panel actions.

</decisions>

<code_context>
## Existing Code Insights

- Phase 7's posts hook holds the loaded dataset — the lightbox must read from it, so cross-tweet
  navigation is bounded by what has been loaded (and may be extended as more pages arrive; decide
  whether navigation triggers loading more, but do not invent an endpoint).
- The reusable lazy+error `MediaImage` primitive (Phase 4) is the tile renderer; reuse it inside the
  lightbox for consistency and broken-media handling.
- Scroll preservation: capture `window.scrollY` when opening and restore after close. Note that a
  Radix Dialog locks body scroll — verify the restore happens after the lock is released.
- Keyboard handling belongs on the dialog content, not a global listener, so it does not fight other
  shortcuts.

</code_context>

<specifics>
## Specific Ideas

1. A 4-media post: clicking image 2 opens the lightbox at image 2; ArrowRight walks 3, 4, then into
   the next loaded post's media; ArrowLeft walks back.
2. `Escape` closes and focus returns to the element that opened the lightbox; the gallery is still at
   the same scroll offset.
3. Tab cycles within the lightbox only; Shift+Tab reverses; every control (close, prev, next,
   Open on X) is reachable and has a visible focus ring.
4. Mobile viewport: media on top, metadata below, all controls reachable.
5. A text-only post has no lightbox entry (nothing to click) but its `Open on X` still works.
6. A broken media URL inside the lightbox shows a neutral placeholder without collapsing the panel.
7. `pnpm build` still succeeds and typechecks.

</specifics>

<deferred>
## Deferred Ideas

- Download / save-image actions (PRD §5 excludes media download)
- Zoom/pan inside the lightbox
- Video playback (PRD §5 excludes it)

</deferred>
