package com.sj010.gboardclipboard.patches

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val GBOARD_PACKAGE_NAME = Constants.GBOARD_PACKAGE_NAME
private const val RENAMED_PACKAGE_NAME = Constants.RENAMED_PACKAGE_NAME

/**
 * Preference XML files that may embed `<intent>` elements pointing back at the host package.
 * These have to follow the manifest rename, otherwise the preferences resolve to an activity
 * that no longer exists in the renamed package.
 */
private val GBOARD_SETTINGS_XML_PATHS = listOf(
    "res/xml/settings.xml",
    "res/xml/settings_legacy.xml",
    "res/xml/setting_clipboard.xml",
)

private data class PackageRenameMapping(
    val elementName: String,
    val namespaceUri: String?,
    val attributeName: String,
    val originalValue: String,
    val renamedValue: String,
)

private fun mapping(
    elementName: String,
    namespaceUri: String?,
    attributeName: String,
    originalValue: String,
    renamedValue: String,
) = PackageRenameMapping(
    elementName = elementName,
    namespaceUri = namespaceUri,
    attributeName = attributeName,
    originalValue = originalValue,
    renamedValue = renamedValue,
)

private fun androidMapping(
    elementName: String,
    attributeName: String,
    originalValue: String,
    renamedValue: String,
) = mapping(
    elementName = elementName,
    namespaceUri = ANDROID_NS,
    attributeName = attributeName,
    originalValue = originalValue,
    renamedValue = renamedValue,
)

private val GBOARD_PACKAGE_RENAME_MAPPINGS = listOf(
    mapping("manifest", null, "package", GBOARD_PACKAGE_NAME, RENAMED_PACKAGE_NAME),
    androidMapping(
        "permission",
        "name",
        "$GBOARD_PACKAGE_NAME.pixelbundle.RECEIVER",
        "$RENAMED_PACKAGE_NAME.pixelbundle.RECEIVER",
    ),
    androidMapping(
        "permission",
        "name",
        "$GBOARD_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
        "$RENAMED_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
    ),
    androidMapping(
        "meta-data",
        "name",
        "com.google.android.gms.phenotype.registration.binarypb:$GBOARD_PACKAGE_NAME",
        "com.google.android.gms.phenotype.registration.binarypb:$RENAMED_PACKAGE_NAME",
    ),
    androidMapping(
        "meta-data",
        "name",
        "com.google.android.gms.phenotype.registration.xml:$GBOARD_PACKAGE_NAME",
        "com.google.android.gms.phenotype.registration.xml:$RENAMED_PACKAGE_NAME",
    ),
    androidMapping(
        "provider",
        "authorities",
        GBOARD_PACKAGE_NAME,
        RENAMED_PACKAGE_NAME,
    ),
    androidMapping(
        "data",
        "host",
        "deeplink.$GBOARD_PACKAGE_NAME",
        "deeplink.$RENAMED_PACKAGE_NAME",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.clipboard_content",
        "$RENAMED_PACKAGE_NAME.clipboard_content",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.inputactionprovider",
        "$RENAMED_PACKAGE_NAME.inputactionprovider",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.swissarmyknifefileprovider",
        "$RENAMED_PACKAGE_NAME.swissarmyknifefileprovider",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.fileprovider",
        "$RENAMED_PACKAGE_NAME.fileprovider",
    ),
    androidMapping(
        "receiver",
        "permission",
        "$GBOARD_PACKAGE_NAME.pixelbundle.RECEIVER",
        "$RENAMED_PACKAGE_NAME.pixelbundle.RECEIVER",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.tracing",
        "$RENAMED_PACKAGE_NAME.tracing",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.wdb",
        "$RENAMED_PACKAGE_NAME.wdb",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.mlkitinitprovider",
        "$RENAMED_PACKAGE_NAME.mlkitinitprovider",
    ),
)

private val GBOARD_OPTIONAL_PACKAGE_RENAME_MAPPINGS = listOf(
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.androidx-startup",
        "$RENAMED_PACKAGE_NAME.androidx-startup",
    ),
    androidMapping(
        "provider",
        "authorities",
        "$GBOARD_PACKAGE_NAME.train.androidx-startup",
        "$RENAMED_PACKAGE_NAME.train.androidx-startup",
    ),
)

val gboardPackageRenamePatch = resourcePatch(
    name = "Package Rename to com.sj010.gboard",
    description = "Rename Gboard package to com.sj010.gboard for coexistence alongside stock Gboard.",
) {
    compatibleWith(Constants.COMPATIBILITY_GBOARD)

    execute {
        applyManifestPackageOverride()
        applyClipboardProviderIdentity()
        rewriteSettingsTargetPackages()
    }

    // Runs after every `execute` block, so the preference documents are already patched
    // with the clipboard history entry when the target package is normalized.
    finalize {
        applyClipboardProviderIdentity()
        rewriteSettingsTargetPackages()
    }
}

/**
 * Keeps the clipboard history provider identity in sync with the renamed package.
 *
 * The provider authority and the signature permission live in global namespaces.
 * The clipboard history patch derives them from the manifest package it sees, so
 * this patch normalises them to the documented `com.sj010.gboard` values once the
 * package rename has been applied.
 *
 * The manifest is rewritten as raw text: DOM attribute mutations of the decoded
 * manifest are not reliably flushed back into the workspace.
 */
context(context: ResourcePatchContext)
private fun applyClipboardProviderIdentity(): Unit = with(context) {
    val file = get("AndroidManifest.xml", false)
    if (!file.exists()) return@with
    val original = file.readText()

    // 1. Drop every clipboard history permission declaration.
    val permissionRegex = Regex(
        """<permission\b[^>]*?android:name="[^"]*\.permission\.READ_CLIPBOARD_HISTORY"[^>]*?/>"""
    )
    var text = permissionRegex.replace(original, "")

    // 2. Point the clipboard history provider at the documented authority.
    val authorityRegex = Regex("""android:authorities="[^"]*\.gboardclipboard\.history"""")
    text = authorityRegex.replace(text, """android:authorities="${Constants.CLIPBOARD_PROVIDER_AUTHORITY}"""")

    // 3. Declare the documented signature permission again.
    if (!text.contains(Constants.CLIPBOARD_PERMISSION_NAME)) {
        val declaration = "<permission android:name=\"${Constants.CLIPBOARD_PERMISSION_NAME}\" " +
            "android:protectionLevel=\"signature\" />"
        text = text.replaceFirst("<application", "$declaration\n    <application")
    }

    if (text != original) {
        file.writeText(text)
    }
}

context(context: ResourcePatchContext)
private fun applyManifestPackageOverride(): Unit = with(context) {
    document("AndroidManifest.xml").use { doc ->
        val manifest = doc.documentElement
        val currentPackage = manifest.getAttribute("package")
        if (currentPackage != GBOARD_PACKAGE_NAME) {
            return@use
        }

        // 1. Rename manifest attributes
        val allElements = doc.getElementsByTagName("*")
        for (i in 0 until allElements.length) {
            val element = allElements.item(i) as? Element ?: continue
            val localName = element.localName ?: element.tagName.substringAfter(':')

            for (mapping in GBOARD_PACKAGE_RENAME_MAPPINGS + GBOARD_OPTIONAL_PACKAGE_RENAME_MAPPINGS) {
                if (localName == mapping.elementName) {
                    val attr = if (mapping.namespaceUri == null) {
                        element.getAttributeNode(mapping.attributeName)
                    } else {
                        element.getAttributeNodeNS(mapping.namespaceUri, mapping.attributeName)
                            ?: element.getAttributeNode("android:${mapping.attributeName}")
                    }
                    if (attr != null && attr.value == mapping.originalValue) {
                        attr.value = mapping.renamedValue
                    }
                }
            }
        }

        // 2. Adjust version code if necessary to match upgrade constraints
        val versionCodeAttr = manifest.getAttributeNodeNS(ANDROID_NS, "versionCode")
            ?: manifest.getAttributeNode("android:versionCode")
        if (versionCodeAttr != null) {
            val currentCode = versionCodeAttr.value.toLongOrNull() ?: 0L
            if (currentCode in 176004200..176004237) {
                versionCodeAttr.value = "176004240"
            } else if (currentCode == 176027078L) {
                versionCodeAttr.value = "176027079"
            }
        }

        // 3. Remove standalone split tags if present
        listOf("requiredSplitTypes", "splitTypes").forEach { attributeName ->
            if (manifest.hasAttributeNS(ANDROID_NS, attributeName)) {
                manifest.removeAttributeNS(ANDROID_NS, attributeName)
            }
            if (manifest.hasAttribute("android:$attributeName")) {
                manifest.removeAttribute("android:$attributeName")
            }
        }

        // 4. Remove com.android.vending.splits.required
        val childNodes = manifest.childNodes
        val toRemove = mutableListOf<Node>()
        for (i in 0 until childNodes.length) {
            val node = childNodes.item(i)
            if (node is Element && node.tagName == "meta-data") {
                val name = node.getAttributeNS(ANDROID_NS, "name").takeIf { it.isNotBlank() }
                    ?: node.getAttribute("android:name")
                if (name == "com.android.vending.splits.required") {
                    toRemove.add(node)
                }
            }
        }
        toRemove.forEach { manifest.removeChild(it) }
    }

    sanitizeMissingSplitResources()
}

/**
 * Rewrites `android:targetPackage` on every `<intent>` in the Gboard preference documents that
 * still points at the original package name.
 *
 * The clipboard history preference is injected by a separate patch which may run before or after
 * this one, so the rewrite is applied unconditionally (and for every target class) instead of
 * only for the clipboard entry.
 *
 * The edit is performed on the raw file instead of through the DOM: the resource patcher does
 * not reliably flush DOM mutations of these preference documents back into the decoded
 * workspace, while a plain text rewrite is always picked up by the resource compiler.
 */
context(context: ResourcePatchContext)
private fun rewriteSettingsTargetPackages(): Unit = with(context) {
    for (path in GBOARD_SETTINGS_XML_PATHS) {
        try {
            val file = get(path, false)
            enforceIntentTargetPackage(file, RENAMED_PACKAGE_NAME, GBOARD_PACKAGE_NAME)
        } catch (_: Throwable) {
        }
    }
}

context(context: ResourcePatchContext)
private fun sanitizeMissingSplitResources() = with(context) {
    val resDir = try {
        this.get("res")
    } catch (_: Throwable) {
        return@with
    }
    if (!resDir.exists() || !resDir.isDirectory) return@with

    val xmlFiles = resDir.walkTopDown()
        .filter { it.isFile && it.extension == "xml" && it.name != "public.xml" }
        .toList()

    val hexPattern = Regex("""@0x7f08[0-9a-fA-F]{4}""")
    val missingHexRefs = mutableSetOf<String>()
    for (file in xmlFiles) {
        val text = file.readText()
        hexPattern.findAll(text).forEach { match ->
            missingHexRefs.add(match.value)
        }
    }
    if (missingHexRefs.isEmpty()) return@with

    val publicFile = this.get("res/values/public.xml")
    val drawablesFile = this.get("res/values/drawables.xml")
    if (!drawablesFile.exists()) {
        drawablesFile.parentFile?.mkdirs()
        drawablesFile.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n")
    }

    var publicText = publicFile.readText()
    var drawablesText = drawablesFile.readText()
    val newPublic = mutableListOf<String>()
    val newDrawables = mutableListOf<String>()
    val fallbackDrawable = when {
        publicText.contains("name=\"drawable_0x7f080000\"") -> "@drawable/drawable_0x7f080000"
        else -> "@null"
    }

    for (ref in missingHexRefs.sorted()) {
        val hexId = ref.substring(1).lowercase()
        val drawableName = "drawable_$hexId"
        if (!publicText.contains("id=\"$hexId\"")) {
            newPublic.add("  <public id=\"$hexId\" type=\"drawable\" name=\"$drawableName\" />")
        }
        if (!drawablesText.contains("name=\"$drawableName\"")) {
            newDrawables.add("  <drawable name=\"$drawableName\">$fallbackDrawable</drawable>")
        }
    }

    if (newPublic.isNotEmpty()) {
        val closeTag = "</resources>"
        val index = publicText.lastIndexOf(closeTag)
        if (index != -1) {
            publicText = publicText.substring(0, index) + newPublic.joinToString("\n") + "\n" + closeTag + publicText.substring(index + closeTag.length)
            publicFile.writeText(publicText)
        }
    }
    if (newDrawables.isNotEmpty()) {
        val closeTag = "</resources>"
        val index = drawablesText.lastIndexOf(closeTag)
        if (index != -1) {
            drawablesText = drawablesText.substring(0, index) + newDrawables.joinToString("\n") + "\n" + closeTag + drawablesText.substring(index + closeTag.length)
            drawablesFile.writeText(drawablesText)
        }
    }

    for (file in xmlFiles) {
        var content = file.readText()
        var modified = false
        for (ref in missingHexRefs) {
            if (content.contains(ref)) {
                val hexId = ref.substring(1).lowercase()
                content = content.replace(ref, "@drawable/drawable_$hexId")
                modified = true
            }
        }
        if (modified) {
            file.writeText(content)
        }
    }
}
