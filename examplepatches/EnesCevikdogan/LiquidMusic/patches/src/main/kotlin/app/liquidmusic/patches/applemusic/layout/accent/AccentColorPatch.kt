package app.liquidmusic.patches.applemusic.layout.accent

import app.liquidmusic.patches.applemusic.shared.Constants.COMPATIBILITY_APPLE_MUSIC
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private val HEX_COLOR = Regex("#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})")

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
    description = "Replaces Apple Music's red accent color with a custom color for dark and light themes.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_APPLE_MUSIC)

    val darkColor by stringOption(
        key = "darkColor",
        default = "#0A84FF",
        values = PRESETS,
        title = "Dark theme accent",
        description = "Accent color in dark mode (#RRGGBB or #AARRGGBB).",
        required = true,
    ) { it != null && HEX_COLOR.matches(it) }

    val lightColor by stringOption(
        key = "lightColor",
        default = "#007AFF",
        values = PRESETS + ("Apple Music red" to "#FA233B"),
        title = "Light theme accent",
        description = "Accent color in light mode (#RRGGBB or #AARRGGBB).",
        required = true,
    ) { it != null && HEX_COLOR.matches(it) }

    execute {
        val dark = normalizeArgb(darkColor!!)
        val light = normalizeArgb(lightColor!!)

        val colorFiles = decode("res/values*/colors.xml")
        for (path in colorFiles) {
            val isNight = path.contains("-night")
            val replacements = if (isNight) {
                mapOf("color_primary_disabled" to dark)
            } else {
                mapOf(
                    "key_color_dark" to dark,
                    "key_color_light" to light,
                    "color_primary_disabled" to light,
                )
            }
            document(path).use { doc ->
                val colors = doc.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val element = colors.item(i) as Element
                    replacements[element.getAttribute("name")]?.let { element.textContent = it }
                }
            }
        }
    }
}

private fun normalizeArgb(color: String): String {
    val hex = color.removePrefix("#")
    return "#" + (if (hex.length == 6) "ff$hex" else hex).lowercase()
}
