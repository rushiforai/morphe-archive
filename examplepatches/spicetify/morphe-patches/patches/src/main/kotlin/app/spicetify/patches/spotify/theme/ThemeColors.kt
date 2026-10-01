package app.spicetify.patches.spotify.theme

import org.w3c.dom.Document
import org.w3c.dom.Element

// Resource names adapted from anddea/revanced-patches (GPL-3.0),
// commit 3174510163d9787571bd93275b54932b575f82ed, CustomThemePatch.kt.
// The extension overrides these colors at runtime by name; launcher colors are excluded.
internal val themeColorResources = listOf(
    "gray_7",
    "gray_10",
    "dark_base_background_base",
    "dark_base_background_elevated_base",
    "bg_gradient_end_color",
    "sthlm_blk",
    "dark_brightaccent_background_base",
    "dark_base_text_brightaccent",
    "green_light",
    "dark_brightaccent_background_press",
)

/** Checks that each runtime theme color exists exactly once, without changing the document. */
internal fun requireThemeColorResources(document: Document) {
    val root = document.documentElement
    require(root?.tagName == "resources") { "Expected <resources> in res/values/colors.xml." }
    val children = root.childNodes
    val resources = (0 until children.length)
        .mapNotNull { children.item(it) as? Element }
        .filter { it.tagName == "color" && it.getAttribute("name") in themeColorResources }
        .groupBy { it.getAttribute("name") }

    val missing = themeColorResources - resources.keys
    require(missing.isEmpty()) {
        "Unsupported Spotify color resources: missing ${missing.joinToString()} in res/values/colors.xml."
    }
    val duplicates = resources.filterValues { it.size != 1 }.keys
    require(duplicates.isEmpty()) {
        "Ambiguous Spotify color resources: duplicate ${duplicates.joinToString()} in res/values/colors.xml."
    }
}
