package patches.bright

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Provider-level collection defaults for the audited Firebase and Google
 * ad-services inventory. These are the flags the shipped SDKs themselves
 * honor at initialization, so collection never activates before the Flutter
 * runtime could set anything. The Facebook meta-data in the manifest is
 * vestigial: no Facebook SDK class is present in the audited build.
 */
internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val all = doc.getElementsByTagName("*")
            val nodes = (0 until all.length).map { all.item(it) as Element }
            val app = nodes.single { it.tagName == "application" }
            val namespace = "http://schemas.android.com/apk/res/android"
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                // Already false in the audited manifest; asserted, not assumed.
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_performance_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false)
            for ((name, value) in flags) {
                val matches = nodes.filter { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate Bright collection flag: $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(namespace, "android:name", name)
                    app.appendChild(it)
                }
                node.setAttributeNS(namespace, "android:value", value.toString())
            }
            val permissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttribute("android:name") in permissions }
            check(removed.size == 6) { "Bright optional advertising permission inventory changed" }
            removed.forEach { it.parentNode.removeChild(it) }
        }
        document("res/xml/ad_services_config.xml").use { doc ->
            val elements = doc.getElementsByTagName("*")
            for (index in 0 until elements.length) {
                val node = elements.item(index) as Element
                if (node.hasAttribute("allowAllToAccess")) {
                    check(node.getAttribute("allowAllToAccess") == "true") { "Bright ad services default changed" }
                    node.setAttribute("allowAllToAccess", "false")
                }
            }
        }
    }
}
