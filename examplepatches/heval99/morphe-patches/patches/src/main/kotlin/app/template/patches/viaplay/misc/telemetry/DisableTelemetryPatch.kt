package app.template.patches.viaplay.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_VIAPLAY
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated

/**
 * Viaplay reports crashes and performance through Firebase Crashlytics and Performance, usage
 * through Firebase Analytics and its own "Cronos" event tracker, playback quality through NPAW
 * (Youbora) and audience measurement through Nielsen.
 *
 * The CSE playback and ad beacons (player.cse), the OneTrust consent flow and continue watching
 * are not touched.
 *
 * Verified 2026-10-29 against 26.42.1 (versionCode 2642010): see COMPATIBILITY_VIAPLAY.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_VIAPLAY)

    execute {
        // 1. Crashlytics: automatic data collection reads as off, so no crash report is sent.
        CrashlyticsDataCollectionFingerprint.method.returnEarly(false)

        // 2. Firebase Performance: monitoring reads as off, so no trace or metric is collected.
        PerformanceMonitoringEnabledFingerprint.method.returnEarly(false)

        // 3. Firebase Analytics: the "firebase_analytics_collection_deactivated" manifest read
        // answers true, so measurement never starts. The stock manifest does not set it.
        forceAnalyticsDeactivated()

        // 4. NPAW: the plugin is never initialised. NpawPluginProvider.getInstance() stays null and
        // every reader skips it.
        NpawInitializeFingerprint.method.returnEarly()

        // 5. Nielsen: no AppSdk is created. The wrapper's AppSdk field stays null and every use
        // of it is null-checked.
        NielsenInitializeFingerprint.method.returnEarly()

        // 6. Cronos: the event dispatcher returns at once, so no Cronos session is opened and no
        // event is posted.
        CronosDispatchFingerprint.method.returnEarly()
    }
}
