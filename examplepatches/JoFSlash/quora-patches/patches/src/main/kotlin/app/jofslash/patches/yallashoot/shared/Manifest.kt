package app.jofslash.patches.yallashoot.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element

/** Edits AndroidManifest.xml. */
internal fun ResourcePatchContext.editManifest(block: (Document) -> Unit) {
    document("AndroidManifest.xml").use(block)
}

/** The elements called [tag], last first, so they can be removed while going through them. */
internal fun Document.elements(tag: String): List<Element> {
    val list = getElementsByTagName(tag)
    return (list.length - 1 downTo 0).map { list.item(it) as Element }
}

/**
 * Takes the [tag] elements whose android:name is in [names] out of the manifest. Throws when none
 * of them is there, so a changed app fails loudly.
 */
internal fun Document.removeNamed(tag: String, names: Set<String>): Set<String> {
    val found = mutableSetOf<String>()
    for (element in elements(tag)) {
        val name = element.getAttribute("android:name")
        if (name in names) {
            element.parentNode.removeChild(element)
            found += name
        }
    }
    if (found.isEmpty()) throw PatchException("Couldn't find any of $names in the manifest")
    return found
}

/** Sets the application's meta-data [name] to [value], adding it when the app has none. */
internal fun Document.setApplicationMetaData(name: String, value: String) {
    val application = getElementsByTagName("application").item(0) as Element
    val existing = elements("meta-data").firstOrNull {
        it.parentNode == application && it.getAttribute("android:name") == name
    }
    val element = existing ?: createElement("meta-data").also {
        it.setAttribute("android:name", name)
        application.appendChild(it)
    }
    element.setAttribute("android:value", value)
}
