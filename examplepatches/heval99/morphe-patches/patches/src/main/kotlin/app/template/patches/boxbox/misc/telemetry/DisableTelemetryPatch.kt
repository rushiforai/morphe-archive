package app.template.patches.boxbox.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.morphe.util.returnEarly

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables AppsFlyer, Firebase Analytics and Crashlytics event logging."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        AppsFlyerLogEventFingerprint.methodOrNull?.returnEarly()
        FirebaseAnalyticsLogEventFingerprint.methodOrNull?.returnEarly()
        FirebaseCrashlyticsLogExceptionFingerprint.methodOrNull?.returnEarly()
    }
}
