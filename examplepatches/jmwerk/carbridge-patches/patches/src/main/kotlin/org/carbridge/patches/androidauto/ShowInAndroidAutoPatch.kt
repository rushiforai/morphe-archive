package org.carbridge.patches.androidauto

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import org.carbridge.core.AndroidAttr
import org.carbridge.core.CarOptions
import org.carbridge.core.CarPatch
import org.carbridge.core.ManifestElement
import org.carbridge.core.ManifestHost
import org.w3c.dom.Document
import org.w3c.dom.Element

@Suppress("unused")
val showInAndroidAutoPatch = patch(
    name = "Show in Android Auto",
    description = "Lists the app in the Android Auto launcher and shows its full interface " +
        "on the car screen while parked.",
    default = false,
) {
    // No compatibleWith: the patch applies to any app.
    val keepMediaServicesOption = booleanOption(
        key = "keepMediaServices",
        default = false,
        title = "Keep media services",
        description = "Keep the app's media browser service, so music and podcast apps keep their " +
            "Android Auto audio player. Android Auto may then show that player instead of the full app.",
    )
    val fillScreenOption = booleanOption(
        key = "fillScreen",
        default = true,
        title = "Fill the car screen",
        description = "Remove portrait-only locks, so screens that only work upright fill the wide car display.",
    )

    execute {
        document("AndroidManifest.xml").use { doc ->
            val options = CarOptions(
                keepMediaServices = keepMediaServicesOption.value == true,
                fillScreen = fillScreenOption.value != false,
            )
            try {
                CarPatch.apply(DomHost(doc), options)
            } catch (e: IllegalStateException) {
                throw PatchException(e.message ?: "Show in Android Auto failed")
            }
        }
    }
}

/** Morphe's decoded manifest, where attributes are written as `android:<name>` text. */
private class DomHost(private val doc: Document) : ManifestHost {
    override val manifest = DomElement(doc.documentElement)
    override val application = manifest.children("application").firstOrNull()
        ?: throw PatchException("Manifest has no <application>")

    override fun hasPermission(name: String) =
        manifest.children("uses-permission").any { it.getString(CarPatch.NAME) == name }

    override fun addPermission(name: String) {
        val el = doc.createElement("uses-permission")
        el.setAttribute("android:name", name)
        doc.documentElement.insertBefore(el, (application as DomElement).el)
    }

    override fun addAutomotiveDescriptor(name: String, uses: String) {
        resourceFile("res/xml/$name.xml", false).apply {
            parentFile.mkdirs()
            writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<automotiveApp>\n    <uses name=\"$uses\"/>\n</automotiveApp>\n")
        }
    }

    // Morphe shows patch progress itself
    override fun log(message: String) = Unit
}

private class DomElement(val el: Element) : ManifestElement {
    override val tag: String get() = el.tagName

    override fun children(tag: String): List<ManifestElement> {
        val nodes = el.childNodes
        return (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
            .filter { it.tagName == tag }
            .map(::DomElement)
    }

    override fun getString(attr: AndroidAttr) = el.getAttribute(key(attr)).ifEmpty { null }

    override fun getInt(attr: AndroidAttr): Int? {
        val text = getString(attr) ?: return null
        return text.toIntOrNull() ?: attr.enumValues[text]
    }

    override fun setString(attr: AndroidAttr, value: String) = el.setAttribute(key(attr), value)
    override fun setBoolean(attr: AndroidAttr, value: Boolean) = el.setAttribute(key(attr), value.toString())
    override fun setInt(attr: AndroidAttr, value: Int) = el.setAttribute(key(attr), value.toString())
    override fun setEnum(attr: AndroidAttr, value: String) = el.setAttribute(key(attr), value)
    override fun setResource(attr: AndroidAttr, type: String, name: String) =
        el.setAttribute(key(attr), "@$type/$name")

    override fun remove(attr: AndroidAttr) = el.removeAttribute(key(attr))

    override fun append(tag: String): ManifestElement =
        DomElement(el.ownerDocument.createElement(tag).also(el::appendChild))

    override fun removeChild(child: ManifestElement) {
        el.removeChild((child as DomElement).el)
    }

    private fun key(attr: AndroidAttr) = "android:${attr.name}"
}
