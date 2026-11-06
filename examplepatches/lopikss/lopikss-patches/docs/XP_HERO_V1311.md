# XP Hero 26.2.0 — fix zero-shard star-upgrade flow and free Return grants

This change is pinned to the **original ARM64 game binary** (83,724,712 bytes, SHA-256 `88b591e6099c55b1147b865847a14651b108f9bd6837707371766a054c8df443`). Both proposed edits were compared with read-only disassembly of the **original** XP Hero 26.2.0 XAPK in GitHub Actions. Runtime gameplay validation on an Android device is still required.

## Hero star upgrade: preserve the actual zero-amount transaction

User report: tapping Upgrade with a 0-shard cost plays a sound and upgrades successfully in the save, but the UI does not show completion and no app controls respond until restarting.

The original `CostumeManager.TryGradeUp` calls `HasEnough(cost)` at VA `0x02847E9C`, validates the return value via `TBZ w0,#0` at `0x02847EA0`, then skips the debit operation entirely with `CMP X22,#1; B.LT` at `0x02847EA4..0x02847EA8` for a zero cost. The older v1.3.8–1.3.10 patches incorrectly bypassed the earlier `TBZ` check, so they never executed the normal transaction that follows the spend branch.

The referenced `HasEnough` method (VA `0x02A34F04`) compares current inventory count against required count using `CMP X0,X19; CSET W0,GE`. Zero cost already passes when inventory is nonnegative, so the bypass was unnecessary.

The updated free-upgrade module **restores** the original validation branch and **NOPs only** the `B.LT` that skips the actual `TryConsume(0)` method call at VA `0x02847EBC`. That method follows the normal consumption/notification flow, rather than simply forcing success after skipping it. The resource cost remains zero and no positive shard balance is deducted.

- Changed game offset `0x02843EA8`: original `2b 01 00 54`, experimental free `1f 20 03 d5`.
- Prior altered offset `0x02843EA0` returns to original `a0 1a 00 36` in new output.
- Original and legacy star instruction variants are recognized by the verifier and normalized to the verified original SHA.

## Return tickets: daily grant without active paid pass

The previous module redirected `HomeReturnPortalPassController.ResetDailyTickets` to grant free inventory ID **7002**, but the on-daily-reset caller at VA `0x024C4C48` skipped that method whenever the pass object was null or the paid pass was inactive. Therefore accounts without a paid pass could receive **zero actual free tickets**, regardless of the configured count.

The new native patch changes only two no-pass/inactive-pass **branch destinations**, so both reach the existing free-ticket reset at VA `0x024C4CF0`. The original active-paid-pass flow is left intact.

- Offset `0x024C0CD0`: `cbz x0, 0x024C4D64` -> `cbz x0, 0x024C4CF0`, bytes `a0 04 00 b4` -> `00 01 00 b4`.
- Offset `0x024C0CDC`: `tbz w0,#0, 0x024C4D64` -> `tbz w0,#0, 0x024C4CF0`, bytes `40 04 00 36` -> `a0 00 00 36`.

This grants tickets on **actual daily reset**, so it does not guarantee an immediate ticket inventory grant on the day the patch is first installed. Store payment offers and Google Play purchase status are not altered.

## Required Android device tests

1. Select Free Hero Upgrade (0 Shards), not the 1-Shard fallback. With zero shards, upgrade one star. Confirm visual completion, UI responsiveness, and zero shard reduction without reopening the app.
2. With Free Tickets & Return selected, check free Return ticket balance **after the next actual game daily reset** on an account without an active paid pass. Confirm it reflects the configured grant.
3. Tap Return, confirm portal travel proceeds and decreases item 7002 by one. Check that paid purchase offers remain unchanged.
4. Check other selected modules (shop, runes, traits, Blaster/Hana unlock, etc.). Preserve saves; do not uninstall the installed game unless save sync/backup is independently confirmed.

**Status:** Compiled and original-binary statically verified when CI passes; *not yet game-tested*. Do not mark either UI issue fully resolved without the above tests.
