package patches.marktplaats

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val nodes = doc.getElementsByTagName("*").let { all ->
                (0 until all.length).map { all.item(it) as Element }
            }
            val app = nodes.single { it.tagName == "application" }
            val existingDefaults = setOf("google_analytics_automatic_screen_reporting_enabled",
                "firebase_crashlytics_collection_enabled", "com.facebook.sdk.AutoLogAppEventsEnabled",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled")
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_performance_collection_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false,
                "com.facebook.sdk.AutoLogAppEventsEnabled" to false,
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to false,
            )
            for ((name, value) in flags) {
                val existing = nodes.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                if (name in existingDefaults) {
                    check(existing.size == 1 && existing.single().getAttribute("android:value") == "false" &&
                        !existing.single().hasAttribute("android:resource")) {
                        "Marktplaats original measurement default changed: $name"
                    }
                    continue
                }
                check(existing.isEmpty()) { "Marktplaats original measurement flag changed: $name" }
                doc.createElement("meta-data").also {
                    it.setAttributeNS(namespace, "android:name", name)
                    it.setAttributeNS(namespace, "android:value", value.toString())
                    app.appendChild(it)
                }
            }
            for (name in setOf("com.datadog.android.rum.DdRumContentProvider", "com.adjust.sdk.SystemLifecycleContentProvider")) {
                val providers = nodes.filter { it.tagName == "provider" && it.getAttribute("android:name") == name }
                check(providers.size == 1 && !providers.single().hasAttribute("android:enabled")) {
                    "Marktplaats original measurement initializer changed: $name"
                }
                providers.single().setAttributeNS(namespace, "android:enabled", "false")
            }
            val receiver = nodes.filter { it.tagName == "receiver" && it.getAttribute("android:name") == "com.adjust.sdk.AdjustReferrerReceiver" }
            check(receiver.size == 1 && !receiver.single().hasAttribute("android:enabled")) {
                "Marktplaats original install-referrer receiver changed"
            }
            receiver.single().setAttributeNS(namespace, "android:enabled", "false")
            val permissions = setOf("com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_AD_ID")
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
            check(removed.size == 2 && removed.map { it.getAttribute("android:name") }.toSet() == permissions) {
                "Marktplaats original advertising permissions changed"
            }
            removed.forEach { doc.documentElement.removeChild(it) }
        }
    }
}
