package app.d0nj.patches.shared

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

internal fun Document.elementByName(name: String): Element {
    val elements = getElementsByTagName("*")
    for (i in 0 until elements.length) {
        val element = elements.item(i) as? Element ?: continue
        if (element.getAttribute("name") == name) return element
    }
    throw PatchException("No resource named $name")
}

internal fun Node.childElements(): List<Element> {
    val children = childNodes
    return (0 until children.length).mapNotNull { children.item(it) as? Element }
}
