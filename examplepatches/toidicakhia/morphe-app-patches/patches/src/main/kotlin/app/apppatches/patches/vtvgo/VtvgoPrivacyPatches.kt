package app.apppatches.patches.vtvgo

import app.apppatches.patches.shared.Constants.VTVGO_COMPATIBILITY
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_MANIFEST = "AndroidManifest.xml"
private const val NETWORK_SECURITY_CONFIG = "res/xml/network_security_config.xml"

private val AD_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "android.permission.AD_SERVICES_CONFIG",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"
)

private val CALENDAR_PERMISSIONS = setOf(
    "android.permission.READ_CALENDAR",
    "android.permission.WRITE_CALENDAR"
)

private fun Document.addMetaData(name: String, value: String) {
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("AndroidManifest.xml has no application element")

    val existing = getElementsByTagName("meta-data")
    for (index in 0 until existing.length) {
        val node = existing.item(index) as? Element ?: continue
        if (node.attributes?.getNamedItem("android:name")?.nodeValue == name) {
            node.setAttribute("android:value", value)
            return
        }
    }

    val metaData = createElement("meta-data")
    metaData.setAttribute("android:name", name)
    metaData.setAttribute("android:value", value)
    application.appendChild(metaData)
}

private fun Document.removePermissions(names: Set<String>) {
    val permissions = getElementsByTagName("uses-permission")
    for (index in permissions.length - 1 downTo 0) {
        val permission = permissions.item(index)
        if (permission.attributes?.getNamedItem("android:name")?.nodeValue in names) {
            permission.parentNode.removeChild(permission)
        }
    }
}

/**
 * Dependency of vtvgoDisableAnalyticsPatch. Firebase reads these flags before
 * the Flutter engine starts, so they stay effective even when the Dart code
 * never touches the collection setters.
 */
internal val vtvgoAnalyticsManifestPatch = resourcePatch {
    execute {
        document(ANDROID_MANIFEST).use { document ->
            document.addMetaData("firebase_data_collection_default_enabled", "false")
            document.addMetaData("firebase_analytics_collection_enabled", "false")
            document.addMetaData("firebase_crashlytics_collection_enabled", "false")
            document.addMetaData("firebase_performance_collection_enabled", "false")
            document.addMetaData("google_analytics_adid_collection_enabled", "false")
            document.addMetaData("google_analytics_ssaid_collection_enabled", "false")
            document.addMetaData("com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            document.addMetaData("com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")
        }
    }
}

@Suppress("unused")
val vtvgoRemoveAdIdPermissionsPatch = resourcePatch(
    name = "Remove Ad ID Permissions",
    description = "Removes the advertising ID, Privacy Sandbox ad-services and Play install-referrer " +
        "permissions. Device identification used for device management is left untouched.",
    default = true
) {
    compatibleWith(VTVGO_COMPATIBILITY)

    execute {
        document(ANDROID_MANIFEST).use { document ->
            document.removePermissions(AD_ID_PERMISSIONS)
        }
    }
}

@Suppress("unused")
val vtvgoRemoveCalendarPermissionsPatch = resourcePatch(
    name = "Remove Calendar Permissions",
    description = "Removes calendar read/write permissions. Programme reminders will no longer work.",
    default = false
) {
    compatibleWith(VTVGO_COMPATIBILITY)

    execute {
        document(ANDROID_MANIFEST).use { document ->
            document.removePermissions(CALENDAR_PERMISSIONS)
        }
    }
}

@Suppress("unused")
val vtvgoTrustUserCertificatesPatch = resourcePatch(
    name = "Trust User Certificates",
    description = "Adds user-installed CA certificates to the network security config so native traffic " +
        "can be inspected with a debugging proxy. Flutter's Dart HTTP stack keeps its own trust store.",
    default = false
) {
    compatibleWith(VTVGO_COMPATIBILITY)

    execute {
        document(NETWORK_SECURITY_CONFIG).use { config ->
            val root = config.documentElement
                ?: throw PatchException("$NETWORK_SECURITY_CONFIG has no root element")
            val anchors = root.getElementsByTagName("trust-anchors")
            if (anchors.length == 0) {
                throw PatchException("$NETWORK_SECURITY_CONFIG has no trust-anchors element")
            }

            for (index in 0 until anchors.length) {
                val set = anchors.item(index) as? Element ?: continue
                val certificates = set.getElementsByTagName("certificates")
                val user = (0 until certificates.length)
                    .mapNotNull { certificates.item(it) as? Element }
                    .firstOrNull { it.getAttribute("src") == "user" }
                    ?: config.createElement("certificates").also {
                        it.setAttribute("src", "user")
                        set.appendChild(it)
                    }
                user.setAttribute("overridePins", "true")
            }
        }
    }
}
