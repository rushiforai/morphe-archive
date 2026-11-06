package app.template.patches.shared.manifest

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.RELAXED_LIST_VALIDATOR
import app.template.patches.shared.UNIVERSAL_PERMISSION_TAGS
import app.template.patches.shared.logUniversal
import app.template.patches.shared.parseTokens
import app.template.patches.shared.removeManifestElements

/**
 * Universal "Remove dangerous permissions" patch.
 *
 * Usability: instead of editing one long comma-separated list, users toggle
 * permission **categories**. All categories are ON by default (aggressive),
 * with an optional keep-list, an optional extra list and a legacy exact-list
 * override for existing configurations.
 *
 * Optimization: a single DOM traversal via [removeManifestElements] replaces
 * the previous three separate `getElementsByTagName` passes.
 */

private const val ADSERVICES_PREFIX = "android.permission.ACCESS_ADSERVICES_"

/** Category key -> concrete permission names. AdServices is handled by prefix. */
private val PERMISSION_GROUPS = linkedMapOf(
    "packageVisibility" to setOf(
        "android.permission.QUERY_ALL_PACKAGES",
    ),
    "phone" to setOf(
        "android.permission.READ_PHONE_STATE",
        "android.permission.READ_BASIC_PHONE_STATE",
        "android.permission.READ_PHONE_NUMBERS",
        "android.permission.CALL_PHONE",
    ),
    "accounts" to setOf(
        "android.permission.GET_ACCOUNTS",
    ),
    "location" to setOf(
        "android.permission.ACCESS_FINE_LOCATION",
        "android.permission.ACCESS_COARSE_LOCATION",
        "android.permission.ACCESS_BACKGROUND_LOCATION",
    ),
    "contacts" to setOf(
        "android.permission.READ_CONTACTS",
        "android.permission.WRITE_CONTACTS",
    ),
    "microphone" to setOf(
        "android.permission.RECORD_AUDIO",
    ),
    "camera" to setOf(
        "android.permission.CAMERA",
    ),
    "storage" to setOf(
        "android.permission.READ_EXTERNAL_STORAGE",
        "android.permission.WRITE_EXTERNAL_STORAGE",
        "android.permission.MANAGE_EXTERNAL_STORAGE",
        "android.permission.READ_MEDIA_IMAGES",
        "android.permission.READ_MEDIA_VIDEO",
        "android.permission.READ_MEDIA_AUDIO",
    ),
    "sms" to setOf(
        "android.permission.READ_SMS",
        "android.permission.RECEIVE_SMS",
        "android.permission.SEND_SMS",
    ),
    "calendar" to setOf(
        "android.permission.READ_CALENDAR",
        "android.permission.WRITE_CALENDAR",
    ),
    "sensors" to setOf(
        "android.permission.BODY_SENSORS",
        "android.permission.ACTIVITY_RECOGNITION",
    ),
    "nearbyDevices" to setOf(
        "android.permission.BLUETOOTH_SCAN",
        "android.permission.BLUETOOTH_CONNECT",
        "android.permission.BLUETOOTH_ADVERTISE",
        "android.permission.NEARBY_WIFI",
    ),
    "screenCaptureDetection" to setOf(
        "android.permission.DETECT_SCREEN_CAPTURE",
    ),
    "adId" to setOf(
        "com.google.android.gms.permission.AD_ID",
    ),
    "notifications" to setOf(
        "android.permission.POST_NOTIFICATIONS",
    ),
)

@Suppress("unused")
val removeDangerousPermissionsPatch = resourcePatch(
    name = "Remove dangerous permissions",
    description = """
        Removes privacy-invasive permissions from any app's manifest using simple
        category switches. All categories are ON by default (aggressive): package
        visibility, phone, accounts, location, contacts, microphone, camera,
        storage, SMS, calendar, sensors, nearby devices, ad ID, AdServices,
        notifications and screen-capture detection.

        Use "Permissions to keep" to exempt a single permission, or "Advanced:
        exact removal list" to replace the switches with your own list.

        Removing a permission the app actually needs can break features (login,
        calls, camera, file picker, notifications). Off by default.
    """.trimIndent(),
    default = false,
) {
    // ── Category switches (aggressive defaults) ─────────────────────────────
    val permPackageVisibility by booleanOption(
        key = "permPackageVisibility",
        default = true,
        title = "Package visibility",
        description = "Remove QUERY_ALL_PACKAGES (app can no longer enumerate every installed app).",
    )
    val permPhone by booleanOption(
        key = "permPhone",
        default = true,
        title = "Phone state & numbers",
        description = "Remove READ_PHONE_STATE / phone-number / CALL_PHONE permissions.",
    )
    val permAccounts by booleanOption(
        key = "permAccounts",
        default = true,
        title = "Accounts",
        description = "Remove GET_ACCOUNTS (account enumeration for login/ads).",
    )
    val permLocation by booleanOption(
        key = "permLocation",
        default = true,
        title = "Location",
        description = "Remove fine, coarse and background location permissions.",
    )
    val permContacts by booleanOption(
        key = "permContacts",
        default = true,
        title = "Contacts",
        description = "Remove read/write contacts permissions.",
    )
    val permMicrophone by booleanOption(
        key = "permMicrophone",
        default = true,
        title = "Microphone",
        description = "Remove RECORD_AUDIO.",
    )
    val permCamera by booleanOption(
        key = "permCamera",
        default = true,
        title = "Camera",
        description = "Remove CAMERA. Disable this if the app needs to take photos or scan QR codes.",
    )
    val permStorage by booleanOption(
        key = "permStorage",
        default = true,
        title = "Storage & media",
        description = "Remove legacy storage, MANAGE_EXTERNAL_STORAGE and READ_MEDIA_* permissions.",
    )
    val permSms by booleanOption(
        key = "permSms",
        default = true,
        title = "SMS",
        description = "Remove READ_SMS / RECEIVE_SMS / SEND_SMS.",
    )
    val permCalendar by booleanOption(
        key = "permCalendar",
        default = true,
        title = "Calendar",
        description = "Remove read/write calendar permissions.",
    )
    val permSensors by booleanOption(
        key = "permSensors",
        default = true,
        title = "Sensors & activity",
        description = "Remove BODY_SENSORS and ACTIVITY_RECOGNITION.",
    )
    val permNearbyDevices by booleanOption(
        key = "permNearbyDevices",
        default = true,
        title = "Nearby devices",
        description = "Remove Bluetooth scan/connect/advertise and NEARBY_WIFI.",
    )
    val permScreenCaptureDetection by booleanOption(
        key = "permScreenCaptureDetection",
        default = true,
        title = "Screen-capture detection",
        description = "Remove DETECT_SCREEN_CAPTURE (Android 14+ screenshot detection).",
    )
    val permAdId by booleanOption(
        key = "permAdId",
        default = true,
        title = "Advertising ID",
        description = "Remove com.google.android.gms.permission.AD_ID.",
    )
    val permAdServices by booleanOption(
        key = "permAdServices",
        default = true,
        title = "AdServices permissions",
        description = "Remove every android.permission.ACCESS_ADSERVICES_* entry.",
    )
    val permNotifications by booleanOption(
        key = "permNotifications",
        default = true,
        title = "Notifications",
        description = "Remove POST_NOTIFICATIONS. Disable this if you still want app notifications.",
    )

    // ── Fine-tuning / backwards compatibility ───────────────────────────────
    val permissionsToKeep by stringOption(
        key = "permissionsToKeep",
        default = "",
        title = "Permissions to keep",
        description = "Comma-separated permission names that are never removed, even if their " +
            "category is on. Example: android.permission.CAMERA,android.permission.POST_NOTIFICATIONS",
        required = false,
        validator = RELAXED_LIST_VALIDATOR,
    )
    val extraPermissionsToRemove by stringOption(
        key = "extraPermissionsToRemove",
        default = "",
        title = "Extra permissions to remove",
        description = "Comma-separated permission names added on top of the enabled categories.",
        required = false,
        validator = RELAXED_LIST_VALIDATOR,
    )
    val permissionsToRemove by stringOption(
        key = "permissionsToRemove",
        default = "",
        title = "Advanced: exact removal list",
        description = "Legacy override. If non-empty, replaces ALL category switches with this " +
            "exact comma-separated list. Leave empty to use the switches above.",
        required = false,
        validator = RELAXED_LIST_VALIDATOR,
    )

    execute {
        val keep = parseTokens(permissionsToKeep)
        val extra = parseTokens(extraPermissionsToRemove)
        val legacy = parseTokens(permissionsToRemove)

        val selections = mapOf(
            "packageVisibility" to permPackageVisibility,
            "phone" to permPhone,
            "accounts" to permAccounts,
            "location" to permLocation,
            "contacts" to permContacts,
            "microphone" to permMicrophone,
            "camera" to permCamera,
            "storage" to permStorage,
            "sms" to permSms,
            "calendar" to permCalendar,
            "sensors" to permSensors,
            "nearbyDevices" to permNearbyDevices,
            "screenCaptureDetection" to permScreenCaptureDetection,
            "adId" to permAdId,
            "notifications" to permNotifications,
        )

        val removalSet = if (legacy.isNotEmpty()) {
            legacy.toMutableSet()
        } else {
            PERMISSION_GROUPS
                .filter { (key, _) -> selections[key] ?: true }
                .values
                .flatten()
                .toMutableSet()
        }
        removalSet.addAll(extra)
        removalSet.removeAll(keep)

        val removeAdServicesEnabled = permAdServices ?: true
        val removed = document("AndroidManifest.xml").use { doc ->
            doc.removeManifestElements(*UNIVERSAL_PERMISSION_TAGS) { element ->
                val name = element.getAttribute("android:name")
                if (name.isBlank() || name in keep) return@removeManifestElements false
                name in removalSet ||
                    (removeAdServicesEnabled && name.startsWith(ADSERVICES_PREFIX))
            }
        }

        val preview = removed.take(4).joinToString(", ")
        val suffix = when {
            removed.isEmpty() -> ""
            removed.size <= 4 -> " ($preview)"
            else -> " ($preview, …)"
        }
        logUniversal(
            "Remove dangerous permissions: ${removed.size} declaration(s) removed" +
                "$suffix; ${removalSet.size} exact name(s) + " +
                "${if (removeAdServicesEnabled) "AdServices prefix" else "no AdServices prefix"} configured.",
        )
    }
}
