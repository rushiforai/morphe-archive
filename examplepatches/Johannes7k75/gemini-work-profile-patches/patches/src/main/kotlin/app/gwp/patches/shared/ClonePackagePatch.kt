/*
 * Adapted from "Clone app" of Morphe Patches (GPLv3):
 * https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt
 * See NOTICE for the GPLv3 section 7 terms that apply to Morphe contributions.
 *
 * Changes: internal patch (applied automatically by the patches of this bundle), fixed package suffix,
 * permissions and providers always updated, no-op if the app was already renamed by another patch.
 */
package app.gwp.patches.shared

import app.gwp.patches.shared.Constants.CLONE_SUFFIX
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import java.util.logging.Logger

/**
 * Installs the patched app next to the original by renaming its package to `<original>.morphe`.
 *
 * Runs in `finalize`, after all patches of this bundle rewrote their package references.
 * Do not additionally enable the official "Clone app" patch.
 */
val clonePackagePatch = patch {
    finalize {
        val packageName = packageMetadata.packageName
        val newPackageName = packageName + CLONE_SUFFIX
        val logger = Logger.getLogger("ClonePackagePatch")
        val providerStringResources = mutableSetOf<String>()

        resourceXml("AndroidManifest.xml").use { manifest ->
            val current = manifest.root.attribute("package")
            if (current != packageName) {
                logger.warning("Package already renamed to '$current' (official \"Clone app\" enabled?), skipping")
                return@finalize
            }
            manifest.root.setAttribute("package", newPackageName)

            // Custom permissions must be unique on the device.
            val usesPermissions = manifest.elements("uses-permission").toList()
            manifest.elements("permission").forEach {
                val oldName = it.attribute("android:name").orEmpty()
                val newName = when {
                    oldName.startsWith('.') -> return@forEach
                    oldName.startsWith("$packageName.") -> oldName.replaceFirst(packageName, newPackageName)
                    else -> "${newPackageName}_$oldName"
                }
                it.setAttribute("android:name", newName)
                usesPermissions.firstOrNull { usesPermission -> usesPermission.attribute("android:name") == oldName }
                    ?.setAttribute("android:name", newName)
            }

            // Content provider authorities must be unique on the device.
            for (provider in manifest.elements("provider")) {
                val authorities = provider.attribute("android:authorities").orEmpty().split(';')
                val newAuthorities = authorities.map {
                    when {
                        it.startsWith("$packageName.") -> it.replaceFirst(packageName, newPackageName)
                        it.startsWith('@') -> {
                            providerStringResources.add(it.removePrefix("@string/"))
                            it
                        }
                        else -> "${newPackageName}_$it"
                    }
                }
                provider.setAttribute("android:authorities", newAuthorities.joinToString(";"))
            }
        }

        if (providerStringResources.isNotEmpty()) {
            resourceXml("res/values/strings.xml").use { strings ->
                providerStringResources.forEach { name ->
                    val string = strings.resourceOrNull(name) ?: return@forEach
                    val authority = string.text
                    if (authority.isEmpty()) return@forEach
                    string.text = if (authority.startsWith("$packageName.")) {
                        authority.replaceFirst(packageName, newPackageName)
                    } else {
                        "${newPackageName}_$authority"
                    }
                }
            }
        }
        logger.info("Renamed package $packageName -> $newPackageName")
    }
}
