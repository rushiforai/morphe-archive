# Block promotional popups

- **Id:** `anghami.ads.promotional-popups`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Ads and promotion

## Observable behaviour

The application sometimes draws a promotional overlay over the screen it is
showing: a popup window anchored to the screen, or a full-screen flyer. After
patching, neither appears and the user stays on the screen they asked for.

## Preconditions

None beyond a normal signed-in session.

## Acceptance criteria

- [ ] Cold starts do not show a promotional overlay.
- [ ] Returning to the application from the background does not show one.
- [ ] Navigating between main sections does not show one.
- [ ] First-run onboarding, permission prompts and tooltips still work.
- [ ] The screen underneath is fully usable directly after a launch.

## Out of scope

Advertising identifiers and telemetry, which are covered separately, and the
fetching of the promotion itself: the client still receives and caches the model,
it just never draws it.

## Open questions

- Are there promotions delivered as a full-screen route rather than as a dialog?
  Answered for this build: the full-screen promotion is a dialog owned by the ad
  popup handler, not a route, so it is covered by the same change. The other
  surface is an anchored popup window owned by the popup ad component.
- Does suppressing the draw break the flow that depends on dismissal? Answered:
  nothing listens for the dialog or the popup to close. The handler only offers a
  visibility query, which keeps answering "not showing".

## Verification

1. Start the patched application cold five times.
2. Background and foreground it five times.
3. Walk through every main section.
4. Play a track and confirm nothing is drawn over the player.
5. Confirm tooltips and onboarding still appear on a fresh install.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-04 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.ads.promotional-popups`.
