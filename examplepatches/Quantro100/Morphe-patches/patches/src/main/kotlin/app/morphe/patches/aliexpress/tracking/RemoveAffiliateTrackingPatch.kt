package app.morphe.patches.aliexpress.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object TrackHelperFingerprint : Fingerprint(
    strings = listOf("firebase_event_switch", "app_config"),
    returnType = "V",
)

val removeAffiliateTrackingPatch = bytecodePatch(
    name = "Remove affiliate tracking",
    description = "Removes affiliate tracking parameters from shared links.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        TrackHelperFingerprint.method.apply {
            addInstructions(
                0,
                """
                return-void
                """.trimIndent(),
            )
        }
    }
}
