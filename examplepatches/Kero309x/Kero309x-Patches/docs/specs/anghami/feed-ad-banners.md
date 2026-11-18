# Hide in-feed ad banners

- **Id:** `anghami.ads.feed-banners`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Ads and promotion

## Observable behaviour

Lists in the application can contain an advertising banner between their ordinary
cells. After patching, no banner is inserted: the cells that follow it move up and
the list looks exactly as it does when the server sends no banner placement.

## Preconditions

Signed in with an account that is not entitled to ad-free browsing, on a list the
server marks for a banner placement.

## Acceptance criteria

- [ ] No advertising banner appears in any list.
- [ ] No empty row or gap is left where the banner would have been.
- [ ] Ordinary cells keep their order, their content and their behaviour.
- [ ] No advertising request is made for the removed placement.
- [ ] Lists the server does not mark for a banner look exactly as before.
- [ ] Turning the patch off restores the banner.

## Out of scope

Server-side ad decisions and revenue accounting. The patch changes client
behaviour only; it does not alter the advertising identifiers the client sends,
the audio ad decision, or the promotional popups, which have their own behaviour.

## Open questions

- Are there banner placements outside lists? Answered for this build: the only
  place that creates the banner slot is the list inserter, and the popup path is
  already covered by `anghami.ads.promotional-popups`.
- Does skipping the insertion leave a listener or a loaded ad behind? Answered:
  the banner object is created, appended and loaded inside the skipped method, so
  none of the three happens.

## Verification

1. Install the patched build on a device with a free account.
2. Open the home feed and scroll through at least several screens.
3. Confirm no banner appears and no gap is left between cells.
4. Open a list the server does not mark for a banner and confirm it is unchanged.
5. Disable the patch and confirm the banner returns.

## Provenance

- Spec author and date: Kero309x, 2026-11-07
- Derived: 2026-11-07 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.ads.feed-banners`.
