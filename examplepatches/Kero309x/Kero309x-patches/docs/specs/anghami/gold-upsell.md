# Hide Gold upsell

- **Id:** `anghami.store.gold-upsell`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Store and upsells

## Observable behaviour

A section header can carry an optional Gold promotion: a small call-to-action
button drawn under the title, labelled with text the server supplies. The client
draws it only for that header, and the only thing that decides whether it appears
is whether the section payload carries the promotion.

After patching, sections that carry a Gold promotion no longer draw that button or
its container. The space they reserved disappears with it, and every other header
renders exactly as before.

## Preconditions

None beyond a stock 8.0.28 installation. The behaviour is about what the client
draws, not about the account's tier.

## Acceptance criteria

- [ ] A section header whose payload carries a Gold promotion does not draw the
      call-to-action button.
- [ ] The same header still draws its title, subtitle, image and "more" button as
      before.
- [ ] A section header without a Gold promotion is unchanged.
- [ ] Another user's Gold badge is still drawn when the server says that user is
      Gold.
- [ ] The account's own Gold answers and stored plan type are unchanged.
- [ ] The subscription screen still opens and renders when reached deliberately.

## Out of scope

Billing, prices and the purchase flow. The patch does not rewrite the plan type,
the account's Gold answer, or any server payload.

## What is deliberately not changed

- **Gold badges.** A badge on a profile, a ranked user or a story author states
  something true about that person. Answering the render-side helper false would
  remove those badges, so it is left alone: decoration is not advertising.
- **The tier predicates.** `Account.isGold()` and `Account.isGoldUser()` describe
  the signed-in account's plan. For a free account they already answer false, so
  overriding them changes nothing; for a Gold account it would take away features
  the user actually paid for.
- **The stored plan type.** It is what the server sent and what the account screen
  displays, and it is what account refresh, authentication and diagnostics write
  back.

## Limitations

The promotion is hidden, not deleted. The payload still contains it, the deep
links that lead to the subscription flow are not intercepted, and a user who
deliberately opens a Gold destination still reaches the screen; the screen's own
server calls decide what it can do.

Two entry points are left in place on purpose, because closing them would mean
removing the badge or the header text they are attached to:

- tapping the Gold badge of another user, which opens the Gold sheet;
- tapping the header or badge of a Gold user while the signed-in account is not
  Gold, which does the same.

## Verification

1. Sign in with a free account.
2. Open a list whose header carries a Gold promotion and confirm the button is
   absent and the header is otherwise unchanged.
3. Open a list without the promotion and confirm nothing changed.
4. Open another user's profile and confirm a Gold user is still badged as Gold.
5. Open the subscription screen deliberately and confirm it still renders.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Re-derived: 2026-11-06 from the stock build, after the first derivation was
  found to target decorations instead of advertising. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.store.gold-upsell`.
