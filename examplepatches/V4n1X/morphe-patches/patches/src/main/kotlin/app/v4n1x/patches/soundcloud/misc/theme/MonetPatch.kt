package app.v4n1x.patches.soundcloud.misc.theme

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.findElementByAttributeValue
import app.v4n1x.patches.soundcloud.shared.Constants
import org.w3c.dom.Element

@Suppress("unused")
val monetPatch = resourcePatch(
    name = "Material You dynamic theme",
    description = "Applies Android 12+ Material You dynamic accent colors from the system wallpaper palette.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_SOUNDCLOUD)

    execute {
        // Dynamic Monet accent mappings for Android 12+ (API 31+)
        document("res/values-v31/colors.xml").use { document ->
            val root = document.documentElement
            val colors = document.getElementsByTagName("color")

            val monetColors = mapOf(
                "shared_colors_special_action" to "@android:color/system_accent1_500",
                "progressBelow" to "@android:color/system_accent1_200",
                "dark_mode_link" to "@android:color/system_accent1_400",
                "light_mode_link" to "@android:color/system_accent1_600"
            )

            monetColors.forEach { (name, value) ->
                val existing = colors.findElementByAttributeValue("name", name)
                if (existing != null) {
                    existing.textContent = value
                } else {
                    val elem = document.createElement("color") as Element
                    elem.setAttribute("name", name)
                    elem.textContent = value
                    root.appendChild(elem)
                }
            }
        }

        // Map soundcloud_orange to dynamic action color in base colors
        document("res/values/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")
            colors.findElementByAttributeValue("name", "soundcloud_orange")?.textContent =
                "@color/shared_colors_special_action"
        }

        // Waveform audio scrubber styles
        document("res/values/styles.xml").use { document ->
            val items = document.getElementsByTagName("item")
            items.findElementByAttributeValue("name", "progressAbove")?.textContent =
                "@color/shared_colors_special_action"
            items.findElementByAttributeValue("name", "progressBelow")?.textContent =
                "@color/progressBelow"
        }
    }
}
