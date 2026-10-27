package app.morphe.patches.googlephotos.misc.theme

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

private const val AMOLED_BLACK = "#ff000000"
private const val AMOLED_CARD_SURFACE_LOW = "#ff121214"
private const val AMOLED_CARD_SURFACE = "#ff18181b"
private const val AMOLED_CARD_SURFACE_HIGH = "#ff222226"
private const val AMOLED_CARD_SURFACE_HIGHEST = "#ff2a2a2e"

// Explicitly named dark colors (safe across all files including values-v31 / values-v34)
private val amoledDarkColorsLow = setOf(
    "gm3_sys_color_dark_surface_container_low",
    "gm3_sys_color_dynamic_dark_surface_container_low",
    "m3_sys_color_dark_surface_container_low",
    "m3_sys_color_dynamic_dark_surface_container_low",
    "sud_system_surface_container_low_dark",
)

private val amoledDarkColorsCard = setOf(
    "cardview_dark_background",
    "color_surface_elevation_plus_two_dark",
    "gm3_sys_color_dark_surface_container",
    "gm3_sys_color_dynamic_dark_surface_container",
    "m3_sys_color_dark_surface_container",
    "m3_sys_color_dynamic_dark_surface_container",
    "sud_system_surface_container_dark",
)

private val amoledDarkColorsHigh = setOf(
    "background_floating_material_dark",
    "gm3_sys_color_dark_surface_container_high",
    "gm3_sys_color_dynamic_dark_surface_container_high",
    "m3_sys_color_dark_surface_container_high",
    "m3_sys_color_dynamic_dark_surface_container_high",
    "sud_glif_v3_dialog_background_color_dark",
    "sud_system_surface_container_high_dark",
)

private val amoledDarkColorsHighest = setOf(
    "gm3_sys_color_dark_surface_container_highest",
    "gm3_sys_color_dark_surface_bright",
    "gm3_sys_color_dynamic_dark_surface_container_highest",
    "gm3_sys_color_dynamic_dark_surface_bright",
    "m3_sys_color_dark_surface_container_highest",
    "m3_sys_color_dark_surface_bright",
    "m3_sys_color_dynamic_dark_surface_container_highest",
    "m3_sys_color_dynamic_dark_surface_bright",
    "sud_glif_edit_text_bg_dark_color",
    "sud_system_surface_container_highest_dark",
    "sud_system_surface_bright_dark",
)

private val amoledDarkColorsBackground = setOf(
    "background_material_dark",
    "design_dark_default_color_background",
    "design_dark_default_color_surface",
    "gm3_legacy_sys_color_dark_background",
    "gm3_sys_color_dark_background",
    "gm3_sys_color_dark_surface",
    "gm3_sys_color_dark_surface_dim",
    "gm3_sys_color_dark_surface_container_lowest",
    "gm3_sys_color_dynamic_dark_background",
    "gm3_sys_color_dynamic_dark_surface",
    "gm3_sys_color_dynamic_dark_surface_dim",
    "gm3_sys_color_dynamic_dark_surface_container_lowest",
    "gm_sys_color_dark_background",
    "gm_sys_color_dark_surface",
    "google_dark_default_color_background",
    "google_dark_default_color_primary",
    "google_dark_default_color_primary_dark",
    "google_dark_default_color_primary_variant",
    "google_dark_default_color_surface",
    "google_dark_default_color_surface_variant",
    "m3_sys_color_dark_background",
    "m3_sys_color_dark_surface",
    "m3_sys_color_dark_surface_dim",
    "m3_sys_color_dark_surface_container_lowest",
    "m3_sys_color_dynamic_dark_background",
    "m3_sys_color_dynamic_dark_surface",
    "m3_sys_color_dynamic_dark_surface_dim",
    "m3_sys_color_dynamic_dark_surface_container_lowest",
    "settingslib_surface_dark",
    "sud_color_background_dark",
    "sud_glif_window_bg_dark_color",
    "sud_system_background_dark",
    "sud_system_surface_dark",
    "sud_system_surface_dim_dark",
    "sud_system_surface_container_lowest_dark",
)

// Night-only colors (STRICTLY patched in values-night* ONLY!)
private val amoledNightOnlyColorsLow = setOf(
    "colorSurfaceContainerLow",
    "photos_daynight_white_elevation_1dp",
)

private val amoledNightOnlyColorsCard = setOf(
    "colorSurfaceContainer",
    "photosSurface2",
    "photos_daynight_white_elevation_3dp",
    "settingslib_materialColorSurfaceContainer",
    "settingslib_materialColorSurfaceVariant",
)

private val amoledNightOnlyColorsHigh = setOf(
    "colorSurfaceContainerHigh",
    "colorBackgroundFloating",
    "photos_daynight_white_elevation_8dp",
    "settingslib_materialColorSurfaceContainerHigh",
)

private val amoledNightOnlyColorsHighest = setOf(
    "colorSurfaceContainerHighest",
    "colorSurfaceBright",
    "photos_daynight_white_elevation_12dp",
    "settingslib_materialColorSurfaceContainerHighest",
)

private val amoledNightOnlyColorsBackground = setOf(
    "material_grey_white_1000",
    "photos_daynight_white",
    "photos_pager_background_daynight_white",
    "photos_photoeditor_background_daynight_white",
    "photos_printingskus_common_ui_education_splash_background",
    "photos_printingskus_editing_background",
    "photos_printingskus_storefront_config_contentrow_alpha50",
    "photos_theme_activity_background",
    "photos_theme_bottom_nav_background",
    "colorSurface",
    "colorSurfaceDim",
    "colorSurfaceContainerLowest",
    "sud_system_background_surface",
    "sud_system_surface",
)

private val neutralDarkSurfaceRgb = setOf(
    "0e0e0e",
    "121212",
    "131313",
    "131314",
    "1b1b1b",
    "1e1f20",
    "1f1f1f",
    "202124",
    "28292c",
    "282a2c",
    "2a2a2a",
    "2d2e30",
    "303030",
    "303134",
    "333537",
    "343434",
    "353639",
    "37393b",
    "3b3b3e",
    "3c4043",
    "424242",
)

private val ignoredColorNameParts = listOf(
    "accent",
    "alert",
    "border",
    "button",
    "disabled",
    "divider",
    "error",
    "foreground",
    "gradient",
    "hairline",
    "icon",
    "inverse",
    "label",
    "on_",
    "outline",
    "primary_container",
    "progress",
    "secondary_container",
    "stroke",
    "tertiary_container",
    "text",
    "tint",
    "warning",
)

private val excludedThemeKeywords = listOf(
    "bottomsheet",
    "bottomdialog",
    "dialog",
    "translucent",
    "transparent",
    "expander",
    "floating",
    "sheet",
    "snackbar",
    "particle",
    "chipactivity",
)

private val intermediateBaseThemes = setOf(
    "base.theme.photos.daynight",
    "base.theme.photos.deprecated",
    "base.theme.photos.deprecated.actionbar",
    "base.theme.photos.deprecated.notitle",
    "theme.photos.deprecated",
    "theme.photos.deprecated.actionbar",
    "theme.photos.deprecated.notitle",
    "base.theme.photos.dialog.daynight",
)

private val protectedTranslucentThemes = mapOf(
    "Base.Theme.Photos.Expander" to "Theme.Photos.Deprecated.ActionBar",
    "Theme.Photos.Expander" to "Base.Theme.Photos.Expander",
    "Theme.Photos.ThemedTransparent" to "Theme.Photos",
    "NativeSharesheetChipActivityExpander" to "Theme.Photos.Expander",
)

private val translucentStyleItems = mapOf(
    "android:windowBackground" to "@android:color/transparent",
    "android:colorBackground" to "@android:color/transparent",
    "android:statusBarColor" to "@android:color/transparent",
    "android:navigationBarColor" to "@android:color/transparent",
    "android:windowIsTranslucent" to "true",
    "android:backgroundDimEnabled" to "true",
)

private val amoledStyleItems = mapOf(
    "android:colorBackground" to AMOLED_BLACK,
    "android:navigationBarColor" to AMOLED_BLACK,
    "android:statusBarColor" to AMOLED_BLACK,
    "android:windowBackground" to AMOLED_BLACK,
    "android:windowLightNavigationBar" to "false",
    "android:windowLightStatusBar" to "false",
    "colorSurface" to AMOLED_BLACK,
    "colorSurfaceDim" to AMOLED_BLACK,
    "colorSurfaceContainerLowest" to AMOLED_BLACK,
    "colorSurfaceContainerLow" to AMOLED_CARD_SURFACE_LOW,
    "colorSurfaceContainer" to AMOLED_CARD_SURFACE,
    "colorSurfaceContainerHigh" to AMOLED_CARD_SURFACE_HIGH,
    "colorSurfaceContainerHighest" to AMOLED_CARD_SURFACE_HIGHEST,
    "colorSurfaceBright" to AMOLED_CARD_SURFACE_HIGHEST,
    "colorBackgroundFloating" to AMOLED_CARD_SURFACE_HIGH,
    "photosSurface2" to AMOLED_CARD_SURFACE,
)

private val mc3DarkSchemeItems = mapOf(
    "mc3_background" to AMOLED_BLACK,
    "mc3_surface" to AMOLED_BLACK,
    "mc3_surface_dim" to AMOLED_BLACK,
    "mc3_surface_container_lowest" to AMOLED_BLACK,
    "mc3_surface_container_low" to AMOLED_CARD_SURFACE_LOW,
    "mc3_surface_container" to AMOLED_CARD_SURFACE,
    "mc3_surface_container_high" to AMOLED_CARD_SURFACE_HIGH,
    "mc3_surface_container_highest" to AMOLED_CARD_SURFACE_HIGHEST,
    "mc3_surface_bright" to AMOLED_CARD_SURFACE_HIGHEST,
)

@Suppress("unused")
val amoledDarkThemePatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Makes Google Photos dark surfaces true black while keeping light mode untouched.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    execute {
        val resDirectory = get("res")
        if (!resDirectory.isDirectory) {
            throw PatchException("Decoded res directory was not found.")
        }

        var changedColors = 0
        var changedStyles = 0

        resDirectory.walkTopDown()
            .onEnter { dir -> dir == resDirectory || dir.name.startsWith("values", ignoreCase = true) }
            .filter { file ->
                file.isValuesXml() && (
                    file.isNightValuesXml() ||
                    file.name.startsWith("color", ignoreCase = true) ||
                    file.name.startsWith("style", ignoreCase = true) ||
                    file.name.startsWith("theme", ignoreCase = true)
                )
            }
            .forEach { file ->
                val source = file.readText()
                if (!source.contains("<color") && !source.contains("<style")) return@forEach

                val resourcePath = "res/${file.relativeTo(resDirectory).invariantSeparatorsPath}"
                val isNightFile = file.isNightValuesXml()
                val isStyleFile = file.name.startsWith("style", ignoreCase = true) || file.name.startsWith("theme", ignoreCase = true)
                document(resourcePath).use { document ->
                    changedColors += document.blackenAmoledColors(isNightFile)
                    changedStyles += document.forceAmoledThemeItems(isNightFile)
                    if (isNightFile && isStyleFile) {
                        changedStyles += document.ensureProtectedTranslucentThemes()
                    }
                }
            }

        val changed = changedColors + changedStyles
        if (changed == 0) {
            throw PatchException("No Google Photos AMOLED theme resources were patched.")
        }
    }
}

private fun Document.blackenAmoledColors(isNightFile: Boolean): Int {
    var changed = 0
    val colors = getElementsByTagName("color")
    for (i in 0 until colors.length) {
        val color = colors.item(i) as? Element ?: continue
        val name = color.getAttribute("name")
        val replacement = getAmoledReplacementColor(name, isNightFile, color.textContent) ?: continue
        if (color.textContent == replacement) continue

        color.textContent = replacement
        changed++
    }
    return changed
}

private fun Document.forceAmoledThemeItems(isNightFile: Boolean): Int {
    var changed = 0
    val styles = getElementsByTagName("style")
    for (i in 0 until styles.length) {
        val style = styles.item(i) as? Element ?: continue
        val styleName = style.getAttribute("name")
        when (styleName) {
            "mc3_dark_scheme" -> {
                mc3DarkSchemeItems.forEach { (name, value) ->
                    style.ensureStyleItem(this, name, value)?.let { changed++ }
                }
            }
            else -> {
                if (!style.isAmoledTargetThemeStyle(isNightFile)) continue
                amoledStyleItems.forEach { (name, value) ->
                    style.ensureStyleItem(this, name, value)?.let { changed++ }
                }
            }
        }
    }
    return changed
}

private fun getAmoledReplacementColor(colorName: String, isNightFile: Boolean, value: String): String? {
    val nameLower = colorName.lowercase()
    if (ignoredColorNameParts.any(nameLower::contains)) return null
    if ("translucent" in nameLower || "transparent" in nameLower) return null

    // STRICT ISOLATION: In non-night files (values, values-v31, values-v34), NEVER touch any color unless it is explicitly dark!
    if (!isNightFile && "dark" !in nameLower) return null

    // 1. Explicitly dark tokens (safe across all files)
    if (nameLower in amoledDarkColorsHighest) return AMOLED_CARD_SURFACE_HIGHEST
    if (nameLower in amoledDarkColorsHigh) return AMOLED_CARD_SURFACE_HIGH
    if (nameLower in amoledDarkColorsCard) return AMOLED_CARD_SURFACE
    if (nameLower in amoledDarkColorsLow) return AMOLED_CARD_SURFACE_LOW
    if (nameLower in amoledDarkColorsBackground) return AMOLED_BLACK

    // 2. Night-only tokens (ONLY matched when isNightFile == true)
    if (isNightFile) {
        if (nameLower in amoledNightOnlyColorsHighest) return AMOLED_CARD_SURFACE_HIGHEST
        if (nameLower in amoledNightOnlyColorsHigh) return AMOLED_CARD_SURFACE_HIGH
        if (nameLower in amoledNightOnlyColorsCard) return AMOLED_CARD_SURFACE
        if (nameLower in amoledNightOnlyColorsLow) return AMOLED_CARD_SURFACE_LOW
        if (nameLower in amoledNightOnlyColorsBackground) return AMOLED_BLACK
    }

    val valLower = value.lowercase().trim()
    if ("system_surface_container_highest" in valLower || "system_surface_bright" in valLower) {
        return AMOLED_CARD_SURFACE_HIGHEST
    }
    if ("system_surface_container_high" in valLower) {
        return AMOLED_CARD_SURFACE_HIGH
    }
    if ("system_surface_container_low" in valLower) {
        return AMOLED_CARD_SURFACE_LOW
    }
    if ("system_surface_container_lowest" in valLower) {
        return AMOLED_BLACK
    }
    if ("system_surface_container" in valLower) {
        return AMOLED_CARD_SURFACE
    }
    if (
        "system_background_dark" in valLower ||
        "system_surface_dark" in valLower ||
        "system_surface_dim_dark" in valLower ||
        "system_neutral1_900" in valLower ||
        "system_neutral1_1000" in valLower ||
        "system_neutral2_900" in valLower ||
        "system_neutral2_1000" in valLower
    ) {
        if ("container_highest" in nameLower || "bright" in nameLower) return AMOLED_CARD_SURFACE_HIGHEST
        if ("container_high" in nameLower || "dialog" in nameLower) return AMOLED_CARD_SURFACE_HIGH
        if ("container_low" in nameLower) return AMOLED_CARD_SURFACE_LOW
        if ("container" in nameLower || "card" in nameLower) return AMOLED_CARD_SURFACE
        return AMOLED_BLACK
    }

    if (!listOf("background", "surface", "container", "canvas", "panel", "sheet", "bar", "card", "dialog").any(nameLower::contains)) {
        return null
    }

    if (value.amoledRgb() in neutralDarkSurfaceRgb) {
        if ("container_highest" in nameLower || "bright" in nameLower) return AMOLED_CARD_SURFACE_HIGHEST
        if ("container_high" in nameLower || "dialog" in nameLower || "floating" in nameLower) return AMOLED_CARD_SURFACE_HIGH
        if ("container_low" in nameLower) return AMOLED_CARD_SURFACE_LOW
        if ("container" in nameLower || "card" in nameLower) return AMOLED_CARD_SURFACE
        return AMOLED_BLACK
    }

    return null
}

/**
 * Ensures style items are strictly targeted to Dark themes:
 * - If inside values-night*, applies to all DayNight, Dark, and Photos themes.
 * - If inside base values*, ONLY applies to styles explicitly named or inheriting Dark (never touching base DayNight or Light styles).
 */
private fun Element.isAmoledTargetThemeStyle(isNightFile: Boolean): Boolean {
    val name = getAttribute("name").lowercase()
    val parent = getAttribute("parent").lowercase()

    // Explicit light themes are never touched
    if ("light" in name && "dark" !in name && "daynight" !in name) return false
    if ("light" in parent && "dark" !in parent && "daynight" !in parent) return false

    // Widgets, text appearances, animations are not window themes
    if (name.startsWith("widget.") || name.startsWith("textappearance.") || name.startsWith("animation.")) return false
    if (parent.startsWith("@android:style/widget") || parent.startsWith("@style/widget.") || parent.startsWith("@style/textappearance.") || parent.startsWith("@style/animation.")) return false

    // Overlays are not window themes and must never receive window-level backgrounds
    if (name.startsWith("themeoverlay.") || name.startsWith("base.themeoverlay.")) return false
    if (parent.startsWith("@style/themeoverlay.") || parent.startsWith("@style/base.themeoverlay.")) return false

    // Intermediate base themes must never have window-level backgrounds injected
    if (intermediateBaseThemes.any { name == it || name.startsWith("$it.") }) return false

    // Bottom sheets, dialogs, translucent/floating windows must never have their window backgrounds clobbered
    if (excludedThemeKeywords.any { it in name || it in parent }) return false
    if (hasTranslucentOrFloatingAttribute()) return false

    if (isNightFile) {
        // In values-night*, we safely style all DayNight and Dark themes, as well as Theme.Photos variants
        return "dark" in name ||
            "daynight" in name ||
            "dark" in parent ||
            "daynight" in parent ||
            "theme.photos" in name ||
            "theme.photos" in parent ||
            "base.theme.photos" in name ||
            "base.theme.photos" in parent ||
            hasDarkThemeItem()
    } else {
        // In default values*, we MUST NOT touch DayNight themes as they serve Light mode!
        // Only target styles that are explicitly Dark and NOT DayNight
        val isExplicitlyDark = ("dark" in name || "dark" in parent) &&
            ("daynight" !in name && "daynight" !in parent)
        return isExplicitlyDark && hasDarkThemeItem()
    }
}

private fun Element.hasTranslucentOrFloatingAttribute(): Boolean {
    val children = childNodes
    for (i in 0 until children.length) {
        val item = children.item(i) as? Element ?: continue
        if (item.tagName != "item") continue
        val itemName = item.getAttribute("name")
        val itemVal = item.textContent.lowercase().trim()
        if (itemName == "android:windowIsTranslucent" && itemVal == "true") return true
        if (itemName == "android:windowIsFloating" && itemVal == "true") return true
        if (itemName == "android:windowBackground" && ("transparent" in itemVal || itemVal == "@null" || itemVal == "#00000000")) return true
    }
    return false
}

private fun Element.hasDarkThemeItem(): Boolean {
    val children = childNodes
    for (i in 0 until children.length) {
        val item = children.item(i) as? Element ?: continue
        if (item.tagName != "item") continue
        val value = item.textContent.lowercase()
        if (
            "design_dark" in value ||
            "gm3_dark" in value ||
            "gm3_sys_color_dark" in value ||
            "gm_sys_color_dark" in value ||
            "m3_sys_color_dark" in value ||
            "photos_daynight_white" in value ||
            "system_background_dark" in value ||
            "system_surface_dark" in value ||
            "gm3_sys_color_dynamic_dark" in value ||
            "m3_sys_color_dynamic_dark" in value
        ) return true
    }
    return false
}

private fun Element.ensureStyleItem(document: Document, name: String, value: String): Boolean? {
    val children = childNodes
    for (i in 0 until children.length) {
        val item = children.item(i) as? Element ?: continue
        if (item.tagName != "item" || item.getAttribute("name") != name) continue
        if (item.textContent == value) return null

        item.textContent = value
        return true
    }

    val item = document.createElement("item")
    item.setAttribute("name", name)
    item.textContent = value
    appendChild(item)
    return true
}

private fun Document.ensureProtectedTranslucentThemes(): Int {
    val resources = documentElement ?: return 0
    var changed = 0
    val styles = getElementsByTagName("style")
    val styleMap = mutableMapOf<String, Element>()
    for (i in 0 until styles.length) {
        val s = styles.item(i) as? Element ?: continue
        styleMap[s.getAttribute("name")] = s
    }

    protectedTranslucentThemes.forEach { (styleName, parentName) ->
        val style = styleMap[styleName] ?: run {
            val newStyle = createElement("style")
            newStyle.setAttribute("name", styleName)
            newStyle.setAttribute("parent", "@style/$parentName")
            resources.appendChild(newStyle)
            changed++
            newStyle
        }

        translucentStyleItems.forEach { (attrName, attrValue) ->
            if (style.ensureStyleItem(this, attrName, attrValue) != null) {
                changed++
            }
        }
    }
    return changed
}

private fun String.amoledRgb(): String {
    var color = trim().removePrefix("#").lowercase()
    if (color.length == 8 && color.startsWith("ff")) color = color.substring(2)
    return color
}

private fun File.isValuesXml(): Boolean {
    if (!isFile || !extension.equals("xml", ignoreCase = true)) return false
    val directoryName = parentFile?.name ?: return false
    return directoryName == "values" || directoryName.startsWith("values-")
}

private fun File.isNightValuesXml(): Boolean {
    val directoryName = parentFile?.name ?: return false
    return directoryName == "values-night" || directoryName.startsWith("values-night-")
}
