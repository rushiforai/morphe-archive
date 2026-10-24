package app.template.patches.mydialog.trackers

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"

/** Third-party tracker components disabled in the manifest. */
private val TRACKER_COMPONENTS = listOf(
    // Google Analytics for Firebase (measurement) — usage/event ping machine.
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

/**
 * Collection opt-outs applied as manifest meta-data. Push notifications
 * (CTFirebaseMessagingReceiver, Firebase messaging) are deliberately untouched —
 * those are features, not telemetry. FacebookInitProvider must STAY enabled: the
 * app's RN module (FBAppEventsLoggerModule) requires FacebookSdk to have been
 * initialized, and removing the provider crashes RN startup with
 * "The SDK has not been initialized, make sure to call FacebookSdk.sdkInitialize()
 * first" (same lesson as Pdb's Crashlytics registrars). Facebook telemetry is
 * switched off with its documented opt-outs instead.
 */
private val OPT_OUTS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    // GMA app-level switch (in-app ad surfaces are removed separately).
    "com.google.android.gms.ads.AD_MANAGER_APP" to "false",
    // Facebook documented opt-outs (SDK stays initialized for the RN module).
    "com.facebook.sdk.AUTO_LOG_APP_EVENTS_ENABLED" to "false",
    "com.facebook.sdk.ADVERTISER_ID_COLLECTION_ENABLED" to "false",
)

/**
 * Removes third-party telemetry at the manifest layer:
 * Google measurement components disabled, Firebase Analytics/AdID collection
 * switched off, GMA app flag off, Facebook auto-logging/ad-ID off (the Facebook
 * SDK itself must stay initialized — see OPT_OUTS doc).
 * Crashlytics is already opted out by the app itself.
 */
@Suppress("unused")
val myDialogDisableTrackersPatch = resourcePatch(
    name = "Disable trackers",
    description = "Disables Google Analytics measurement and Facebook SDK auto-init, " +
        "and turns off Firebase Analytics/AdID data collection via their official " +
        "opt-out flags.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

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

            // Meta-data values: flip existing ones, add missing ones.
            val application = doc.getElementsByTagName("application").item(0) as Element
            val metas = doc.getElementsByTagName("meta-data")
            val handled = mutableSetOf<String>()
            for (i in 0 until metas.length) {
                val el = metas.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in OPT_OUTS) {
                    el.setAttribute("android:value", OPT_OUTS[name])
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
