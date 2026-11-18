# Show profile Plus badge

- **Id:** `anghami.entitlement.profile-badge`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Account and entitlements

## Observable behaviour

The profile header and the account row in settings draw a small badge when the
account is a subscriber. In the stock build the header reads a flag carried by the
profile itself, and the row copies the account's own plus answer, so both stay
empty for a free account.

After patching, both draw the badge for the signed-in account. Profiles that
belong to other people are unchanged, and a profile that is itself gold keeps its
gold badge.

## Preconditions

Signed in.

## Acceptance criteria

- [ ] Your own profile header shows the subscription badge.
- [ ] The account row in settings shows the badge.
- [ ] Another user's profile keeps its real badge state.
- [ ] A gold profile still shows the gold badge rather than the plus badge.
- [ ] No entitlement changes: downloads, lyrics, skips and playback behave as
      they did before patching.

## Out of scope

Feature entitlements. This behaviour is cosmetic and must not be relied on to
unlock anything. The separate `anghami.entitlement.plus` behaviour covers that.

## What is deliberately not changed

Neither the account's plus answer nor the profile's own flag is rewritten. The
header already computes whether the profile belongs to the signed-in account, and
the patch reuses that answer for the badge branch instead of inventing a new
comparison. The settings row gets a constant at the two places where it copies
the account's answer into its row model. The account itself keeps reporting what
the server said.

## Open questions

- None for this build. Both badge surfaces were enumerated, and no other screen
  draws the account's subscription state from these two sources.

## Verification

1. Sign in with a free account.
2. Open your profile and the settings screen, and confirm both show the badge.
3. Open another user's profile and confirm its badge state is unchanged.
4. Confirm downloads, lyrics, skips and playback behave as before.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-06 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.entitlement.profile-badge`.
