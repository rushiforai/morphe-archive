package app.gboardios.patches.packagename

import app.gboardios.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.gboardios.patches.shared.Constants.GBOARD_PACKAGE_NAME
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val DEFAULT_PACKAGE_NAME = "$GBOARD_PACKAGE_NAME.iosflick"

private val PACKAGE_NAME_REGEX = Regex("""^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$""")

/** Permissions Gboard declares under its own package name. */
private val OWN_PERMISSION_SUFFIXES = listOf(
    ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
    ".pixelbundle.RECEIVER",
)

@Suppress("unused")
val changePackageNamePatch = patch(
    name = "Change package name",
    description = "Installs the patched Gboard as a separate app next to the stock Gboard, " +
        "which is usually a system app that cannot be replaced by an APK with another signature.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val packageName by stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE_NAME,
        title = "Package name",
        description = "The package name of the patched Gboard.",
        required = true,
    ) { it != null && PACKAGE_NAME_REGEX.matches(it) && it != GBOARD_PACKAGE_NAME }

    finalize {
        val newName = packageName!!
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newName)

            // Class names in the decoded manifest are fully qualified, so they keep working.
            // Provider authorities and the app's own permissions must not clash with the stock app.
            val all = document.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val element = all.item(i) as Element
                element.renameAttribute("authorities", newName) { authority ->
                    authority.split(';').joinToString(";") { it.renamePackagePrefix(newName) }
                }
                if (element.tagName in setOf("permission", "uses-permission")) {
                    element.renameAttribute("name", newName) { it.renameOwnPermission(newName) }
                }
                element.renameAttribute("permission", newName) { it.renameOwnPermission(newName) }
            }
        }
    }
}

private fun Element.renameAttribute(name: String, newName: String, transform: (String) -> String) {
    val value = getAttributeNS(ANDROID_NS, name).ifEmpty { return }
    val renamed = transform(value)
    if (renamed != value) setAttributeNS(ANDROID_NS, "android:$name", renamed)
}

private fun String.renamePackagePrefix(newName: String) = when {
    this == GBOARD_PACKAGE_NAME -> newName
    startsWith("$GBOARD_PACKAGE_NAME.") -> newName + removePrefix(GBOARD_PACKAGE_NAME)
    else -> this
}

private fun String.renameOwnPermission(newName: String) =
    if (OWN_PERMISSION_SUFFIXES.any { this == GBOARD_PACKAGE_NAME + it }) renamePackagePrefix(newName) else this
