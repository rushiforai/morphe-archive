# XP Hero 26.2.0 — v1.3.4 ticket refill experiment

**Status: experimental until tested in-game.** Use the original, unmodified XP Hero 26.2.0 XAPK.

## New module

XP Hero 1.3: Free Ticket Refills (400/day) edits the game's RemoteConfig_329 and ConfigData_45 Unity TextAsset files. All modifications require the expected original asset hash (allowing verified existing S-ticket price edits only).

- Zero gem recharge prices for PvP, Boss Raid and Heroes' Tomb tickets.
- Set Boss Raid and Heroes' Tomb ticket purchase limits to 400.
- Expand the PvP and Boss Raid refill gem price lists to 400 zero-cost entries.
- Set configured Challenge Tower video ticket limits and related ticket limits to 400 (advertisements may still be required).
- Set related ticket pack daily purchase limits to 400.
- Set the PvP ticket video refill limit in the separate ConfigData_45 asset to 400.
- Update the existing Free S-Ticket Rolls module to share the same validated editor so both modules can be selected in either order.

## Test instructions

Confirm the Morphe patching process succeeds for XP Hero 26.2.0. Then check price display, refill counts, completed purchases, and the gem balance. Game server checks, counter state, ad requirements and other code may still limit actual refills. Do not claim 400 refills or free ticket purchases are confirmed before the user tests them. Other proven patches are unchanged.
