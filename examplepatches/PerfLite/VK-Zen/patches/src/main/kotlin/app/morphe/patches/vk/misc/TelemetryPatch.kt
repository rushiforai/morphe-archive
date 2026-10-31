package app.morphe.patches.vk.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

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
    description = "Disables MyTracker analytics. VK's internal AppStartReporter / BaseAnalyticsSender are intentionally left intact because they carry notification-sync/heartbeat traffic (stubbing them made the unread badge stick and delayed message pushes)."
) {
    compatibleWith(COMPATIBILITY_VK)

    execute {
        // Prevent MyTracker from initializing
        MyTrackerInitFingerprint.method.apply {
            addInstructions(0, "return-void")
        }

        // Suppress MyTracker event reporting
        MyTrackerTrackEventFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
        MyTrackerTrackEventWithMapFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
    }
}
