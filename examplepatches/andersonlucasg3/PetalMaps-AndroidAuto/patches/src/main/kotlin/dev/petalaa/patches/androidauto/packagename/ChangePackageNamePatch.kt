/*
 * Copyright 2026 PetalAA.
 * https://github.com/petalaa/PetalMaps-AndroidAuto
 *
 * Adapted from the Morphe patches project:
 * https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/packagename/ChangePackageNamePatch.kt
 * (original code hard forked from ReVanced patches)
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the PetalAA patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the Morphe patches
 * LICENSE file: https://github.com/MorpheApp/morphe-patches/blob/main/NOTICE
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * File-Specific Exception to Section 7b:
 * -------------------------------------
 * Section 7b (Attribution Requirement) of the Morphe patches LICENSE
 * does not apply to THIS FILE. Use of this file does NOT require any
 * user-facing, in-application, or UI-visible attribution.
 *
 * For this file only, attribution under Section 7b is satisfied by
 * retaining this comment block in the source code of this file.
 *
 * Distribution and Derivative Works:
 * ----------------------------------
 * This comment block MUST be preserved in all copies, distributions,
 * and derivative works of this file, whether in source or modified
 * form.
 *
 * All other terms of the Morphe Patches LICENSE, including Section 7c
 * (Project Name Restriction) and the GPLv3 itself, remain fully
 * applicable to this file.
 */

package dev.petalaa.patches.androidauto.packagename

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.morphe.util.findElementByAttributeValue
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS
import org.w3c.dom.Element

private const val DEFAULT_NEW_PACKAGE_NAME = "morphe.huawei.petal.maps"

private lateinit var packageNameOption: Option<String>

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name from com.huawei.maps.app to " +
            "$DEFAULT_NEW_PACKAGE_NAME by default, allowing the patched app " +
            "to coexist with the original. Changing the package name can lead " +
            "to unexpected issues.",
    default = false
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "The package name to rename the app to. " +
                "Leave as 'Default' to use $DEFAULT_NEW_PACKAGE_NAME.",
        required = true,
    ) {
        it == "Default" || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    val updatePermissionsOption = booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Update custom permissions declared by the app. " +
            "Required for Petal Maps coexistence.",
    )

    val updateProvidersOption = booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Update provider authorities declared by the app. " +
            "Required for Petal Maps coexistence.",
    )

    fun getReplacementPackageName(): String {
        val replacementPackageName = packageNameOption.value
        return if (replacementPackageName != packageNameOption.default) {
            replacementPackageName!!
        } else {
            DEFAULT_NEW_PACKAGE_NAME
        }
    }

    finalize {
        val packageName = packageMetadata.packageName
        val newPackageName = getReplacementPackageName()

        val applyUpdatePermissions = updatePermissionsOption.value!!
        val applyUpdateProviders = updateProvidersOption.value!!

        val providerStringResources = mutableSetOf<String>()

        document("AndroidManifest.xml").use { document ->
            // Change the main package attribute.
            document.documentElement.setAttribute("package", newPackageName)

            // Update permission names so they don't conflict with the original app.
            if (applyUpdatePermissions) {
                val permissions = document.getElementsByTagName("permission")
                val usesPermissions = document.getElementsByTagName("uses-permission")

                permissions.asSequence().map { it as Element }.forEach {
                    val oldName = it.getAttribute("android:name")
                    val newName = when {
                        oldName.startsWith('.') -> return@forEach
                        oldName.startsWith("$packageName.") ->
                            oldName.replaceFirst(packageName, newPackageName)
                        else -> "${newPackageName}_$oldName"
                    }
                    it.setAttribute("android:name", newName)

                    // Update the corresponding <uses-permission> if it exists.
                    usesPermissions
                        .findElementByAttributeValue("android:name", oldName)
                        ?.setAttribute("android:name", newName)
                }
            }

            // Update provider authorities so they don't conflict with the original.
            if (applyUpdateProviders) {
                val providers =
                    document.getElementsByTagName("provider").asSequence()
                        .map { it as Element }

                for (provider in providers) {
                    val authorities = provider.getAttribute("android:authorities").split(';')
                    val newAuthorities = authorities.map {
                        when {
                            it.startsWith("$packageName.") ->
                                it.replaceFirst(packageName, newPackageName)
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

        // Update string resources that contain authority references (e.g. @string/xxx).
        if (providerStringResources.isNotEmpty()) {
            document("res/values/strings.xml").use { document ->
                val children = document.documentElement.childNodes
                for (i in 0 until children.length) {
                    val node = children.item(i) as? Element ?: continue

                    if (node.getAttribute("name") in providerStringResources) {
                        val authority = node.textContent
                        node.textContent = if (authority.startsWith("$packageName.")) {
                            authority.replaceFirst(packageName, newPackageName)
                        } else {
                            "${newPackageName}_$authority"
                        }
                    }
                }
            }
        }
    }
}
