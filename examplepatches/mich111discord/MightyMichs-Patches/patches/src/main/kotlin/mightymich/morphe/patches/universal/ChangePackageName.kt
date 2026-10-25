package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: change the app package name in AndroidManifest.xml.
 * Default: append ".mightymich" to the original package.
 */
@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name in the manifest. Default appends \".mightymich\". " +
        "May break some features (auth, providers, permissions).",
    default = false
) {
    val packageName by stringOption(
        name = "Package name",
        key = "packageName",
        default = "Default",
        description = "New package name, or \"Default\" to append \".mightymich\".",
        values = mapOf("Default" to "Default")
    )

    val updatePermissions by booleanOption(
        name = "Update permissions",
        key = "updatePermissions",
        default = true,
        description = "Rewrite custom permissions that start with the old package name."
    )

    val updateProviders by booleanOption(
        name = "Update providers",
        key = "updateProviders",
        default = true,
        description = "Rewrite ContentProvider authorities that start with the old package name."
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement as Element
            val oldPackage = manifest.getAttribute("package")
                ?: return@use

            val newPackage = when {
                packageName.isNullOrBlank() || packageName == "Default" ->
                    "$oldPackage.mightymich"
                else -> packageName!!
            }

            if (newPackage == oldPackage) return@use

            manifest.setAttribute("package", newPackage)

            if (updatePermissions == true) {
                val tags = listOf("permission", "uses-permission")
                tags.forEach { tag ->
                    val nodes = document.getElementsByTagName(tag)
                    for (i in 0 until nodes.length) {
                        val el = nodes.item(i) as? Element ?: continue
                        val name = el.getAttribute("android:name") ?: continue
                        if (name.startsWith("$oldPackage.")) {
                            el.setAttribute(
                                "android:name",
                                name.replaceFirst(oldPackage, newPackage)
                            )
                        }
                    }
                }
            }

            if (updateProviders == true) {
                val nodes = document.getElementsByTagName("provider")
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as? Element ?: continue
                    val auth = el.getAttribute("android:authorities") ?: continue
                    if (auth.startsWith("$oldPackage.")) {
                        el.setAttribute(
                            "android:authorities",
                            auth.replace(oldPackage, newPackage)
                        )
                    }
                }
            }
        }
    }
}
