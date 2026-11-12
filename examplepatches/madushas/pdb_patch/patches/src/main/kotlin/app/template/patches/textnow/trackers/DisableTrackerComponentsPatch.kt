package app.template.patches.textnow.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Third-party telemetry components disabled in TextNow 26.45.0.0's manifest.
 * (The 6.1.0.1 list — Crashlytics, Google Analytics v3, Flurry — is gone in this
 * build; the surviving trackers are Firebase measurement, AppsFlyer attribution and
 * Facebook app-events.)
 *
 * Firebase core (`FirebaseInitProvider`, `ComponentDiscoveryService`) and FCM push
 * are deliberately **not** in this list — push must keep working.
 */
private val TRACKER_COMPONENTS = listOf(
    // Google Analytics for Firebase (measurement pipeline).
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver",
    // AppsFlyer attribution (install referrer capture).
    "com.appsflyer.referrer.INSTALL_PROVIDER",
    // Facebook auto-initialisation (app-events + codeless tracking).
    "com.facebook.internal.FacebookInitProvider",
)

/** Firebase / Google-Analytics / Facebook collection opt-outs. */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)

/**
 * Removes TextNow 26.45.0.0's third-party telemetry at the manifest layer: Firebase
 * measurement components, the AppsFlyer install-referrer provider and Facebook's
 * auto-init provider are disabled, and the Firebase/GA/Facebook collection opt-outs
 * are set (the Facebook `AutoLogAppEventsEnabled` meta already exists in the manifest
 * and is flipped to false). FCM push is untouched. The AppsFlyer SDK entry points are
 * no-op'ed by [textnowDisableTrackersPatch].
 */
@Suppress("unused")
val textnowDisableTrackerComponentsPatch = resourcePatch(
    name = "Disable tracker components",
    description = "Disables Firebase measurement, the AppsFlyer install-referrer provider " +
        "and Facebook auto-init components, and sets the Firebase/GA/Facebook collection " +
        "opt-outs. FCM push is kept.",
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
