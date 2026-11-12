package app.template.patches.glassdoor.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.GLASSDOOR_COMPATIBILITY
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/**
 * Attribution / telemetry components disabled in the manifest.
 *
 * Glassdoor 13.15.1 declares the AppsFlyer install-referrer **receiver + provider**; both are
 * disabled here (the bytecode side is handled by the "Disable AppsFlyer" patch, which no-ops
 * the SDK entry points). `Iterable` components are **push notifications** and are left intact.
 */
private val TRACKER_COMPONENTS = listOf(
    "com.appsflyer.MultipleInstallBroadcastReceiver",
    "com.appsflyer.SingleInstallBroadcastReceiver",
    "com.appsflyer.referrer.INSTALL_PROVIDER",
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/**
 * Collection opt-outs applied as manifest meta-data. Glassdoor declares no Firebase/GA opt-out
 * flags itself, so all are added: Crashlytics (registered as a Firebase component) and every
 * Google Analytics data-collection path are switched off with the official flags.
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
 * Glassdoor bundles **AppsFlyer** (attribution/analytics), **RudderStack** (customer-data
 * pipeline), **Crashlytics** (Firebase component) and **Qualaroo** (in-app surveys). This
 * patch disables the AppsFlyer install-referrer components and any Google measurement
 * component, drops the install-referrer permission and turns Crashlytics + Firebase/Google
 * Analytics collection off via the official opt-out flags. AppsFlyer's bytecode entry points
 * are no-oped by the "Disable AppsFlyer" patch. FCM push (Iterable/Firebase messaging) is
 * kept working.
 */
@Suppress("unused")
val glassdoorDisableTrackerComponentsPatch = resourcePatch(
    name = "Disable tracker components",
    description = "Disables the AppsFlyer install-referrer receiver/provider and any Google " +
        "measurement component, turns Crashlytics and Firebase/Google-Analytics collection " +
        "off, and removes the install-referrer permission. FCM push is kept.",
    default = true,
) {
    compatibleWith(GLASSDOOR_COMPATIBILITY)

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
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    el.getAttribute("android:name") == "com.android.vending.INSTALL_REFERRER"
                ) {
                    el.parentNode.removeChild(el)
                }
            }
        }
    }
}
