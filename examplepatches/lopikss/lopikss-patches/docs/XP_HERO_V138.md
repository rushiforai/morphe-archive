# XP Hero v1.3.8 — Blaster, Hana and zero-shard hero upgrades

Target: **original XP Hero 26.2.0** only. The modifications were checked against exact original assets; **gameplay is still experimental until device-tested**.

## Unlock Blaster & Hana (FREE)

The original CostumeData_59 Unity TextAsset has exactly 24 hero records. The two target rows are:

- **Blaster**, hero ID **23**, originally 100 required pieces
- **Hana**, hero ID **24**, originally 100 required pieces

The opt-in `XP Hero | Unlock Blaster & Hana (FREE)` patch sets only these two `UnlockRequiredPieces` values to zero, preserving the original Unity asset byte length. It verifies the expected SHA-256 and exact record values. Other heroes and any real-money purchases remain untouched. The game might still require an additional unlock confirmation or validate ownership online.

## Actual zero-shard star upgrades

The original 1-shard patch was user-tested to work and deduct 1 shard. Earlier 0-shard data alone displayed 0 but clicking Upgrade had no effect.

The new separate `XP Hero | Free Hero Upgrade (0 Shards)` patch:
1. Zeroes all 144 `Cost1_Amount` values in original CostumeStarGradeOptionData_50, with exact asset hash/record-count validation.
2. At `CostumeManager.TryGradeUp` virtual address `0x02847EA0` (file offset `0x02843EA0`), replaces a `TBZ w0,#0, failure` instruction with one ARM64 `NOP`.
3. Leaves the next existing `CMP x22,#1; B.LT` spending guard untouched, which skips deducting shards for zero cost.

The change is precise, verifies original library SHA-256 and neighboring instructions, and normalizes the known native edits from **Free Trait Rerolls**, **Free Tickets & Return**, and Heroes' Tomb refills so all modules can be enabled together in any order.

**Do not enable the new free upgrade module together with** `XP Hero | Hero Upgrade (1 Shard - Fallback)`; both edit the same original hero star data. Keep the 1-shard option available if the experimental 0-cost version does not work in-game.

## First in-game tests

1. On Hana and Blaster, verify **Unlock Now** shows a zero requirement and actually unlocks each hero. Check piece balance before/after.
2. With the free upgrade patch enabled (and 1-shard fallback disabled), attempt a star upgrade. Verify the star count rises and shard balance does **not** decrease.
3. Test with existing Free Trait Rerolls and Free Tickets & Return modules; confirm no patch conflict.
4. If a price becomes zero but a button does nothing, report exactly what it shows rather than assuming success.

This patch does not modify Google Play purchases, receipts or paid passes.
