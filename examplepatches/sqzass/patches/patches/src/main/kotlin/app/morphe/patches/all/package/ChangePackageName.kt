package app.morphe.patches.all.packagename

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Renames the app package.",
    default = false,
) {
    val packageNameOption = stringOption(
        key = "packageName",
        default = null,
        values = null,
        title = "Package name",
        description = "Custom package name. Left blank, the original package is suffixed with '.lustx'.",
        required = false,
    ) { it == null || it.isBlank() || it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) }

    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Rename custom permissions (incl. the dynamic-receiver permission) that use the old package.",
    )
    val updateProviders by booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update provider authorities",
        description = "Rename content-provider authorities that use the old package.",
    )

    finalize {
        document("AndroidManifest.xml").use { doc ->
            fun elementsByTag(tag: String): List<Element> {
                val nl = doc.getElementsByTagName(tag)
                return (0 until nl.length).map { nl.item(it) as Element }
            }

            val manifest = elementsByTag("manifest").first()
            val oldPackage = manifest.getAttribute("package")
            val newPackage =
                packageNameOption.value
                    ?.takeIf { it.isNotBlank() }
                    ?: "$oldPackage.lustx"

            if (updatePermissions == true) {
                (elementsByTag("permission") + elementsByTag("uses-permission")).forEach { el ->
                    val name = el.getAttribute("android:name")
                    if (name.startsWith(oldPackage)) {
                        el.setAttribute("android:name", newPackage + name.removePrefix(oldPackage))
                    }
                }
            }

            if (updateProviders == true) {
                elementsByTag("provider").forEach { el ->
                    val authorities = el.getAttribute("android:authorities")
                    if (authorities.isNotEmpty()) {
                        el.setAttribute(
                            "android:authorities",
                            authorities.split(";").joinToString(";") { auth ->
                                if (auth.startsWith(oldPackage)) newPackage + auth.removePrefix(oldPackage) else auth
                            },
                        )
                    }
                }
            }

            manifest.setAttribute("package", newPackage)
        }
    }
}
