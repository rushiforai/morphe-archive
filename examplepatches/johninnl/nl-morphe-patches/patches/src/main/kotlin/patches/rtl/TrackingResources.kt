package patches.rtl

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
                "firebase_performance_logcat_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false)
            for ((name, value) in flags) {
                val matches = nodes.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate RTL measurement flag: $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(namespace, "android:name", name)
                    app.appendChild(it)
                }
                node.setAttributeNS(namespace, "android:value", value.toString())
            }
            val permissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID", "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.AD_SERVICES_CONFIG")
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
            check(removed.size == 5) { "RTL advertising-permission inventory changed" }
            removed.forEach { it.parentNode.removeChild(it) }
        }
    }
}
