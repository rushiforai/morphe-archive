# 0005 — Audit findings change where three behaviours answer

- **Status:** accepted
- **Date:** 2026-11-07

## Context

An audit of every subscription-related answer in the stock build found three
places where a behaviour was answering the right question in the wrong place.

1. The Gold behaviour answered five tier predicates false. Reading their callers
   showed two problems: both account answers are already false for a free account,
   so the edit changed nothing there, and the three render-side helpers drive Gold
   *badges* on other users, so the edit removed a decoration that states something
   true about those users. The actual advertisement is an optional call to action
   on a section header, read in one class.
2. The Plus behaviour answered only the plan derivation. Two further answers come
   from server flags and never consult the plan: one marks the account as
   restricted in the player, the other turns an attempted scrub, repeat or
   play-more into a subscription prompt. A real subscriber receives both off, so a
   patched client still interrupted those actions.
3. The upgrade-banner behaviour covered every surface except the subscription
   notice on the downloads screen, which is gated by a single server flag that
   four cells read.

## Decision

- Retarget `anghami.store.gold-upsell` to the section-header call to action. Leave
  the tier predicates, the render-side helpers and the stored plan type alone.
- Extend `anghami.entitlement.plus` with the two player flags.
- Extend `anghami.store.upgrade-banners` with the downloads notice flag.

No new behaviour is introduced. The behaviour count stays at the set this project
replaces; only the code points each behaviour answers are corrected.

## Consequences

- Other users keep their Gold badges, and the Gold behaviour no longer changes
  anything for an account whose plan is already Gold.
- Two badge-driven Gold entry points remain: tapping a Gold badge, and tapping the
  header of a Gold user while the viewer is not Gold. Closing them would mean
  deleting the badge or the title they are attached to, so they are recorded as
  limitations instead.
- The Plus behaviour now touches two server flags in addition to the derivation.
  Both are answered, not stored, so the account record keeps the server values.
- The upgrade-banner behaviour gains one more flag answer; its heuristic and its
  limitations are unchanged.
