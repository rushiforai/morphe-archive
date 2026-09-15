package app.template.patches.ffmpeg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FFPMPEG_COMPATIBILITY
import app.template.patches.ffmpeg.DonateFingerprint
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Remove Ads of FFmpeg",
    description = "Unlock donator features and removes ads.",
    default = true
) {
    compatibleWith(FFPMPEG_COMPATIBILITY)

    execute {
        DonateFingerprint.method.apply {
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
