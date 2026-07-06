package app.paresh.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val hidePremiumTabPatch = bytecodePatch(
    name = "Hide Premium tab",
    description = "Hides the Premium tab from the bottom navigation bar."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        PremiumPurchaseSupportedFingerprint.let {
            // Replace iget-object p5, p0, Lqn2/a;->d:Lqn2/l; with const/4 p5, 0x0
            // This makes the premium button null, so it gets filtered by filterNotNull
            val index = it.instructionMatches[0].index
            val reg = it.instructionMatches[0].getInstruction<TwoRegisterInstruction>().registerA
            it.method.replaceInstruction(index, "const/4 v$reg, 0x0")
        }
    }
}
