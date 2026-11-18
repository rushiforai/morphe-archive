# Full lyrics access

- **Id:** `anghami.media.lyrics-access`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** high
- **Category:** Media and lyrics

## Observable behaviour

Time-synced lyrics are offered for some tracks and withheld for others behind a
subscription prompt. After patching, the lyrics screen opens for a track that
previously showed the prompt, and the synced lines follow playback.

## Preconditions

The track has lyrics available at all.

## Acceptance criteria

- [ ] The lyrics screen opens instead of a paywall prompt.
- [ ] Synced lines advance with playback.
- [ ] A track without lyrics shows the normal empty state rather than a crash.
- [ ] Seeking moves the highlighted line correctly.

## Out of scope

Fetching lyrics that the server does not serve. The patch does not substitute a
third-party lyrics provider.

## Open questions

- Is the refusal a client-side flag, a server response, or both? Only the client
  part may be changed. Answered for the entry point: the lyrics screen is gated by
  one account predicate, `Account.lyricsEnabled()`, which the entry point reads
  before it starts the activity. Whether the lyrics payload is separately withheld
  by the server has not been observed.
- Does the lyrics request depend on a token that the patch would have to
  fabricate? No token is fabricated: the request is made exactly as a subscriber
  makes it.

## Verification

1. Open a track that shows the subscription prompt on the stock build.
2. Confirm the lyrics screen opens and lines advance.
3. Seek within the track and confirm the highlighted line follows.
4. Open a track with no lyrics and confirm a clean empty state.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-04 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.media.lyrics-access`.
