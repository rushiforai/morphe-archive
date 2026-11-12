package app.template.patches.hutch.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.HUTCH_COMPATIBILITY
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/**
 * Analytics components that ship enabled in Hutch's manifest. Google Analytics
 * for Firebase (via @react-native-firebase) is the only third-party telemetry
 * found in the app — no Crashlytics, AppsFlyer, Adjust or CleverTap.
 *
 * The Firebase messaging components (`io.invertase.firebase.messaging.*`,
 * `FirebaseInstanceIdReceiver`, `FirebaseMessagingService`) are deliberately
 * **untouched** — push notifications are a feature, not telemetry.
 */
private val ANALYTICS_COMPONENTS = listOf(
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/**
 * Firebase/Google Analytics documented opt-out flags, flipped from the app's
 * default `true` values. Setting `firebase_analytics_collection_enabled=false`
 * is the SDK's own kill switch: collection stops before any event is uploaded.
 */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "google_analytics_automatic_screen_reporting_enabled" to "false",
    "google_analytics_default_allow_analytics_storage" to "false",
    "google_analytics_default_allow_ad_storage" to "false",
    "google_analytics_default_allow_ad_user_data" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Advertising-ID permissions. Removing them is the documented way to make Play
 * services hand back a zeroed advertising ID to any SDK that asks.
 */
private val AD_ID_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
)

/**
 * Turns off Firebase/Google Analytics telemetry: the measurement components are
 * disabled, every collection flag is flipped to its opt-out value, and the
 * advertising-ID permissions are dropped. Push (FCM/HMS) is left intact.
 */
@Suppress("unused")
val hutchDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Disables Google Analytics for Firebase collection (the app's only " +
        "third-party analytics) and removes the advertising-ID permissions. Push " +
        "notifications keep working.",
    default = true,
) {
    compatibleWith(HUTCH_COMPATIBILITY)

    execute {
        document(MANIFEST).use { doc ->
            // 1. Disable the measurement components.
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in ANALYTICS_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "provider" || el.tagName == "receiver") {
                        el.setAttribute("android:exported", "false")
                    }
                }
            }

            // 2. Flip the collection meta-data to their opt-out values.
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

            // 3. Remove the advertising-ID permissions.
            val permissions = doc.getElementsByTagName("uses-permission")
            val toRemove = mutableListOf<Element>()
            for (i in 0 until permissions.length) {
                val el = permissions.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in AD_ID_PERMISSIONS) toRemove += el
            }
            toRemove.forEach { it.parentNode.removeChild(it) }
        }
    }
}
