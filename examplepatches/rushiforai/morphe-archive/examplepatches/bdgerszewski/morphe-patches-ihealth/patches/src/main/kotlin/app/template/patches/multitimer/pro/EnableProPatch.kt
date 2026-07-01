package app.template.patches.multitimer.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MULTITIMER

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable PRO",
    description = "Unlocks all PRO features by short-circuiting the purchase status check to always return true.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MULTITIMER)

    execute {
        IsProFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
