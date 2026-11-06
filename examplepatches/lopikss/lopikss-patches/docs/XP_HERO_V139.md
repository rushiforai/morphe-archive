# XP Hero 26.2.0 — v1.3.9 hero unlock confirmation fix

## Verified failure

In v1.3.8 Hana (ID 24) and Blaster (ID 23) show **0/0** pieces after patching, but pressing the green confirmation button does not unlock them. The original unlock data file was changed correctly, but the runtime consumes pieces through `CostumeManager.TryConsumeCostumePiece` before the purchase flow completes.

## Native zero-quantity fix

The original ARM64 library has `CostumeManager.TryConsumeCostumePiece` at virtual address `0x02852DD0`.

- At virtual address `0x02852E60`, it compares the required piece count against zero: `cmp x19, #0`.
- At virtual address `0x02852E64` (file offset `0x0284EE64`), it branches to a failure/logging path when the count is zero or negative: `b.le 0x02852F8C`.
- The function has an existing successful result `mov w0, #1` at virtual address `0x02852F84`.

In v1.3.9, only that ARM64 conditional branch is redirected to the existing successful result at `0x02852F84` (`4d 09 00 54` -> `0d 09 00 54`). Required-piece amounts greater than zero still execute their original inventory checks and deductions. The separate hero unlock asset patch remains scoped to Hana and Blaster.

`XP Hero | Unlock Blaster & Hana (FREE)` now applies both the scoped 0-piece asset transformation and this version-locked native edit. The native editor normalizes this new edit along with existing trait, ticket and zero-shard star-upgrade edits, so the enabled modules can be applied in either order.

The original library SHA-256, exact instruction bytes, preceding comparison, and existing success return were verified against the unmodified XP Hero 26.2.0 ARM64 XAPK. The code must still be **tested in-game**; a server-side ownership check could be independent.

## Return tickets

The Return paid-pass prompt problem is **not changed in v1.3.9**. The prior Free Tickets & Return module is preserved untouched. Local free-ticket quantity settings do not prove that free tickets have been granted to the active save. Before concluding a new gameplay change is needed, check the free ticket balance after the game's actual daily reset and whether Return opens the paid offer even with a positive free-ticket inventory.

## Test

1. Enable `XP Hero | Unlock Blaster & Hana (FREE)` and optionally `XP Hero | Free Hero Upgrade (0 Shards)`; do not select the 1-shard fallback together with the 0-shard module.
2. Attempt to unlock Hana with the green `0/0` button. Confirm the character becomes available and zero pieces are deducted. Repeat for Blaster.
3. Confirm normal free traits/runes and other previously working patches are unaffected.
4. For Return, report the actual free-ticket counter and whether the popup occurs after a daily reset. Do not assume the premium 30-day pass is active.
