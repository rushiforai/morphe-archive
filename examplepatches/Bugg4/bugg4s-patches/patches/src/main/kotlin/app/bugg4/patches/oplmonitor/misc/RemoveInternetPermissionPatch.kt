package app.bugg4.patches.oplmonitor.misc

import app.bugg4.patches.oplmonitor.Constants.COMPATIBILITY_OPL_MONITOR
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val removeInternetPermissionPatch = resourcePatch(
    name = "Remove internet permission",
    description = "Removes the INTERNET permission from the manifest. " +
        "This stops the app from reaching the network at all, which also prevents app update checks. " +
        "This will likely break features that download data, such as DTC descriptions, " +
        "VIN decoder gauges and function files.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_OPL_MONITOR)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            val internetPermissions = buildList {
                for (i in 0 until permissions.length) {
                    val permission = permissions.item(i) as? Element ?: continue
                    if (permission.getAttribute("android:name") ==
                        "android.permission.INTERNET"
                    ) {
                        add(permission)
                    }
                }
            }

            internetPermissions.forEach { permission ->
                permission.parentNode.removeChild(permission)
            }
        }
    }
}
