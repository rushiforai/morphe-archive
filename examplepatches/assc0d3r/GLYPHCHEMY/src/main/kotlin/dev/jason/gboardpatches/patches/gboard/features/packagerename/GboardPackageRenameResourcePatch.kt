package dev.jason.gboardpatches.patches.gboard.features.packagerename

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import dev.jason.gboardpatches.patches.gboard.features.lanftp.LAN_FTP_STATUS_PROVIDER_AUTHORITY_SUFFIX
import dev.jason.gboardpatches.patches.gboard.features.lanftp.LAN_FTP_STATUS_PROVIDER_CLASS
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_SETTINGS_XML_PATHS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.gboard.shared.elements
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PACKAGE_NAME
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCHED_PACKAGE_NAME
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element


internal const val MAX_GBOARD_APP_DISPLAY_NAME_CODE_POINTS = 40

internal fun isValidGboardAppDisplayName(value: String?): Boolean {
    if (value.isNullOrEmpty() || value != value.trim()) return false
    if (value.codePointCount(0, value.length) > MAX_GBOARD_APP_DISPLAY_NAME_CODE_POINTS) return false
    if (value.first() == '@' || value.first() == '?') return false
    return value.none { character ->
        character.isISOControl() || character == '\u2028' || character == '\u2029'
    }
}

private const val APP_DISPLAY_NAME_RESOURCE = "gboard_patches_app_display_name"
private const val APP_DISPLAY_NAME_RESOURCE_REF = "@string/$APP_DISPLAY_NAME_RESOURCE"
internal const val APP_DISPLAY_NAME_RESOURCE_PATH = "res/values/strings.xml"

context(context: ResourcePatchContext)
internal fun applyGboardApplicationDisplayName(displayName: String) = with(context) {
    // Patcher 2.x decodes resources on request; the scan below must see every values file.
    decode("res/values*/*.xml")
    val target = this[APP_DISPLAY_NAME_RESOURCE_PATH, false]
    check(target.isFile) { "Missing existing default string resources at $APP_DISPLAY_NAME_RESOURCE_PATH" }
    val factory = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
    val builder = factory.newDocumentBuilder()
    val labelResources = builder.parse(target)
    val otherResources = this["res", false].listFiles().orEmpty().asSequence()
        .filter { it.isDirectory && (it.name == "values" || it.name.startsWith("values-")) }
        .flatMap { it.listFiles().orEmpty().asSequence() }
        .filter { it.isFile && it.extension == "xml" && it.absoluteFile != target.absoluteFile }
        .sortedBy { it.path }
        .map { builder.parse(it) }
        .toList()
    PublicXmlManager(this["res/values/public.xml"]).use { publicIds ->
        document("AndroidManifest.xml").use { manifest ->
            applyGboardApplicationDisplayName(manifest, displayName, labelResources, otherResources, publicIds)
            val writer = StringWriter()
            TransformerFactory.newInstance().newTransformer().apply {
                setOutputProperty(OutputKeys.ENCODING, "utf-8")
            }.transform(DOMSource(labelResources), StreamResult(writer))
            check(target.parentFile.isDirectory || target.parentFile.mkdirs()) {
                "Could not create default display-name resource directory"
            }
            target.writeText(writer.toString(), Charsets.UTF_8)
        }
    }
}

internal fun applyGboardApplicationDisplayName(
    manifestDocument: Document,
    displayName: String,
    labelResourceDocument: Document,
    otherValueResourceDocuments: List<Document>,
    publicIds: PublicXmlManager,
) {
    applyGboardApplicationDisplayName(
        manifestDocument, displayName, labelResourceDocument, otherValueResourceDocuments,
    )
    publicIds.createPublicId("string", APP_DISPLAY_NAME_RESOURCE)
}

internal fun applyGboardApplicationDisplayName(
    manifestDocument: Document,
    displayName: String,
    labelResourceDocument: Document,
    otherValueResourceDocuments: List<Document> = emptyList(),
) {
    require(isValidGboardAppDisplayName(displayName)) {
        "Invalid Gboard app display name"
    }
    val applications = manifestDocument.documentElement.childElements("application").toList()
    check(applications.size == 1) {
        "Expected exactly one application element, found ${applications.size}"
    }
    val label = applications.single().androidAttribute("label")
        ?: error("Gboard application is missing android:label")
    val resources = labelResourceDocument.documentElement
    check(resources.tagName == "resources") { "Expected default display-name resources root" }
    val existing = displayNameResourceEntries(labelResourceDocument)
    check(existing.size <= 1) { "Duplicate default display-name resources" }
    check(otherValueResourceDocuments.all { displayNameResourceEntries(it).isEmpty() }) {
        "Display-name resource collides outside default values/strings.xml"
    }
    if (label.value == APP_DISPLAY_NAME_RESOURCE_REF) {
        check(existing.size == 1) { "Display-name resource reference has no unique definition" }
        val entry = existing.single()
        check(entry.tagName == "string" &&
            entry.getAttribute("translatable") == "false" &&
            entry.getAttribute("formatted") == "false" &&
            entry.childElements().none() &&
            entry.textContent.startsWith('"') && entry.textContent.endsWith('"')) {
            "Existing display-name resource is not patch-owned"
        }
    } else {
        check(existing.isEmpty()) { "Display-name resource name is already occupied" }
    }

    val entry = existing.singleOrNull() ?: labelResourceDocument.createElement("string").apply {
        setAttribute("name", APP_DISPLAY_NAME_RESOURCE)
        setAttribute("translatable", "false")
        setAttribute("formatted", "false")
        resources.appendChild(this)
    }
    entry.textContent = encodeAndroidDisplayName(displayName)
    label.value = APP_DISPLAY_NAME_RESOURCE_REF
}

private fun displayNameResourceEntries(document: Document): List<Element> {
    val root = document.documentElement
    check(root.tagName == "resources") { "Expected values resource document" }
    return root.childElements().filter {
        it.tagName != "public" && it.getAttribute("name") == APP_DISPLAY_NAME_RESOURCE
    }.toList()
}

private fun encodeAndroidDisplayName(value: String): String = buildString {
    append('"')
    value.forEach { character ->
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\'' -> append("\\'")
            else -> append(character)
        }
    }
    append('"')
}


private fun Element.androidAttribute(localName: String): Attr? =
    attributes.asSequence().filterIsInstance<Attr>().firstOrNull { attribute ->
        (
            attribute.namespaceURI == ANDROID_NS &&
                attribute.localName == localName
            ) ||
            attribute.nodeName == "android:$localName"
    }

private fun org.w3c.dom.NamedNodeMap.asSequence(): Sequence<org.w3c.dom.Node> =
    (0 until length).asSequence().map(::item)
