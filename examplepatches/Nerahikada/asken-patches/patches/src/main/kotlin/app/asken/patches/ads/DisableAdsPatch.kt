package app.asken.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables all in-app advertising by preventing ad SDK initialization and suppressing ad containers."
) {
    compatibleWith(ASKEN_COMPATIBILITY)

    execute {
        AdjustInitFingerprint.method.addInstruction(0, "return-void")

        AdMobInitFingerprint.method.addInstruction(0, "return-void")

        AdjustOnResumeFingerprint.method.addInstruction(0, "return-void")

        AdjustOnPauseFingerprint.method.addInstruction(0, "return-void")

        AdStatusCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
