package app.aidan.patches.canvas.customization

import app.aidan.patches.canvas.shared.CANVAS_PACKAGE_NAME
import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val ANDROID_PACKAGE_MAX_LENGTH = 255
private const val DYNAMIC_RECEIVER_PERMISSION = "DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"

private val ANDROID_PACKAGE_REGEX = Regex("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$")

/**
 * Authorities the clone must not share with the original app. Installation fails with
 * INSTALL_FAILED_CONFLICTING_PROVIDER when both packages declare the same authority.
 */
private val REQUIRED_AUTHORITY_SUFFIXES = listOf(
    ".provider",
    ".pdf.share",
    ".pdf.assets",
    ".canvasApiContextKeeper",
    ".firebaseinitprovider",
    ".mlkitinitprovider",
    ".com.pspdfkit.initialization.InitializationProvider"
)

private val COMPONENT_TAGS = listOf(
    "application",
    "activity",
    "activity-alias",
    "service",
    "receiver",
    "provider"
)

@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone App",
    description = "Changes the package name so this build installs alongside the original Canvas Student. " +
        "The clone has separate app data. Re-signed or cloned App Links, push notifications, and " +
        "package/certificate-bound services may not work; verify login, sharing, and document viewing.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_CANVAS)

    val packageNameOption = stringOption(
        key = "packageName",
        default = "com.instructure.candroid.morphe",
        title = "Clone Package Name",
        description = "Android package name for the clone. It must contain at least two segments and " +
            "must differ from $CANVAS_PACKAGE_NAME."
    )

    finalize {
        val packageName = packageNameOption.value?.trim().orEmpty()
        validateClonePackageName(packageName)

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.tagName != "manifest") {
                throw PatchException("Expected <manifest> root, found <${manifest.tagName}>.")
            }

            val originalPackage = manifest.getAttribute("package").trim()
            if (originalPackage != CANVAS_PACKAGE_NAME) {
                throw PatchException(
                    "Expected manifest package '$CANVAS_PACKAGE_NAME', found '$originalPackage'."
                )
            }
            if (packageName == originalPackage) {
                throw PatchException(
                    "Clone package name '$packageName' is the original package name; the clone would replace the app."
                )
            }

            resolveRelativeClassNames(document, originalPackage)
            val originalAuthorities = collectProviderAuthorities(document)
            rewriteCustomPermissions(document, originalPackage, packageName)
            rewriteProviderAuthorities(document, originalPackage, packageName, originalAuthorities)
            rewriteInstrumentationTarget(document, originalPackage, packageName)

            manifest.setAttribute("package", packageName)
        }
    }
}

private fun validateClonePackageName(packageName: String) {
    if (packageName.isEmpty()) {
        throw PatchException("Invalid packageName: the clone package name must not be blank.")
    }
    if (packageName.length > ANDROID_PACKAGE_MAX_LENGTH) {
        throw PatchException(
            "Invalid packageName '$packageName': Android package names are limited to " +
                "$ANDROID_PACKAGE_MAX_LENGTH characters."
        )
    }
    if (!ANDROID_PACKAGE_REGEX.matches(packageName)) {
        throw PatchException(
            "Invalid packageName '$packageName': expected at least two dot-separated segments, each " +
                "starting with a letter and containing only letters, digits, and underscores."
        )
    }
    if (packageName == CANVAS_PACKAGE_NAME) {
        throw PatchException(
            "Invalid packageName '$packageName': it must differ from the original package " +
                "'$CANVAS_PACKAGE_NAME'."
        )
    }
}

private fun resolveRelativeClassNames(document: Document, originalPackage: String) {
    for (tagName in COMPONENT_TAGS) {
        val components = document.getElementsByTagName(tagName)
        for (index in 0 until components.length) {
            val component = components.item(index) as? Element ?: continue
            for (attribute in classAttributesFor(tagName)) {
                val name = component.getAttribute(attribute)
                if (name.isEmpty() || name.startsWith("@")) continue
                val resolved = resolveClassName(name, originalPackage)
                if (resolved != name) component.setAttribute(attribute, resolved)
            }
        }
    }
}

private fun classAttributesFor(tagName: String): List<String> = when (tagName) {
    "application" -> listOf(
        "android:name",
        "android:backupAgent",
        "android:appComponentFactory",
        "android:manageSpaceActivity"
    )
    "activity-alias" -> listOf("android:name", "android:targetActivity")
    else -> listOf("android:name")
}

private fun resolveClassName(name: String, packageName: String): String = when {
    name.startsWith(".") -> packageName + name
    !name.contains('.') -> "$packageName.$name"
    else -> name
}

private fun ResourcePatchContext.collectProviderAuthorities(document: Document): Set<String> {
    val authorities = mutableSetOf<String>()
    val providers = document.getElementsByTagName("provider")
    for (index in 0 until providers.length) {
        val provider = providers.item(index) as? Element ?: continue
        for (authority in readAuthorities(provider)) {
            authorities += resolveAuthority(authority)
        }
    }
    return authorities
}

private fun ResourcePatchContext.rewriteCustomPermissions(
    document: Document,
    originalPackage: String,
    packageName: String
) {
    val rewrittenNames = mutableMapOf<String, String>()
    val permissionPrefix = "$originalPackage."

    val permissions = document.getElementsByTagName("permission")
    for (index in 0 until permissions.length) {
        val permission = permissions.item(index) as? Element ?: continue
        val name = permission.getAttribute("android:name")
        if (!name.startsWith(permissionPrefix)) continue

        val newName = packageName + name.removePrefix(originalPackage)
        permission.setAttribute("android:name", newName)
        rewrittenNames[name] = newName
    }

    val dynamicPermission = "$originalPackage.$DYNAMIC_RECEIVER_PERMISSION"
    if (dynamicPermission !in rewrittenNames) {
        throw PatchException(
            "Expected the clone to declare custom permission '$dynamicPermission', but no matching " +
                "<permission> was found in AndroidManifest.xml."
        )
    }

    var dynamicPermissionUsed = false
    for (tagName in listOf("uses-permission", "uses-permission-sdk-23")) {
        val usesPermissions = document.getElementsByTagName(tagName)
        for (index in 0 until usesPermissions.length) {
            val usesPermission = usesPermissions.item(index) as? Element ?: continue
            val name = usesPermission.getAttribute("android:name")
            if (name == dynamicPermission) dynamicPermissionUsed = true

            val rewritten = rewrittenNames[name] ?: continue
            usesPermission.setAttribute("android:name", rewritten)
        }
    }

    if (!dynamicPermissionUsed) {
        throw PatchException(
            "Expected AndroidManifest.xml to request custom permission '$dynamicPermission', but no " +
                "matching <uses-permission> entry was found."
        )
    }

    val allElements = document.getElementsByTagName("*")
    for (index in 0 until allElements.length) {
        val element = allElements.item(index) as? Element ?: continue
        val permission = element.getAttribute("android:permission")
        val rewritten = rewrittenNames[permission] ?: continue
        element.setAttribute("android:permission", rewritten)
    }
}

private fun ResourcePatchContext.rewriteProviderAuthorities(
    document: Document,
    originalPackage: String,
    packageName: String,
    originalAuthorities: Set<String>
) {
    val rewrittenAuthorities = mutableSetOf<String>()
    val providers = document.getElementsByTagName("provider")
    for (index in 0 until providers.length) {
        val provider = providers.item(index) as? Element ?: continue
        val authorities = readAuthorities(provider)
        if (authorities.isEmpty()) continue

        val rewritten = authorities.map { authority ->
            rewriteAuthority(authority, originalPackage, packageName)
        }
        provider.setAttribute("android:authorities", rewritten.joinToString(";"))
        rewrittenAuthorities += rewritten
    }

    val requiredAuthorities = REQUIRED_AUTHORITY_SUFFIXES.map { "$packageName$it" }
    val missing = requiredAuthorities.filter { it !in rewrittenAuthorities }
    if (missing.isNotEmpty()) {
        throw PatchException(
            "Clone manifest is missing required provider authorities: ${missing.joinToString(", ")}."
        )
    }

    val conflicts = rewrittenAuthorities.filter { it in originalAuthorities }
    if (conflicts.isNotEmpty()) {
        throw PatchException(
            "Clone would declare provider authorities that already belong to the original app: " +
                "${conflicts.joinToString(", ")}."
        )
    }
}

private fun ResourcePatchContext.rewriteAuthority(
    authority: String,
    originalPackage: String,
    packageName: String
): String {
    if (authority == originalPackage) return packageName
    if (authority.startsWith("$originalPackage.")) {
        return packageName + authority.removePrefix(originalPackage)
    }
    if (!authority.startsWith("@")) return authority

    val stringName = parseStringResourceName(authority)
    val currentValue = resolveStringResource(stringName)
    val rewritten = when {
        currentValue == originalPackage -> packageName
        currentValue.startsWith("$originalPackage.") -> packageName + currentValue.removePrefix(originalPackage)
        else -> return currentValue
    }
    rewriteStringResource(stringName, currentValue, rewritten)
    return rewritten
}

private fun readAuthorities(provider: Element): List<String> = provider.getAttribute("android:authorities")
    .split(';')
    .map { it.trim() }
    .filter { it.isNotEmpty() }

private fun ResourcePatchContext.resolveAuthority(authority: String): String = if (authority.startsWith("@")) {
    resolveStringResource(parseStringResourceName(authority))
} else {
    authority
}

private fun parseStringResourceName(reference: String): String {
    val match = Regex("^@(?:[A-Za-z0-9_.]+:)?string/([A-Za-z0-9_.]+)$").matchEntire(reference)
        ?: throw PatchException(
            "Unsupported resource-valued provider authority '$reference': expected @string/<name>."
        )
    return match.groupValues[1]
}

private fun ResourcePatchContext.resolveStringResource(name: String): String {
    val entries = findStringResourceEntries(name)
    if (entries.isEmpty()) {
        throw PatchException("Provider authority references @string/$name, but that string resource was not found.")
    }

    val values = entries.map { it.value }.distinct()
    if (values.size > 1) {
        throw PatchException(
            "Provider authority references @string/$name, but that resource has conflicting values " +
                "across configurations: ${values.joinToString(", ")}."
        )
    }
    return values.single()
}

private fun ResourcePatchContext.rewriteStringResource(name: String, oldValue: String, newValue: String) {
    val entries = findStringResourceEntries(name)
    if (entries.isEmpty()) {
        throw PatchException("Provider authority references @string/$name, but that string resource was not found.")
    }

    entries.groupBy { it.file }.forEach { (file, values) ->
        if (values.none { it.value == oldValue }) return@forEach
        val resourceDirectory = get("res").parentFile
        val relativePath = file.relativeTo(resourceDirectory).invariantSeparatorsPath
        document(relativePath).use { document ->
            val strings = document.getElementsByTagName("string")
            for (index in 0 until strings.length) {
                val element = strings.item(index) as? Element ?: continue
                if (element.getAttribute("name") != name) continue
                if (element.textContent != oldValue) continue
                element.textContent = newValue
            }
        }
    }
}

private data class StringResourceEntry(val file: File, val value: String)

private fun ResourcePatchContext.findStringResourceEntries(name: String): List<StringResourceEntry> {
    val resourceDirectory = get("res")
    if (!resourceDirectory.isDirectory) {
        throw PatchException("Decoded resource directory is missing: ${resourceDirectory.path}.")
    }

    val entries = mutableListOf<StringResourceEntry>()
    val valuesDirectories = resourceDirectory.listFiles()
        ?.filter { it.isDirectory && it.name.startsWith("values") }
        ?: emptyList()

    for (directory in valuesDirectories) {
        val stringsFile = File(directory, "strings.xml")
        if (!stringsFile.isFile) continue

        val document = DocumentBuilderFactory.newInstance()
            .newDocumentBuilder()
            .parse(stringsFile)
        val strings = document.getElementsByTagName("string")
        for (index in 0 until strings.length) {
            val element = strings.item(index) as? Element ?: continue
            if (element.getAttribute("name") != name) continue
            entries += StringResourceEntry(stringsFile, element.textContent)
        }
    }

    return entries
}

private fun rewriteInstrumentationTarget(document: Document, originalPackage: String, packageName: String) {
    val instrumentations = document.getElementsByTagName("instrumentation")
    for (index in 0 until instrumentations.length) {
        val instrumentation = instrumentations.item(index) as? Element ?: continue
        if (instrumentation.getAttribute("android:targetPackage") == originalPackage) {
            instrumentation.setAttribute("android:targetPackage", packageName)
        }
    }
}
