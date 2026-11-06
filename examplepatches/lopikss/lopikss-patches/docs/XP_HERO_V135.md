# XP Hero v1.3.5 — configurable shops and ticket cost fallback

Target: original XP Hero 26.2.0 XAPK only. This remains an **experimental** build until verified in-game.

## Shop cleanup
One **XP Hero | Free Shops** patch replaces the previous six separately selectable shop modules, with six Morphe boolean settings (all initially on):
- Daily Gem Shop (300 prices)
- Chest Shops (20 prices)
- Token Shop (27 prices)
- Invasion Shop (38 prices)
- Exchange Shop (24 prices)
- Other Shops (27 prices)

The already established non-IAP cost editor, category mapping and strict original-asset checksum checks remain unchanged. Paid purchases are not targeted. These settings affect the APK when patched, not switches inside the running game.

## Ticket refill root cause

The project owner reported that the 400 daily refill limit works in Heroes' Tomb (377 remaining after purchases), but zero-gem refills sometimes show **100 gems**.

In original arm64 `libil2cpp.so`, managed method `HeroTombTicketController.GetChargeCost` is mapped to virtual address **0x024CD254**. Its code at **VA 0x024CD2C4–0x024CD2CC** is:

```asm
cmp  w8, #0
mov  w9, #100
csel w0, w8, w9, gt    // substitutes 100 when configured price is zero
```

The experimental patch replaces only the last instruction at file offset **0x024C92CC** with `mov w0, w8` (little-endian bytes `e0 03 08 2a`). The existing purchase method `TryPurchaseTicketByCrystal` already has a cost-below-1 check that skips the gem subtraction. The game still needs to verify that ticket purchases actually complete at zero.

The native library's size, SHA-256, original assembly bytes and adjacent instructions are checked before modification. Normalization of the two known native modifications allows both this ticket price patch and the user-tested **Free Trait Rerolls** patch to be selected in any order without a checksum conflict.

Boss Raid has a different `GetCurrentChargeCost` handler and did not have this exact fallback. Existing ticket configuration changes remain intact; the 400-refill limit has not been modified again. Other ticket currencies or online server checks might still behave differently.

## Other patch names

All patch names are now prefixed `XP Hero |` rather than including stale version numbers. Free Rune Upgrades, Free Trait Rerolls, Free Trait Presets, Free S-Ticket Rolls, Free Hero Level Up, Free Hero Evolve and Hero Upgrade (1 Shard) are otherwise unchanged.

## First in-game checks

1. Select the new Free Shops patch, open **settings**, and verify all six switches or selectively disable a shop.
2. Select Ticket Refills (400/day) **together with** Free Trait Rerolls and your other desired modules.
3. In Heroes' Tomb, verify both the on-screen gem price and the **actual gem balance before and after** buying a ticket. Successful behavior is a ticket granted, no gems spent, and the daily counter decreasing by one.
4. Verify Boss Raid / PvP similarly. If a ticket still charges gems, report the exact screen and before/after gem amounts.
5. Preserve synced game data before installing a modified XAPK.
