package app.spicetify.patches.spotify.theme

import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.Properties

/** The Spotify version whose color resources `theme/<version>.properties` lists. */
internal const val THEME_TARGET_VERSION = "9.1.80.2221"

/** The overlayable the extension's overlay targets. */
internal const val THEME_OVERLAYABLE = "SpicetifyTheme"

/** Spicetify color.ini keys used as roles, plus `on-button`, in a fixed order. */
internal val ROLE_KEYS = listOf(
    "main", "main-elevated", "card", "highlight", "highlight-elevated", "text", "subtext",
    "button", "button-active", "on-button", "button-disabled", "selected-row", "tab-active",
    "notification", "notification-error", "shadow",
)

private object ThemeResourceAnchor

private fun themeProperties(version: String): Properties {
    val stream = ThemeResourceAnchor::class.java.getResourceAsStream("/theme/$version.properties")
        ?: throw IllegalStateException("No theme resource map for Spotify $version")
    return Properties().apply { stream.use(::load) }
}

/** Spotify's color resources for each role, in [ROLE_KEYS] order. */
internal fun loadRoleMap(version: String = THEME_TARGET_VERSION): Map<String, List<String>> {
    val properties = themeProperties(version)
    return ROLE_KEYS.associateWith { key ->
        properties.getProperty(key).orEmpty().split(',').map(String::trim).filter(String::isNotEmpty)
    }.filterValues { it.isNotEmpty() }
}

/** Compose field paths to the resource each follows: Spotify's default dark Encore palette, then Encore's raw colors. */
internal fun loadComposePaths(version: String = THEME_TARGET_VERSION): List<Map<String, String>> {
    val properties = themeProperties(version)
    return listOf("compose.", "primitive.").map { prefix ->
        properties.stringPropertyNames().filter { it.startsWith(prefix) }.sorted()
            .associate { it.removePrefix(prefix) to properties.getProperty(it).trim() }
    }
}

internal fun colorElements(document: Document): List<Element> {
    val children = document.documentElement.childNodes
    return (0 until children.length).mapNotNull { children.item(it) as? Element }.filter { it.tagName == "color" }
}

/** The ARGB of a declared color, following `@color/` aliases; null for anything else. */
internal fun stockColor(name: String, declared: Map<String, String>): Int? {
    var value = declared[name] ?: return null
    val seen = mutableSetOf(name)
    while (value.startsWith("@color/")) {
        val next = value.removePrefix("@color/")
        if (!seen.add(next)) return null
        value = declared[next] ?: return null
    }
    if (!value.startsWith("#")) return null
    // #RGB and #ARGB repeat each digit; the forms without alpha are opaque.
    val digits = value.substring(1).let { if (it.length <= 4) it.flatMap { c -> listOf(c, c) }.joinToString("") else it }
    return when (digits.length) {
        6 -> "FF$digits"
        8 -> digits
        else -> null
    }?.toLongOrNull(16)?.toInt()
}

/** The alpha of a declared color, following `@color/` aliases. Other references count as opaque. */
internal fun originalAlpha(name: String, declared: Map<String, String>): Int =
    stockColor(name, declared)?.ushr(24) ?: 0xFF

/**
 * The table the extension reads: `role:name,name@AA|role:...`, where `@AA` is the stock alpha of a
 * translucent color. Fails when a mapped color is missing or declared twice in `res/values/colors.xml`.
 */
internal fun roleTable(document: Document, roleMap: Map<String, List<String>>): String {
    val elements = colorElements(document)
    val byName = elements.groupBy { it.getAttribute("name") }
    val names = roleMap.values.flatten()
    val missing = names.filter { it !in byName }
    require(missing.isEmpty()) {
        "Unsupported Spotify color resources: missing ${missing.joinToString()} in res/values/colors.xml."
    }
    val duplicates = names.filter { byName.getValue(it).size != 1 }
    require(duplicates.isEmpty()) {
        "Ambiguous Spotify color resources: duplicate ${duplicates.joinToString()} in res/values/colors.xml."
    }
    val declared = elements.associate { it.getAttribute("name") to it.textContent.trim() }
    return roleMap.entries.joinToString("|") { (role, targets) ->
        role + ":" + targets.joinToString(",") { name ->
            val alpha = originalAlpha(name, declared)
            if (alpha == 0xFF) name else name + "@" + "%02X".format(alpha)
        }
    }
}

/**
 * The table ComposeTheme reads: `path=name@AARRGGBB,...;path=...`, palette paths then raw color paths,
 * with each color's stock value and the `*` of a field that turns see-through behind a background image.
 * Fails when a path follows a color no role maps, since nothing would ever theme it.
 */
internal fun composeTable(document: Document, roleMap: Map<String, List<String>>, paths: List<Map<String, String>>): String {
    val mapped = roleMap.values.flatten().toSet()
    val declared = colorElements(document).associate { it.getAttribute("name") to it.textContent.trim() }
    return paths.joinToString(";") { section ->
        section.entries.joinToString(",") { (path, target) ->
            val name = target.removeSuffix("*")
            require(name in mapped) { "Compose color $path follows $name, which no theme role maps." }
            val stock = requireNotNull(stockColor(name, declared)) { "Compose color $path: $name has no stock color." }
            "$path=$name@%08X".format(stock) + target.substring(name.length)
        }
    }
}

/** `res/values/overlayable.xml` declaring every mapped color overlayable, so Spotify can overlay itself. */
internal fun overlayableXml(names: Collection<String>): String = buildString {
    appendLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
    appendLine("<resources>")
    appendLine("    <overlayable name=\"$THEME_OVERLAYABLE\">")
    appendLine("        <policy type=\"public\">")
    names.forEach { appendLine("            <item type=\"color\" name=\"$it\" />") }
    appendLine("        </policy>")
    appendLine("    </overlayable>")
    appendLine("</resources>")
}
