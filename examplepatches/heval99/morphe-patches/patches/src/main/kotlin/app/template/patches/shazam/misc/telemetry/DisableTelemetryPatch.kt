package app.template.patches.shazam.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SHAZAM

/**
 * A fingerprint can match an abstract declaration; calling returnEarly() on a
 * method without a body crashes the patcher, so only patch methods that
 * actually have an implementation.
 */
private fun MutableMethod?.returnEarlyIfImplemented() =
    this?.takeIf { it.implementation != null }?.returnEarly()

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables Firebase Analytics event logging and Crashlytics crash reporting."
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    execute {
        // Firebase Analytics event logging.
        FirebaseAnalyticsLogEventFingerprint.method.returnEarlyIfImplemented()

        // Crashlytics: disable collection and neuter every concrete reporting
        // entry point (recordException has two overloads - patch all matches,
        // not just the first).
        CrashlyticsCollectionEnabledFingerprint.method
            .takeIf { it.implementation != null }?.returnEarly(false)
        mutableClassDefByOrNull("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
            ?.methods.orEmpty()
            .filter { it.implementation != null }
            .filter { it.name == "recordException" || it.name == "log" }
            .forEach { it.returnEarly() }
    }
}
