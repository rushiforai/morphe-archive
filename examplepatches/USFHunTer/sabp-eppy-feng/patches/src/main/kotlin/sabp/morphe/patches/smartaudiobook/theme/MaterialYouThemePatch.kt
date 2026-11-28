package sabp.morphe.patches.smartaudiobook.theme

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import sabp.morphe.patches.smartaudiobook.smartAudioBookCompatibility
import org.w3c.dom.Document
import org.w3c.dom.Element

// How SABP colours itself (11.7.8):
//
// * Every accent in the app (seek bars, progress bars, the hand-drawn player buttons, highlighted
//   list rows, switches) comes from two colour resources, theme_color_1 (#33B5E5) and theme_color_2
//   (#0099CC). That is the old Android 4 "Holo" blue, which is most of why the app looks dated. The
//   custom player views read these through Resources.getColor(), so recolouring the resource
//   recolours the canvas-drawn widgets too, with no bytecode changes.
// * Backgrounds come from background_dark (#1F1F1F), background_light (#FFFFFF) and
//   background_black (#000000). The user picks Light / Dark / Black inside the app, and the app
//   calls setTheme() with one of nine AppTheme* styles, so system night-mode qualifiers do not
//   follow the in-app choice. Colours therefore have to be valid on both light and dark surfaces,
//   or be routed per theme through the AppTheme* styles.
// * Dialogs are framework android.app.AlertDialog on Theme.Material, whose background shape reads
//   ?android:dialogCornerRadius from the *dialog* theme, so rounding them needs a custom
//   android:alertDialogTheme rather than an attribute on the activity theme.
//
// Wallpaper ("dynamic") colours are only exposed as @android:color/system_* from Android 12 (API
// 31), and SABP's minSdk is 30, so dynamic values go into -v31 resource folders and Android 11 keeps
// the stock colours (or the custom accent, if one is set).

private val HEX_COLOR = Regex("^#?([0-9a-fA-F]{6})$")

private val LIGHT_THEMES = setOf(
    "AppThemeLight",
    "AppThemeCompatNoActionBarLight",
    "AppThemeCompatOverlayLight",
)
private val DARK_THEMES = setOf(
    "AppThemeDark",
    "AppThemeBlack",
    "AppThemeCompatNoActionBarDark",
    "AppThemeCompatNoActionBarBlack",
    "AppThemeCompatOverlayDark",
    "AppThemeCompatOverlayBlack",
)

private const val DIALOG_THEME_DARK = "SabpModern.AlertDialog.Dark"
private const val DIALOG_THEME_LIGHT = "SabpModern.AlertDialog.Light"

@Suppress("unused")
val materialYouThemePatch = resourcePatch(
    name = "Material You theme",
    description = "Replaces the old Holo-blue accent with your wallpaper colours (Android 12+) or a " +
        "colour you choose, tints the dark and light backgrounds to match, and rounds dialogs, " +
        "sheets, cards and progress bars the way Material 3 does. The in-app Light, Dark and Black " +
        "theme choice keeps working.",
) {
    compatibleWith(smartAudioBookCompatibility)

    val accentColor by stringOption(
        key = "accentColor",
        default = null,
        title = "Custom accent colour",
        description = "Leave empty to follow your wallpaper colours (Material You, Android 12+). " +
            "Or enter a hex colour such as #8AB4F8 to use that accent on every Android version.",
        required = false,
    ) { value -> value.isNullOrBlank() || HEX_COLOR.matches(value.trim()) }

    val tintBackgrounds by booleanOption(
        key = "tintBackgrounds",
        default = true,
        title = "Tint backgrounds",
        description = "Gives the Dark and Light themes the softly tinted Material You surfaces " +
            "(Android 12+). The Black theme stays pure black for AMOLED screens.",
    )

    val roundedShapes by booleanOption(
        key = "roundedShapes",
        default = true,
        title = "Rounded shapes",
        description = "Rounds dialogs (28dp), bottom sheets, cards and buttons, and makes progress " +
            "bars thicker with pill-shaped ends.",
    )

    execute {
        val customAccent = accentColor?.trim()?.takeIf { it.isNotEmpty() }?.let { raw ->
            val hex = HEX_COLOR.matchEntire(raw)?.groupValues?.get(1)
                ?: throw PatchException("Custom accent colour \"$raw\" is not a 6-digit hex colour like #8AB4F8.")
            hex.lowercase()
        }

        // 1. Base colours (all Android versions). Only touched when a custom accent is set;
        //    otherwise Android 11 keeps the stock accent.
        if (customAccent != null) {
            document("res/values/colors.xml").use { doc ->
                doc.setResourceValue("color", "theme_color_1", "#ff$customAccent")
                doc.setResourceValue("color", "theme_color_2", "#ff${darken(customAccent, 0.80)}")
            }
        }

        // 2. Android 12+ dynamic colours. values-v31 overrides values on API 31+, so an entry is only
        //    written here when it should win over the base value.
        val v31Colors = buildList {
            if (customAccent == null) {
                // Tone 300 reads well on both the dark surfaces and, as a seek-bar/progress fill, on
                // the light one; tone 500 is the pressed/secondary shade the app pairs with it.
                add("theme_color_1" to "@android:color/system_accent1_300")
                add("theme_color_2" to "@android:color/system_accent1_500")
            }
            if (tintBackgrounds == true) {
                add("background_dark" to "@android:color/system_neutral1_900")
                add("background_light" to "@android:color/system_neutral1_10")
                add("background_highlighted_dark" to "@color/sabp_modern_highlight_dark")
                add("background_highlighted_light" to "@color/sabp_modern_highlight_light")
            }
        }
        if (v31Colors.isNotEmpty()) {
            writeResourceFile(
                "res/values-v31/colors.xml",
                resourcesXml(v31Colors.joinToString("\n") { (name, value) ->
                    "    <color name=\"$name\">$value</color>"
                }),
            )
        }
        if (tintBackgrounds == true) {
            // Highlighted rows (current chapter, selected book) become a translucent accent
            // instead of a translucent grey, like a Material 3 "secondary container".
            val highlightAccent = if (customAccent != null) "#ff$customAccent" else "@android:color/system_accent1_200"
            val highlightAccentLight = if (customAccent != null) "#ff$customAccent" else "@android:color/system_accent1_600"
            writeResourceFile("res/color-v31/sabp_modern_highlight_dark.xml", alphaColorList(highlightAccent, 0.22))
            writeResourceFile("res/color-v31/sabp_modern_highlight_light.xml", alphaColorList(highlightAccentLight, 0.16))
            // Fallbacks so the resource names also exist below API 31 (never referenced there).
            writeResourceFile("res/color/sabp_modern_highlight_dark.xml", alphaColorList("#ffffffff", 0.19))
            writeResourceFile("res/color/sabp_modern_highlight_light.xml", alphaColorList("#ff000000", 0.18))
        }

        // 3. Shapes.
        if (roundedShapes == true) {
            document("res/values/dimens.xml").use { doc ->
                doc.setResourceValue("dimen", "mtrl_shape_corner_size_small_component", "8.0dip")
                doc.setResourceValue("dimen", "mtrl_shape_corner_size_medium_component", "16.0dip")
                doc.setResourceValue("dimen", "mtrl_shape_corner_size_large_component", "28.0dip")
                doc.setResourceValue("dimen", "progress_height", "6.0dip")
                doc.setResourceValue("dimen", "progress_corner_radius", "3.0dip")
            }

            document("res/values/styles.xml").use { doc ->
                val resources = doc.documentElement
                resources.appendChild(
                    doc.newStyle(
                        DIALOG_THEME_DARK,
                        "@android:style/Theme.Material.Dialog.Alert",
                        "android:dialogCornerRadius" to "28.0dip",
                        "android:colorAccent" to "@color/theme_color_1",
                        "android:colorBackground" to "@color/background_dark",
                    ),
                )
                resources.appendChild(
                    doc.newStyle(
                        DIALOG_THEME_LIGHT,
                        "@android:style/Theme.Material.Light.Dialog.Alert",
                        "android:dialogCornerRadius" to "28.0dip",
                        "android:colorAccent" to "@color/theme_color_2",
                        "android:colorBackground" to "@color/background_light",
                    ),
                )

                val styles = doc.elements("style").associateBy { it.getAttribute("name") }
                (LIGHT_THEMES + DARK_THEMES).forEach { name ->
                    val style = styles[name] ?: throw PatchException(
                        "Smart AudioBook Player: theme style $name was not found. The theme layout " +
                            "changed in this version.",
                    )
                    val dialogTheme = if (name in LIGHT_THEMES) DIALOG_THEME_LIGHT else DIALOG_THEME_DARK
                    style.setItem(doc, "android:alertDialogTheme", "@style/$dialogTheme")
                    style.setItem(doc, "android:dialogCornerRadius", "28.0dip")
                }
            }
        }
    }
}

// ---- helpers -------------------------------------------------------------------------------

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { nodes -> (0 until nodes.length).mapNotNull { nodes.item(it) as? Element } }

private fun Document.setResourceValue(tag: String, name: String, value: String) {
    val element = elements(tag).singleOrNull { it.getAttribute("name") == name }
        ?: throw PatchException(
            "Smart AudioBook Player: <$tag name=\"$name\"> was not found. The resources changed in " +
                "this version.",
        )
    element.textContent = value
}

private fun Document.newStyle(name: String, parent: String, vararg items: Pair<String, String>): Element =
    createElement("style").apply {
        setAttribute("name", name)
        setAttribute("parent", parent)
        items.forEach { (itemName, value) -> setItem(this@newStyle, itemName, value) }
    }

private fun Element.setItem(doc: Document, itemName: String, value: String) {
    val children = getElementsByTagName("item")
    val existing = (0 until children.length)
        .mapNotNull { children.item(it) as? Element }
        .firstOrNull { it.getAttribute("name") == itemName }
    if (existing != null) {
        existing.textContent = value
    } else {
        appendChild(doc.createElement("item").apply {
            setAttribute("name", itemName)
            textContent = value
        })
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.writeResourceFile(path: String, content: String) {
    val file = get(path)
    file.parentFile.mkdirs()
    file.writeText(content)
}

private fun resourcesXml(body: String) =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n$body\n</resources>\n"

private fun alphaColorList(color: String, alpha: Double) =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
        "<selector xmlns:android=\"http://schemas.android.com/apk/res/android\">\n" +
        "    <item android:color=\"$color\" android:alpha=\"$alpha\" />\n" +
        "</selector>\n"

/** Darkens an RRGGBB hex colour by multiplying each channel by [factor]. */
private fun darken(hex: String, factor: Double): String =
    hex.chunked(2).joinToString("") { channel ->
        (channel.toInt(16) * factor).toInt().coerceIn(0, 255).toString(16).padStart(2, '0')
    }
