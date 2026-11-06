/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.patches.applemusic.layout.accent

import app.liquidmusic.patches.applemusic.shared.Constants.COMPATIBILITY_APPLE_MUSIC
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private val COLOR = Regex("#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})")

private val PRESETS = mapOf(
    "Apple Music red" to "#FA2D48",
    "Blue" to "#0A84FF",
    "Purple" to "#BF5AF2",
    "Green" to "#30D158",
    "Orange" to "#FF9F0A",
)

@Suppress("unused")
val accentColorPatch = resourcePatch(
    name = "Accent color",
    description = "Replaces the red of Apple Music (buttons, links, the selected tab, progress) with " +
        "another color. Blue matches the liquid tab bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_APPLE_MUSIC)

    val darkColor by stringOption(
        key = "darkColor",
        default = "#0A84FF",
        values = PRESETS,
        title = "Color in the dark theme",
        description = "Accent color when Apple Music is dark, as #RRGGBB. Apple's is #FA2D48.",
        required = true,
    ) { it != null && COLOR.matches(it) }

    val lightColor by stringOption(
        key = "lightColor",
        default = "#007AFF",
        values = PRESETS + ("Apple Music red" to "#FA233B"),
        title = "Color in the light theme",
        description = "Accent color when Apple Music is light, as #RRGGBB. Apple's is #FA233B.",
        required = true,
    ) { it != null && COLOR.matches(it) }

    execute {
        val dark = argb(darkColor!!)
        val light = argb(lightColor!!)

        // key_color is the accent of the app; color_primary and the other accents point to it.
        // color_primary_disabled repeats the red for both themes.
        val colorFiles = decode("res/values*/colors.xml")
        for (path in colorFiles) {
            val night = path.contains("-night")
            val replacements = if (night) {
                mapOf("color_primary_disabled" to dark)
            } else {
                mapOf(
                    "key_color_dark" to dark,
                    "key_color_light" to light,
                    "color_primary_disabled" to light,
                )
            }
            document(path).use { document ->
                val colors = document.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val color = colors.item(i) as Element
                    replacements[color.getAttribute("name")]?.let { color.textContent = it }
                }
            }
        }
    }
}

/** #RRGGBB or #AARRGGBB to the #AARRGGBB form of the app's colors. */
private fun argb(color: String): String {
    val hex = color.removePrefix("#")
    return "#" + (if (hex.length == 6) "ff$hex" else hex).lowercase()
}
