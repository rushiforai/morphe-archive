# XP Hero v1.3.1 test notes

This release retires the redundant legacy `XP Hero: Zero-gem Exchange materials` option. Use `XP Hero 1.3: Exchange Shop` instead (owner-confirmed in v1.3.0).

The v1.3.0 `Free Hero Upgrade` patch zeroes the `Cost1_Amount` in the 144 star-grade data rows. The owner confirmed that the UI shows 0 but the Upgrade action did not complete. The other hero Level Up and Evolve patches worked.

**Experimental alternative:** `XP Hero 1.3: Hero Upgrade (1-piece test)` sets each price to *one* piece, preserving fixed-width asset layout and source hash checks. It is **not free**. Select it instead of `Free Hero Upgrade`, never both. A successful click would suggest the game rejects zero-priced star upgrades; a failed click may indicate server-side validation or another gameplay requirement.

The PvP ticket cap patch remains unchanged and user-reported non-working.
