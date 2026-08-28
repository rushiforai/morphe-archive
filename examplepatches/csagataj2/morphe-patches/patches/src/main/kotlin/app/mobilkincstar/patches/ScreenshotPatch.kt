package app.mobilkincstar.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mobilkincstar.patches.shared.Constants.COMPATIBILITY_MOBILKINCSTAR

@Suppress("unused")
val screenshotPatch = bytecodePatch(
    name = "Disable Screenshot Protection",
    description = "Allows taking screenshots and screen recording in MobilKincstár.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOBILKINCSTAR)

    execute {
        // Target the Java-side check in React Modal that sets FLAG_SECURE
        ReactModalScreenshotFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
