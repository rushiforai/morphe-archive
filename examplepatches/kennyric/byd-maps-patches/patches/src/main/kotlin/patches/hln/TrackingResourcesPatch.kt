package patches.hln

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc
            val applications = manifest.getElementsByTagName("application")
            check(applications.length == 1)
            val application = applications.item(0) as Element
            val nodes = manifest.getElementsByTagName("meta-data")
            val entries = (0 until nodes.length).map { nodes.item(it) as Element }
            val fiam = entries.filter { it.getAttribute("android:name").startsWith("com.google.firebase.components:com.google.firebase.inappmessaging.") }
            check(fiam.map { it.getAttribute("android:name") }.toSet() == setOf(
                "com.google.firebase.components:com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayKtxRegistrar",
                "com.google.firebase.components:com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayRegistrar",
                "com.google.firebase.components:com.google.firebase.inappmessaging.FirebaseInAppMessagingKtxRegistrar",
                "com.google.firebase.components:com.google.firebase.inappmessaging.FirebaseInAppMessagingRegistrar")) { "HLN FIAM registrar set changed" }
            check(fiam.size == 4)
            fiam.forEach { it.parentNode.removeChild(it) }
            val adPermissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID", "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE")
            val permissionNodes = manifest.getElementsByTagName("uses-permission")
            val permissions = (0 until permissionNodes.length).map { permissionNodes.item(it) as Element }
                .filter { it.getAttribute("android:name") in adPermissions }
            check(permissions.size == adPermissions.size && permissions.map { it.getAttribute("android:name") }.toSet() == adPermissions) {
                "HLN advertising permission set changed"
            }
            permissions.forEach { it.parentNode.removeChild(it) }

            mapOf("delivery_metrics_exported_to_big_query_enabled" to "false", "firebase_analytics_collection_deactivated" to "true", "firebase_analytics_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false", "firebase_performance_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false", "google_analytics_default_allow_ad_personalization_signals" to "false",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false", "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false").forEach { (name, value) ->
                val matches = entries.filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "HLN duplicate manifest flag $name" }
                val node = matches.singleOrNull() ?: manifest.createElement("meta-data").also { application.appendChild(it) }
                node.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", name)
                node.setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", value)
            }
        }
    }
}
