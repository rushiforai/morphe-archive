package app.riky.patches.chefkoch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CHEFKOCH

@Suppress("unused")
val removeAnalyticsPatch = bytecodePatch(
    name = "Remove analytics",
    description = "Drops Firebase Analytics events and user properties before they leave " +
        "the app. Other telemetry (Snowplow, Audix) is handled by the Remove tracking patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHEFKOCH)

    execute {
        // logAndTrack() is the only path that writes events/user properties to Firebase.
        LogAndTrackFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
