package mightymich.morphe.patches.com.piriform.ccleaner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

/**
 * Disables CCleaner telemetry / analytics tracking.
 *
 * Nops out TrackingManager track-event entry points so nothing is sent to
 * Avast Burger / Firebase backends.
 *
 * Note: R8 keeps log literals; the real string is "TrackingManager.trackEvent("
 * (with '('), not the bare method name.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry",
    description = "Disables analytics and telemetry event tracking.",
    default = true
) {
    compatibleWith(CCleanerCompatibility.CCLEANER)

    // Primary: method that logs "TrackingManager.trackEvent() - Mapping event "
    val trackEventFingerprint = Fingerprint(
        definingClass = "Lcom/avast/android/cleaner/tracking/TrackingManager;",
        returnType = "V",
        filters = listOf(
            string("TrackingManager.trackEvent() - Mapping event ")
        )
    )

    // Fallback: shorter log tag with opening paren (present in 26.08.0)
    val trackEventAltFingerprint = Fingerprint(
        definingClass = "Lcom/avast/android/cleaner/tracking/TrackingManager;",
        returnType = "V",
        filters = listOf(
            string("TrackingManager.trackEvent(")
        )
    )

    // Strategy handler that can skip events
    val strategyFingerprint = Fingerprint(
        definingClass = "Lcom/avast/android/cleaner/tracking/TrackingManager;",
        returnType = "V",
        filters = listOf(
            string("TrackingManager.handleTrackingStrategy() - Skipping event ")
        )
    )

    execute {
        val ret = "return-void"
        var ok = 0

        for (fp in listOf(trackEventFingerprint, trackEventAltFingerprint, strategyFingerprint)) {
            try {
                fp.method.addInstructions(0, ret)
                ok++
            } catch (_: Exception) {
            }
        }

        if (ok == 0) {
            throw PatchException(
                "Could not find TrackingManager track/strategy methods. " +
                    "Expected log strings TrackingManager.trackEvent(…)."
            )
        }
    }
}
