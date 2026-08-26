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

package io.github.hiosdra.patches

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.morphe.util.findElementByAttributeValue
import org.w3c.dom.Element

/**
 * F1 TV-only adaptation of Morphe's Clone app patch.
 *
 * Source attribution:
 * https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt
 * Source revision: 38c13fa35e05e4df87d28445428e1fadf1bc5ea9
 *
 * The app-specific bytecode workaround from the universal patch is not
 * included because it targets Reddit and cannot apply to F1 TV.
 */
@Suppress("unused")
val f1TvChangePackageNamePatch = resourcePatch(
    name = "F1 TV - Change package name",
    description = "Changes the F1 TV package name to allow installing a separate patched instance. " +
        "By default \".morphe\" is appended to the package name.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)

    val packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "Package name to use for the cloned F1 TV app.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    val updatePermissionsOption = booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Update custom permissions declared by F1 TV. " +
            "This can fix installation conflicts, but may break app features.",
    )

    val updateProvidersOption = booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Update provider names declared by F1 TV. " +
            "This can fix installation conflicts, but may break app features.",
    )

    finalize {
        val packageName = packageMetadata.packageName
        val replacementPackageName = packageNameOption.value.let { selected ->
            if (selected == packageNameOption.default) "$packageName.morphe" else selected!!
        }
        val providerStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", replacementPackageName)

            if (updatePermissionsOption.value == true) {
                val permissions = document.getElementsByTagName("permission")
                val usesPermissions = document.getElementsByTagName("uses-permission")

                permissions.asSequence().map { it as Element }.forEach {
                    val oldName = it.getAttribute("android:name")
                    val newName = when {
                        oldName.startsWith('.') -> return@forEach
                        oldName.startsWith("$packageName.") -> oldName.replaceFirst(packageName, replacementPackageName)
                        else -> "${replacementPackageName}_$oldName"
                    }
                    it.setAttribute("android:name", newName)

                    usesPermissions
                        .findElementByAttributeValue("android:name", oldName)
                        ?.setAttribute("android:name", newName)
                }
            }

            if (updateProvidersOption.value == true) {
                val providers =
                    document.getElementsByTagName("provider").asSequence().map { it as Element }

                for (provider in providers) {
                    val authorities = provider.getAttribute("android:authorities").split(';')
                    val newAuthorities = authorities.map { authority ->
                        when {
                            authority.startsWith("$packageName.") ->
                                authority.replaceFirst(packageName, replacementPackageName)
                            authority.startsWith('@') -> {
                                providerStringResources.add(authority.removePrefix("@string/"))
                                authority
                            }
                            else -> "${replacementPackageName}_$authority"
                        }
                    }
                    provider.setAttribute("android:authorities", newAuthorities.joinToString(";"))
                }
            }
        }

        if (providerStringResources.isNotEmpty()) {
            document("res/values/strings.xml").use { document ->
                val children = document.documentElement.childNodes
                for (i in 0 until children.length) {
                    val node = children.item(i) as? Element ?: continue
                    if (node.getAttribute("name") !in providerStringResources) continue

                    val authority = node.textContent
                    node.textContent = if (authority.startsWith("$packageName.")) {
                        authority.replaceFirst(packageName, replacementPackageName)
                    } else {
                        "${replacementPackageName}_$authority"
                    }
                }
            }
        }
    }
}
