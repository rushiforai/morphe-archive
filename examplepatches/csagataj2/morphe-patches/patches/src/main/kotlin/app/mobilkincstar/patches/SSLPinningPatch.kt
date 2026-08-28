package app.mobilkincstar.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mobilkincstar.patches.shared.Constants.COMPATIBILITY_MOBILKINCSTAR

@Suppress("unused")
val sslPinningPatch = bytecodePatch(
    name = "Disable SSL Pinning",
    description = "Disables SSL certificate pinning in MobilKincstár, allowing traffic interception.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOBILKINCSTAR)

    execute {
        SSLPinningFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
