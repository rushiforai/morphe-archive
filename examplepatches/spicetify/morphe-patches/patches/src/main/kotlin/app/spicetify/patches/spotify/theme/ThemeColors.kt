package app.spicetify.patches.spotify.theme

import org.w3c.dom.Document
import org.w3c.dom.Element

private val hexColor = Regex("#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?")

internal fun isThemeColor(value: String?): Boolean = value != null && hexColor.matches(value)

internal data class ThemeColors(
    val background: String,
    val accent: String,
    val pressedAccent: String,
) {
    init {
        mapOf(
            "Primary background color" to background,
            "Accent color" to accent,
            "Pressed accent color" to pressedAccent,
        ).forEach { (name, value) ->
            require(isThemeColor(value)) { "$name must be #RRGGBB or #AARRGGBB." }
        }
    }
}

// Resource mapping adapted from anddea/revanced-patches (GPL-3.0),
// commit 3174510163d9787571bd93275b54932b575f82ed, CustomThemePatch.kt.
// Limited to resources present in Spotify 9.1.80.2221; launcher colors are excluded.
internal fun applyThemeColors(document: Document, colors: ThemeColors) {
    val replacements = buildMap {
        listOf(
            "gray_7",
            "gray_10",
            "dark_base_background_base",
            "dark_base_background_elevated_base",
            "bg_gradient_end_color",
            "sthlm_blk",
        ).forEach { put(it, colors.background) }
        listOf(
            "dark_brightaccent_background_base",
            "dark_base_text_brightaccent",
            "green_light",
        ).forEach { put(it, colors.accent) }
        put("dark_brightaccent_background_press", colors.pressedAccent)
    }

    val root = document.documentElement
    require(root?.tagName == "resources") { "Expected <resources> in res/values/colors.xml." }
    val children = root.childNodes
    val resources = (0 until children.length)
        .mapNotNull { children.item(it) as? Element }
        .filter { it.tagName == "color" && it.getAttribute("name") in replacements }
        .groupBy { it.getAttribute("name") }

    val missing = replacements.keys - resources.keys
    require(missing.isEmpty()) {
        "Unsupported Spotify color resources: missing ${missing.joinToString()} in res/values/colors.xml."
    }
    val duplicates = resources.filterValues { it.size != 1 }.keys
    require(duplicates.isEmpty()) {
        "Ambiguous Spotify color resources: duplicate ${duplicates.joinToString()} in res/values/colors.xml."
    }

    resources.forEach { (name, nodes) -> nodes.single().textContent = replacements.getValue(name) }
}
