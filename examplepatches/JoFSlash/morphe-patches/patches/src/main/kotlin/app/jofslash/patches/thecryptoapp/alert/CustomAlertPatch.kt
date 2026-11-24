package app.jofslash.patches.thecryptoapp.alert

import app.jofslash.patches.thecryptoapp.shared.ApplicationOnCreateFingerprint
import app.jofslash.patches.thecryptoapp.shared.Constants.COMPATIBILITY_THECRYPTOAPP
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val EXTENSION_PACKAGE = "app.jofslash.extension.thecryptoapp"
private const val EXTENSION_CLASS = "Lapp/jofslash/extension/thecryptoapp/CustomAlerts;"

// Registers the extension's own launcher Activity and the alarm/boot BroadcastReceiver into the
// host manifest (the extension's own manifest stays a bare <manifest/>; components are declared
// here, the same way the extension dex supplies their classes).
private val customAlertResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element

            // Exact alarms so the check fires through Doze. USE_EXACT_ALARM (API 33+) is auto-granted
            // for an alarm-style app; SCHEDULE_EXACT_ALARM covers API 31-32. The extension falls back
            // to inexact if neither is effective (canScheduleExactAlarms() == false).
            fun addPermission(name: String, maxSdk: Int? = null) {
                val exists = document.getElementsByTagName("uses-permission").let { list ->
                    (0 until list.length).any {
                        (list.item(it) as Element).getAttribute("android:name") == name
                    }
                }
                if (!exists) manifest.insertBefore(
                    document.createElement("uses-permission").apply {
                        setAttribute("android:name", name)
                        if (maxSdk != null) setAttribute("android:maxSdkVersion", maxSdk.toString())
                    },
                    application
                )
            }
            addPermission("android.permission.USE_EXACT_ALARM")
            addPermission("android.permission.SCHEDULE_EXACT_ALARM", maxSdk = 32)
            // The host already declares both; added only if a later version drops them.
            addPermission("android.permission.RECEIVE_BOOT_COMPLETED")
            addPermission("android.permission.POST_NOTIFICATIONS")

            // Standalone config screen, shown as a second launcher icon "Crypto Alerts". A framework
            // theme (DayNight) and a framework icon keep it free of any host-app resource dependency.
            val activity = document.createElement("activity").apply {
                setAttribute("android:name", "$EXTENSION_PACKAGE.AlertsActivity")
                setAttribute("android:exported", "true")
                setAttribute("android:label", "Crypto Alerts")
                setAttribute("android:icon", "@android:drawable/ic_popup_reminder")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
                setAttribute("android:taskAffinity", "$EXTENSION_PACKAGE.alerts")
                appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.MAIN")
                    })
                    appendChild(document.createElement("category").apply {
                        setAttribute("android:name", "android.intent.category.LAUNCHER")
                    })
                })
            }
            application.appendChild(activity)

            // Internal screens launched from AlertsActivity (no launcher icon).
            fun internalActivity(className: String) = document.createElement("activity").apply {
                setAttribute("android:name", className)
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
                setAttribute("android:taskAffinity", "$EXTENSION_PACKAGE.alerts")
            }
            application.appendChild(internalActivity("$EXTENSION_PACKAGE.ChartActivity"))
            application.appendChild(internalActivity("$EXTENSION_PACKAGE.PortfolioActivity"))

            // Receives the ~15 min alarm tick (our own PendingIntent), BOOT_COMPLETED and
            // MY_PACKAGE_REPLACED (both re-arm the alarm). Not exported: the system still delivers
            // its own broadcasts, but other apps can't send it fake ticks.
            val receiver = document.createElement("receiver").apply {
                setAttribute("android:name", "$EXTENSION_PACKAGE.AlertReceiver")
                setAttribute("android:exported", "false")
                appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.BOOT_COMPLETED")
                    })
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.MY_PACKAGE_REPLACED")
                    })
                })
            }
            application.appendChild(receiver)
        }
    }
}

@Suppress("unused")
val customAlertPatch = bytecodePatch(
    name = "Custom price alerts",
    description = "Adds a \"Crypto Alerts\" app icon with your own price alerts (a price above or below a " +
            "target, or a 24h change), checked about every 15 minutes with free public prices (Binance, then " +
            "CoinGecko) and shown as notifications, plus a chart and a local portfolio. Our own screens: they " +
            "don't unlock Pro or touch the app's own alerts, and need no account.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_THECRYPTOAPP)

    extendWith("extensions/thecryptoapp.mpe")
    dependsOn(customAlertResourcePatch)

    execute {
        // At the very top of App.onCreate, hand the Application (a Context) to our extension, which
        // creates the channel, schedules the alarm and runs an immediate check. The range form
        // reaches p0 regardless of how many locals onCreate uses.
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->init(Landroid/content/Context;)V"
        )
    }
}
