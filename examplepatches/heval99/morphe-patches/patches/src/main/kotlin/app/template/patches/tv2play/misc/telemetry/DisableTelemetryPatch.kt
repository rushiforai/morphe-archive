package app.template.patches.tv2play.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TV2PLAY
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated
import org.w3c.dom.Element

/**
 * Turns off Crashlytics, Sessions, Performance and advertising-ID collection through the manifest
 * switches. Firebase Messaging (push) is not touched.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_TV2PLAY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_sessions_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )) {
                // Overwrite a stock entry in place, otherwise add one under <application>.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

/**
 * TV 2 Play reports usage through Google Analytics for Firebase (the full measurement SDK is
 * bundled). The shared bytecode helper forces the "firebase_analytics_collection_deactivated" read
 * to Boolean.TRUE inside the measurement SDK, so it never starts - no automatic first_open /
 * session_start / screen_view and no advertising-ID read - and the manifest switches cover
 * Crashlytics, Sessions and Performance.
 *
 * Bugsnag crash reporting is deliberately left in place: unlike TV 2 Nyheder, this app does not
 * start it from BugsnagContentProvider (that provider only registers a foreground detector) - it
 * constructs the Client inline in PlayApplication.onCreate and stores it in Bugsnag.client. There
 * is no start call to drop, and neutering the Client constructor would leave the app's own
 * BugsnagLogger calling methods on an uninitialised object. Crash reports are diagnostic, not
 * usage analytics. The streaming stack, DRM and the account session are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics.",
) {
    compatibleWith(COMPATIBILITY_TV2PLAY)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        forceAnalyticsDeactivated()
    }
}
