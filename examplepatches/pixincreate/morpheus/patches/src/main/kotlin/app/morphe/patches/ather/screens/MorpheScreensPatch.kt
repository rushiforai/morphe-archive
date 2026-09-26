/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.screens

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val EXTENSION_PACKAGE = "app.morphe.ather"

/** The Morphe screens the extension ships, as label to class name. */
private val SCREENS = listOf(
    "Morphe settings" to "MorpheMapSettingsActivity",
    "Morphe history" to "MorpheHistoryActivity",
    "Morphe ride" to "MorpheRideActivity",
)

/**
 * Registers the components of the Morphe extension in the app manifest.
 *
 * The extension ships three screens, a background ride service and a boot receiver.
 * Android only starts a component that the manifest declares, so all five have to be
 * added here. Without this patch the Morphe screens cannot open, the background
 * service cannot start and the boot receiver never receives `BOOT_COMPLETED`.
 *
 * The app already asks for every permission these components need, so this patch adds
 * components only.
 */
@Suppress("unused")
val morpheScreensPatch = resourcePatch(
    name = "Morphe screens",
    description = "Registers the Morphe settings, history and ride screens, the background ride service and its boot receiver in the app manifest.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw IllegalStateException("Ather manifest has no application element.")

            SCREENS.forEach { (label, className) ->
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", "$EXTENSION_PACKAGE.$className")
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:label", label)
                activity.setAttribute("android:screenOrientation", "portrait")
                activity.setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                application.appendChild(activity)
            }

            val service = document.createElement("service")
            service.setAttribute("android:name", "$EXTENSION_PACKAGE.RideService")
            service.setAttribute("android:exported", "false")
            service.setAttribute("android:foregroundServiceType", "connectedDevice")
            application.appendChild(service)

            val receiver = document.createElement("receiver")
            receiver.setAttribute("android:name", "$EXTENSION_PACKAGE.RideBootReceiver")
            receiver.setAttribute("android:exported", "false")

            val intentFilter = document.createElement("intent-filter")
            val action = document.createElement("action")
            action.setAttribute("android:name", "android.intent.action.BOOT_COMPLETED")
            intentFilter.appendChild(action)
            receiver.appendChild(intentFilter)

            application.appendChild(receiver)
        }
    }
}
