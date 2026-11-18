package app.morphe.patches.universal

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.ANDROID_XML_NAMESPACE
import app.morphe.patches.shared.PERMISSION_TAGS
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PERMISSION_INTERNET = "android.permission.INTERNET"

private val NETWORK_STATE_PERMISSIONS = setOf(
    "android.permission.ACCESS_NETWORK_STATE",
    "android.permission.ACCESS_WIFI_STATE",
)

private val WIFI_CONTROL_PERMISSIONS = setOf(
    "android.permission.CHANGE_NETWORK_STATE",
    "android.permission.CHANGE_WIFI_STATE",
    "android.permission.CHANGE_WIFI_MULTICAST_STATE",
    "android.permission.NEARBY_WIFI_DEVICES",
    "android.permission.OVERRIDE_WIFI_CONFIG",
)

private val PUSH_PERMISSIONS = setOf(
    "com.google.android.c2dm.permission.RECEIVE",
)

private val GOOGLE_SERVICES_PERMISSIONS = setOf(
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "android.permission.GET_ACCOUNTS",
)

private fun buildBlockedPermissions(
    stripNetworkState: Boolean,
    stripWifiControls: Boolean,
    stripPush: Boolean,
    stripGoogleServices: Boolean,
): Set<String> {
    val blocked = mutableSetOf(PERMISSION_INTERNET)
    if (stripNetworkState) blocked.addAll(NETWORK_STATE_PERMISSIONS)
    if (stripWifiControls) blocked.addAll(WIFI_CONTROL_PERMISSIONS)
    if (stripPush) blocked.addAll(PUSH_PERMISSIONS)
    if (stripGoogleServices) blocked.addAll(GOOGLE_SERVICES_PERMISSIONS)
    return blocked
}

private fun getPermissionName(element: Element): String {
    val name = element.getAttribute("android:name")
    if (name.isNotBlank()) return name.trim()
    val nameNs = element.getAttributeNS(ANDROID_XML_NAMESPACE, "name")
    if (nameNs.isNotBlank()) return nameNs.trim()
    return element.getAttribute("name").trim()
}

private fun stripPermissionsFromManifest(
    doc: Document,
    blockedPermissions: Set<String>,
): List<String> {
    val removed = mutableListOf<String>()

    for (tag in PERMISSION_TAGS) {
        val nodes = doc.getElementsByTagName(tag)
        val elementsToRemove = mutableListOf<Pair<Element, String>>()

        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as? Element ?: continue
            val permissionName = getPermissionName(element)
            if (permissionName in blockedPermissions) {
                elementsToRemove.add(element to permissionName)
            }
        }

        for ((element, name) in elementsToRemove) {
            val parent = element.parentNode
            if (parent != null) {
                parent.removeChild(element)
                removed.add(name)
            }
        }
    }

    return removed
}

private fun enforceCleartextBlock(doc: Document): Boolean {
    val appNodes = doc.getElementsByTagName("application")
    if (appNodes.length == 0) return false

    val appElement = appNodes.item(0) as? Element ?: return false
    val currentSetting = appElement.getAttribute("android:usesCleartextTraffic").trim()
    val currentSettingNs = appElement.getAttributeNS(ANDROID_XML_NAMESPACE, "usesCleartextTraffic").trim()
    if (currentSetting.equals("false", ignoreCase = true) || currentSettingNs.equals("false", ignoreCase = true)) {
        return false
    }

    appElement.setAttributeNS(ANDROID_XML_NAMESPACE, "android:usesCleartextTraffic", "false")
    return true
}

@Suppress("unused")
val universalOfflinePatch = resourcePatch(
    name = "Go Fully Offline",
    description = "Removes internet access completely.",
    default = false,
) {
    // Universal patch: applies to any target APK in Morphe Manager / CLI (no compatibleWith)
    val stripNetworkState by booleanOption(
        key = "stripNetworkState",
        default = false,
        title = "Network state",
        description = "Also removes network and Wi-Fi state permissions.",
        required = false,
    )

    val stripWifiControls by booleanOption(
        key = "stripWifiControls",
        default = true,
        title = "Wi-Fi controls",
        description = "Removes Wi-Fi management and nearby device permissions.",
        required = false,
    )

    val stripPush by booleanOption(
        key = "stripPush",
        default = false,
        title = "Push permissions",
        description = "Removes push notification permissions.",
        required = false,
    )

    val stripGoogleServices by booleanOption(
        key = "stripGoogleServices",
        default = false,
        title = "Google sync",
        description = "Removes Google Services and account sync permissions.",
        required = false,
    )

    val blockCleartext by booleanOption(
        key = "blockCleartext",
        default = true,
        title = "Block unencrypted traffic",
        description = "Enforces encrypted traffic in the manifest.",
        required = false,
    )

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Go Fully Offline] Skipped: AndroidManifest.xml not found.")
            return@execute
        }

        val removeNetworkState = stripNetworkState ?: false
        val removeWifiControls = stripWifiControls ?: true
        val removePush = stripPush ?: false
        val removeGoogleServices = stripGoogleServices ?: false
        val shouldBlockCleartext = blockCleartext ?: true

        val blockedPermissions = buildBlockedPermissions(
            stripNetworkState = removeNetworkState,
            stripWifiControls = removeWifiControls,
            stripPush = removePush,
            stripGoogleServices = removeGoogleServices,
        )

        var removedList: List<String> = emptyList()
        var cleartextBlocked = false

        document(manifestFile.absolutePath).use { doc ->
            removedList = stripPermissionsFromManifest(doc, blockedPermissions)
            if (shouldBlockCleartext) {
                cleartextBlocked = enforceCleartextBlock(doc)
            }
        }

        if (removedList.isEmpty() && !cleartextBlocked) {
            println("[Go Fully Offline] No target network permissions found in AndroidManifest.xml (already offline).")
            return@execute
        }

        if (removedList.isEmpty()) {
            println("[Go Fully Offline] Blocked cleartext HTTP traffic (0 network permissions present).")
            return@execute
        }

        val shortNames = removedList.map { it.substringAfterLast('.') }.distinct()
        val cleartextNote = if (cleartextBlocked) " + blocked cleartext HTTP" else ""
        println("[Go Fully Offline] Stripped ${removedList.size} permission(s) (${shortNames.joinToString(", ")})$cleartextNote.")
    }
}
