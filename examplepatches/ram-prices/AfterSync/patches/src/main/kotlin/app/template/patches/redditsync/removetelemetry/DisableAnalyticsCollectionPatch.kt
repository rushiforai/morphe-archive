package app.template.patches.redditsync.removetelemetry

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * The app bundles a real Firebase project (confirmed via res/values/strings.xml:
 * google_app_id, google_api_key, project_id, etc. are genuine, not placeholders) with
 * Firebase Analytics present as an auto-initializing SDK. Confirmed via smali: no
 * app code calls FirebaseAnalytics/AppMeasurement directly, so disabling collection
 * via the officially-supported manifest meta-data flag carries no crash risk — the
 * SDK stays present and initialized (Firebase Functions/RemoteConfig/Installations
 * still needed for other patches in this bundle stay untouched), it just stops
 * collecting/sending usage data.
 */
val disableAnalyticsCollectionPatch = resourcePatch(
    name = "Remove telemetry (resources)",
    description = "Disables Firebase Analytics data collection in Sync for Reddit. Unlike " +
        "most \"(resources)\"-suffixed patches in this project, this one is safe to use " +
        "on its own — see \"Remove telemetry\" for the broader bytecode patch that also " +
        "disables Crashlytics and a device/account registration call, and depends on " +
        "this one rather than the other way around.",
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: error("Could not find the <application> element in AndroidManifest.xml.")

            val metaData = document.createElement("meta-data")
            metaData.setAttributeNS(ANDROID_NS, "android:name", "firebase_analytics_collection_enabled")
            metaData.setAttributeNS(ANDROID_NS, "android:value", "false")

            application.appendChild(metaData)
        }
    }
}
