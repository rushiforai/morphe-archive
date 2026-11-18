# Hide the promotional card

- **Id:** `vodafone.promotion.ad-space`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Ads and promotion

## Observable behaviour

The stock build asks the server for a gift offer and, when one comes back,
draws it as a card with a description, a price and a redemption button. The
card appears on the home screen, on the recharge screen and on the payment
screen. After patching, no card is drawn on any of them.

## Preconditions

The server offers a gift. Without that answer the card is not drawn in the
stock build either, so the patch changes nothing in that case.

## Acceptance criteria

- [ ] The home screen shows no promotional card.
- [ ] The recharge screen and the payment screen show no promotional card.
- [ ] The rest of each screen is unchanged: the offer is drawn by its own piece
      of interface code, so the surrounding content keeps its place.
- [ ] The application still works: no screen waits for the card, and the
      application does not read the offer back from the card.
- [ ] Turning the patch off restores the card.

## Out of scope

The offer itself. The application still asks the server for it and still holds
the answer, so the promotion is not withdrawn from the account; only the card
that presents it is not drawn.

## Limitations

- The redemption flow is still reachable through the server answer, but not
  through the interface. The card is the only way the application offers to
  start it.
- The server keeps offering the promotion. The patched build simply does not
  draw it.

## Open questions

- Is the card drawn anywhere else, by a copy of the interface code? Answered
  for this build: every screen calls the same composable, and the copies the
  shrinker left behind all call it as well.

## Verification

1. Install the patched build and sign in.
2. Open the home screen, the recharge screen and the payment screen, and confirm
   no promotional card is drawn on any of them.
3. Confirm the rest of each screen is unchanged.
4. Disable the patch, rebuild and install, and confirm the card returns.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-10 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.promotion.ad-space`.
