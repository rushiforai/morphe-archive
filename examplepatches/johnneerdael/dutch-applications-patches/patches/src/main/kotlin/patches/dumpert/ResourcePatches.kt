package patches.dumpert

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val adResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("*")
            val elements = (0 until nodes.length).map { nodes.item(it) as Element }
            for (name in listOf("com.google.android.gms.ads.MobileAdsInitProvider", "com.google.android.gms.ads.AdService")) {
                val found = elements.filter { it.getAttribute("android:name") == name }
                check(found.size == 1) { "Dumpert ad component changed: $name" }
                found.single().setAttributeNS(ANDROID, "android:enabled", "false")
            }
        }
    }
}

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("*")
            val elements = (0 until nodes.length).map { nodes.item(it) as Element }
            val application = elements.single { it.tagName == "application" }
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false,
                "com.facebook.sdk.AutoInitEnabled" to false,
                "com.facebook.sdk.AutoLogAppEventsEnabled" to false,
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to false,
            )
            for ((name, value) in flags) {
                val found = elements.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                check(found.size <= 1) { "Duplicate Dumpert tracking flag: $name" }
                val flag = found.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name)
                    application.appendChild(it)
                }
                flag.setAttributeNS(ANDROID, "android:value", value.toString())
            }
            // Preserve CxSdkInitializer and Facebook/Firebase providers: actual
            // DI, manual login, push, Auth and config dereference these services.
            val permissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION", "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.AD_SERVICES_CONFIG")
            val removed = elements.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
            check(removed.size == 6) { "Dumpert advertising permission inventory changed" }
            removed.forEach { it.parentNode.removeChild(it) }
        }
    }
}
