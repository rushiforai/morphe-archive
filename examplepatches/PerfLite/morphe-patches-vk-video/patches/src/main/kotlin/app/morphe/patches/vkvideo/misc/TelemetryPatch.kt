package app.morphe.patches.vkvideo.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO

internal object MyTrackerInitFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "initTracker",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/app/Application;")
)

internal object MyTrackerTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object MyTrackerTrackEventWithMapFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;")
)

@Suppress("unused")
val telemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables MyTracker and embedded analytics trackers."
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    execute {
        MyTrackerInitFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        MyTrackerTrackEventFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        MyTrackerTrackEventWithMapFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }
    }
}
