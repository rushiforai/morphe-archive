package app.template.patches.materialcapsule.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MATERIAL_CAPSULE_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/** Third-party telemetry components disabled in the manifest. */
private val TRACKER_COMPONENTS = listOf(
    // Google Analytics for Firebase (measurement) — usage/event ping machine.
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/**
 * Collection opt-outs applied as manifest meta-data. Firebase itself stays *initialised*
 * (`FirebaseInitProvider`, `ComponentDiscoveryService` and the app's
 * `FirebaseAnalytics.getInstance(...)` call are all left intact — removing them would crash
 * startup with "Default FirebaseApp is not initialized", the same lesson as Pdb's
 * Crashlytics registrars), but every upload path is switched off with the documented flags.
 */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Removes third-party telemetry at the manifest layer.
 *
 * Material Capsule's only telemetry is **Google Analytics for Firebase** (measurement)
 * plus the Firebase Installations/RemoteConfig infra it rides on; there is no Crashlytics,
 * AppsFlyer, Amplitude, Sentry or other analytics/attribution SDK in the dex. The three
 * measurement components are disabled so no usage events, screen views or install-referrer
 * pings reach Google, and every documented collection flag is forced off. Firebase core is
 * deliberately kept so the app's own `FirebaseAnalytics.getInstance()` /
 * `FirebaseRemoteConfig` calls do not throw.
 */
@Suppress("unused")
val materialCapsuleDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Disables Google Analytics for Firebase measurement and switches off " +
        "Firebase Analytics / Advertising-ID data collection via the official opt-out flags.",
    default = true,
) {
    category("Privacy")
    compatibleWith(MATERIAL_CAPSULE_COMPATIBILITY)

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
            // referrer to the install.
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
