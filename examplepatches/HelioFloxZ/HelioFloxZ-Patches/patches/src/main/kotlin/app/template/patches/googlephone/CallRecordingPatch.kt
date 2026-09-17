package app.template.patches.googlephone

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.Constants.GOOGLE_PHONE_COMPATIBILITY

@Suppress("unused")
val callRecordingPatch = bytecodePatch(
    name = "Call recording support",
    description = "Enables the Google Phone call-recording eligibility check.",
    default = true,
) {
    compatibleWith(GOOGLE_PHONE_COMPATIBILITY)

    execute {
        CallRecordingCountryGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
