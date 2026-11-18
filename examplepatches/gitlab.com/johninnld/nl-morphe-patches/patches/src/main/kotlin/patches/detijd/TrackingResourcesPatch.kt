package patches.detijd

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val applications = manifest.getElementsByTagName("application")
            check(applications.length == 1) { "De Tijd application declaration changed" }
            val application = applications.item(0) as Element
            val nodes = application.getElementsByTagName("meta-data")
            val metadata = (0 until nodes.length).map { nodes.item(it) as Element }
                .filter { it.parentNode == application }
            mapOf(
                "firebase_analytics_collection_enabled" to ("true" to "false"),
                "firebase_analytics_collection_deactivated" to ("false" to "true"),
                "google_analytics_adid_collection_enabled" to ("true" to "false"),
                "google_analytics_ssaid_collection_enabled" to ("true" to "false"),
                "google_analytics_default_allow_analytics_storage" to ("true" to "false"),
                "google_analytics_default_allow_ad_storage" to ("true" to "false"),
                "google_analytics_default_allow_ad_user_data" to ("true" to "false"),
                "google_analytics_default_allow_ad_personalization_signals" to ("true" to "false"),
            ).forEach { (name, values) ->
                val node = metadata.single { it.getAttribute("android:name") == name }
                check(node.getAttribute("android:value") == values.first) { "De Tijd collection flag changed: $name" }
                node.setAttributeNS(ANDROID, "android:value", values.second)
            }
            check(metadata.single { it.getAttribute("android:name") == "firebase_crashlytics_collection_enabled" }
                .getAttribute("android:value") == "false") { "De Tijd Crashlytics default changed" }
            // Keep Firebase App/Remote Config/Installations/Messaging and the
            // app-wide collection default: anonymous client credentials come
            // from Remote Config, and Airship push depends on Messaging.
        }
    }
}
