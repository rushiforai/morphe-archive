# Hide premium feature buttons

- **Id:** `anghami.interface.premium-buttons`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Interface

## Observable behaviour

On a track the server says has karaoke, the player and the player's queue rows can
show a button that advertises karaoke as a paid extra. After patching, that button
is not drawn, while the rest of the player and of the row is unchanged.

## Preconditions

A track that carries the karaoke marker and an account the server asks to upsell.

## Acceptance criteria

- [ ] The upsell button is absent on the full player screen.
- [ ] The upsell button is absent in the player's queue rows.
- [ ] The surrounding controls keep their normal layout.
- [ ] The remaining player actions still work.
- [ ] The button does not reappear after rotation or a configuration change.
- [ ] An account that actually has karaoke keeps its own entry point.

## Out of scope

Making the paid extra usable, and any other upsell surface in the store. Those are
separate behaviours or separate screens.

## Known limitation

This build carries no separately advertised remix button in the player or the
queue. The only premium teaser drawn there is the karaoke upsell, so that is the
whole of this behaviour for 8.0.28. If a later build adds another teaser that is
driven by its own answer, it needs its own derivation.

## Open questions

- None for this build. Two surfaces read the same getter, and the getter is the
  only thing that decides whether the button is drawn.

## Verification

1. Open a track with karaoke while the server asks for the upsell.
2. Confirm the button is absent on the player screen.
3. Open the queue and confirm the row shows no upsell button.
4. Rotate the device and confirm the button stays absent.
5. Confirm the other player actions and the queue rows still work.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-06 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.interface.premium-buttons`.
