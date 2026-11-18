package app.afterglow.patches.compat.morphe

import org.w3c.dom.Document
import org.w3c.dom.Element

private fun Document.valueElements(): List<Element> {
    require(documentElement.tagName == "resources") { "Expected a resources document" }
    val children = documentElement.childNodes
    return (0 until children.length).mapNotNull { children.item(it) as? Element }
}

/** All Android array tags share one resource type and one ID namespace. */
internal fun compatibilityValueGroups(source: Document): Map<String, List<Element>> =
    source.valueElements().groupBy { value ->
        when (value.tagName) {
            "string" -> "res/values/strings.xml"
            "array", "string-array", "integer-array" -> "res/values/arrays.xml"
            else -> error("Unsupported compatibility resource type: ${value.tagName}")
        }
    }

/** Append new names only; an existing value must be identical to the pinned value. */
internal fun mergeCompatibilityValues(target: Document, values: List<Element>, path: String) {
    val existing = linkedMapOf<String, Element>()
    target.valueElements().forEach { value ->
        val name = value.getAttribute("name")
        require(name.isNotEmpty()) { "Unnamed resource in $path" }
        require(existing.put(name, value) == null) { "Duplicate resource $name in $path" }
    }
    val additions = mutableListOf<Element>()
    values.forEach { value ->
        val name = value.getAttribute("name")
        require(name.isNotEmpty()) { "Unnamed compatibility resource in $path" }
        val previous = existing.putIfAbsent(name, value)
        if (previous == null) {
            additions += value
        } else {
            require(previous.isEqualNode(value)) { "Conflicting compatibility resource $name in $path" }
        }
    }
    additions.forEach { target.documentElement.appendChild(target.importNode(it, true)) }
}
