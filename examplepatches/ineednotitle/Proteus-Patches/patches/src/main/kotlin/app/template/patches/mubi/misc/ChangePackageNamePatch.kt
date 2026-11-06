package app.template.patches.mubi.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import org.w3c.dom.Element
import org.w3c.dom.NodeList

// Install a cloned MUBI beside the official app.
//
// The manifest package, permission identifiers, provider authorities and
// task affinity are rewritten, while DEX component class names are left alone
// (renaming android:name on an <activity>/<service>/<provider> produces a
// ClassNotFoundException at startup).
//
// Known limitations, documented in the patch description:
//   • The clone is re-signed. Google Play Billing, Cast receiver registration
//     and Google sign-in may reject it; those flows are server- and
//     signature-bound and cannot be fixed in the manifest.
//   • Use this for side-by-side installs and for testing the patched build,
//     not as a replacement for the official app if you need purchases.
//
// Fail-safe: only identifiers that start with com.mubi are rewritten. Any
// authority or permission outside that namespace is preserved verbatim.

private const val ORIGINAL_PACKAGE_NAME = "com.mubi"
private const val DEFAULT_PACKAGE_NAME = "app.morphe.mubi"
private const val APP_NAME_STRING = "morphe_mubi_app_name"

@Suppress("unused")
val mubiChangePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Installs MUBI beside the official app by changing the package, " +
        "permission names, provider authorities and launcher label. " +
        "Play Billing, Cast and Google sign-in may not work on the clone.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    val packageName by stringOption(
        key = "mubiPackageName",
        default = DEFAULT_PACKAGE_NAME,
        title = "Package name",
        description = "Package name for the cloned MUBI app.",
        required = true,
    ) { it?.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) == true }

    val appName by stringOption(
        key = "mubiAppName",
        default = "MUBI Proteus",
        title = "App name",
        description = "Launcher name for the cloned MUBI app.",
        required = true,
    ) { !it.isNullOrBlank() }

    execute {
        val newPackageName = packageName ?: DEFAULT_PACKAGE_NAME

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newPackageName)

            val allElements = document.getElementsByTagName("*")
            replaceNameAttributes(allElements, newPackageName)
            replaceComponentPermissions(allElements, newPackageName)
            replaceProviderAuthorities(document.getElementsByTagName("provider"), newPackageName)
            replaceTaskAffinity(allElements, newPackageName)

            (document.getElementsByTagName("application").item(0) as? Element)
                ?.setAttribute("android:label", "@string/$APP_NAME_STRING")
        }

        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            val strings = document.getElementsByTagName("string")

            val existing = (0 until strings.length)
                .mapNotNull { strings.item(it) as? Element }
                .firstOrNull { it.getAttribute("name") == APP_NAME_STRING }

            val target = existing ?: document.createElement("string").also {
                it.setAttribute("name", APP_NAME_STRING)
                resources.appendChild(it)
            }
            target.textContent = appName ?: "MUBI Proteus"
        }
    }
}

/**
 * Replaces the original package prefix in an identifier, without double-replacing
 * when the new package itself starts with the original one.
 */
private fun String.safeReplace(newPackageName: String): String {
    if (!startsWith(ORIGINAL_PACKAGE_NAME)) return this

    val after = drop(ORIGINAL_PACKAGE_NAME.length)
    val extraSuffix = newPackageName.removePrefix(ORIGINAL_PACKAGE_NAME)
    if (extraSuffix.isNotEmpty() && after.startsWith(extraSuffix)) return this

    return newPackageName + after
}

/**
 * android:name means different things per element, so only the elements whose
 * name is a free-form key are rewritten:
 *   <permission>/<uses-permission>(/-sdk-23) → permission identifier → rename
 *   <activity-alias>                         → alias label          → rename
 *   <activity>/<service>/<receiver>/<provider>/<application>
 *                                            → DEX class name        → never rename
 *   <meta-data>/<intent-filter> ...           → SDK keys              → never rename
 */
private val RENAMEABLE_NAME_ELEMENTS = setOf(
    "permission",
    "uses-permission",
    "uses-permission-sdk-23",
    "activity-alias",
)

private fun replaceNameAttributes(nodes: NodeList, newPackageName: String) {
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        if (element.tagName !in RENAMEABLE_NAME_ELEMENTS) continue

        val value = element.getAttribute("android:name")
        if (value.startsWith(ORIGINAL_PACKAGE_NAME)) {
            element.setAttribute("android:name", value.safeReplace(newPackageName))
        }
    }
}

private fun replaceComponentPermissions(nodes: NodeList, newPackageName: String) {
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        val permission = element.getAttribute("android:permission")

        if (permission.startsWith(ORIGINAL_PACKAGE_NAME)) {
            element.setAttribute("android:permission", permission.safeReplace(newPackageName))
        }
    }
}

private fun replaceProviderAuthorities(nodes: NodeList, newPackageName: String) {
    for (index in 0 until nodes.length) {
        val provider = nodes.item(index) as? Element ?: continue
        val authorities = provider.getAttribute("android:authorities")
        if (authorities.isBlank()) continue

        val rewritten = authorities.split(";").joinToString(";") { authority ->
            if (authority.startsWith(ORIGINAL_PACKAGE_NAME)) {
                authority.safeReplace(newPackageName)
            } else {
                authority
            }
        }
        provider.setAttribute("android:authorities", rewritten)
    }
}

private fun replaceTaskAffinity(nodes: NodeList, newPackageName: String) {
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        val affinity = element.getAttribute("android:taskAffinity")

        if (affinity.startsWith(ORIGINAL_PACKAGE_NAME)) {
            element.setAttribute("android:taskAffinity", affinity.safeReplace(newPackageName))
        }
    }
}
