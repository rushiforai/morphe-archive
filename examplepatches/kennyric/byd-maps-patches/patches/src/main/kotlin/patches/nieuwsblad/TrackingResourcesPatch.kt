package patches.nieuwsblad

import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val applications = manifest.getElementsByTagName("application")
            check(applications.length == 1)
            val application = applications.item(0) as Element
            val permissionNames = setOf(
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "android.permission.AD_ID",
                "android.permission.AD_SERVICES_CONFIG",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                "com.google.android.gms.permission.AD_ID",
            )
            val permissionNodes = manifest.getElementsByTagName("uses-permission")
            val permissions = (0 until permissionNodes.length).map { permissionNodes.item(it) as Element }
                .filter { it.getAttribute("android:name") in permissionNames }
            check(permissions.size == permissionNames.size && permissions.map { it.getAttribute("android:name") }.toSet() == permissionNames) {
                "Advertising permission inventory changed"
            }
            permissions.forEach { it.parentNode.removeChild(it) }
            val metadataNodes = manifest.getElementsByTagName("meta-data")
            val metadata = (0 until metadataNodes.length).map { metadataNodes.item(it) as Element }
            mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "delivery_metrics_exported_to_big_query_enabled" to "false",
                "com.facebook.sdk.AutoInitEnabled" to "false",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            ).forEach { (name, value) ->
                check(metadata.none { it.getAttribute("android:name") == name }) { "Unexpected existing collection flag $name" }
                val node = manifest.createElement("meta-data")
                node.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", name)
                node.setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", value)
                application.appendChild(node)
            }
        }
        val file = get("assets/index.android.bundle")
        val original = file.readBytes()
        val digest = MessageDigest.getInstance("SHA-256").digest(original).joinToString("") { "%02x".format(it.toInt() and 0xff) }
        check(digest == "6a56bf9f5104fb4c56e7f8d0bb9b04c790c54e230b304f73707c5f06af926fbd") { "Unsupported Twipe reader asset" }
        var text = original.toString(Charsets.UTF_8)
        // Keep the actual exported modules and their promise/callback contracts.
        // The original disabled transport also covers later remote logger config.
        listOf(
            "_e.transportFactory=function(t,n){switch(t){" to "_e.transportFactory=function(t,n){return B;switch(t){",
            "function*(e){var r=(0,n.isEmulatorSync)(),i=r?" to "function*(e){return;var r=(0,n.isEmulatorSync)(),i=r?",
            "enableTracking:function(){f=!0}" to "enableTracking:function(){f=!1}",
            "yield t.track(null,'','',R)" to "yield Promise.resolve()",
        ).forEach { (anchor, replacement) ->
            val index = text.indexOf(anchor)
            check(index >= 0 && text.lastIndexOf(anchor) == index) { "Twipe telemetry boundary changed" }
            text = text.replace(anchor, replacement)
        }
        file.writeText(text)
    }
}
