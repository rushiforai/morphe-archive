package app.paresh.patches.teleprompter.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.teleprompter.shared.Constants.COMPATIBILITY_TELEPROMPTER

@Suppress("unused")
val teleprompterPremiumPatch = bytecodePatch(
    name = "Teleprompter Premium",
    description = "Unlocks premium features in Teleprompter Vlog & Scripts app."
) {
    compatibleWith(COMPATIBILITY_TELEPROMPTER)

    execute {
        EntitlementCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
