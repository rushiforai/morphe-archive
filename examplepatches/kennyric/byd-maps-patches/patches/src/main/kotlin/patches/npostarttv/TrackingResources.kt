package patches.npostarttv

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
            for ((name, value) in mapOf("io.sentry.auto-init" to false,
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false)) {
                val existing = nodes.filter { it.tagName == "meta-data" && it.getAttributeNS(namespace, "name") == name }
                check(existing.size <= 1) { "Duplicate TV measurement flag: $name" }
                val node = existing.singleOrNull() ?: doc.createElement("meta-data").also { app.appendChild(it) }
                node.setAttributeNS(namespace, "android:name", name)
                node.setAttributeNS(namespace, "android:value", value.toString())
            }
            val adPermissions = setOf("com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION", "android.permission.AD_SERVICES_CONFIG")
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttributeNS(namespace, "name") in adPermissions }
            check(removed.size == 4) { "NPO TV advertising-permission inventory changed" }
            removed.forEach { it.parentNode.removeChild(it) }
            // Sentry's performance provider records startup data before SDK enablement.
            // Other providers and all functional service/receiver declarations stay intact.
            val performanceProviders = nodes.filter { it.tagName == "provider" &&
                it.getAttributeNS(namespace, "name") == "io.sentry.android.core.SentryPerformanceProvider" }
            check(performanceProviders.size == 1) { "NPO TV Sentry performance-provider inventory changed" }
            performanceProviders.single().let { it.parentNode.removeChild(it) }
        }
    }
}
