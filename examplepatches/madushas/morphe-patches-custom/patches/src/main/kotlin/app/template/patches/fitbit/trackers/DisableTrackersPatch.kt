package app.template.patches.fitbit.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.FITBIT_COMPATIBILITY
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/**
 * Telemetry components disabled in the manifest. Fitbit 5.11.1 declares **none** of the
 * Google Analytics for Firebase measurement components in its base manifest (verified:
 * no `AppMeasurementReceiver` / `AppMeasurementService` / `AppMeasurementJobService`
 * entry, and the `com.google.android.gms.measurement.*` implementation classes are absent
 * from all eight dex files — only the `com.google.firebase.analytics.connector` AIDL stub
 * is bundled, with no `FirebaseAnalytics` class). The list is kept so the patch also
 * neutralises the measurement components if a future build declares them.
 */
private val TRACKER_COMPONENTS = listOf(
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/**
 * Collection opt-outs applied as manifest meta-data. `firebase_crashlytics_collection_enabled`
 * is already `false` in the shipping manifest and `google_analytics_adid_collection_enabled`
 * is already `false`; both are re-asserted and the remaining documented Firebase /
 * Google-Analytics flags are added.
 *
 * Firebase core stays *initialised* (`FirebaseInitProvider`, `ComponentDiscoveryService`,
 * FCM and Installations are all left intact — removing them would break push and crash
 * startup), but every analytics/ads upload path is switched off with the official flags.
 */
private val OPT_OUTS = mapOf(
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Removes telemetry at the manifest layer.
 *
 * Fitbit's only bundled Firebase telemetry is **Crashlytics** (the manifest opt-out flag
 * is present) plus the Firebase Analytics *connector* stub; there is no Firebase Analytics
 * measurement SDK, no AppsFlyer, Amplitude or Sentry in the dex. This patch disables any
 * declared Google measurement component, forces Crashlytics and Firebase/Google-Analytics
 * collection off, and drops the install-referrer permission so Play cannot attach an
 * attribution referrer. FCM push (`firebase.iid` / `FirebaseMessagingService`) is left
 * untouched.
 */
@Suppress("unused")
val fitbitDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Disables Google Analytics for Firebase measurement components, switches " +
        "Crashlytics and Firebase/Google-Analytics collection off via the official " +
        "opt-out flags, and removes the install-referrer permission. FCM push is kept.",
    default = true,
) {
    compatibleWith(FITBIT_COMPATIBILITY)

    execute {
        document(MANIFEST).use { doc ->
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in TRACKER_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "provider") el.setAttribute("android:exported", "false")
                }
            }

            // Meta-data opt-outs: flip existing values, add any that are missing.
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

            // Install-referrer attribution: drop the permission so Play cannot attach a
            // referrer to the install (not declared by Fitbit 5.11.1 — defensive).
            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") ==
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"
                ) {
                    el.parentNode.removeChild(el)
                }
            }
        }
    }
}
