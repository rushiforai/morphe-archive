package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EXAMPLE

@Suppress("unused")
val examplePatch = bytecodePatch(
    name = "Remove idokep ads",
    description = "Removes ads from the idokep app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EXAMPLE)

    // Business logic of the patch to disable ads in the app.
    execute {
        // AdvertDecisionChain's decision methods return true when an ad should
        // be shown. Force each ad-decision entry point to always return false so
        // no ads are ever displayed. These are fixed-value overrides, so no
        // extension code is required.
        listOf(DecideFingerprint, DecideOnClothesFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
