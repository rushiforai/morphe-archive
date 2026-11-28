package app.template.patches.universal.privacy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/*
 * Adapted from kveld's universal patch set (morphe community patches, GPLv3) —
 * `universal/UniversalPrivacyPermissionsPatch.kt`. Group definitions kept; re-implemented
 * against this repo's resource helpers.
 */

private const val MANIFEST = "AndroidManifest.xml"

private val NOTIFICATION = setOf("android.permission.POST_NOTIFICATIONS")
private val CAMERA = setOf("android.permission.CAMERA")
private val MICROPHONE = setOf(
    "android.permission.RECORD_AUDIO",
    "android.permission.CAPTURE_AUDIO_OUTPUT",
)
private val MEDIA_STORAGE = setOf(
    "android.permission.READ_EXTERNAL_STORAGE",
    "android.permission.WRITE_EXTERNAL_STORAGE",
    "android.permission.MANAGE_EXTERNAL_STORAGE",
    "android.permission.READ_MEDIA_IMAGES",
    "android.permission.READ_MEDIA_VIDEO",
    "android.permission.READ_MEDIA_AUDIO",
    "android.permission.READ_MEDIA_VISUAL_USER_SELECTED",
    "android.permission.ACCESS_MEDIA_LOCATION",
)
private val LOCATION = setOf(
    "android.permission.ACCESS_FINE_LOCATION",
    "android.permission.ACCESS_COARSE_LOCATION",
    "android.permission.ACCESS_BACKGROUND_LOCATION",
)
private val CONTACTS = setOf(
    "android.permission.READ_CONTACTS",
    "android.permission.WRITE_CONTACTS",
    "android.permission.GET_ACCOUNTS",
)
private val CALENDAR = setOf(
    "android.permission.READ_CALENDAR",
    "android.permission.WRITE_CALENDAR",
)
private val NEARBY_DEVICES = setOf(
    "android.permission.BLUETOOTH_SCAN",
    "android.permission.BLUETOOTH_CONNECT",
    "android.permission.BLUETOOTH_ADVERTISE",
    "android.permission.NEARBY_WIFI_DEVICES",
    "android.permission.UWB_RANGING",
)
private val SENSORS = setOf(
    "android.permission.BODY_SENSORS",
    "android.permission.BODY_SENSORS_BACKGROUND",
    "android.permission.ACTIVITY_RECOGNITION",
)
private val INSTALLED_APPS = setOf("android.permission.QUERY_ALL_PACKAGES")

/**
 * Removes the capability permissions an app does not strictly need, grouped so each can be
 * chosen independently. Complements the per-app "Disable trackers"/"Remove ads" patches,
 * which only strip advertising and analytics permissions.
 *
 * **Every group is off by default**: removing a permission the user actually relies on (camera
 * in a scanner, location in a map, notifications in a messenger) breaks that feature with no
 * visible explanation, so this stays a deliberate, opt-in choice. The patch reports how many
 * declarations it removed, and reports "none matched" rather than failing — an app may simply
 * not request a group.
 */
@Suppress("unused")
val universalPrivacyPermissionsPatch = resourcePatch(
    name = "Remove privacy-sensitive permissions",
    description = "Strips selected capability permissions (notifications, camera, microphone, " +
        "media/storage, location, contacts, calendar, nearby devices, sensors, installed-apps " +
        "visibility) from the app's manifest. Off by default — disabling a permission the app " +
        "needs breaks the feature that uses it.",
    default = false,
) {
    fun group(key: String, title: String, description: String) =
        booleanOption(key = key, default = false, title = title, description = description)

    val stripNotifications by group(
        "stripNotifications", "Notifications",
        "android.permission.POST_NOTIFICATIONS",
    )
    val stripCamera by group("stripCamera", "Camera", "android.permission.CAMERA")
    val stripMicrophone by group(
        "stripMicrophone", "Microphone", "Record/capture audio permissions",
    )
    val stripMedia by group(
        "stripMedia", "Media & storage", "External-storage and media read permissions",
    )
    val stripLocation by group(
        "stripLocation", "Location", "Fine/coarse/background location",
    )
    val stripContacts by group("stripContacts", "Contacts & accounts", "Read/write contacts, GET_ACCOUNTS")
    val stripCalendar by group("stripCalendar", "Calendar", "Read/write calendar")
    val stripNearby by group(
        "stripNearby", "Nearby devices", "Bluetooth scan/connect, nearby WiFi, UWB",
    )
    val stripSensors by group(
        "stripSensors", "Body sensors & activity", "Body sensors, activity recognition",
    )
    val stripInstalledApps by group(
        "stripInstalledApps", "Installed-apps visibility", "QUERY_ALL_PACKAGES",
    )

    execute {
        val selected = buildSet {
            if (stripNotifications == true) addAll(NOTIFICATION)
            if (stripCamera == true) addAll(CAMERA)
            if (stripMicrophone == true) addAll(MICROPHONE)
            if (stripMedia == true) addAll(MEDIA_STORAGE)
            if (stripLocation == true) addAll(LOCATION)
            if (stripContacts == true) addAll(CONTACTS)
            if (stripCalendar == true) addAll(CALENDAR)
            if (stripNearby == true) addAll(NEARBY_DEVICES)
            if (stripSensors == true) addAll(SENSORS)
            if (stripInstalledApps == true) addAll(INSTALLED_APPS)
        }

        if (selected.isEmpty()) {
            println("Remove privacy-sensitive permissions: no group selected — nothing removed.")
            return@execute
        }

        var removed = 0
        document(MANIFEST).use { doc ->
            // Both plain <uses-permission> and the API-23 variant declare the name identically.
            for (tag in listOf("uses-permission", "uses-permission-sdk-23")) {
                val nodes = doc.getElementsByTagName(tag)
                val doomed = (0 until nodes.length)
                    .map { nodes.item(it) as? Element }
                    .filterNotNull()
                    .filter { it.permissionName() in selected }
                doomed.forEach {
                    it.parentNode.removeChild(it)
                    removed++
                }
            }
        }

        if (removed == 0) {
            println(
                "Remove privacy-sensitive permissions: none of the selected groups are requested " +
                    "by this app — nothing to remove.",
            )
        } else {
            println("Remove privacy-sensitive permissions: removed $removed declaration(s).")
        }
    }
}

private fun Element.permissionName(): String =
    attributes.getNamedItem("android:name")?.nodeValue ?: ""
