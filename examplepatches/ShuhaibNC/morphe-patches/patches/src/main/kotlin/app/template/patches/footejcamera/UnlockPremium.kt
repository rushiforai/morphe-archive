package app.template.patches.footejcamera

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FOOTEJ_COMPATIBILITY
import app.template.patches.footejcamera.PremiumFingerprint
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Footej Camera Premium",
    description = "All Premium features are unlocked.",
    default = true
) {
    compatibleWith(FOOTEJ_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        PremiumFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
