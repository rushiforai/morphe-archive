package app.template.patches.crimeradar

import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR
import org.w3c.dom.Element

val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the app package name to allow installing alongside the original.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    val packageNameOption = stringOption(
        key = "packageName",
        default = "com.newsbreak.crimeradar.patched",
        title = "New package name",
        required = true,
    )

    finalize {
        val newPackageName = packageNameOption.value
            ?: throw IllegalArgumentException("Package name option not set")

        val oldPackageName = packageMetadata.packageName

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newPackageName)

            // Rename custom permissions to avoid install conflicts
            val permissions = document.getElementsByTagName("permission")
            val usesPermissions = document.getElementsByTagName("uses-permission")

            for (i in 0 until permissions.length) {
                val perm = permissions.item(i) as? Element ?: continue
                val oldName = perm.getAttribute("android:name") ?: continue
                val newName = when {
                    oldName.startsWith('.') -> continue
                    oldName.startsWith("$oldPackageName.") -> oldName.replaceFirst(oldPackageName, newPackageName)
                    else -> "${newPackageName}_$oldName"
                }
                perm.setAttribute("android:name", newName)

                // Update corresponding uses-permission
                for (j in 0 until usesPermissions.length) {
                    val usePerm = usesPermissions.item(j) as? Element ?: continue
                    if (usePerm.getAttribute("android:name") == oldName) {
                        usePerm.setAttribute("android:name", newName)
                        break
                    }
                }
            }

            // Rewrite provider authorities to avoid conflicts.
            // Must handle both package-namespaced authorities AND
            // hardcoded SDK authorities (e.g. Facebook ContentProvider)
            // that don't contain the package name.
            val providers = document.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as? Element ?: continue
                val authorities = provider.getAttribute("android:authorities") ?: continue

                // Handle semicolon-separated multiple authorities
                val newAuthorities = authorities.split(";").joinToString(";") { auth ->
                    val trimmed = auth.trim()
                    when {
                        trimmed.startsWith(newPackageName) -> trimmed
                        trimmed.contains(oldPackageName) -> trimmed.replace(oldPackageName, newPackageName)
                        // Hardcoded SDK authority (e.g. Facebook) — prefix to make unique
                        else -> "$newPackageName.$trimmed"
                    }
                }

                provider.setAttribute("android:authorities", newAuthorities)
            }
        }

        // Rewrite string resources that contain the old package name.
        // This catches @string references used as provider authorities
        // (e.g. @string/sync_data_authority -> com.newsbreak.crimeradar.datasync).
        document("res/values/strings.xml").use { stringsDoc ->
            val resources = stringsDoc.documentElement
            val stringNodes = resources.getElementsByTagName("string")
            for (i in 0 until stringNodes.length) {
                val elem = stringNodes.item(i) as? Element ?: continue
                val value = elem.textContent ?: continue
                if (value.contains(oldPackageName)) {
                    elem.textContent = value.replace(oldPackageName, newPackageName)
                }
            }
        }
    }
}
