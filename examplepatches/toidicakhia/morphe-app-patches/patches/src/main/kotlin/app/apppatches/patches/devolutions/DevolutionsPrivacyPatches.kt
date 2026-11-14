package app.apppatches.patches.devolutions

import app.apppatches.patches.shared.Constants.RDM_COMPATIBILITY
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_MANIFEST = "AndroidManifest.xml"

private val AD_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "android.permission.AD_SERVICES_CONFIG",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"
)

private fun Document.addMetaData(name: String, value: String) {
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("$ANDROID_MANIFEST has no application element")

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
 * Firebase reads these flags before its components are initialized, so they stay
 * effective even though the .NET code only touches the collection setters on the
 * managed side. The Devolutions telemetry client (telemetry2.devolutions.net) is
 * not Firebase based and keeps following its own "DisableSendingAnalytics" option.
 */
internal val rdmAnalyticsManifestPatch = resourcePatch {
    compatibleWith(RDM_COMPATIBILITY)

    execute {
        document(ANDROID_MANIFEST).use { document ->
            document.addMetaData("firebase_data_collection_default_enabled", "false")
            document.addMetaData("firebase_analytics_collection_enabled", "false")
            document.addMetaData("firebase_crashlytics_collection_enabled", "false")
            document.addMetaData("firebase_performance_collection_enabled", "false")
            document.addMetaData("google_analytics_adid_collection_enabled", "false")
            document.addMetaData("google_analytics_ssaid_collection_enabled", "false")
        }
    }
}

@Suppress("unused")
val rdmDisableAnalyticsPatch = resourcePatch(
    name = "Disable Analytics / Telemetry",
    description = "Disables Firebase Analytics, Crashlytics and Performance, including advertising-ID " +
        "and app-set-ID collection. The Devolutions product telemetry is sent by the .NET code inside " +
        "the AOT assemblies, use the app's \"Disable sending analytics\" option to turn it off.",
    default = true
) {
    compatibleWith(RDM_COMPATIBILITY)
    dependsOn(rdmAnalyticsManifestPatch)
}

@Suppress("unused")
val rdmRemoveAdIdPermissionsPatch = resourcePatch(
    name = "Remove Ad ID Permissions",
    description = "Removes the advertising ID, Privacy Sandbox ad-services and Play install-referrer " +
        "permissions.",
    default = true
) {
    compatibleWith(RDM_COMPATIBILITY)

    execute {
        document(ANDROID_MANIFEST).use { document ->
            document.removePermissions(AD_ID_PERMISSIONS)
        }
    }
}
