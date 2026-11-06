# XP Hero v1.3.6 — Return tickets and configurable ticket limits

Target: original XP Hero 26.2.0 XAPK. All changes are **experimental** until tested on the device.

## Ticket Refills & Return settings (in Morphe)

The previous **XP Hero | Ticket Refills (400/day)** module becomes **XP Hero | Ticket Refills & Return**. It exposes three integer patch options:

| Setting | Default | Allowed range | Original |
| --- | ---: | ---: | ---: |
| Daily ticket refill limit | 400 | 1–5000 | Various 3/5/10 |
| Daily Return Tickets | 5000 | 10–5000 | 10 |
| Free return allowance | 5000 | 3–5000 | 3 |

The remote Unity `RemoteConfig_329` file includes original values `RETURN_TICKET_COUNT = 10` and `RETURN_FIRST_FREE_CNT = 3`. They are changed to the chosen values when the module is selected. The last setting may be an allowance only for certain stages of the Return feature; the runtime could enforce it elsewhere.

**Important:** The Return Ticket 30 Days screen advertises a paid €5.99 purchase. These settings modify local **quantities**, not the Google Play in-app purchase. They do **not** grant the 30-day paid subscription or fake a receipt. A player without the entitlement may not receive 5000 tickets daily. Server checks, expiration windows, or cached values could also override local configuration.

## Remaining ticket behavior

Gem recharge price lists are generated as `0,0,...` with as many entries as the selected daily limit. Existing native Heroes' Tomb zero-price-fallback fix is preserved; previous user verified that the 400 refill limit appeared in Heroes' Tomb. Free S-Ticket Rolls is independently stackable, and the game version and asset checks remain strict.

The `ConfigData_45` PvP video-refill cap also respects the selected daily limit. The original untouched data are re-normalized and SHA-256 checked, allowing either patch order with the S-ticket price module.

## Suggested tests

1. In Morphe patch settings, confirm all three editable integer fields and set the desired limits.
2. Rebuild the unmodified XP Hero 26.2.0 APK, keeping save data synced.
3. Observe whether Return Portal free returns are available **without** a paid pass; do not buy anything solely to test.
4. If you already have an active Return Ticket entitlement, observe the actual daily granted quantity after the next game reset. Without that entitlement, verify only the free return allowance, not the paid benefit.
5. For Heroes' Tomb, Boss Raid, PvP, Challenge Tower, verify counter, displayed gem cost, successful refill and before/after gem balance.

Other v1.3.5 modules, including configurable Free Shops, Free Trait Rerolls, Rune Upgrades and Hero Upgrade (1 Shard), are unchanged.
