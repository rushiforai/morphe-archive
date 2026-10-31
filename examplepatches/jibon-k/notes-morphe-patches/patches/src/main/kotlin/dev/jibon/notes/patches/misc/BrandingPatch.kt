package dev.jibon.notes.patches.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import dev.jibon.notes.patches.compat.elements
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

// Samsung's accent blue; colours using it (with any alpha) get the new accent.
private const val SAMSUNG_BLUE = "387aff"

// Densities of the launcher icon's foreground layer (108 dp); -v35 copies exist for Android 15+.
private val ICON_DENSITIES = listOf("mdpi", "xhdpi", "xxhdpi")

private val HEX_COLOR = Regex("#?[0-9a-fA-F]{6}")

/** "#aarrggbb" or "#rrggbb" using [SAMSUNG_BLUE] -> the same alpha with [rgb]; anything else -> null. */
private fun recolor(value: String, rgb: String): String? {
    val hex = value.trim().lowercase().removePrefix("#")
    if (!hex.endsWith(SAMSUNG_BLUE) || hex.length !in setOf(6, 8)) return null
    return "#" + hex.dropLast(6) + rgb
}

@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "Branding",
    description = "Your own app name, the Notes pen logo as launcher icon, and an accent colour in place of Samsung's blue.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    val appName by stringOption(
        key = "appName",
        default = "Notes",
        values = mapOf("Notes" to "Notes", "Samsung Notes (unchanged)" to ""),
        title = "App name",
        description = "Name under the launcher icon. Empty: keep Samsung Notes.",
    )
    val accentLight by stringOption(
        key = "accentLight",
        default = "#C8372A",
        values = mapOf("Red (logo)" to "#C8372A", "Samsung blue (unchanged)" to ""),
        title = "Accent colour (light theme)",
        description = "#rrggbb for buttons, switches and highlights. Empty: keep Samsung's blue.",
    )
    val accentDark by stringOption(
        key = "accentDark",
        default = "#FF7A6B",
        values = mapOf("Light red (logo)" to "#FF7A6B", "Same as light theme" to ""),
        title = "Accent colour (dark theme)",
        description = "#rrggbb used in the dark theme; a lighter shade reads better on dark backgrounds. " +
            "Empty: the light-theme colour.",
    )

    execute {
        // Launcher icon: the logo carries its own background, so only the foreground layer changes.
        ICON_DENSITIES.forEach { density ->
            val png = object {}.javaClass.classLoader.getResourceAsStream("branding/notes_foreground-$density.png")
                ?.use { it.readBytes() } ?: throw PatchException("branding/notes_foreground-$density.png not found")
            listOf("drawable-$density", "drawable-$density-v35").forEach { dir ->
                get("res/$dir/notes_foreground.png", false).writeBytes(png)
            }
        }

        appName?.takeIf { it.isNotBlank() }?.let { name ->
            // app_name is also translated; the launcher label follows the device language.
            listDecodableFiles("res/values*/strings.xml").forEach { path ->
                document(path).use { document ->
                    document.documentElement.elements("string")
                        .filter { it.getAttribute("name") == "app_name" }
                        .forEach { it.textContent = name }
                }
            }
        }

        val light = accentLight?.takeIf { it.isNotBlank() } ?: return@execute
        if (!HEX_COLOR.matches(light)) throw PatchException("accentLight must be #rrggbb: $light")
        val dark = accentDark?.takeIf { it.isNotBlank() } ?: light
        if (!HEX_COLOR.matches(dark)) throw PatchException("accentDark must be #rrggbb: $dark")
        val lightRgb = light.lowercase().removePrefix("#")
        val darkRgb = dark.lowercase().removePrefix("#")

        // Named colours with Samsung's blue are only defined once (values/); the dark theme gets
        // its own shade through new values-night entries of the same names.
        val nightColors = mutableMapOf<String, String>()
        document("res/values/colors.xml").use { document ->
            document.documentElement.elements("color").forEach { color ->
                val original = color.textContent
                color.textContent = recolor(original, lightRgb) ?: return@forEach
                nightColors[color.getAttribute("name")] = recolor(original, darkRgb)!!
            }
        }
        document("res/values-night/colors.xml").use { document ->
            val resources = document.documentElement
            val defined = resources.elements("color").map { it.getAttribute("name") }.toSet()
            nightColors.filterKeys { it !in defined }.forEach { (name, value) ->
                resources.appendChild(document.createElement("color").apply {
                    setAttribute("name", name)
                    textContent = value
                })
            }
        }
        // Theme items that use the blue directly.
        document("res/values/styles.xml").use { document ->
            document.documentElement.elements("item").forEach { item ->
                recolor(item.textContent, lightRgb)?.let { item.textContent = it }
            }
        }
    }
}
