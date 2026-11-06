package app.template.patches.shared.manifest

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.logUniversal

@Suppress("unused")
val removeDangerousPermissionsPatch = resourcePatch(
    name = "Remove dangerous permissions",
    description = """
        Removes selected permission declarations from an app's manifest. The patch
        is off by default. When enabled, all category switches start ON, including
        camera, storage, SMS and notifications. Turn off categories the app needs.

        Permissions to keep always wins. Extra permissions are added to the selected
        categories. A non-empty advanced list replaces the category selections,
        except that AdServices remains controlled by its own switch.

        Removing permissions can break features or prevent an app from starting.
        This does not block every way an app may collect data.
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
        description = "Remove phone state, phone numbers and calling permissions. Calls or sign-in may stop working.",
    )
    val permAccounts by booleanOption(
        key = "permAccounts",
        default = true,
        title = "Accounts",
        description = "Remove GET_ACCOUNTS. Account discovery or sign-in may stop working.",
    )
    val permLocation by booleanOption(
        key = "permLocation",
        default = true,
        title = "Location",
        description = "Remove fine, coarse and background location. Maps or location features may stop working.",
    )
    val permContacts by booleanOption(
        key = "permContacts",
        default = true,
        title = "Contacts",
        description = "Remove read/write contacts. Contact sync and sharing may stop working.",
    )
    val permMicrophone by booleanOption(
        key = "permMicrophone",
        default = true,
        title = "Microphone",
        description = "Remove RECORD_AUDIO. Voice messages, calls and recording may stop working.",
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
        description = "Remove storage and media permissions. File access and media features may stop working.",
    )
    val permSms by booleanOption(
        key = "permSms",
        default = true,
        title = "SMS",
        description = "Remove SMS permissions. Messaging or automatic verification may stop working.",
    )
    val permCalendar by booleanOption(
        key = "permCalendar",
        default = true,
        title = "Calendar",
        description = "Remove read/write calendar permissions. Calendar integration may stop working.",
    )
    val permSensors by booleanOption(
        key = "permSensors",
        default = true,
        title = "Sensors & activity",
        description = "Remove BODY_SENSORS and ACTIVITY_RECOGNITION. Fitness features may stop working.",
    )
    val permNearbyDevices by booleanOption(
        key = "permNearbyDevices",
        default = true,
        title = "Nearby devices",
        description = "Remove Bluetooth and nearby Wi-Fi permissions. Device pairing may stop working.",
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
        description = "Always keep these permissions, even if a category, extra list or AdServices " +
            "would remove them. Use commas, semicolons or new lines; e.g. CAMERA, POST_NOTIFICATIONS.",
        required = false,
        validator = { isPermissionListValid(it) },
    )
    val extraPermissionsToRemove by stringOption(
        key = "extraPermissionsToRemove",
        default = "",
        title = "Extra permissions to remove",
        description = "Add permissions to remove. Use commas, semicolons or new lines; " +
            "e.g. CAMERA or com.example.permission.CUSTOM. The keep list takes priority.",
        required = false,
        validator = { isPermissionListValid(it) },
    )
    val permissionsToRemove by stringOption(
        key = "permissionsToRemove",
        default = "",
        title = "Advanced: exact removal list",
        description = "Legacy override: when non-empty, replaces the category selections with this " +
            "list. AdServices is still controlled by its switch; extra and keep lists still apply. " +
            "Leave blank to use categories.",
        required = false,
        validator = { isPermissionListValid(it) },
    )

    execute {
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
        val policy = PermissionRemovalPolicy.fromOptions(
            selections = selections,
            removeAdServices = permAdServices ?: true,
            keep = permissionsToKeep,
            extra = extraPermissionsToRemove,
            legacy = permissionsToRemove,
        )
        val removed = document("AndroidManifest.xml").use { doc ->
            removeRequestedPermissions(doc, policy)
        }

        val preview = removed.distinct().take(6).joinToString(", ")
        val suffix = if (removed.isEmpty()) "" else " Names: $preview" +
            if (removed.distinct().size > 6) ", …" else ""
        logUniversal(
            "Remove dangerous permissions: removed ${removed.size} declaration(s)." + suffix +
                if (policy.usesLegacyList) " Advanced list active; category switches are ignored except AdServices." else "",
        )
    }
}
