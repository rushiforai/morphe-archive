package santodan.patches

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.nuvio.tv"
private const val CLONED_PACKAGE = "com.nuvio.santodan"
private const val CLONED_LABEL = "NuvioTV Patched"

/** Gives the patched APK an install identity that does not collide with official NuvioTV. */
@Suppress("unused")
val nuvioSideBySideInstallationPatch = resourcePatch(
    name = "NuvioTV - Side-by-side installation",
    description = "Installs a separately named NuvioTV clone using a configurable package name and app name.",
    default = true,
) {
    compatibleWith(NuvioSideBySideCompatibility.create())

    val packageName = stringOption(
        key = "packageName",
        default = CLONED_PACKAGE,
        title = "Package name",
        description = "Unique Android package name for this installation, for example com.nuvio.testing.one.",
        required = true,
    ) { value -> value != null && isValidClonePackage(value) }
    val appName = stringOption(
        key = "appName",
        default = CLONED_LABEL,
        title = "App name",
        description = "Name displayed by Android launchers for this installation.",
        required = true,
    ) { value -> value != null && value == value.trim() && value.isNotEmpty() && value.length <= 80 }

    // Run after other selected resource patches so authorities they add are renamed too.
    finalize {
        document("AndroidManifest.xml").use {
            transformNuvioManifest(
                it,
                requireNotNull(packageName.value) { "Package name option is required" },
                requireNotNull(appName.value) { "App name option is required" },
            )
        }
    }
}

internal fun transformNuvioManifest(
    document: Document,
    clonedPackage: String = CLONED_PACKAGE,
    clonedLabel: String = CLONED_LABEL,
) {
    require(isValidClonePackage(clonedPackage)) { "Invalid clone package name: $clonedPackage" }
    require(clonedLabel == clonedLabel.trim() && clonedLabel.isNotEmpty() && clonedLabel.length <= 80) {
        "App name must contain 1 to 80 characters without leading or trailing whitespace"
    }
    val manifest = document.documentElement
    check(manifest.tagName == "manifest") { "AndroidManifest.xml has no manifest root" }
    check(manifest.getAttribute("package") == ORIGINAL_PACKAGE) {
        "Expected manifest package $ORIGINAL_PACKAGE"
    }

    val applications = document.getElementsByTagName("application")
    check(applications.length == 1) { "Expected exactly one application element" }

    renameNuvioPermissions(document, clonedPackage)
    renameNuvioProviderAuthorities(document, clonedPackage)
    manifest.setAttribute("package", clonedPackage)
    (applications.item(0) as Element).setAttribute("android:label", clonedLabel)

    // Nuvio declares a label on each selectable launcher activity, so changing only the
    // application label does not change the name shown by Android launchers.
    for (tag in listOf("activity", "activity-alias")) {
        val components = document.getElementsByTagName(tag)
        for (index in 0 until components.length) {
            val component = components.item(index) as Element
            val categories = component.getElementsByTagName("category")
            val isLauncher = (0 until categories.length).any { categoryIndex ->
                (categories.item(categoryIndex) as Element).getAttribute("android:name") in setOf(
                    "android.intent.category.LAUNCHER",
                    "android.intent.category.LEANBACK_LAUNCHER",
                )
            }
            if (isLauncher) component.setAttribute("android:label", clonedLabel)
        }
    }
}

private fun renameNuvioPermissions(document: Document, clonedPackage: String) {
    val renamed = mutableMapOf<String, String>()
    val declarations = document.getElementsByTagName("permission")
    for (index in 0 until declarations.length) {
        val permission = declarations.item(index) as Element
        val name = permission.getAttribute("android:name")
        check(name.startsWith("$ORIGINAL_PACKAGE.")) { "Unexpected app-defined permission: $name" }
        val replacement = name.replaceNuvioPackagePrefix(clonedPackage)
        renamed[name] = replacement
        permission.setAttribute("android:name", replacement)
    }

    val usesPermissions = document.getElementsByTagName("uses-permission")
    for (index in 0 until usesPermissions.length) {
        val permission = usesPermissions.item(index) as Element
        renamed[permission.getAttribute("android:name")]?.let {
            permission.setAttribute("android:name", it)
        }
    }

    renamed.forEach { (original, replacement) ->
        check((0 until usesPermissions.length).any { index ->
            (usesPermissions.item(index) as Element).getAttribute("android:name") == replacement
        }) { "App-defined permission is not requested by the manifest: $original" }
    }
}

private fun renameNuvioProviderAuthorities(document: Document, clonedPackage: String) {
    val providers = document.getElementsByTagName("provider")
    for (index in 0 until providers.length) {
        val provider = providers.item(index) as Element
        val authorities = provider.getAttribute("android:authorities")
        check(authorities.isNotBlank()) { "Provider has no android:authorities value" }
        provider.setAttribute(
            "android:authorities",
            authorities.split(';').joinToString(";") { authority ->
                val value = authority.trim()
                check(value.startsWith("$ORIGINAL_PACKAGE.")) {
                    "Unexpected provider authority: $value"
                }
                value.replaceNuvioPackagePrefix(clonedPackage)
            },
        )
    }
}

private fun String.replaceNuvioPackagePrefix(clonedPackage: String) =
    clonedPackage + removePrefix(ORIGINAL_PACKAGE)

private fun isValidClonePackage(value: String): Boolean =
    value != ORIGINAL_PACKAGE &&
        value.length <= 255 &&
        PACKAGE_NAME.matches(value)

private val PACKAGE_NAME = Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+")
