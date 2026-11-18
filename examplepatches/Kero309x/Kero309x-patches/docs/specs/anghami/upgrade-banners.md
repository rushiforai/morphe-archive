# Hide upgrade banners

- **Id:** `anghami.store.upgrade-banners`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Store and upsells

## Observable behaviour

A free account is shown several surfaces that advertise a subscription upgrade:

- an entry in the bottom navigation;
- a promo bar drawn above some lists;
- feed cells served as an ordinary button or link whose destination points at
  the subscription flow, plus an automation teaser cell;
- a subscription notice on the downloads screen;
- a subscriptions row and a question banner in settings;
- a promo button appended to the library screen.

After patching, those surfaces are not created. They are not merely hidden at
draw time: the row getters answer null, the list filter drops the models, and the
library button supplier answers null, so no adapter position or empty cell is
left behind.

## Preconditions

Signed in with an account that is not subscribed. Several of the surfaces are
also suppressed for a subscribing account by the server; the patch does not
depend on that.

## Acceptance criteria

- [ ] The subscription entry is absent from the bottom navigation.
- [ ] No promo bar is drawn above a list.
- [ ] No feed cell whose destination points at the subscription flow is drawn.
- [ ] No automation teaser cell is drawn.
- [ ] The downloads screen draws no subscription notice.
- [ ] The settings screen has neither the subscriptions row nor the question
      banner.
- [ ] The library screen has no promo button.
- [ ] Playback from a search result uses the ordinary path and shows no
      queue-restriction prompt.
- [ ] Navigation still works and no empty section remains where a surface was.
- [ ] The subscription screen still opens when reached deliberately.

## Out of scope

The subscription screen itself and its purchase flow. Deep links are not
intercepted: a link that is already present in an external source still resolves
to the screen, which is deliberate.

## What is deliberately not changed

The two preference getters that feed the navigation entry and the
restricted-queue prompt are answered false; the stored preferences are not
rewritten. The raw server payloads are left in place and only the getters that
supply them to the row builders answer null, so nothing is lost from storage and
a later build can start using the payload again by disabling this patch.

The downloads notice is the one server-flag surface closed as a group. Four cells
on that screen read the same flag before building their notice text, and no other
screen reads it, so the flag answers false instead of each cell being hidden after
it has been built. The flag's stored value is untouched.

## Limitations

The feed match is a heuristic. A cell is treated as an advertisement when its
destination contains `upgrade`, `upsell`, `offer`, `premium`, `plus` or
`subscribe`, case-insensitively. A legitimate cell whose destination happens to
contain one of those fragments is hidden too. The alternative, matching a stable
model type, is not available because these cells are ordinary button and link
models.

The promo bar is collapsed before its own binding runs. The bar therefore keeps
no item and no timer; that is intentional, but it means a rebuilt bar in a future
version would need a new derivation.

## Open questions

- None for this build. Every surface was traced to the getter, filter or bind
  method that creates it; no other call site adds these cells.

## Verification

1. Sign in with a free account.
2. Walk through every bottom-navigation entry and confirm the subscription entry
   is absent.
3. Scroll several feeds to the end and confirm no promo bar, upsell cell or
   automation teaser appears, and that sections do not leave gaps.
4. Open settings and the library screen and confirm the promo rows and button are
   absent.
5. Open the downloads screen and confirm no subscription notice is drawn.
6. Play a song from a search result and confirm no queue-restriction prompt
   appears.
7. Open the subscription screen deliberately and confirm it still renders.
8. Open every deep link the stock build exposes and confirm nothing crashes.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-06 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.store.upgrade-banners`.
