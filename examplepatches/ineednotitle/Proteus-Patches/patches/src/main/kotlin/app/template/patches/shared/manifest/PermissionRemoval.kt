package app.template.patches.shared.manifest

import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val ANDROID_PERMISSION_PREFIX = "android.permission."
private const val ADSERVICES_PREFIX = "android.permission.ACCESS_ADSERVICES_"
private val PERMISSION_NAME = Regex("[A-Za-z_][A-Za-z0-9_]*(?:\\.[A-Za-z_][A-Za-z0-9_]*)*")

// The category keys are also used by the patch options. Keep them stable for saved configurations.
internal val PERMISSION_GROUPS = linkedMapOf(
    "packageVisibility" to setOf("android.permission.QUERY_ALL_PACKAGES"),
    "phone" to setOf(
        "android.permission.READ_PHONE_STATE", "android.permission.READ_BASIC_PHONE_STATE",
        "android.permission.READ_PHONE_NUMBERS", "android.permission.CALL_PHONE",
    ),
    "accounts" to setOf("android.permission.GET_ACCOUNTS"),
    "location" to setOf(
        "android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION",
        "android.permission.ACCESS_BACKGROUND_LOCATION",
    ),
    "contacts" to setOf("android.permission.READ_CONTACTS", "android.permission.WRITE_CONTACTS"),
    "microphone" to setOf("android.permission.RECORD_AUDIO"),
    "camera" to setOf("android.permission.CAMERA"),
    "storage" to setOf(
        "android.permission.READ_EXTERNAL_STORAGE", "android.permission.WRITE_EXTERNAL_STORAGE",
        "android.permission.MANAGE_EXTERNAL_STORAGE", "android.permission.READ_MEDIA_IMAGES",
        "android.permission.READ_MEDIA_VIDEO", "android.permission.READ_MEDIA_AUDIO",
    ),
    "sms" to setOf("android.permission.READ_SMS", "android.permission.RECEIVE_SMS", "android.permission.SEND_SMS"),
    "calendar" to setOf("android.permission.READ_CALENDAR", "android.permission.WRITE_CALENDAR"),
    "sensors" to setOf("android.permission.BODY_SENSORS", "android.permission.ACTIVITY_RECOGNITION"),
    "nearbyDevices" to setOf(
        "android.permission.BLUETOOTH_SCAN", "android.permission.BLUETOOTH_CONNECT",
        "android.permission.BLUETOOTH_ADVERTISE", "android.permission.NEARBY_WIFI_DEVICES",
    ),
    "screenCaptureDetection" to setOf("android.permission.DETECT_SCREEN_CAPTURE"),
    "adId" to setOf("com.google.android.gms.permission.AD_ID"),
    "notifications" to setOf("android.permission.POST_NOTIFICATIONS"),
)

private fun listTokens(value: String?): List<String> = value.orEmpty()
    .split(',', ';', '\n', '\r')
    .map(String::trim)
    .filter(String::isNotEmpty)

/** Accept harmless empty separators, but reject typos such as space-separated names. */
internal fun isPermissionListValid(value: String?): Boolean = listTokens(value).all { token ->
    PERMISSION_NAME.matches(token) && ('.' in token || token == token.uppercase())
}

private fun parsePermissionList(value: String?): Set<String> = listTokens(value).mapTo(linkedSetOf()) { token ->
    when {
        '.' in token -> token
        token == "AD_ID" -> "com.google.android.gms.permission.AD_ID"
        else -> ANDROID_PERMISSION_PREFIX + token
    }
}

internal data class PermissionRemovalPolicy(
    val names: Set<String>,
    val keep: Set<String>,
    val removeAdServices: Boolean,
    val usesLegacyList: Boolean,
) {
    fun shouldRemove(name: String): Boolean = name.isNotBlank() && name !in keep &&
        (name in names || (removeAdServices && name.startsWith(ADSERVICES_PREFIX)))

    companion object {
        fun fromOptions(
            selections: Map<String, Boolean?>,
            removeAdServices: Boolean,
            keep: String?,
            extra: String?,
            legacy: String?,
        ): PermissionRemovalPolicy {
            // Validate here as well as in the UI: stored options and programmatic callers
            // must not silently turn a malformed keep list into an ineffective exemption.
            require(isPermissionListValid(keep)) { "Invalid Permissions to keep list; separate permission names with commas, semicolons or new lines." }
            require(isPermissionListValid(extra)) { "Invalid Extra permissions to remove list; separate permission names with commas, semicolons or new lines." }
            require(isPermissionListValid(legacy)) { "Invalid Advanced exact removal list; separate permission names with commas, semicolons or new lines." }
            val legacyNames = parsePermissionList(legacy)
            val names = if (legacyNames.isNotEmpty()) legacyNames else PERMISSION_GROUPS
                .filter { (key, _) -> selections[key] ?: true }
                .values.flatten().toSet()
            return PermissionRemovalPolicy(
                names = names + parsePermissionList(extra),
                keep = parsePermissionList(keep),
                removeAdServices = removeAdServices,
                usesLegacyList = legacyNames.isNotEmpty(),
            )
        }
    }
}

/** Remove only declarations directly under manifest, not e.g. permissions inside queries. */
internal fun removeRequestedPermissions(document: Document, policy: PermissionRemovalPolicy): List<String> {
    val manifest = document.documentElement ?: return emptyList()
    val permissionTags = setOf("uses-permission", "uses-permission-sdk-23", "uses-permission-sdk-m")
    val matches = mutableListOf<Pair<Element, String>>()
    val children = manifest.childNodes
    for (index in 0 until children.length) {
        val element = children.item(index) as? Element ?: continue
        if (element.tagName !in permissionTags) continue
        // Resource documents can be namespace-aware or expose the literal android: prefix.
        val name = element.getAttributeNS(ANDROID_NAMESPACE, "name")
            .ifBlank { element.getAttribute("android:name") }
        if (policy.shouldRemove(name)) matches += element to name
    }
    matches.forEach { (element, _) -> manifest.removeChild(element) }
    return matches.map { it.second }
}
