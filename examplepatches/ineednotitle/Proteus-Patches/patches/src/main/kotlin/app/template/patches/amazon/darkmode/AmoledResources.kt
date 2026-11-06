package app.template.patches.amazon.darkmode

import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

/**
 * AMOLED resource pass for the Amazon "Dark mode" patch (Shopping + India).
 *
 * Modeled on the Google Photos AMOLED patch (same heuristics, copied and
 * adjusted for Amazon's resource layout).  Unlike Photos — which hard-fails
 * when nothing matches — every step here is fail-safe: Amazon mShop APKs ship
 * wildly different resource layouts, so an unrecognized layout is a logged
 * no-op.  The WebView CSS half of the patch still delivers AMOLED there, and
 * nothing about this pass throws into the build.
 *
 * What it does:
 *   1. Blackens `<color>` items whose value is a neutral dark surface gray
 *      (night files: dark-ish surface names; other files: surface-ish names
 *      containing "dark"), skipping text/icon/accent/border-ish names.
 *   2. Forces the dark/daynight `<style parent|name>` themes to pure black via
 *      android:windowBackground / colorSurface* / navigationBarColor /
 *      statusBarColor / colorBackgroundFloating (+ light status/nav bar flags
 *      off), creating the items when absent.
 */

private const val AMOLED_BLACK = "#ff000000"

private val neutralDarkSurfaceRgb = setOf(
    "0e0e0e", "121212", "131313", "131314", "1b1b1b", "1e1f20", "1f1f1f",
    "202124", "232323", "242424", "262626", "28292c", "282a2c", "2a2a2a",
    "2d2e30", "303030", "303134", "333537", "343434", "353639", "37393b",
    "3b3b3e", "3c4043", "424242",
)

private val ignoredColorNameParts = listOf(
    "accent", "alert", "border", "button", "disabled", "divider", "error",
    "foreground", "gradient", "hairline", "icon", "inverse", "label", "on_",
    "outline", "primary_container", "progress", "secondary_container",
    "stroke", "tertiary_container", "text", "tint", "warning",
)

private val surfaceNameParts = listOf(
    "background", "surface", "container", "canvas", "panel", "sheet", "bar",
)

private val amoledStyleItems = mapOf(
    "android:colorBackground" to AMOLED_BLACK,
    "android:navigationBarColor" to AMOLED_BLACK,
    "android:statusBarColor" to AMOLED_BLACK,
    "android:windowBackground" to AMOLED_BLACK,
    "android:windowLightNavigationBar" to "false",
    "android:windowLightStatusBar" to "false",
    "colorBackgroundFloating" to AMOLED_BLACK,
    "colorSurface" to AMOLED_BLACK,
    "colorSurfaceBright" to AMOLED_BLACK,
    "colorSurfaceContainer" to AMOLED_BLACK,
    "colorSurfaceContainerHigh" to AMOLED_BLACK,
    "colorSurfaceContainerHighest" to AMOLED_BLACK,
    "colorSurfaceContainerLow" to AMOLED_BLACK,
    "colorSurfaceContainerLowest" to AMOLED_BLACK,
    "colorSurfaceDim" to AMOLED_BLACK,
)

internal fun File.isValuesXml(): Boolean =
    isFile && extension == "xml" && parentFile?.name?.startsWith("values") == true

internal fun File.isNightValuesXml(): Boolean =
    parentFile?.name?.startsWith("values-night") == true

internal fun Document.blackenAmazonAmoledColors(isNightFile: Boolean): Int {
    var changed = 0
    val colors = getElementsByTagName("color")
    for (i in 0 until colors.length) {
        val color = colors.item(i) as? Element ?: continue
        val name = color.getAttribute("name")
        if (!name.shouldBlackenAmoledColor(isNightFile, (color.textContent ?: "").trim())) continue
        if (color.textContent.trim().equals(AMOLED_BLACK, ignoreCase = true)) continue

        color.textContent = AMOLED_BLACK
        changed++
    }
    return changed
}

internal fun Document.forceAmazonAmoledThemeItems(): Int {
    var changed = 0
    val styles = getElementsByTagName("style")
    for (i in 0 until styles.length) {
        val style = styles.item(i) as? Element ?: continue
        if (!style.isDarkThemeStyle()) continue

        style.ensureStyleItem(this, FORCE_DARK_ATTRIBUTE, "true")?.let { changed++ }
        amoledStyleItems.forEach { (name, value) ->
            style.ensureStyleItem(this, name, value)?.let { changed++ }
        }
    }
    return changed
}

// Same attribute the base resource pass flips; re-ensured here so dark/daynight
// themes get it even when they live outside styles.xml.
private const val FORCE_DARK_ATTRIBUTE = "android:forceDarkAllowed"

private fun String.shouldBlackenAmoledColor(isNightFile: Boolean, value: String): Boolean {
    val colorName = lowercase()
    if (ignoredColorNameParts.any(colorName::contains)) return false
    if (!isNightFile && "dark" !in colorName) return false
    if (!surfaceNameParts.any(colorName::contains)) return false
    if (isNightFile && "night" in colorName && "dark" !in colorName) {
        // e.g. night_background — still a surface; keep it.
    }
    return value.amoledRgb() in neutralDarkSurfaceRgb
}

private fun String.amoledRgb(): String? {
    var v = trim().lowercase()
    if (!v.startsWith("#")) return null
    v = v.removePrefix("#")
    if (v.length == 8) v = v.substring(2) // drop alpha
    if (v.length == 3) v = v.map { c -> "$c$c" }.joinToString("")
    if (v.length != 6) return null
    return v
}

private fun Element.isDarkThemeStyle(): Boolean {
    val name = getAttribute("name").lowercase()
    val parent = getAttribute("parent").lowercase()
    if ("theme" !in name && "theme" !in parent) return false
    val named = name.isDarkThemeDescriptor() || parent.isDarkThemeDescriptor()
    if (named) {
        // Reject explicitly light themes ("Theme.Light.DarkActionBar" and friends).
        val lightOnly = { s: String -> s.contains("light") && !s.contains("dark") && !s.contains("daynight") }
        if (lightOnly(name) && lightOnly(parent)) return false
        return true
    }
    return hasDarkThemeItem()
}

private fun String.isDarkThemeDescriptor(): Boolean =
    contains("dark") || contains("daynight") || contains("night")

private fun Element.hasDarkThemeItem(): Boolean {
    val children = childNodes
    for (i in 0 until children.length) {
        val item = children.item(i) as? Element ?: continue
        if (item.tagName != "item") continue
        val value = (item.textContent ?: "").lowercase()
        if ("_dark" in value || "dark_" in value || "_night" in value || "night_" in value
            || "design_dark" in value || "gm3" in value && "dark" in value
        ) return true
    }
    return false
}

private fun Element.ensureStyleItem(document: Document, name: String, value: String): Boolean? {
    val children = childNodes
    for (i in 0 until children.length) {
        val item = children.item(i) as? Element ?: continue
        if (item.tagName != "item" || item.getAttribute("name") != name) continue
        if ((item.textContent ?: "").trim().equals(value, ignoreCase = true)) return null
        item.textContent = value
        return true
    }

    val item = document.createElement("item")
    item.setAttribute("name", name)
    item.textContent = value
    appendChild(item)
    return true
}
