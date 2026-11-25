package app.deviceinfo.patches.shared.resource

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

typealias Manifest = Document

private const val MANIFEST_NODE = "manifest"
private const val APPLICATION_NODE = "application"
private const val ANDROID_NAME_ATTR = "android:name"

/**
 * Applies a configuration block to the AndroidManifest document.
 */
fun ResourcePatchContext.androidManifest(
    block: Manifest.() -> Unit,
): Document = document("AndroidManifest.xml").use { document ->
    document.apply(block)
}

/**
 * Removes elements from the manifest document based on the specified tag name and element names.
 */
private fun Document.removeManifestElements(
    tagName: String,
    vararg elements: String,
    isRootLevel: Boolean = false,
) {
    val nodeName = if (isRootLevel) MANIFEST_NODE else APPLICATION_NODE
    val parentNode = getElementsByTagName(nodeName).item(0) as? Element ?: return

    val regexes = elements.map(String::toRegex)
    val elementsToRemove = mutableListOf<Node>()

    val nodeList = parentNode.getElementsByTagName(tagName)
    for (i in 0 until nodeList.length) {
        val element = nodeList.item(i) as? Element ?: continue
        val androidName = element.getAttribute(ANDROID_NAME_ATTR)

        if (regexes.any { it.matches(androidName) }) {
            elementsToRemove.add(element)
        }
    }

    elementsToRemove.forEach { parentNode.removeChild(it) }
}

/**
 * Removes specified [services] from the <application> element.
 */
fun Manifest.removeService(vararg services: String) =
    removeManifestElements("service", *services)

/**
 * Removes specified [providers] from the <application> element.
 */
fun Manifest.removeProvider(vararg providers: String) =
    removeManifestElements("provider", *providers)

/**
 * Removes specified [permissions] from the <manifest> element.
 */
fun Manifest.removeUsesPermission(vararg permissions: String) =
    removeManifestElements("uses-permission", *permissions, isRootLevel = true)

/**
 * Removes specified [libraries] (`<uses-library>` elements) from the <application> element.
 */
fun Manifest.removeUsesLibrary(vararg libraries: String) =
    removeManifestElements("uses-library", *libraries)
