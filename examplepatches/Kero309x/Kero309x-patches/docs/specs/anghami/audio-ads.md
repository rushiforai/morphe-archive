# Block ads between tracks

- **Id:** `anghami.ads.audio-ads`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Ads and promotion

## Observable behaviour

Free accounts hear a short advertisement between tracks. After patching, a track
is followed by the next track instead of an advertisement, and the player never
enters an advertisement state.

## Preconditions

Signed in with an account that is not entitled to ad-free playback.

## Acceptance criteria

- [ ] Playing an album end to end produces no advertisement.
- [ ] The now-playing surface never enters an advertisement state.
- [ ] The queue advances to the next track by itself after a track ends.
- [ ] Normal playback, seeking and queue transitions are unaffected.
- [ ] Songs the server exempts from ads behave exactly as before.

## Out of scope

Server-side ad decisions and ad revenue accounting. The patch changes client
behaviour only and does not make requests appear as if they came from a paying
account, nor does it remove the advertising identifiers the client still sends.

## Open questions

- Which surfaces must also be covered so that no ad placeholder remains visible
  on the player, the queue and the mini player? Answered for this build: there is
  a single decision point, and the surfaces render an ad only after the player
  enters the ad state, so nothing has to be hidden separately.
- Does skipping the ad break a back-to-back ad flow? Answered: the back-to-back
  step only runs after an ad has started, so it cannot be reached.

## Verification

1. Install the patched build on a device with a free account.
2. Play at least five consecutive tracks from an album and from a playlist.
3. Confirm no advertisement and no advertisement state appears.
4. Confirm the queue still advances and the next track starts automatically.
5. Confirm a song the server marks as exempt still plays identically.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-05 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.ads.audio-ads`.
