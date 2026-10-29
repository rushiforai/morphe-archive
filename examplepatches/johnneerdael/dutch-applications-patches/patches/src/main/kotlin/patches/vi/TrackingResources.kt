package patches.vi

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val all = doc.getElementsByTagName("*")
            val nodes = (0 until all.length).map { all.item(it) as Element }
            val app = nodes.single { it.tagName == "application" }
            val namespace = "http://schemas.android.com/apk/res/android"
            val flags = mapOf("firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_performance_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false,
                "com.facebook.sdk.AutoLogAppEventsEnabled" to false,
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to false)
            for ((name, value) in flags) {
                val matches = nodes.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate VI collection flag: $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(namespace, "android:name", name)
                    app.appendChild(it)
                }
                node.setAttributeNS(namespace, "android:value", value.toString())
            }
            val permissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION", "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.AD_SERVICES_CONFIG", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
            check(removed.size == 7) { "VI optional advertising permission inventory changed" }
            removed.forEach { it.parentNode.removeChild(it) }
        }
        document("res/xml/ga_ad_services_config.xml").use { doc ->
            val attribution = doc.getElementsByTagName("attribution")
            check(attribution.length == 1)
            val node = attribution.item(0) as Element
            check(node.getAttribute("allowAllToAccess") == "true")
            node.setAttribute("allowAllToAccess", "false")
        }
    }
}
