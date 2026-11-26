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
 * Terms under Section 7 stated in this file-specific notice below.
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

// Adapted for futatabi (2026-11-21): use Morphe Patcher 1.15.1
// resourcePatch API, restrict to futatter 3.1.1, and enable by default.
// Derived from the official Clone app algorithm; upstream license notice retained.
package dev.rikunode.futatabi.clone

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val ORIGINAL = "com.Nanasaki.ftutter"

/**
 * The official Clone app package, permissions, and provider-authority rewrite,
 * ported to the v1.15.1 resource API pinned in this repository.
 */
@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone app",
    description = "Clone futatter for side-by-side installation. Default package suffix: .morphe. Cloning may not work on all devices.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "futatter",
            packageName = ORIGINAL,
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
        )
    )

    val packageName = stringOption(
        key = "packageName",
        default = "Default",
        title = "Package name",
        description = "Clone package name, or Default to append .morphe.",
        required = true,
    ) { it == "Default" || it?.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) == true }

    val updatePermissions = booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Avoid collisions of custom manifest permissions.",
    )
    val updateProviders = booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Avoid collisions of ContentProvider authorities.",
    )

    execute {
        val requested = packageName.value!!
        val replacement = if (requested == "Default") ORIGINAL + ".morphe" else requested
        require(replacement != ORIGINAL) { "Clone package must differ from the original" }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            require(manifest.tagName == "manifest" &&
                manifest.getAttribute("package") == ORIGINAL
            ) { "Unexpected futatter manifest; refusing clone" }

            if (updatePermissions.value!!) {
                val declared = document.getElementsByTagName("permission")
                val uses = document.getElementsByTagName("uses-permission")
                for (i in 0 until declared.length) {
                    val element = declared.item(i) as? Element ?: continue
                    val old = element.getAttribute("android:name")
                    require(old.isNotEmpty()) { "Permission name missing" }
                    val updated = if (old.startsWith(ORIGINAL + ".")) {
                        replacement + old.removePrefix(ORIGINAL)
                    } else replacement + "_" + old
                    element.setAttribute("android:name", updated)
                    for (j in 0 until uses.length) {
                        val use = uses.item(j) as? Element ?: continue
                        if (use.getAttribute("android:name") == old) {
                            use.setAttribute("android:name", updated)
                        }
                    }
                }
            }

            if (updateProviders.value!!) {
                val providers = document.getElementsByTagName("provider")
                for (i in 0 until providers.length) {
                    val provider = providers.item(i) as? Element ?: continue
                    val old = provider.getAttribute("android:authorities")
                    require(old.isNotBlank()) { "Provider authority missing" }
                    val mapped = old.split(';').joinToString(";") { authority ->
                        require(!authority.startsWith("@")) {
                            "Resource-ref provider authorities require additional handling"
                        }
                        if (authority.startsWith(ORIGINAL + ".")) {
                            replacement + authority.removePrefix(ORIGINAL)
                        } else replacement + "_" + authority
                    }
                    provider.setAttribute("android:authorities", mapped)
                }
            }
            manifest.setAttribute("package", replacement)
        }
    }
}
