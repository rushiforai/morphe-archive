package app.enigma.patches.music.maloja

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.InputStream

/**
 * Path of the file the official Morphe settings patch merges add-on preferences from.
 * The official patch removes the file after merging it into the Morphe preference screens.
 */
private const val ADD_ON_PREFERENCES_FILE_PATH = "morphe_addon_prefs.xml"

private fun bundledResource(name: String): InputStream =
    object {}.javaClass.classLoader.getResourceAsStream("maloja/$name")
        ?: throw PatchException("Bundled resource not found: maloja/$name")

/**
 * Adds the Maloja strings and declares the Maloja preferences for the official settings patch.
 */
internal val malojaResourcePatch = resourcePatch {
    execute {
        addStrings()
        declareAddOnPreferences()
    }
}

context(context: ResourcePatchContext)
private fun addStrings() {
    val bundled = context.document(bundledResource("strings.xml"))
    val strings = bundled.documentElement.childElements("string")

    context.document("res/values/strings.xml").use { document ->
        val resources = document.documentElement
        val existingNames = resources.childElements("string")
            .map { it.getAttribute("name") }
            .toHashSet()

        strings.forEach { string ->
            if (string.getAttribute("name") !in existingNames) {
                resources.appendChild(document.importNode(string, true))
            }
        }
    }
}

context(context: ResourcePatchContext)
private fun declareAddOnPreferences() {
    val bundled = context.document(bundledResource("addon_prefs.xml"))
    val screens = bundled.documentElement.childElements("screen")

    val declarationFile = context[ADD_ON_PREFERENCES_FILE_PATH]
    if (!declarationFile.exists()) {
        declarationFile.writeText(
            """<?xml version="1.0" encoding="utf-8"?>""" +
                    """<morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android"/>"""
        )
    }

    // Another add-on may have declared its preferences already, so this one is appended to it.
    context.document(ADD_ON_PREFERENCES_FILE_PATH).use { document ->
        val root = document.documentElement
        screens.forEach { screen ->
            root.appendChild(document.importNode(screen, true))
        }
    }
}

private fun Element.childElements(tagName: String): List<Element> {
    val nodes = childNodes
    return (0 until nodes.length)
        .map(nodes::item)
        .filter { it.nodeType == Node.ELEMENT_NODE && it.nodeName == tagName }
        .map { it as Element }
}
