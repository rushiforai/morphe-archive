package app.template.patches.letterboxd.theme

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

/** Replace the value of `<color name="[name]">` in [resources], or add it if absent. */
internal fun upsertColor(document: Document, resources: Element, name: String, value: String) {
    val colors = resources.getElementsByTagName("color")
    for (i in 0 until colors.length) {
        val color = colors.item(i) as Element
        if (color.getAttribute("name") == name) {
            color.textContent = value
            return
        }
    }
    resources.appendChild(
        document.createElement("color").apply {
            setAttribute("name", name)
            textContent = value
        },
    )
}

/** The current value of `<item name="[itemName]">` inside `<style name="[styleName]">`, or null. */
internal fun styleItemValue(document: Document, styleName: String, itemName: String): String? {
    val styles = document.getElementsByTagName("style")
    val style = (0 until styles.length)
        .map { styles.item(it) as Element }
        .firstOrNull { it.getAttribute("name") == styleName } ?: return null
    val items = style.getElementsByTagName("item")
    for (i in 0 until items.length) {
        val item = items.item(i) as Element
        if (item.getAttribute("name") == itemName) return item.textContent
    }
    return null
}

/** Replace `<item name="[itemName]">` inside `<style name="[styleName]">`, or add it if absent. */
internal fun setStyleItem(document: Document, styleName: String, itemName: String, value: String) {
    val styles = document.getElementsByTagName("style")
    val style = (0 until styles.length)
        .map { styles.item(it) as Element }
        .firstOrNull { it.getAttribute("name") == styleName }
        ?: throw PatchException("Style \"$styleName\" not found in res/values/styles.xml")

    val items = style.getElementsByTagName("item")
    for (i in 0 until items.length) {
        val item = items.item(i) as Element
        if (item.getAttribute("name") == itemName) {
            item.textContent = value
            return
        }
    }
    style.appendChild(
        document.createElement("item").apply {
            setAttribute("name", itemName)
            textContent = value
        },
    )
}

/**
 * Adds a `<public type="color" name="[name]" id="[id]"/>` entry to `res/values/public.xml`'s root
 * (a no-op if already present). Needed for any colour a runtime `.arsc` overlay (see
 * [buildColorOverlay]) will target: the overlay bakes in the exact numeric resource id, which only
 * a `<public>` declaration pins reliably for a colour this project itself introduces.
 */
internal fun ensurePublicColor(document: Document, resources: Element, name: String, id: String) {
    val publicNodes = resources.getElementsByTagName("public")
    for (i in 0 until publicNodes.length) {
        val element = publicNodes.item(i) as Element
        if (element.getAttribute("type") == "color" && element.getAttribute("name") == name) return
    }
    resources.appendChild(
        document.createElement("public").apply {
            setAttribute("type", "color")
            setAttribute("name", name)
            setAttribute("id", id)
        },
    )
}
