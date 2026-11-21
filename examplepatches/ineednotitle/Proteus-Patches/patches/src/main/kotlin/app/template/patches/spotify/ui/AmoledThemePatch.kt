package app.template.patches.spotify.ui

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

// AMOLED dark theme for Spotify (xManager-style): every dark surface resolves
// to pure black instead of Spotify's dark grays, including the player bar and
// the bottom navigation, so the app renders "pitch black" on OLED screens.
//
// Scope: compiled resources only.
//   1. `<color>` tokens whose value is a neutral dark surface gray (Spotify's
//      121212/181818/1e1e1e/282828/... palette and grays of the same shape)
//      are rewritten to #FF000000. Text, icon, accent, border and gradient
//      named colors are skipped.
//   2. Dark themes (`values-night*` styles, or styles named/parented "dark" /
//      "night") get the framework window/nav/status-bar background items
//      forced to #FF000000 (and light-bar flags off). Only `android:`
//      framework attributes — Material attribute names cannot be re-resolved
//      by the reandroid resource encoder (see docs/AMAZON.md).
//
// Fail-safe per file: an unrecognized layout is a logged no-op and can never
// throw into the build. Surfaces Spotify draws from code (hardcoded ARGB
// constants) are out of scope for a resource pass.

private const val AMOLED_BLACK = "#ff000000"

// Spotify's dark surfaces plus the generic neutral dark grays other ports
// have used. All are also covered by the gray-shape test below; the set makes
// the intent explicit.
private val spotifyDarkPalette = setOf(
    "0e0e0e", "121212", "131313", "181818", "1e1e1e", "1e1f20", "1f1f1f",
    "202124", "212121", "232323", "242424", "282828", "2a2a2a", "2d2e30",
    "303030", "333537", "353639", "3e3e3e", "424242",
)

private val ignoredColorNameParts = listOf(
    "accent", "alert", "border", "button", "disabled", "divider", "error",
    "foreground", "gradient", "hairline", "icon", "inverse", "label", "on_",
    "outline", "progress", "scrub", "stroke", "text", "tint", "warning",
)

private val surfaceNameParts = listOf(
    "background", "surface", "container", "canvas", "panel", "sheet", "bar",
    "base", "black", "gray", "grey", "elevation", "overlay",
)

private val amoledStyleItems = mapOf(
    "android:colorBackground" to AMOLED_BLACK,
    "android:navigationBarColor" to AMOLED_BLACK,
    "android:statusBarColor" to AMOLED_BLACK,
    "android:windowBackground" to AMOLED_BLACK,
    "android:windowLightNavigationBar" to "false",
    "android:windowLightStatusBar" to "false",
)

private fun File.isValuesXml(): Boolean =
    isFile && extension == "xml" && parentFile?.name?.startsWith("values") == true

private fun File.isNightValuesXml(): Boolean =
    parentFile?.name?.startsWith("values-night") == true

/**
 * Pure: true when `value` (#AARRGGBB / #RRGGBB / #RGB) is a neutral dark
 * surface gray — the shape every AMOLED port has blackened.
 */
internal fun isNeutralDarkGray(value: String): Boolean {
    val hex = value.trim().removePrefix("#")
    val rgb = when (hex.length) {
        3 -> hex.map { "$it$it".toInt(16) }
        6 -> listOf(hex.substring(0, 2), hex.substring(2, 4), hex.substring(4, 6)).map { it.toInt(16) }
        8 -> {
            // Opaque only: a translucent surface must keep its alpha.
            if (!hex.substring(0, 2).equals("ff", ignoreCase = true)) return false
            listOf(hex.substring(2, 4), hex.substring(4, 6), hex.substring(6, 8)).map { it.toInt(16) }
        }
        else -> return false
    }
    val (r, g, b) = rgb
    val named = value.lowercase().removePrefix("#").takeLast(6)
    if (named in spotifyDarkPalette) return true
    val max = maxOf(r, g, b)
    val min = minOf(r, g, b)
    return max <= 0x48 && (max - min) <= 0x12
}

private fun String.looksLikeSurfaceName(): Boolean {
    val lower = lowercase()
    if (ignoredColorNameParts.any { lower.contains(it) }) return false
    return surfaceNameParts.any { lower.contains(it) } || lower.contains("dark")
}

internal fun Document.blackenAmoledColors(): Int {
    var blackened = 0
    val items = getElementsByTagName("color")
    for (i in 0 until items.length) {
        val item = items.item(i) as? Element ?: continue
        val value = item.textContent?.trim() ?: continue
        if (!value.startsWith("#")) continue
        if (!isNeutralDarkGray(value)) continue
        if (!item.getAttribute("name").looksLikeSurfaceName()) continue
        if (value.lowercase() == AMOLED_BLACK) continue
        item.textContent = AMOLED_BLACK
        blackened++
    }
    return blackened
}

internal fun Document.forceAmoledThemeItems(nightFile: Boolean): Int {
    var forced = 0
    val styles = getElementsByTagName("style")
    for (i in 0 until styles.length) {
        val style = styles.item(i) as? Element ?: continue
        val name = (style.getAttribute("name") + " " + style.getAttribute("parent")).lowercase()
        val darkTheme = nightFile || name.contains("dark") || name.contains("night")
        if (!darkTheme) continue
        for (j in 0 until style.childNodes.length) {
            val item = style.childNodes.item(j) as? Element ?: continue
            val attr = item.getAttribute("name")
            val target = amoledStyleItems[attr] ?: continue
            if (item.textContent == target) continue
            item.textContent = target
            forced++
        }
    }
    return forced
}

@Suppress("unused")
val spotifyAmoledThemePatch = resourcePatch(
    name = "AMOLED dark theme",
    description = "Pure-black AMOLED theme for Spotify: dark surfaces, the player bar and the " +
        "bottom navigation render as #000000 instead of dark gray. Only compiled resources are " +
        "rewritten; surfaces the app draws from code colors stay dark gray.",
    default = false,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    execute {
        var blackened = 0
        var forced = 0
        try {
            val resDirectory = get("res")
            if (resDirectory.isDirectory) {
                for (file in resDirectory.walkTopDown().filter(File::isValuesXml)) {
                    val source = runCatching { file.readText() }.getOrNull() ?: continue
                    if (!source.contains("<color") && !source.contains("<style")) continue
                    val path = "res/${file.relativeTo(resDirectory).invariantSeparatorsPath}"
                    runCatching {
                        document(path).use { doc ->
                            blackened += doc.blackenAmoledColors()
                            forced += doc.forceAmoledThemeItems(file.isNightValuesXml())
                        }
                    }.onFailure { e -> println("Spotify AMOLED: skipping $path (${e.message})") }
                }
            } else {
                println("Spotify AMOLED: res directory not found; nothing to do.")
            }
        } catch (t: Throwable) {
            println("Spotify AMOLED: resource pass failed (${t.message}).")
        }
        println("Spotify AMOLED dark theme: blackened $blackened color(s), forced $forced theme item(s).")
    }
}
