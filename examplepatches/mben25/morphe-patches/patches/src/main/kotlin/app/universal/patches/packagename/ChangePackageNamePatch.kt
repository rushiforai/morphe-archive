/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original code hard forked from:
 * https://github.com/ReVanced/revanced-patches/blob/724e6d61b2ecd868c1a9a37d465a688e83a74799/patches/src/main/kotlin/app/revanced/patches/all/misc/packagename/ChangePackageNamePatch.kt
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file.
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * Section 7b: Notice Preservation
 * -------------------------------
 * This entire comment block must be preserved in all copies,
 * distributions, and derivative works of this file, in both
 * original and modified source forms.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.universal.patches.packagename

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private fun NodeList.elements() = (0 until length).map { item(it) as Element }

/**
 * Morphe's "Clone app" without the clone semantics: no `.morphe` fallback and no per-app
 * overrides. The user names the package the patched APK installs as, and the manifest's
 * permissions and provider authorities follow it so the install never collides with
 * another app's.
 */
@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Installs the patched app under the package name you specify instead of the " +
        "original one. Not every app works under a new package name; some may crash or lose " +
        "features that check their own package.",
    default = false,
) {
    val packageNameOption = stringOption(
        key = "packageName",
        default = null,
        title = "Package name",
        description = "Package name to install the patched app as, e.g. com.example.app.",
        required = true,
    ) {
        !it.isNullOrBlank() && it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Rename custom permissions declared by the app to the new package. " +
            "Fixes installation conflicts, but can break features in certain apps.",
    )

    val updateProviders by booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Rename provider authorities declared by the app to the new package. " +
            "Fixes installation conflicts, but can break features in certain apps.",
    )

    // finalize, not execute: other patches may still read or add manifest entries under the
    // original package name, and rename runs after all of them.
    finalize {
        val newPackageName = packageNameOption.value!!
        lateinit var packageName: String
        val providerStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            packageName = manifest.getAttribute("package")
            if (newPackageName == packageName) return@finalize
            manifest.setAttribute("package", newPackageName)

            if (updatePermissions == true) {
                val usesPermissions = document.getElementsByTagName("uses-permission").elements()

                document.getElementsByTagName("permission").elements().forEach {
                    val oldName = it.getAttribute("android:name")
                    val newName = when {
                        oldName.startsWith('.') -> return@forEach
                        oldName.startsWith("$packageName.") -> oldName.replaceFirst(packageName, newPackageName)
                        else -> "${newPackageName}_$oldName"
                    }
                    it.setAttribute("android:name", newName)

                    usesPermissions.filter { usesPermission -> usesPermission.getAttribute("android:name") == oldName }
                        .forEach { usesPermission -> usesPermission.setAttribute("android:name", newName) }
                }
            }

            if (updateProviders == true) {
                document.getElementsByTagName("provider").elements().forEach { provider ->
                    val authorities = provider.getAttribute("android:authorities").split(';')
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
        }

        if (providerStringResources.isEmpty()) return@finalize
        document("res/values/strings.xml").use { document ->
            document.getElementsByTagName("string").elements()
                .filter { it.getAttribute("name") in providerStringResources && it.textContent.isNotEmpty() }
                .forEach {
                    val authority = it.textContent
                    it.textContent = if (authority.startsWith("$packageName.")) {
                        authority.replaceFirst(packageName, newPackageName)
                    } else {
                        "${newPackageName}_$authority"
                    }
                }
        }
    }
}
