package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Universal: strip INTERNET (and related) permissions from the manifest.
 * Useful for offline-only launchers / tools. Will break online features.
 */
@Suppress("unused")
val removeInternetPermissionPatch = resourcePatch(
    name = "Remove INTERNET permission",
    description = "Removes INTERNET / ACCESS_NETWORK_STATE permissions from the manifest.",
    default = false
) {
    execute {
        val banned = setOf(
            "android.permission.INTERNET",
            "android.permission.ACCESS_NETWORK_STATE",
            "android.permission.ACCESS_WIFI_STATE",
            "android.permission.CHANGE_NETWORK_STATE",
            "android.permission.CHANGE_WIFI_STATE"
        )

        document("AndroidManifest.xml").use { document ->
            val nodes = document.getElementsByTagName("uses-permission")
            // Remove from end to start so indices stay valid
            for (i in nodes.length - 1 downTo 0) {
                val el = nodes.item(i) as? Element ?: continue
                val name = el.getAttribute("android:name")
                if (name in banned) {
                    el.parentNode?.removeChild(el)
                }
            }
        }
    }
}
