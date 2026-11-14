package app.morphe.patches.all.permissions

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch

private fun p(vararg names: String) = names.map { "android.permission.$it" }

@Suppress("unused")
val stripSensitivePermissionsPatch = resourcePatch(
    name = "Strip sensitive permissions",
    description = "Removes selected sensitive permissions from the manifest. Can break features " +
        "that rely on them; enable only the groups you want stripped.",
    default = false,
) {
    val location by booleanOption("location", true, title = "Location")
    val contacts by booleanOption("contacts", true, title = "Contacts & accounts")
    val smsCallLog by booleanOption("smsCallLog", true, title = "SMS & call log")
    val phone by booleanOption("phone", true, title = "Phone")
    val cameraMic by booleanOption("cameraMic", false, title = "Camera & microphone")
    val storage by booleanOption("storage", false, title = "Storage / media")
    val sensors by booleanOption("sensors", true, title = "Sensors & activity")
    val calendar by booleanOption("calendar", true, title = "Calendar")
    val nearby by booleanOption("nearby", true, title = "Nearby devices")
    val notifications by booleanOption("notifications", false, title = "Notifications")

    execute {
        val remove = mutableSetOf<String>()
        if (location == true) remove += p("ACCESS_FINE_LOCATION", "ACCESS_COARSE_LOCATION", "ACCESS_BACKGROUND_LOCATION", "ACCESS_MEDIA_LOCATION")
        if (contacts == true) remove += p("READ_CONTACTS", "WRITE_CONTACTS", "GET_ACCOUNTS")
        if (smsCallLog == true) remove += p("SEND_SMS", "RECEIVE_SMS", "READ_SMS", "RECEIVE_MMS", "RECEIVE_WAP_PUSH", "READ_CELL_BROADCASTS", "READ_CALL_LOG", "WRITE_CALL_LOG", "PROCESS_OUTGOING_CALLS")
        if (phone == true) remove += p("READ_PHONE_STATE", "READ_PHONE_NUMBERS", "CALL_PHONE", "ANSWER_PHONE_CALLS", "ADD_VOICEMAIL", "USE_SIP", "ACCEPT_HANDOVER")
        if (cameraMic == true) remove += p("CAMERA", "RECORD_AUDIO")
        if (storage == true) remove += p("READ_EXTERNAL_STORAGE", "WRITE_EXTERNAL_STORAGE", "READ_MEDIA_IMAGES", "READ_MEDIA_VIDEO", "READ_MEDIA_AUDIO", "MANAGE_EXTERNAL_STORAGE")
        if (sensors == true) remove += p("BODY_SENSORS", "BODY_SENSORS_BACKGROUND", "ACTIVITY_RECOGNITION", "HIGH_SAMPLING_RATE_SENSORS")
        if (calendar == true) remove += p("READ_CALENDAR", "WRITE_CALENDAR")
        if (nearby == true) remove += p("BLUETOOTH_SCAN", "BLUETOOTH_CONNECT", "BLUETOOTH_ADVERTISE", "NEARBY_WIFI_DEVICES", "UWB_RANGING")
        if (notifications == true) remove += p("POST_NOTIFICATIONS")

        document("AndroidManifest.xml").use { doc ->
            listOf("uses-permission", "uses-permission-sdk-23").forEach { tag ->
                val nl = doc.getElementsByTagName(tag)
                (0 until nl.length).map { nl.item(it) as org.w3c.dom.Element }
                    .filter { it.getAttribute("android:name") in remove }
                    .forEach { it.parentNode.removeChild(it) }
            }
        }
    }
}
