package app.template.patches.shima.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.SHIMA_COMPATIBILITY
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/**
 * Telemetry components disabled in the manifest. Shima+ 0.5.1 declares **none** of the
 * Google Analytics for Firebase measurement components (verified: no
 * `AppMeasurementReceiver` / `AppMeasurementService` / `AppMeasurementJobService`, and no
 * `com.google.firebase.*` / Crashlytics / AppsFlyer / Sentry classes in the dex). The list
 * is kept so the patch also neutralises them if a future build declares them.
 */
private val TRACKER_COMPONENTS = listOf(
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/**
 * Collection opt-outs applied as manifest meta-data. Shima+ declares no Firebase /
 * analytics meta-data at all, so all flags are added defensively.
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
 * Shima+ bundles **no telemetry SDK** (single dex, no Firebase/Crashlytics/AppsFlyer/
 * Sentry — its only third-party SDKs are Play Billing and the Play app-update API). This
 * patch disables any declared Google measurement component, adds the official
 * collection opt-out flags so nothing can start reporting, and drops the install-referrer
 * permission so Play cannot attach an attribution referrer.
 */
@Suppress("unused")
val shimaDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Adds the official analytics/Crashlytics collection opt-out flags, " +
        "disables any Google measurement component and removes the install-referrer " +
        "permission. Shima+ itself ships no telemetry SDK.",
    default = true,
) {
    compatibleWith(SHIMA_COMPATIBILITY)

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
            // referrer to the install (not declared by Shima+ 0.5.1 — defensive).
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
