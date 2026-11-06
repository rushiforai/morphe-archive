# XP Hero 26.2.0 — v1.3.14 candidate: zero-shard *display*, positive-quantity transaction

## Why this approach differs

The project owner's verified 1-shard fallback changes 144 `Cost1_Amount` prices to **1** without altering native game code. Its star-upgrade animation, save, and screen navigation all work, but it deducts a shard. Every prior 0-shard patch (v1.3.8–v1.3.12) set `Cost1_Amount` to **0** and attempted to bypass zero-amount rejects or force the zero consumer; the grade saved but the upgrade UI and Back button remained stuck.

The new patch leaves the display prices at **0**, but changes ONLY four instructions inside **`CostumeController.TryGradeUpCostume`** to run the original **positive 1-shard transaction**, using the game's own **`CostumeManager.AddCostumePiece(int costumeID,long amount)`** API to temporarily supply one shard. It then calls the original unchanged `TryConsumeCostumePiece(id,1)`. That is the sequence requested by the user; no generic inventory deduction function is changed.

## Exact verified instruction edits (game VA and ARM64 bytes)

| Address | Original | v1.3.14 | Reason |
| --- | --- | --- | --- |
| `0x02848460` | `d7 12 40 f9` (LDR X23,[X22,#0x20]) | `37 00 80 d2` (MOV X23,#1) | Upgrade internally costs 1 despite 0 price in asset |
| `0x02848478` | `11 18 00 94` (BL HasEnoughPieces) | `9f 31 00 94` (BL AddCostumePiece) | Credit +1 for the **same selected character** |
| `0x0284847C` | `20 1a 00 36` (TBZ W0,#0,fail) | `1f 20 03 d5` (NOP) | AddCostumePiece returns void; do not test stale return register |
| `0x02848484` | `d3 12 40 f9` (LDR X19,[X22,#0x20]) | `33 00 80 d2` (MOV X19,#1) | The original consumer deducts the temporary 1 |

The original nearby instruction `BL TryConsumeCostumePiece` at `0x0284849C` remains **unchanged**, as do its success/failure and grade-up notification callbacks. The `AddCostumePiece` target is VA `0x02854AF4`, confirmed in the original game's IL2CPP metadata, and it calls `CostumePiece.AddPieces` at `0x02854E7C`; `AddPieces` stores the higher balance and invokes `AddCostumePieceAcquired`. The unchanged lower consumer at `0x02854ED4` decrements 1 and triggers `AddCostumePieceSpent`. For a successful upgrade, **starting shard balance = ending shard balance**.

## Source integrity and independent patches

- Pinned original game: 26.2.0 ARM64 `libil2cpp.so`, **83,724,712** bytes, SHA-256 `88b591e6099c55b1147b865847a14651b108f9bd6837707371766a054c8df443`.
- The four original/edited instruction patterns are checked and normalized before the existing full-library SHA check. They support reapplying patch modules and coexist with the existing Return, free trait, and optional Blaster/Hana patch.
- `Free Hero Upgrade (0 Shards)` preserves its own 144-row SHA-verified zero-price asset edit. The separate 1-shard fallback must **remain disabled**.
- Working `Free Tickets & Return`, including the confirmed zero-cost teleport and 50 display default, is **unchanged**.

## Remaining risk: gameplay validation

Native static checks and build success **do not** guarantee the star-upgrade UI finishes correctly; it needs a real Android test.

- This is a tightly scoped experimental patch. A crash, forced closure, or consumer failure between the temporary credit and subsequent deduction could leave **+1 shard** unexpectedly. If credit fails for a missing/invalid costume, its success branch is deliberately not taken, but this could produce a failed upgrade path.
- The temporary `AddCostumePieceAcquired(+1)` event may briefly update the piece display before the subsequent `Spent(1)` event. Exact UI timing and online save behavior remain unknown.
- **Do not uninstall or clear app data** to try it. Back up or verify cloud sync before replacing the game. Test a single grade at a starting balance of zero, then check: new star renders immediately, Back works without restart, no shard balance change, Return still works.
- If it still fails, preserve original game/save and report the exact screen and balance changes. Do not label it confirmed working without that test.
