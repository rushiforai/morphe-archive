package app.template.patches.intervaltimer.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_INTERVALTIMER
import org.w3c.dom.Element

// Interval Timer logs through its own AndroidAnalytics wrapper into Firebase Analytics, and
// reports non-fatal errors to Crashlytics. Both SDKs are R8-renamed (FirebaseCrashlytics keeps
// only getInstance and recordException, no runtime collection switch), so their manifest switches
// are the stable way to turn them off. The stock manifest sets none of these keys. Remote Config,
// which drives the app's ad and feature flags, is left alone.

/**
 * Turns off Firebase Analytics (permanently), advertising ID collection and Crashlytics report
 * upload through their manifest switches.
 */
@Suppress("unused")
val disableTelemetryPatch = resourcePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_INTERVALTIMER)

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
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
            )) {
                // Overwrite in place should a later build ship one of these keys.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}
