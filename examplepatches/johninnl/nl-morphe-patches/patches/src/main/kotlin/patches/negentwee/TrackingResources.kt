package patches.negentwee

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("*").let { all ->
                (0 until all.length).map { all.item(it) as Element }
            }
            val app = nodes.single { it.tagName == "application" }
            val namespace = "http://schemas.android.com/apk/res/android"
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false,
            )
            for ((name, value) in flags) {
                val existing = nodes.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                if (name == "google_analytics_automatic_screen_reporting_enabled") {
                    check(existing.size == 1 && existing.single().getAttribute("android:value") == "false" &&
                        !existing.single().hasAttribute("android:resource")) {
                        "9292 original screen-reporting metadata changed"
                    }
                    continue // Already disabled in the original; retain its node.
                }
                check(existing.isEmpty()) {
                    "9292 original measurement metadata changed: $name"
                }
                doc.createElement("meta-data").also {
                    it.setAttributeNS(namespace, "android:name", name)
                    it.setAttributeNS(namespace, "android:value", value.toString())
                    app.appendChild(it)
                }
            }
            val permissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS")
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
            check(removed.size == permissions.size && removed.map { it.getAttribute("android:name") }.toSet() == permissions) {
                "9292 original advertising permissions changed"
            }
            removed.forEach { app.ownerDocument.documentElement.removeChild(it) }
        }
    }
}
