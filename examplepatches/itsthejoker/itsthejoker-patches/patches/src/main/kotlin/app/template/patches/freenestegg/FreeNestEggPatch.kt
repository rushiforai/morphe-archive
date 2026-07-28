package app.template.patches.freenestegg

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST
import com.android.tools.smali.dexlib2.Opcode

/**
 * Bypasses the server-side cooldown gate on the existing "collect nest egg" (free-bird
 * claim) button so it fires the claim coroutine on every tap, regardless of how much
 * cooldown time remains.
 *
 * ## Background — the gift mechanism
 *
 * Roost Social grants free birds through two server-side paths:
 *  1. **Store gifts** — free or purchasable birds in the in-app shop.
 *  2. **Airdrop / nest-egg claim** — a periodic free-bird grant triggered by the
 *     "collect nest egg" button already present in the bird-collection screen.
 *
 * The airdrop flow (all server-authoritative):
 *  - Button tap → `collectNestEgg` lambda (`Q8.a0` / `Q8.C1113a0`, case 3)
 *  - Lambda checks `P7.j.alreadyClaimed` (field `a:Z`); if true, bails.
 *  - Lambda calls `P7.j.a(currentTimeMillis): Long` to get milliseconds remaining on the
 *    cooldown timer; if > 0, shows a countdown UI instead of claiming.
 *  - If cooldown ≤ 0: launches `P7.e` coroutine → `B1.b()` →
 *    Firebase callable `checkLoginAirdropHTTP` → server grants a new bird and resets the
 *    cooldown.
 *
 * ## What this patch does
 *
 * The cooldown gate in smali (`Q8/a0.1.smali`, `:pswitch_19`) is:
 * ```smali
 * invoke-virtual {v3, v4, v5}, LP7/j;->a(J)J   # cooldownRemaining = state.a(now)
 * move-result-wide v3
 * const-wide/16 v5, 0x0
 * cmp-long v5, v3, v5                           # compare remaining vs 0
 * if-lez v5, :cond_5                            # if remaining <= 0 → claim  ← PATCH TARGET
 * # (fall-through: show countdown UI)
 * :cond_5
 * new-instance v2, LP7/e;                       # launch claim coroutine
 * ```
 *
 * We replace the `if-lez` with `goto` so the claim coroutine is always launched.
 * The `alreadyClaimed` guard (line 660) is left intact — the server still controls
 * whether a bird is actually granted; this patch only removes the client-side timer check
 * that prevents the request from even being sent.
 *
 * ## Server validation note
 *
 * `checkLoginAirdropHTTP` is a Firebase Cloud Function. The server enforces its own
 * cooldown and will return an appropriate response (e.g. `{ adopted: false }`) if the
 * player is not yet eligible. This patch causes the client to ask more often; it does
 * not bypass server-side eligibility.
 */
@Suppress("unused")
val freeNestEggPatch = bytecodePatch(
    name = "Free Nest Egg (bypass claim cooldown)",
    description = "Removes the client-side cooldown timer check on the nest-egg free-bird " +
        "claim button so the claim request is sent to the server on every tap. The server " +
        "still controls eligibility; this only stops the client from blocking the request.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    execute {
        CollectNestEggCooldownFingerprint.method.apply {
            // instructionMatches[0] = invoke-virtual LP7/j;->a(J)J  (cooldown-remaining call)
            // +1 = move-result-wide
            // +2 = const-wide/16 v5, 0x0
            // +3 = cmp-long v5, v3, v5
            // +4 = if-lez v5, :cond_5   <-- replace this with goto
            val cooldownCallIndex = CollectNestEggCooldownFingerprint.instructionMatches[0].index
            val ifLezIndex = cooldownCallIndex + 4

            val ifLezInstruction = getInstruction(ifLezIndex)
            check(ifLezInstruction.opcode == Opcode.IF_LEZ) {
                "FreeNestEggPatch: expected IF_LEZ at index $ifLezIndex but found " +
                    "${ifLezInstruction.opcode}. The cooldown gate may have moved in this " +
                    "app version — verify Q8/a0.1.smali :pswitch_19."
            }

            // Replace with an unconditional goto to the same label (:cond_5 = claim path).
            replaceInstruction(ifLezIndex, "goto :cond_5")
        }
    }
}
