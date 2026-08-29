package app.danielthemaniel.patches.defit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val materialYouThemePatch = resourcePatch(
    name = "Material You Theme",
    description = "Uses Android 12+ wallpaper-derived colors and enables safe system Force Dark without changing DeFit's AppCompat theme parent.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)

    execute {
        // Keep DeFit's original AppCompat parent. Changing it to a DayNight
        // parent causes this old build to crash during Activity startup.
        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")

            for (i in 0 until styles.length) {
                val style = styles.item(i) as? Element ?: continue
                if (style.getAttribute("name") != "AppTheme") continue

                fun setStyleItem(name: String, value: String) {
                    val items = style.getElementsByTagName("item")
                    for (j in 0 until items.length) {
                        val item = items.item(j) as? Element ?: continue
                        if (item.getAttribute("name") == name) {
                            item.textContent = value
                            return
                        }
                    }

                    val item = document.createElement("item")
                    item.setAttribute("name", name)
                    item.textContent = value
                    style.appendChild(item)
                }

                // Let Android automatically darken this legacy light theme
                // when the device is in dark mode.
                setStyleItem("android:forceDarkAllowed", "true")

                // Avoid a permanently-black navigation bar on modern devices.
                setStyleItem(
                    "android:navigationBarColor",
                    "@android:color/system_neutral1_800"
                )

                break
            }
        }

        // These are the same dynamic palette mappings that already worked
        // without crashing on the device.
        val replacements = mapOf(
            "colorPrimary" to "@android:color/system_accent1_500",
            "colorPrimaryDark" to "@android:color/system_accent1_700",
            "colorAccent" to "@android:color/system_accent2_500",

            "background_material_light" to "@android:color/system_neutral1_50",
            "foreground_material_light" to "@android:color/system_neutral1_900",
            "dim_foreground_material_light" to "@android:color/system_neutral2_700",
            "bright_foreground_material_light" to "@android:color/system_neutral1_1000",

            "background_material_dark" to "@android:color/system_neutral1_900",
            "foreground_material_dark" to "@android:color/system_neutral1_100",
            "dim_foreground_material_dark" to "@android:color/system_neutral2_300",
            "bright_foreground_material_dark" to "@android:color/system_neutral1_0",
        )

        document("res/values/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")

            for (i in 0 until colors.length) {
                val color = colors.item(i) as? Element ?: continue
                replacements[color.getAttribute("name")]?.let {
                    color.textContent = it
                }
            }
        }
    }
}
