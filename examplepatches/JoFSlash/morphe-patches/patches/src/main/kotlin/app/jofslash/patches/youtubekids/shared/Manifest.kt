package app.jofslash.patches.youtubekids.shared

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
