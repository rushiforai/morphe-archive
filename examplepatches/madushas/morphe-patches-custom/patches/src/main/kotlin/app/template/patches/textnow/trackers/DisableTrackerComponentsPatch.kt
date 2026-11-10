package app.template.patches.textnow.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Third-party telemetry components disabled in the manifest. Firebase core
 * (`FirebaseInitProvider`, `ComponentDiscoveryService`) and FCM push
 * (`FirebaseMessagingService`, `FirebaseInstanceIdReceiver`, `FirebaseInstanceIdService`)
 * are deliberately **not** in this list — push must keep working.
 */
private val TRACKER_COMPONENTS = listOf(
    // Firebase Crashlytics crash reporter.
    "com.crashlytics.android.CrashlyticsInitProvider",
    // Google Analytics v3.
    "com.google.android.gms.analytics.AnalyticsReceiver",
    "com.google.android.gms.analytics.AnalyticsService",
    "com.google.android.gms.analytics.AnalyticsJobService",
    // Google Analytics for Firebase (measurement pipeline).
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver",
    // Flurry Analytics UI surfaces.
    "com.flurry.android.FlurryBrowserActivity",
    "com.flurry.android.FlurryFullscreenTakeoverActivity",
    "com.flurry.android.FlurryShareActivity",
    "com.flurry.android.FlurryTileAdActivity",
)

/** Firebase / Google-Analytics collection opt-outs. */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Removes TextNow's third-party telemetry at the manifest layer: Crashlytics, Google
 * Analytics v3 and Google Analytics for Firebase measurement components are disabled and
 * the Flurry UI surfaces are disabled; the Firebase/GA collection opt-outs are set. FCM
 * push is untouched. The Adjust / Flurry SDK initialisers are no-op'ed by
 * [textnowDisableTrackersPatch].
 */
@Suppress("unused")
val textnowDisableTrackerComponentsPatch = resourcePatch(
    name = "Disable tracker components",
    description = "Disables Crashlytics, Google Analytics v3, Firebase measurement and " +
        "Flurry components and sets the Firebase/GA collection opt-outs. FCM push is kept.",
    default = true,
) {
    compatibleWith(TEXTNOW_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in TRACKER_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "provider") el.setAttribute("android:exported", "false")
                }
            }

            val application = doc.getElementsByTagName("application").item(0) as Element
            val metas = doc.getElementsByTagName("meta-data")
            val handled = mutableSetOf<String>()
            for (i in 0 until metas.length) {
                val el = metas.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in OPT_OUTS) {
                    el.setAttribute("android:value", OPT_OUTS.getValue(name))
                    handled += name
                }
            }
            for ((name, value) in OPT_OUTS) {
                if (name in handled) continue
                val meta = doc.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
        }
    }
}
