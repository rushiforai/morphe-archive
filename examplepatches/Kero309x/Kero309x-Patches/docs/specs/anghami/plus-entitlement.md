# Plus entitlement state

- **Id:** `anghami.entitlement.plus`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** high
- **Category:** Account and entitlements

## Observable behaviour

The client derives "is this a paying subscriber?" in one method on the account
object: a plus plan, a free trial, or a gold plan. Scores of screens ask that
question, directly or through the cached static wrapper.

Two further answers come straight from server flags rather than from that
derivation, and they are what makes the player treat a free account differently:
one marks the account as restricted, the other turns an attempted scrub, repeat or
play-more action into a subscription prompt. A real subscriber receives both
switched off.

After patching, the client answers yes to the derivation and no to those two flags.
Every feature that is gated only by that local answer becomes available: the
download manager stops refusing downloads, the player stops applying free-tier
queue rules, lyrics and skips open up, scrubbing and repeating are no longer
interrupted by a prompt, and the screens that advertise an upgrade stop doing so
because they now see a subscriber.

## Preconditions

Signed in. Features the server itself refuses remain out of reach.

## Acceptance criteria

- [ ] The local check reports an active subscription on every screen that asks it.
- [ ] Locally gated features become usable.
- [ ] Scrubbing, repeating and play-more are no longer replaced by a subscription
      prompt.
- [ ] The account screen still shows the plan the server sent.
- [ ] A server refusal still appears as its normal error, with no crash.
- [ ] Turning the patch off restores the stock answer everywhere.

## Out of scope

Server-side entitlement, billing, purchases, and anything that would require
forging a receipt. The patch does not make the server hand over paid content.

## What is deliberately not changed

- The plan type string is left exactly as the server sent it. It is displayed on
  the account screen and used by answers that describe a different tier.
- The gold answer is left alone. Gold is a separate tier with its own checks, and
  reporting it would be a claim about a purchase that never happened.
- The two player flags are answered, not stored. Their values in the account
  record stay as the server sent them, so persistence and diagnostics are
  unchanged.
- No request is altered and no response is rewritten. The change is confined to
  the local derivation and the two local flag answers.

## Known limitations

- A feature that the server gates will still be refused, usually as an error or an
  empty response rather than a crash, because the client only controls its own
  check.
- The account screen may show the free plan next to features that now work. This
  is the visible consequence of changing the derived answer and not the stored
  plan.
- This behaviour overlaps the narrow patches on purpose. It is the broad switch;
  the narrow ones exist so a user can take a single behaviour instead.

## Open questions

- Should this stay enabled by default? Current decision: yes, recorded as decision
  `0004`, matching the behaviour set this project replaces. A user who does not
  want it disables it in the manager.

## Verification

1. Sign in with a free account and enable only this patch.
2. Exercise downloads, lyrics, skips and queue behaviour and confirm they no
   longer ask for an upgrade.
3. Seek within a track, repeat a track and use play-more, then confirm no
   subscription prompt interrupts them.
4. Open the account screen and confirm the plan the server sent is still shown.
5. Trigger a server-gated feature and confirm it fails normally, without a crash.
6. Disable the patch and confirm every answer returns to what it was.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-06 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.entitlement.plus`.
