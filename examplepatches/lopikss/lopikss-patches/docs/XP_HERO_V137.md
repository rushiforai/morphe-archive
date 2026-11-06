# XP Hero v1.3.7 — free Return tickets, not a modified paid offer

Original game: XP Hero 26.2.0 (ARM64). Experimental until confirmed in-game.

## What was wrong in v1.3.6?

The previous patch changed `RETURN_TICKET_COUNT`, which is the quantity advertised in the **€5.99, 30-day Return Ticket offer**. It made the paid offer display 5,000 tickets without granting that entitlement. This was not the intended feature.

## New free gameplay path

The game has two different inventory currencies:

- `Stackable_HomeReturnPortalTicket`, inventory ID **7001**: paid Return tickets
- `Stackable_HomeReturnPortalFreeTicket`, inventory ID **7002**: free Return tickets

The existing `HomeReturnPortalPassController.GetRemainingUseCount` counts free tickets even when the paid pass is inactive, and `TryUseHomeReturnPortal` has an explicit free-ticket consumption path.

`HomeReturnPortalPassController.ResetDailyTickets` normally sets item **7001** from the paid-pass configured amount. It runs from the controller's daily-reset handler. For the **Free Tickets & Return** patch, the experimental native edit changes the daily-reset item to **7002**, with the `Free Return tickets per day` Morphe setting (10–5000, default 5000). The normal Return action can then spend free tickets, without buying the pass.

The implementation modifies only these two exact ARM64 instructions:

- VA `0x024C4DC0`: load original ticket quantity -> `mov x19,#configuredFreeTickets`
- VA `0x024C4DD8`: set inventory item 7001 -> inventory item 7002

The native editor verifies the original XP Hero 26.2.0 IL2CPP library SHA-256 after normalizing these precise changes plus the known user-tested Trait Reroll edit and Heroes' Tomb price fallback. It rejects other game versions. The count is validated in [10, 5000]. No IAP product status, receipts or Google Play billing code are modified.

## Store display

`RETURN_TICKET_COUNT` remains **10** and the €5.99 paid store offer is no longer altered. The configurable quantity applies to the game's **free-ticket inventory**, not the paid product description. `RETURN_FIRST_FREE_CNT` (initial onboarding free allowance) remains a separate experimental Morphe setting.

## Testing required

1. Confirm the paid Return Ticket 30 Days offer displays its **original 10-ticket quantity** and original price.
2. Confirm **Free Return tickets per day** is set to your desired number in Morphe and the patch succeeds.
3. Check the Return feature after **the next in-game daily reset**. A daily-reset method only runs when the game processes a new day, so an existing save may not gain tickets immediately.
4. Use Return and verify travel succeeds without a pass, and the **free ticket** balance decreases by one. If not, record whether a purchase popup appeared, and what quantity was shown.
5. The game may synchronize inventory with a server or validate Return travel remotely; game-side confirmation is required.

Other store, rune, trait and regular ticket refill modules are unchanged.
