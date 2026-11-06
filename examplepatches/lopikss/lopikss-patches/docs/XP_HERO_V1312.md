# XP Hero 26.2.0 — v1.3.12 candidate

## Why the previous v1.3.11 zero-shard workaround still froze the screen

The **character-detail screen** calls `CostumeViewModel.TryGradeUp` (VA `0x02874E9C`), which calls `CostumeController.TryGradeUpCostume` (VA `0x028482FC`). The earlier v1.3.8–v1.3.11 native edits instead targeted the *different* `CostumeManager.TryGradeUp` static method (VA `0x02847EA0`). That explains why native-cost branch experiments did not address the screen's actual success/notification path.

The controller validates `Cost1_Amount` through `HasEnoughPieces`, which accepts zero as an affordable price (inventory >= 0), and calls `TryConsumeCostumePiece` (VA `0x02852DD0`). That helper originally used `CMP X19,#0; B.LE failure` at VA `0x02852E60–0x02852E64`.

The previous zero-piece unlock patch redirected `B.LE` **straight to the success return**, skipping its normal transaction, inventory-change notification, and observers. This let the saved star count increment, but the observed game UI did not show the new grade and the Back button was stuck.

v1.3.12 changes **only the condition** from `B.LE` to `B.LT` at VA `0x02852E64`, so zero enters the original consumer, performs a zero-amount inventory update and invokes the original observers. Negative counts still trigger the original rejection. Both `Free Hero Upgrade (0 Shards)` and `Unlock Blaster & Hana` use this same patch; the previous static star-upgrade edit is restored to the original assembly. Original game bytes `4d 09 00 54` -> `4b 09 00 54`; both old `0d 09 00 54` shortcut and new version normalize for the full-library SHA check. Actual on-device success still needs testing.

## No daily-reset wait for free Return

The original game's free Return item is **7002**. v1.3.11 attempted to grant a persisted count via a paid-pass daily reset, which may not fire immediately on an existing free account.

v1.3.12 instead makes `HomeReturnPortalPassController.GetFreeTicketCount` (VA `0x024C237C`) immediately return the configured `returnDailyTickets` value (default 5000), using `MOV W0,#N; RET` at function entry. The free-use `TryUseHomeReturnPortal` path at VA `0x024C6458` no longer aborts when its underlying item-7002 debit cannot occur (a native ARM64 NOP replaces its failure branch). This allows an **immediate virtual free balance**, not 5000 persisted ticket items; the displayed virtual counter does not decrement, so this effectively allows unlimited free uses while the module is enabled. It does *not* activate a paid pass, alter the paid 7001 inventory or purchase APIs, or remove the game's €5.99 promotional popup.

The bottom-right **Return** icon in the **home/base screen** may continue to open that €5.99 paid-pass popup. It is not necessarily the actual free Return teleport action. To test free Return, go **away from base into the field** and press Return there, rather than the paid-pass offer at base.

The previous optional daily-reset edits remain for compatibility, but the instant virtual count no longer depends on the reset occurring.

## Verification

- All edits are pinned to the exact original XP Hero 26.2.0 ARM64 `libil2cpp.so`: SHA-256 `88b591e6099c55b1147b865847a14651b108f9bd6837707371766a054c8df443`.
- Source-specific byte validation and normalization ensure patches compose without silently modifying an unsupported game binary.
- CI verifies the original ARM64 bytes and assembles the Kotlin/Morphe patch bundle.
- On-device UI success **has not been verified**; compiling does not prove the upgrade animation, Back button or actual field Return action is fixed.

## Device test without risking save

1. Do **not** uninstall XP Hero or clear its app storage; ensure your game save is safely backed up before any APK replacement.
2. Apply Free Hero Upgrade (0 Shards), but not the 1 Shard fallback. Upgrade **one** character at zero shards and confirm the new star becomes visible and the Back button works without restarting.
3. With Free Tickets & Return enabled, enter the field away from base and try the real free Return action immediately; check that it teleports to base without a purchase.
4. Recheck previous working XP Hero patches. If the zero-shard screen remains stuck, provide a brief screen recording or Morphe debugging logs; do not repeatedly upgrade to diagnose without preserving progress.
