package app.template.patches.videotomp3

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.VIDEO_COMPATIBILITY
import app.template.patches.videotomp3.*
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium of Video to MP3",
    description = "Enables premium features and functionality in the Video to MP3 application.",
    default = true
) {
    compatibleWith(VIDEO_COMPATIBILITY)

    execute {
        listOf(
            PremiumFingerprint1,
            PremiumFingerprint2
        ).forEach { fingerprint ->
            fingerprint.method.apply {
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
}
