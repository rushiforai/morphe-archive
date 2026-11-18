# Disable forced shuffle

- **Id:** `anghami.playback.forced-shuffle`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Playback

## Observable behaviour

For some lists, the server marks the content as shuffle-only. When an account
without an active Plus plan opens such a list, the stock client does not build a
queue over the songs the user can see: it replaces the list with a radio queue
whose play mode is `shuffle`, so playback starts in a different order and the
shuffle control does not describe the queue that is playing.

After patching, an account without Plus builds a plain queue over the listed
songs, at the song that was selected, and playback follows the order shown.
Accounts with an active Plus plan keep the stock behaviour.

## Preconditions

An account without an active Plus plan, and a list that the server marks with
play mode `shuffle`.

## Acceptance criteria

- [ ] Starting a marked list plays its songs in the order shown.
- [ ] Selecting a song from the middle starts at that song and continues from
      there.
- [ ] The in-player shuffle control reflects the user's choice, and turning it on
      and off still works.
- [ ] A list the server does not mark as shuffle plays exactly as before.
- [ ] An account with Plus keeps the stock behaviour, including lists that are
      meant to be radios.

## Out of scope

Server-side decisions about which content may be played in order, and radio
recommendations. The patch changes which queue the client builds for a marked
list; it does not make a request look like it came from a paying account.

## Known limitation

The same decision also controls whether the list is expanded as a radio. A free
account therefore plays the songs contained in the list and does not receive the
extra recommendations the radio queue would have fetched. This is the client-side
part of removing the restriction; the server still decides what the list may
contain.

## Open questions

- Are there regions where `shuffle` marks a licensing requirement rather than a
  free-tier restriction? If so they need to be listed before release. The client
  carries no separate marker for the two cases.

## Verification

1. With an account that has no active plan, open a list the stock build marks as
   shuffle and start it.
2. Confirm the songs play in the order shown and that the selected song starts
   first.
3. Toggle shuffle in the player several times and confirm the control sticks.
4. Open a list the stock build does not mark as shuffle and confirm it is
   unchanged.
5. Repeat with a Plus account and confirm the stock behaviour is kept.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-05 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.playback.forced-shuffle`.
