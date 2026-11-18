# Hide sponsored content

- **Id:** `anghami.ads.sponsored-content`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Ads and promotion

## Observable behaviour

The server can mark a song, or the in-car screen's banner, as sponsored. The client
draws a sponsor label on the song in list and card layouts, and a sponsor image and
caption on the in-car screen. After patching none of those markers is drawn, while
the songs themselves keep playing normally and the lists keep their layout.

## Preconditions

None.

## Acceptance criteria

- [ ] A song the server marks as sponsored shows no sponsor caption in the compact
      row, the card or the wide row.
- [ ] The same song shows its title, artist, artwork and explicit marker as before.
- [ ] The in-car screen shows no sponsor image or caption.
- [ ] No row is blank and no space is reserved where a marker used to be.
- [ ] Ordinary recommendations and every song still play.

## Out of scope

Removing the songs themselves. The feed is assembled by the server, and the client
never filters a sponsored song out of it; a patch that claimed to remove entries
would be describing something the client does not do.

## Open questions

- Does the application paginate around a removed sponsored item, or does it expect
  a fixed count? Answered for this build: nothing is removed, so the question does
  not apply. The client only decorates what the server sent.
- Are sponsored entries drawn anywhere else? Answered: the sponsored flag on a
  song is read by the three song layouts only, never by a click handler and never
  by a filter, and the section model's own sponsored flag is carried but never
  read by a view.

## Verification

1. Find a feed that shows a sponsored song and compare the patched build with the
   stock build side by side.
2. Confirm the caption is gone and the row is otherwise identical.
3. Open the in-car screen and confirm the sponsor banner is gone.
4. Play a previously sponsored song and confirm it behaves like any other song.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-04 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.ads.sponsored-content`.
