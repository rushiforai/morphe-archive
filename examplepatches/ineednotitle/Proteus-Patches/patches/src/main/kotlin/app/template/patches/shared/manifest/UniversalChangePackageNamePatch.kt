package app.template.patches.shared.manifest
import app.template.patches.shared.logUniversal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.NodeList

// Universal "Change package name" (clone) toolkit. Original package is read
// from the manifest at patch time; rewrites package attr, free-form
// android:name identifiers (permission/uses-permission*/activity-alias —
// NEVER component class names), android:permission, provider authorities,
// taskAffinity and the app label. Clone is re-signed (payments/logins/
// anti-fraud may reject it). Fail-safe; default = false.

@Suppress("unused")
val universalChangePackageNamePatch = resourcePatch(
    name = "Change package name (clone app)",
    description = """
        Installs a clone of any app beside the original by changing the package,
        permission names, provider authorities and launcher label.

        The clone is re-signed: payments, SDK logins, Google sign-in and anti-fraud
        checks bound to the original signature may not work on the clone.
    """.trimIndent(),
    default = false,
) {
    val packageName by stringOption(
        key = "clonePackageName",
        default = "",
        title = "Package name",
        description = "Package name for the cloned app. Leave empty for the default " +
            "(app.morphe.<app name>).",
        required = false,
    ) { it == null || it.isEmpty() || it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) }

    val appName by stringOption(
        key = "cloneAppName",
        default = "",
        title = "App name",
        description = "Launcher name for the cloned app. Leave empty to append \"(Proteus)\" " +
            "to the current label.",
        required = false,
    ) { it == null || it.isEmpty() || !it.isNullOrBlank() }

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val originalPackageName = manifest.getAttribute("package")
            if (originalPackageName.isBlank()) return@use

            val newPackageName = packageName?.takeIf { it.isNotBlank() }
                ?: "app.morphe." + originalPackageName.substringAfterLast('.')

            val application = document.getElementsByTagName("application").item(0) as? Element
            val label = application?.getAttribute("android:label")?.takeIf { it.isNotBlank() }
            val newAppName = appName?.takeIf { it.isNotBlank() }
                ?: if (label != null && !label.startsWith("@")) "$label (Proteus)" else "Proteus Clone"

            manifest.setAttribute("package", newPackageName)

            val allElements = document.getElementsByTagName("*")
            replaceNameAttributes(allElements, originalPackageName, newPackageName)
            replaceComponentPermissions(allElements, originalPackageName, newPackageName)
            replaceProviderAuthorities(document.getElementsByTagName("provider"), originalPackageName, newPackageName)
            replaceTaskAffinity(allElements, originalPackageName, newPackageName)

            application?.setAttribute("android:label", newAppName)
            logUniversal("Change package name: $originalPackageName -> $newPackageName (\"$newAppName\").")
        }
    }
}

private fun String.safeReplace(original: String, new: String): String {
    if (!startsWith(original)) return this

    val after = drop(original.length)
    val extraSuffix = new.removePrefix(original)
    if (extraSuffix.isNotEmpty() && after.startsWith(extraSuffix)) return this

    return new + after
}

private val RENAMEABLE_NAME_ELEMENTS = setOf(
    "permission",
    "uses-permission",
    "uses-permission-sdk-23",
    "uses-permission-sdk-m",
    "activity-alias",
)

private fun replaceNameAttributes(nodes: NodeList, original: String, new: String) {
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        if (element.tagName !in RENAMEABLE_NAME_ELEMENTS) continue

        val value = element.getAttribute("android:name")
        if (value.startsWith(original)) {
            element.setAttribute("android:name", value.safeReplace(original, new))
        }
    }
}

private fun replaceComponentPermissions(nodes: NodeList, original: String, new: String) {
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        val permission = element.getAttribute("android:permission")
        if (permission.startsWith(original)) {
            element.setAttribute("android:permission", permission.safeReplace(original, new))
        }
    }
}

private fun replaceProviderAuthorities(providers: NodeList, original: String, new: String) {
    for (index in 0 until providers.length) {
        val provider = providers.item(index) as? Element ?: continue
        val authorities = provider.getAttribute("android:authorities")
        if (authorities.isEmpty()) continue

        val rewritten = authorities
            .split(";")
            .map { authority ->
                if (authority.trim().startsWith(original)) authority.safeReplace(original, new)
                else authority
            }
            .joinToString(";")
        provider.setAttribute("android:authorities", rewritten)
    }
}

private fun replaceTaskAffinity(nodes: NodeList, original: String, new: String) {
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        val affinity = element.getAttribute("android:taskAffinity")
        if (affinity.startsWith(original)) {
            element.setAttribute("android:taskAffinity", affinity.safeReplace(original, new))
        }
    }
}
