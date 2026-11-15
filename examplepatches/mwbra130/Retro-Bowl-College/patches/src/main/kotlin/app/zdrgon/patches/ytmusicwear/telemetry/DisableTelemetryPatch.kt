package app.zdrgon.patches.ytmusicwear.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * YouTube Music (Wear OS) — Disable network telemetry.
 *
 * The stock manifest ships the Cronet networking stack's telemetry
 * switch turned ON (verified by reading the decoded manifest of
 * 9.45.41-WEAR_RELEASE on 2026-11-14):
 *
 *     <meta-data android:name="android.net.http.EnableTelemetry"
 *                android:value="true" />
 *
 * Cronet (the Chromium network library the app routes its traffic
 * through) reads this application meta-data and, when true, collects
 * and uploads network telemetry. This patch flips the value to false
 * — the library's own off switch, nothing is stubbed or removed.
 *
 * Scope, stated plainly so the patch does not overclaim:
 * - This covers Cronet's network telemetry only.
 * - Firebase Analytics needs no patch in this build: Google already
 *   ships the Wear manifest with
 *   firebase_analytics_collection_enabled=false (verified in the same
 *   manifest read), even though the Firebase SDK is present in the dex.
 * - Google Play services telemetry (Clearcut, GMS measurement) is not
 *   app-side code; with the "GmsCore support" patch applied those
 *   calls route to MicroG, which does not upload them.
 * - YouTube's own event logging (GEL) has no client-side off switch:
 *   its sampling verdicts are computed in native code from
 *   server-supplied configuration
 *   (LogSamplerImpl.nativeShouldCollect), so there is no honest
 *   client gate to pin.
 *
 * Hard failure if the meta-data is missing or not currently "true":
 * a build that changed either fact must not silently ship unpatched.
 */
@Suppress("unused")
val disableTelemetryWearPatch = resourcePatch(
    name = "Disable network telemetry",
    description = "Turns off the Cronet networking library's telemetry in the Wear OS app (its manifest switch ships set to true). Does not affect playback, downloads, or sign-in.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        document("AndroidManifest.xml").use { doc ->
            val metaData = doc.getElementsByTagName("meta-data")
            var flipped = 0
            for (i in 0 until metaData.length) {
                val element = metaData.item(i) as Element
                if (element.getAttribute("android:name") == "android.net.http.EnableTelemetry") {
                    val current = element.getAttribute("android:value")
                    if (current != "true") {
                        throw PatchException(
                            "YT Music Wear telemetry: EnableTelemetry is '$current', expected 'true'; " +
                                "refusing to guess at a changed manifest."
                        )
                    }
                    element.setAttribute("android:value", "false")
                    flipped++
                }
            }
            if (flipped == 0) {
                throw PatchException("YT Music Wear telemetry: android.net.http.EnableTelemetry meta-data not found in the manifest.")
            }
            logger.info("YT Music Wear telemetry: android.net.http.EnableTelemetry flipped to false.")
        }
    }
}
