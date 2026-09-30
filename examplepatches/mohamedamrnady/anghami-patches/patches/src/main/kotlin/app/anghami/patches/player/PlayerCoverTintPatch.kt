package app.anghami.patches.player

import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Player: remove the album-cover background tint.
 *
 * The player's background is coloured from the current song in exactly one
 * place — `com.anghami.player.ui.l.L0()V` (PlayerFragment), which feeds
 * `Song.hexColor` (a server-supplied per-song hex) into `g9/i.s(...)`.
 * When that hex is empty, `g9/i.s` instead extracts the dominant colour
 * from the cover bitmap; either way it ends at
 * `view.setBackgroundColor(colour)` applied to `player/ui/d.e`, the
 * inflated `layout_player` root (`g9/i.smali:3557-3570`).
 *
 * The `g9/i.s(...)` range-invoke and its `move-result-object` are replaced
 * by `const/4 v0, 0x0`, so:
 *  - the cover colour is never computed and never applied;
 *  - the disposable field `player/ui/l.n` becomes null, which its own
 *    `if-eqz` dispose guard already tolerates;
 *  - the rest of `L0()` (the TimeSpentTracker bookkeeping after
 *    `:cond_1`) still runs.
 *
 * This removes cover-derived backgrounds in BOTH day and night mode — it is
 * not a "light mode only" change. The replacement is unconditional (no
 * uiMode branch), so light and dark get identical treatment: no per-song
 * color anywhere on the player.
 *
 * Scope: the hook sits in `L0()` rather than in `g9/i.s` on purpose.
 * `g9/i.s` has a second caller, `V5/c` (an `app/base/r` screen), and
 * patching the shared helper would silently strip that screen's theming
 * too. The other player-side cover-colour writes are the ad pages
 * (`F8/n` pswitch_b, `F8/Y` pswitch_a); those are left alone because the
 * ad card forces its own black background.
 *
 * Pair with the "Player theme background" resource patch, which repoints
 * the player chrome at the app's day/night roles.
 */
@Suppress("unused")
val removePlayerCoverTintPatch = bytecodePatch(
    name = "Player: remove cover-art tint",
    description = "Stops the player background from being tinted by the current album cover, in both day and night mode.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    category("Experimental")

    execute {
        val l0 = PlayerCoverTintFingerprint.method
        val instructions = l0.implementation!!.instructions
        // `invoke-static/range` is dex format 3rc, NOT 35c — a 35c cast
        // silently yields nothing here. ReferenceInstruction covers both.
        val g9Calls = instructions.mapIndexedNotNull { index, ins ->
            val reference = (ins as? ReferenceInstruction)?.reference as? MethodReference
            if (reference?.definingClass == "Lg9/i;") {
                index to "${ins.opcode} ${reference.name}(" +
                    reference.parameterTypes.joinToString("") + ")"
            } else {
                null
            }
        }
        val tintCalls = g9Calls.filter { it.second.startsWith("INVOKE_STATIC_RANGE s(") }
        check(tintCalls.size == 1) {
            "expected exactly 1 g9/i.s range-invoke in PlayerFragment.L0, found ${tintCalls.size}; g9/i calls: $g9Calls"
        }
        val callIndex = tintCalls[0].first
        check(instructions[callIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
            "expected move-result-object after g9/i.s, found ${instructions[callIndex + 1].opcode}"
        }
        // Drop the trailing instruction first so the call index stays valid.
        l0.removeInstruction(callIndex + 1)
        l0.replaceInstructions(callIndex, "const/4 v0, 0x0")
    }
}
