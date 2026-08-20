package app.template.patches.sofascore.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.util.returnEarly

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables AppsFlyer, Firebase Analytics, Crashlytics, and Adjust telemetry."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // AppsFlyer
        AppsFlyerLogEventFingerprint.methodOrNull?.returnEarly()

        // Firebase Analytics
        FirebaseAnalyticsLogEventFingerprint.methodOrNull?.returnEarly()

        // Crashlytics
        CrashlyticsLogExceptionFingerprint.methodOrNull?.returnEarly()

        // Adjust
        AdjustTrackEventFingerprint.methodOrNull?.returnEarly()

        // Generic analytics dispatch
        AnalyticsDispatchFingerprint.methodOrNull?.returnEarly()
    }
}
