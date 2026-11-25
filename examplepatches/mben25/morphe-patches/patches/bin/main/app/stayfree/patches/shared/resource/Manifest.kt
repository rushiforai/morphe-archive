package app.stayfree.patches.shared.resource

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

typealias Manifest = Document

private const val MANIFEST_NODE = "manifest"
private const val APPLICATION_NODE = "application"
private const val META_DATA_TAG = "meta-data"
private const val ANDROID_NAME_ATTR = "android:name"
private const val ANDROID_VALUE_ATTR = "android:value"

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
        // getElementsByTagName is recursive; only direct children belong to parentNode.
        if (element.parentNode != parentNode) continue
        val androidName = element.getAttribute(ANDROID_NAME_ATTR)

        if (regexes.any { it.matches(androidName) }) {
            elementsToRemove.add(element)
        }
    }

    elementsToRemove.forEach { parentNode.removeChild(it) }
}

/**
 * Adds or updates `<meta-data>` elements directly under the <application> element.
 */
fun Manifest.metaData(vararg properties: Pair<String, String>) {
    val application = getElementsByTagName(APPLICATION_NODE).item(0) as? Element ?: return

    properties.forEach { (name, value) ->
        val nodeList = application.getElementsByTagName(META_DATA_TAG)
        var metaData: Element? = null

        for (i in 0 until nodeList.length) {
            val element = nodeList.item(i) as? Element ?: continue
            if (element.parentNode == application && element.getAttribute(ANDROID_NAME_ATTR) == name) {
                metaData = element
                break
            }
        }

        (metaData ?: createElement(META_DATA_TAG).also {
            it.setAttribute(ANDROID_NAME_ATTR, name)
            application.appendChild(it)
        }).setAttribute(ANDROID_VALUE_ATTR, value)
    }
}

/**
 * Removes specified [services] from the <application> element.
 */
fun Manifest.removeService(vararg services: String) =
    removeManifestElements("service", *services)

/**
 * Removes specified [receivers] from the <application> element.
 */
fun Manifest.removeReceiver(vararg receivers: String) =
    removeManifestElements("receiver", *receivers)

/**
 * Removes specified [permissions] from the <manifest> element.
 */
fun Manifest.removeUsesPermission(vararg permissions: String) =
    removeManifestElements("uses-permission", *permissions, isRootLevel = true)
