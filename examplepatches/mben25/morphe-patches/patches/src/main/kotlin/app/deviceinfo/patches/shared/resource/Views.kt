package app.deviceinfo.patches.shared.resource

import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_ID_ATTR = "android:id"

private fun Document.elementsWithId(id: String): List<Element> {
    val root = documentElement ?: return emptyList()
    val elements = root.getElementsByTagName("*")
    val reference = "@id/$id"

    return (0 until elements.length)
        .mapNotNull { elements.item(it) as? Element }
        .filter { it.getAttribute(ANDROID_ID_ATTR) == reference }
}

/**
 * Removes every element whose `android:id` is `@id/[id]` from a decoded layout or menu document.
 */
fun Document.removeElementById(id: String) =
    elementsWithId(id).forEach { it.parentNode.removeChild(it) }

/**
 * Sets `android:visibility="gone"` on every view whose `android:id` is `@id/[id]`. Only sticks
 * when no code path calls `setVisibility` on that view afterwards.
 */
fun Document.hideViewById(id: String) =
    elementsWithId(id).forEach { it.setAttribute("android:visibility", "gone") }
