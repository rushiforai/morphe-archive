package app.fakhradio.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Sets the `<tag name="...">` values in [document] to the values in [values]. Throws when one is missing,
 * so a renamed resource fails the patch instead of silently doing nothing.
 */
fun setResourceValues(document: Document, tag: String, values: Map<String, String>) {
    val nodes = document.getElementsByTagName(tag)
    val byName = (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
    for ((name, value) in values) {
        val node = byName[name] ?: throw PatchException("<$tag name=\"$name\"> not found")
        node.textContent = value
    }
}

/**
 * Sets the `<item name="[item]">` of the style [style] to [value]. Throws when the style or the item is missing.
 */
fun setStyleItem(document: Document, style: String, item: String, value: String) {
    val styles = document.getElementsByTagName("style")
    val node = (0 until styles.length).map { styles.item(it) as Element }.singleOrNull { it.getAttribute("name") == style }
        ?: throw PatchException("<style name=\"$style\"> not found")
    val items = node.getElementsByTagName("item")
    val target = (0 until items.length).map { items.item(it) as Element }.singleOrNull { it.getAttribute("name") == item }
        ?: throw PatchException("$item of <style name=\"$style\"> not found")
    target.textContent = value
}

/**
 * Sets the `<item name>` entries of [items] in the style [style], adding the ones it does not have yet. Throws when
 * the style is missing.
 */
fun setStyleItems(document: Document, style: String, items: Map<String, String>) {
    val styles = document.getElementsByTagName("style")
    val node = (0 until styles.length).map { styles.item(it) as Element }.singleOrNull { it.getAttribute("name") == style }
        ?: throw PatchException("<style name=\"$style\"> not found")
    val children = node.getElementsByTagName("item")
    val existing = (0 until children.length).map { children.item(it) as Element }.associateBy { it.getAttribute("name") }
    for ((name, value) in items) {
        val item = existing[name] ?: document.createElement("item").also {
            it.setAttribute("name", name)
            node.appendChild(it)
        }
        item.textContent = value
    }
}

/**
 * Sets [colors] (resource name to framework color, or a #AARRGGBB value) in the directory's colors.xml, creating it
 * when the app has none. Entries are merged into the existing file, so its other colors stay.
 */
fun ResourcePatchContext.writeColors(directory: String, colors: Map<String, String>) {
    val file = get("res").resolve(directory).resolve("colors.xml")
    if (!file.exists()) {
        file.parentFile.mkdirs()
        file.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n")
    }
    document("res/$directory/colors.xml").use { document ->
        val resources = document.documentElement
        val nodes = resources.getElementsByTagName("color")
        val existing = (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
        for ((name, system) in colors) {
            val color = existing[name] ?: document.createElement("color").also {
                it.setAttribute("name", name)
                resources.appendChild(it)
            }
            color.textContent = if (system.startsWith("#")) system else "@android:color/$system"
        }
    }
}

/**
 * Sets [attributes] on every element named [tag] in [document] whose attributes include [match], overriding the
 * existing values. Throws when no element matches, so a changed layout fails the patch.
 */
fun setElementAttributes(
    document: Document,
    tag: String,
    attributes: Map<String, String>,
    match: Map<String, String> = emptyMap(),
) {
    val nodes = document.getElementsByTagName(tag)
    val matched = (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { element -> match.all { (name, value) -> element.getAttribute(name) == value } }
    if (matched.isEmpty()) throw PatchException("<$tag> not found")
    matched.forEach { element -> attributes.forEach { (name, value) -> element.setAttribute(name, value) } }
}

/** Writes [text] to [path] under the decoded res directory, replacing the file the app ships with. */
fun ResourcePatchContext.writeResourceFile(path: String, text: String) {
    get("res").resolve(path).writeText(text)
}
