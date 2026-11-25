package app.jofslash.patches.wikipedia.tracking

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.methodOf
import app.jofslash.patches.wikipedia.shared.returnEarly
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EVENT_PLATFORM_CLIENT = "Lorg/wikipedia/analytics/eventplatform/EventPlatformClient;"
private const val INSTALL_REFERRER_CLIENT = "Lcom/android/installreferrer/api/InstallReferrerClientImpl;"

// Test Kitchen (Wikimedia's metrics client) builds every interaction event in one method, which
// drops the event with this log line when there is no stream config. R8 merges the Test Kitchen
// classes into unrelated ones, so the method is found by the string.
internal object TestKitchenSubmitInteractionFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("No stream config exists for this stream, the event is ignored and dropped."),
)

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops the usage analytics the app sends to Wikimedia (Event Platform and Test Kitchen " +
            "events about what you tap, read and search, and how long you use the app) and the Google " +
            "Play install referrer. The app has no setting for this. Reading, editing, sync and " +
            "notifications keep working.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // Every Event Platform event goes through EventPlatformClient.submit into the queue that is
        // sent to intake-analytics.wikimedia.org. Nothing queued means nothing sent.
        methodOf(EVENT_PLATFORM_CLIENT, "submit").returnEarly()

        // Test Kitchen events go to the same intake through their own queue.
        TestKitchenSubmitInteractionFingerprint.method.addInstructions(0, "return-void")

        // At its first starts the app asks Google Play where it was installed from and reports it
        // as an event.
        methodOf(INSTALL_REFERRER_CLIENT, "startConnection").returnEarly()
    }
}
