package app.template.patches.crimeradar

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR

/**
 * Changes the app name to "CrimeRadar+" and tints the launcher icon background
 * to a distinctive purple, making the patched version easy to identify
 * when installed alongside the original.
 */
@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "Branding",
    description = "Changes app name to 'CrimeRadar+' and tints the icon for easy identification.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    finalize {
        // Change app name: "CrimeRadar" → "CrimeRadar+"
        document("res/values/strings.xml").use { doc ->
            val stringNodes = doc.getElementsByTagName("string")
            for (i in 0 until stringNodes.length) {
                val elem = stringNodes.item(i) as? org.w3c.dom.Element ?: continue
                if (elem.getAttribute("name") == "app_name") {
                    elem.textContent = "CrimeRadar+"
                    break
                }
            }
        }

        // Tint the adaptive icon background: white (#fff) → purple (#7B1FA2)
        // This makes the patched app visually distinct on the home screen.
        document("res/drawable/ic_launcher_background.xml").use { doc ->
            val paths = doc.getElementsByTagName("path")
            for (i in 0 until paths.length) {
                val path = paths.item(i) as? org.w3c.dom.Element ?: continue
                val fillColor = path.getAttribute("android:fillColor")
                if (fillColor == "#fff") {
                    path.setAttribute("android:fillColor", "#FF7B1FA2")
                }
            }
        }

        // Also tint the night mode variant
        try {
            document("res/drawable-night/ic_launcher_background.xml").use { doc ->
                val paths = doc.getElementsByTagName("path")
                for (i in 0 until paths.length) {
                    val path = paths.item(i) as? org.w3c.dom.Element ?: continue
                    val fillColor = path.getAttribute("android:fillColor")
                    if (fillColor == "#000" || fillColor == "#000000") {
                        path.setAttribute("android:fillColor", "#FF7B1FA2")
                    }
                }
            }
        } catch (_: Exception) {
            // Night variant may not exist
        }
    }
}
