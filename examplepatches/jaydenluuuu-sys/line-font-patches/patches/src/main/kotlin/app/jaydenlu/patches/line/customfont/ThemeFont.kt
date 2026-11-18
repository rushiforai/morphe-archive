package app.jaydenlu.patches.line.customfont

import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

internal const val FONT_RESOURCE_NAME = "line_custom_font"
internal const val FONT_ATTRIBUTE = "android:fontFamily"
internal val FONT_EXTENSIONS = setOf("ttf", "otf", "ttc")

private const val STYLE_PREFIX = "@style/"

/** Parses [file] for reading. Nothing is written back, so the patcher does not see a change. */
internal fun readDocument(file: File): Document =
    file.inputStream().use { DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it) }

/**
 * The names of the app's own themes that the manifest gives to the application, an activity or
 * an activity alias. A framework theme (`@android:style/...`) is not in the app's resources, so
 * it is left out.
 */
internal fun manifestThemes(manifest: Document): Set<String> {
    val themes = mutableSetOf<String>()
    listOf("application", "activity", "activity-alias").forEach { tag ->
        val nodes = manifest.getElementsByTagName(tag)
        for (index in 0 until nodes.length) {
            val theme = (nodes.item(index) as Element).getAttribute("android:theme")
            if (theme.startsWith(STYLE_PREFIX)) themes += theme.removePrefix(STYLE_PREFIX)
        }
    }
    return themes
}

/**
 * Each style of this styles.xml with the name of its parent in the app, or null when the parent
 * is a framework style or the style has none.
 */
internal fun Document.styleParents(): Map<String, String?> {
    val result = mutableMapOf<String, String?>()
    val styles = getElementsByTagName("style")
    for (index in 0 until styles.length) {
        val style = styles.item(index) as Element
        val name = style.getAttribute("name")
        if (name.isEmpty()) continue
        result[name] = style.appParent(name)
    }
    return result
}

/**
 * A style names its parent in `parent`. With no `parent` attribute, the parent is the name up
 * to its last dot. An empty `parent` means the style has none.
 */
private fun Element.appParent(name: String): String? {
    if (!hasAttribute("parent")) return name.substringBeforeLast('.', "").ifEmpty { null }

    val parent = getAttribute("parent")
    return when {
        parent.isEmpty() -> null
        parent.startsWith("@android:") || parent.startsWith("android:") -> null
        parent.startsWith("?") || parent.startsWith("@*") -> null
        else -> parent.removePrefix(STYLE_PREFIX)
    }
}

/** [themes] and every style above them in [parents]. A style can have one parent per file. */
internal fun withParents(themes: Set<String>, parents: Map<String, Set<String>>): Set<String> {
    val result = themes.toMutableSet()
    val queue = ArrayDeque(themes)
    while (queue.isNotEmpty()) {
        parents[queue.removeFirst()].orEmpty().forEach { parent ->
            if (result.add(parent)) queue += parent
        }
    }
    return result
}

/**
 * Sets [FONT_ATTRIBUTE] to [fontReference] in each style of this styles.xml whose name is in
 * [themes]. A style that has the item already gets the new value.
 *
 * @return How many styles were changed.
 */
internal fun Document.setThemeFont(themes: Set<String>, fontReference: String): Int {
    var changed = 0
    val styles = getElementsByTagName("style")
    for (index in 0 until styles.length) {
        val style = styles.item(index) as Element
        if (style.getAttribute("name") !in themes) continue

        val children = style.childNodes
        val item = (0 until children.length)
            .map(children::item)
            .filterIsInstance<Element>()
            .firstOrNull { it.tagName == "item" && it.getAttribute("name") == FONT_ATTRIBUTE }
            ?: createElement("item").also {
                it.setAttribute("name", FONT_ATTRIBUTE)
                style.appendChild(it)
            }
        item.textContent = fontReference
        changed++
    }
    return changed
}
