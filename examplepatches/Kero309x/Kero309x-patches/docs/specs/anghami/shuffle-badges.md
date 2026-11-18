# Hide shuffle badges

- **Id:** `anghami.interface.shuffle-badges`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Interface

## Observable behaviour

Lists mark content the server expects to be played shuffled. The marker takes
three shapes: a small glyph in front of a card's subtitle, an image span inside a
row's subtitle, and a dedicated badge view in a header or in the store carousel.

After patching, none of those surfaces draws the marker. The item itself, its
title, its subtitle and its actions stay as they were, and the space that the
badge occupied is not left blank.

## Preconditions

A list that shows the badge in the stock build.

## Acceptance criteria

- [ ] Album, playlist and link cards show no shuffle glyph before the subtitle.
- [ ] Album, playlist and link rows show no shuffle image span in the subtitle.
- [ ] Album and playlist headers show no shuffle badge, and the header content
      keeps its normal layout.
- [ ] The link header card and the store carousel show no shuffle badge.
- [ ] Items remain visible and tappable, and no empty gap is left behind.
- [ ] A list that never showed a badge renders exactly as before.

## Out of scope

Changing whether playback is actually shuffled, and hiding the player's shuffle
control. Both are separate behaviours.

## What is deliberately not changed

The underlying flag is part of the item model. It is written and read from
storage, compared when a list is diffed, and consulted when sections are
flattened. The patch therefore changes only the reads that draw the badge; the
flag itself keeps its value, so persistence, diffing and queue building behave
exactly as before.

## Open questions

- None for this build. Every read that produces a badge was enumerated; the
  remaining reads of the flag do not draw anything.

## Verification

1. Visit an album, a playlist, a link card, a store carousel and the row variants
   on a build that shows the badge.
2. Confirm no badge is drawn and that subtitles start at their normal position.
3. Confirm tapping an item still starts playback and that the header actions still
   work.
4. Confirm a list that never showed a badge is unchanged.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-05 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.interface.shuffle-badges`.
