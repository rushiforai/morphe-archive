package app.masareef.patches.telemetry.resource

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

typealias Manifest = Document

internal const val MANIFEST_NODE = "manifest"
internal const val APPLICATION_NODE = "application"
internal const val META_DATA_TAG = "meta-data"
internal const val ANDROID_NAME_ATTR = "android:name"
internal const val ANDROID_VALUE_ATTR = "android:value"

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
 * Adds or updates meta-data elements in the manifest document.
 */
fun Document.metaData(vararg properties: Pair<String, String>) {
    val application = getElementsByTagName(APPLICATION_NODE).item(0) as? Element ?: return

    properties.forEach { (name, value) ->
        val nodeList = application.getElementsByTagName(META_DATA_TAG)
        var metaData: Element? = null
        
        for (i in 0 until nodeList.length) {
            val element = nodeList.item(i) as? Element ?: continue
            if (element.getAttribute(ANDROID_NAME_ATTR) == name) {
                metaData = element
                break
            }
        }

        if (metaData != null) {
            metaData.setAttribute(ANDROID_VALUE_ATTR, value)
        } else {
            val newMetaData = createElement(META_DATA_TAG)
            newMetaData.setAttribute(ANDROID_NAME_ATTR, name)
            newMetaData.setAttribute(ANDROID_VALUE_ATTR, value)
            application.appendChild(newMetaData)
        }
    }
}

/**
 * Removes specified [receivers] from the <application> element.
 */
fun Manifest.removeReceiver(vararg receivers: String) =
    removeManifestElements("receiver", *receivers)

/**
 * Removes specified [services] from the <application> element.
 */
fun Manifest.removeService(vararg services: String) =
    removeManifestElements("service", *services)

/**
 * Removes specified [permissions] from the <manifest> element.
 */
fun Manifest.removeUsesPermission(vararg permissions: String) =
    removeManifestElements("uses-permission", *permissions, isRootLevel = true)

/**
 * Removes specified [properties] from the <application> element.
 */
fun Manifest.removeProperty(vararg properties: String) =
    removeManifestElements("property", *properties)
