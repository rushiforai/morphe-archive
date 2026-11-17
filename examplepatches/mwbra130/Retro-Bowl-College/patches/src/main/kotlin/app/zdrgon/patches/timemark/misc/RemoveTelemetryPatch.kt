package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.timemark.shared.Constants.COMPATIBILITY_TIMEMARK

/**
 * Timemark — Remove telemetry.
 *
 * What telemetry this app actually has (full census in
 * Fingerprints.kt and in the workdir RECON.md, verified 2026-11-16
 * against the exact v10.0.316 XAPK):
 *
 * The analytics platform is SensorsData (694 SDK class references,
 * plus its AB-test and Sensors Focus campaign SDKs). The app's own
 * product analytics — clicks, watermark edits, purchase funnel
 * steps, and location-page events whose properties include the
 * latitude/longitude and the chosen address — are sent through two
 * funnels, and both end in SensorsDataAPI.track:
 *
 *   1. SensorAnalyzeUtil.wrapSensorsTrack (both overloads): the
 *      analytics facade's sinks; every one of its dozens of event
 *      methods (camera clicks, watermark statistics, weather-item
 *      settings, logo-edit pages, take-photo properties with
 *      location detail registered as super properties) ends here.
 *   2. LogService.track (both overloads): the backing service for
 *      the framework logger's track() (Xlog / Lty/h;), called from
 *      all over the app (photo-memory events, team-upload monitors,
 *      auto-save results, attendance events); LogService.monitor()
 *      delegates to it too.
 *
 * This patch pins all four sink methods to return immediately, so
 * no app event reaches SensorsData. The SDK itself stays
 * initialized (the app also reads experiment configuration through
 * it), and the framework logger's local on-device log — which only
 * leaves the phone when the user explicitly sends a feedback
 * report — is untouched.
 *
 * Why there is no manifest half to this patch (unlike the App
 * Finder / ContentCam sets): Timemark's stock manifest declares
 * android:extractNativeLibs TWICE on the <application> element
 * (visible in the aapt2 dump of the exact XAPK). Android tolerates
 * it, but the decoded manifest is not well-formed XML, so every
 * resource patch that opens AndroidManifest.xml dies in the XML
 * parser (SAXParseException, verified on a desktop run of this
 * set). The Sensors Focus campaign provider and the Firebase
 * datatransport upload components therefore cannot be
 * manifest-disabled for this app version; with both event funnels
 * cut, the app produces no analytics events for that plumbing to
 * upload in the first place.
 *
 * Deliberately left alone, and why:
 * - The first-party API reporters on the feature client
 *   (reportDeviceFeature, reportActiveVersion, addEventCount,
 *   saveUserAttribution): suspend calls returning response beans
 *   that feature code consumes — the event counters feed
 *   server-side feature accounting — so they are dual-use feature
 *   traffic, not a clean telemetry funnel (same call made for the
 *   /inf exchange in the App Finder set).
 * - reportWatermarkSaveUsage: the save-quota metering tied to the
 *   photo-save feature itself.
 * - Firebase Messaging (the app's push notifications — a feature),
 *   the place/weather/backup/verify API traffic (the app's
 *   function), and the ad SDKs (ads, not telemetry; out of scope).
 */
@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Stops the app reporting usage to SensorsData: both analytics event funnels (the SensorAnalyzeUtil sinks and the framework logger's LogService sinks) are cut, so no clicks, watermark edits, purchase steps or location-page events leave the device. Camera, backup, weather and all other features are unaffected.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TIMEMARK)

    execute {
        // The analytics facade's sinks.
        WrapSensorsTrackPropsFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )

        WrapSensorsTrackFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )

        // The framework logger's backing sinks.
        LogServiceTrackPropsFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )

        LogServiceTrackFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )
    }
}
