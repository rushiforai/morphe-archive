package app.fakh.patches.cnn

import app.fakh.patches.cnn.shared.Constants.COMPATIBILITY_CNN
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.fakh.patches.shared.gms.mutableClass
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/** Detik Analytics' entry points: recording a screen or an event, and pushing what was recorded. */
private val DETIK_TRACKER_CALLS = setOf("sendEvent", "sendView", "forcePushDataToServer")

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops Detik Analytics and Google Analytics from recording screens and events, and turns off " +
        "Firebase Analytics, Crashlytics, Performance and Sessions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CNN)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        var stubbed = 0
        mutableClass("Lcom/detikcom/detik_analytics/api/DetikTracker;").methods
            .filter { it.name in DETIK_TRACKER_CALLS && it.implementation != null }
            .forEach { method ->
                if (method.returnType == "V") {
                    method.addInstruction(0, "return-void")
                } else {
                    method.addInstructions(
                        0,
                        """
                            const/4 p0, 0x0
                            return-object p0
                        """,
                    )
                }
                stubbed++
            }
        // Two sendEvent overloads, sendView and forcePushDataToServer, plus any synthetic default variants.
        if (stubbed < 4) throw PatchException("CNN Indonesia: expected at least 4 Detik Analytics calls, found $stubbed")

        val tracker = mutableClass("Lcom/google/android/gms/analytics/Tracker;").methods
            .filter { it.name == "send" || it.name == "enableAdvertisingIdCollection" }
        if (tracker.size != 2) throw PatchException("CNN Indonesia: expected 2 Google Analytics calls, found ${tracker.size}")
        tracker.forEach { it.addInstruction(0, "return-void") }
    }
}
