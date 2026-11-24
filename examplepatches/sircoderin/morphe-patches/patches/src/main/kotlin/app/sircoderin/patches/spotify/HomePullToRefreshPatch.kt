package app.sircoderin.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.sircoderin.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Home has a pull-to-refresh implementation that is gated by a remote flag
 * ("android-system-home-evopage:enable_pull_to_refresh"), off for most accounts. The Home page constructor does
 * `swipeRefreshLayout.setEnabled(flags.k())` and, `if (flags.k())`, installs the refresh listener.
 *
 * This forces every result of that flag getter inside the constructor to `true`.
 */
@Suppress("unused")
val homePullToRefreshPatch = patch(
    name = "Home pull to refresh",
    description = "Enables Spotify's built-in pull-to-refresh on the Home feed, which is normally turned off by a server flag.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val method = HomePageConstructorFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        fun ref(i: Int) = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference

        // The flag getter: the invoke whose move-result is the argument of SwipeRefreshLayout.setEnabled(Z).
        val setEnabledIndex = instructions.indices.first {
            ref(it)?.let { r ->
                r.definingClass == "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;" && r.name == "setEnabled"
            } == true
        }
        val flagRegister = (instructions[setEnabledIndex] as FiveRegisterInstruction)
            .registerD
        val moveResultIndex = (setEnabledIndex - 1 downTo 0).first {
            instructions[it].opcode == Opcode.MOVE_RESULT && (instructions[it] as OneRegisterInstruction).registerA == flagRegister
        }
        val getter = ref(moveResultIndex - 1)
        require(instructions[moveResultIndex - 1].opcode == Opcode.INVOKE_VIRTUAL && getter != null &&
            getter.returnType == "Z" && getter.parameterTypes.isEmpty()) {
            "Pull-to-refresh flag getter not found before setEnabled"
        }

        // Every call of the getter in the constructor (setEnabled and the listener install guard), back to front.
        val results = instructions.indices.filter { i ->
            i > 0 && instructions[i].opcode == Opcode.MOVE_RESULT && ref(i - 1)?.let {
                it.definingClass == getter.definingClass && it.name == getter.name &&
                    it.parameterTypes == getter.parameterTypes
            } == true
        }
        require(results.size >= 2) { "Expected at least two reads of the pull-to-refresh flag, found ${results.size}" }
        for (i in results.reversed()) {
            val register = (instructions[i] as OneRegisterInstruction).registerA
            // const/4 only reaches v0..v15.
            val const = if (register <= 15) "const/4" else "const/16"
            method.addInstruction(i + 1, "$const v$register, 0x1")
        }
    }
}
