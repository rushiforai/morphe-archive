package app.template.patches.universal

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private fun parseXml(file: File): Document {
    val factory = DocumentBuilderFactory.newInstance()
    factory.isNamespaceAware = true
    return factory.newDocumentBuilder().parse(file)
}

private fun writeXml(file: File, document: Document) {
    val transformer = TransformerFactory.newInstance().newTransformer()
    transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8")
    transformer.setOutputProperty(OutputKeys.INDENT, "no")
    file.outputStream().use { output ->
        transformer.transform(DOMSource(document), StreamResult(output))
    }
}

/**
 * Applies [transform] to the app label shown by launchers.
 *
 * Launchers show the label of the launcher activity when it declares
 * one, and the <application> label otherwise, so both are rewritten,
 * together with any <activity-alias> labels. A label usually lives in
 * a string resource referenced from the manifest
 * (android:label="@string/app_name"), in which case the string in
 * res/values/strings.xml is edited; a literal label is edited in the
 * manifest attribute itself. Only the default (values) strings are
 * changed; per-locale labels, if the app defines any, keep the
 * original name.
 *
 * Even so, this only works when the app actually takes its displayed
 * name from these labels. Apps that set their name in code, or whose
 * label resources live somewhere else, are unaffected.
 */
private fun ResourcePatchContext.transformAppLabel(transform: (String) -> String) {
    val manifestFile = get("AndroidManifest.xml")
    val manifest = parseXml(manifestFile)

    val labelHolders = mutableListOf<Element>()
    manifest.getElementsByTagName("application").item(0)?.let { labelHolders += it as Element }
    for (tag in listOf("activity", "activity-alias")) {
        val nodes = manifest.getElementsByTagName(tag)
        for (i in 0 until nodes.length) labelHolders += nodes.item(i) as Element
    }
    if (labelHolders.isEmpty()) {
        throw PatchException("No <application> or <activity> element found in AndroidManifest.xml")
    }

    val stringNames = mutableSetOf<String>()
    var manifestChanged = false
    var found = false
    for (element in labelHolders) {
        var label = element.getAttributeNS(ANDROID_NS, "label")
        if (label.isEmpty()) label = element.getAttribute("android:label")
        when {
            label.startsWith("@string/") -> {
                stringNames += label.removePrefix("@string/")
                found = true
            }

            label.isNotEmpty() -> {
                val renamed = transform(label)
                if (element.getAttributeNS(ANDROID_NS, "label").isNotEmpty()) {
                    element.setAttributeNS(ANDROID_NS, "android:label", renamed)
                } else {
                    element.setAttribute("android:label", renamed)
                }
                manifestChanged = true
                found = true
            }
        }
    }
    if (!found) throw PatchException("This app declares no android:label that could be renamed")

    if (stringNames.isNotEmpty()) {
        val stringsFile = get("res/values/strings.xml")
        val strings = parseXml(stringsFile)
        val nodes = strings.getElementsByTagName("string")
        var updated = 0
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as Element
            if (element.getAttribute("name") in stringNames) {
                element.textContent = transform(element.textContent)
                updated++
            }
        }
        if (updated == 0) {
            throw PatchException(
                "App label string(s) ${stringNames.joinToString()} were not found in res/values/strings.xml"
            )
        }
        writeXml(stringsFile, strings)
    }

    if (manifestChanged) writeXml(manifestFile, manifest)
}

/**
 * Renames the app by appending " TV" to its name, so a TV-patched copy
 * installed next to the original (for example with Morphe's Clone app
 * patch) can be told apart on the launcher: "Zangetsu" becomes
 * "Zangetsu TV". Off by default.
 */
@Suppress("unused")
val renameAppTvSuffixPatch = resourcePatch(
    name = "Rename app (add TV suffix)",
    description = "Appends \" TV\" to the app name, e.g. \"Zangetsu\" becomes \"Zangetsu TV\". Useful to tell a TV-patched copy apart from the original. Experimental: only works when the app takes its launcher name from its manifest label resources - many apps do not, and then nothing changes.",
    default = false
) {
    execute {
        transformAppLabel { name -> if (name.endsWith("TV")) name else "$name TV" }
    }
}

/**
 * Renames the app by appending " (TV)" to its name: "Zangetsu" becomes
 * "Zangetsu (TV)". A parenthesized variant of the plain suffix patch,
 * for launchers where the two copies should not sort adjacently or
 * where the plain " TV" suffix looks like part of the real name.
 * Off by default.
 */
@Suppress("unused")
val renameAppTvParenSuffixPatch = resourcePatch(
    name = "Rename app (add (TV) suffix)",
    description = "Appends \" (TV)\" to the app name, e.g. \"Zangetsu\" becomes \"Zangetsu (TV)\". Useful to tell a TV-patched copy apart from the original. Experimental: only works when the app takes its launcher name from its manifest label resources - many apps do not, and then nothing changes.",
    default = false
) {
    execute {
        transformAppLabel { name -> if (name.endsWith("(TV)")) name else "$name (TV)" }
    }
}
