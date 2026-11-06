package app.template.patches.meesho.misc

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import org.w3c.dom.Element

// Stop Meesho's alarm-driven "pull notification" fetches.
//
// Besides FCM push (com.meesho.pushnotify.MyFcmService — kept working), the
// manifest declares exported alarm receivers that periodically wake the app to
// pull marketing notifications:
//   com.meesho.pushnotify.pullnotifications.br.PNAlarmReceiver
//   com.meesho.pushnotify.pullnotifications.br.PNPullAlarmReceiver
//   com.meesho.pushnotify.pullnotifications.br.RebootBroadcastReceiver (BOOT_COMPLETED)
//
// Setting android:enabled="false" on exactly these receivers stops the alarm
// rescheduling chain while leaving FCM push and the rest of the app intact.
//
// Opt-in (default = false): some users may want the pull notifications; this
// only removes the alarm-driven marketing channel.
//
// Fail-safe: receivers not present in the manifest are simply not touched.

private val PULL_NOTIFICATION_RECEIVERS = setOf(
    "com.meesho.pushnotify.pullnotifications.br.PNAlarmReceiver",
    "com.meesho.pushnotify.pullnotifications.br.PNPullAlarmReceiver",
    "com.meesho.pushnotify.pullnotifications.br.RebootBroadcastReceiver",
)

@Suppress("unused")
val meeshoStopPullNotificationAlarmsPatch = resourcePatch(
    name = "Stop pull-notification alarms (keep push)",
    description = "Disables Meesho's alarm-based pull-notification receivers so the app is " +
        "not periodically woken to fetch marketing notifications. FCM push keeps working.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val receivers = document.getElementsByTagName("receiver")
            for (index in 0 until receivers.length) {
                val receiver = receivers.item(index) as? Element ?: continue
                if (receiver.getAttribute("android:name") in PULL_NOTIFICATION_RECEIVERS) {
                    receiver.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}
