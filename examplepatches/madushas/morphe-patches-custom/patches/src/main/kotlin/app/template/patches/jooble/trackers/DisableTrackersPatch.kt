package app.template.patches.jooble.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.JOOBLE_COMPATIBILITY
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/**
 * Attribution / telemetry components disabled in the manifest: the AppsFlyer install-referrer
 * provider, the Facebook SDK content provider (Jooble bundles `flutter_facebook_auth` +
 * Facebook app-events), the Facebook token broadcast receivers and any Google measurement
 * component. FCM push (`FirebaseMessagingService`) is left intact.
 */
private val TRACKER_COMPONENTS = listOf(
    "com.appsflyer.referrer.INSTALL_PROVIDER",
    "com.appsflyer.MultipleInstallBroadcastReceiver",
    "com.appsflyer.SingleInstallBroadcastReceiver",
    "com.facebook.internal.FacebookInitProvider",
    "com.facebook.CurrentAccessTokenExpirationBroadcastReceiver",
    "com.facebook.AuthenticationTokenManager\$CurrentAuthenticationTokenChangedBroadcastReceiver",
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/** Collection opt-outs added as manifest meta-data (Jooble declares none of these). */
private val OPT_OUTS = mapOf(
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_data_collection_default_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/** Facebook SDK switches — auto app-event logging and advertiser-ID collection. */
private val FACEBOOK_OPTS = mapOf(
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
    "com.facebook.sdk.AutoInitEnabled" to "false",
    "com.facebook.sdk.CodelessDebugLogEnabled" to "false",
)

/**
 * Removes telemetry at the manifest layer.
 *
 * Jooble bundles **AppsFlyer** (attribution — also no-oped in bytecode), the **Facebook SDK**
 * (login + app events), **Firebase Analytics** and **Crashlytics**. This patch disables the
 * AppsFlyer referrer provider and the Facebook/measurement components, switches Facebook app
 * events and advertiser-ID collection off, turns Crashlytics + Firebase/Google-Analytics
 * collection off via the official flags, and drops the install-referrer permission. Freshchat
 * (support chat) and FCM push are left working.
 */
@Suppress("unused")
val joobleDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Disables AppsFlyer/Facebook/Google measurement components, switches " +
        "Facebook app events and Firebase/Crashlytics/Google-Analytics collection off, and " +
        "removes the install-referrer permission. Push notifications are kept.",
    default = true,
) {
    compatibleWith(JOOBLE_COMPATIBILITY)

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

            val application = doc.getElementsByTagName("application").item(0) as Element
            val all = OPT_OUTS + FACEBOOK_OPTS
            val metas = doc.getElementsByTagName("meta-data")
            val handled = mutableSetOf<String>()
            for (i in 0 until metas.length) {
                val el = metas.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in all) {
                    el.setAttribute("android:value", all.getValue(name))
                    handled += name
                }
            }
            for ((name, value) in all) {
                if (name in handled) continue
                val meta = doc.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }

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
