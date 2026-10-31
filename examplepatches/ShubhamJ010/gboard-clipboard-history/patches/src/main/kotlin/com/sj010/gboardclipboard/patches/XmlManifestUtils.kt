package com.sj010.gboardclipboard.patches

import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.File

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Rewrites `android:targetPackage` on the intents of a preference document.
 *
 * The resource patcher does not consistently flush DOM attribute mutations of the decoded
 * preference documents back into the workspace, so the attribute is enforced directly on
 * the raw XML. That keeps an entry resolvable regardless of whether the package rename
 * patch already ran or still has to run.
 *
 * @param file the document to rewrite
 * @param packageName the package the intents have to point at
 * @param previousPackage the package the intents pointed at before the rename
 * @param targetClass when set, only the intent for that class is rewritten. When it is
 *     null, every intent that still points at [previousPackage] is rewritten.
 * @return true when the document was changed
 */
internal fun enforceIntentTargetPackage(
    file: File,
    packageName: String,
    previousPackage: String,
    targetClass: String? = null,
): Boolean {
    if (!file.exists()) {
        return false
    }
    val original = file.readText()
    val updated = if (targetClass != null) {
        val intentRegex = Regex("""<intent\b[^>]*targetClass="${Regex.escape(targetClass)}"[^>]*/>""")
        intentRegex.replace(original) { match ->
            match.value.replace(
                Regex("""targetPackage="[^"]*""""),
                """targetPackage="$packageName"""",
            )
        }
    } else {
        original.replace(
            """targetPackage="$previousPackage"""",
            """targetPackage="$packageName"""",
        )
    }
    if (updated == original) {
        return false
    }
    file.writeText(updated)
    return true
}

internal fun Element.childElements(name: String? = null): Sequence<Element> =
    (0 until childNodes.length)
        .asSequence()
        .map { childNodes.item(it) }
        .filter { it.nodeType == Node.ELEMENT_NODE && (name == null || it.nodeName == name) }
        .filterIsInstance<Element>()

internal fun Element.manifestAndroidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) return namespaced
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

internal fun Element.setManifestAndroidAttribute(localName: String, value: String) {
    try {
        setAttributeNS(ANDROID_NS, "android:$localName", value)
    } catch (_: Throwable) {
        setAttribute("android:$localName", value)
    }
}

internal fun ensureManifestComponent(
    document: Document,
    application: Element,
    tagName: String,
    className: String,
): Element {
    val component = application.childElements(tagName).firstOrNull {
        it.manifestAndroidAttribute("name") == className
    } ?: document.createElement(tagName).also(application::appendChild)
    component.setManifestAndroidAttribute("name", className)
    return component
}

internal fun ensureManifestPermission(
    document: Document,
    manifest: Element,
    permissionName: String,
    protectionLevel: String = "signature",
) {
    val permission = manifest.childElements("permission").firstOrNull {
        it.manifestAndroidAttribute("name") == permissionName
    } ?: document.createElement("permission").also { created ->
        val application = manifest.childElements("application").firstOrNull()
        if (application == null) {
            manifest.appendChild(created)
        } else {
            manifest.insertBefore(created, application)
        }
    }
    permission.setManifestAndroidAttribute("name", permissionName)
    permission.setManifestAndroidAttribute("protectionLevel", protectionLevel)
}
