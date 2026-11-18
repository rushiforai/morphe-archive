package patches.videolandatv

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val all = doc.getElementsByTagName("*")
            val nodes = (0 until all.length).map { all.item(it) as Element }
            val app = nodes.single { it.tagName == "application" }
            for ((name, value) in mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false,
                "com.facebook.sdk.AutoLogAppEventsEnabled" to false,
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to false,
            )) {
                val existing = nodes.filter { it.tagName == "meta-data" &&
                    it.parentNode == app && it.getAttributeNS(namespace, "name") == name }
                check(existing.size <= 1) { "Duplicate Videoland measurement flag: $name" }
                val node = existing.singleOrNull() ?: doc.createElement("meta-data").also { app.appendChild(it) }
                node.setAttributeNS(namespace, "android:name", name)
                node.setAttributeNS(namespace, "android:value", value.toString())
            }
            val permissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID", "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE")
            val removed = nodes.filter { it.tagName == "uses-permission" &&
                it.getAttributeNS(namespace, "name") in permissions }
            check(removed.size == 5) { "Changed Videoland advertising-permission inventory" }
            removed.forEach { it.parentNode.removeChild(it) }
            val providers = nodes.filter { it.tagName == "provider" && it.getAttributeNS(namespace, "name") ==
                "com.newrelic.agent.android.rum.contentprovider.NewRelicAppContentProvider" }
            check(providers.size == 1) { "Changed Videoland New Relic provider inventory" }
            providers.single().let { it.parentNode.removeChild(it) }
        }
    }
}
