package app.template.patches.atresplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ATRESPLAYER

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Skips the video ads requested through the Google IMA SDK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ATRESPLAYER)

    execute {
        // The app already handles an empty ads response by playing the main video.
        // Forcing the response to be empty makes it take that path every time.
        ImaRequestAdsFingerprint.method.addInstructions(
            0,
            """
                const-string p0, ""
            """
        )
    }
}
