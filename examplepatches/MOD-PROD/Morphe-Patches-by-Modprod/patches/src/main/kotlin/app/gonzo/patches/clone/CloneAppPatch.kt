package app.gonzo.patches.clone

import app.gonzo.patches.shared.Constants.COMPATIBILITY_TIZENTUBE
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.morphe.util.findElementByAttributeValue
import org.w3c.dom.Element

/** Valid Android application id: at least two segments, each starting with a lowercase letter. */
private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")

/**
 * Changes the application id so the patched TizenTube installs next to the original one.
 *
 * Adapted from the official Morphe "Clone app" patch, reduced to what TizenTube needs:
 *  - <manifest package="..."> is rewritten,
 *  - custom <permission> names are renamed (two apps cannot declare the same permission),
 *  - <provider android:authorities> are renamed (two apps cannot share an authority).
 *
 * Activities and services keep their fully-qualified class names, so no bytecode change
 * is required: Android resolves components by class name, not by application id.
 *
 * Runs in `finalize` so it sees the manifest after every other patch touched it.
 */
@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone app",
    description = "Changes the package name so the patched app can be installed next to the original TizenTube. " +
        "Default package name: mod.android.youtube.tv.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TIZENTUBE)

    val packageName by stringOption(
        key = "packageName",
        default = "mod.android.youtube.tv",
        values = mapOf(
            "mod.android.youtube.tv" to "mod.android.youtube.tv",
            "mod.youtube.tv" to "mod.youtube.tv",
            "io.gh.reisxd.tizentube.cobalt.mod" to "io.gh.reisxd.tizentube.cobalt.mod",
        ),
        title = "Package name",
        description = "Package name of the cloned app. Each cloned install needs a unique package name.",
        required = true,
    ) { it != null && it.matches(PACKAGE_NAME_REGEX) }

    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Rename custom permissions declared by the app. Prevents install conflicts with the original app.",
    )

    val updateProviders by booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Rename content provider authorities. Prevents install conflicts with the original app.",
    )

    finalize {
        val oldPackageName = packageMetadata.packageName
        val newPackageName = packageName!!

        if (newPackageName == oldPackageName) return@finalize

        /** `old.pkg.X` -> `new.pkg.X`, anything else -> `new.pkg_X` (keeps names unique). */
        fun rename(name: String) =
            if (name.startsWith("$oldPackageName.")) name.replaceFirst(oldPackageName, newPackageName)
            else "${newPackageName}_$name"

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", newPackageName)

            if (updatePermissions == true) {
                val usesPermissions = document.getElementsByTagName("uses-permission")

                document.getElementsByTagName("permission").asSequence().map { it as Element }.forEach { permission ->
                    val oldName = permission.getAttribute("android:name")
                    if (oldName.startsWith('.')) return@forEach

                    val newName = rename(oldName)
                    permission.setAttribute("android:name", newName)

                    // Keep the matching <uses-permission> in sync, otherwise the app loses its own permission.
                    usesPermissions.findElementByAttributeValue("android:name", oldName)
                        ?.setAttribute("android:name", newName)
                }
            }

            if (updateProviders == true) {
                document.getElementsByTagName("provider").asSequence().map { it as Element }.forEach { provider ->
                    val authorities = provider.getAttribute("android:authorities")
                    if (authorities.isEmpty()) return@forEach

                    provider.setAttribute(
                        "android:authorities",
                        authorities.split(';').joinToString(";") { authority ->
                            // @string/ references are left untouched (not resolved here).
                            if (authority.startsWith('@')) authority else rename(authority)
                        },
                    )
                }
            }
        }
    }
}
