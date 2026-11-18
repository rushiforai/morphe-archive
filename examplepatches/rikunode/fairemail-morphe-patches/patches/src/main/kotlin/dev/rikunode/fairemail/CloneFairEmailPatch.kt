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

/*
 * FairEmail-targeted port, adapted 2026-10-29 by the FairEmail Morphe project.
 * Original upstream reference:
 * https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt
 *
 * This targeted port intentionally excludes unrelated apps' DEX-specific rules.
 * Keeps the upstream default ".morphe" suffix and option names/defaults so
 * already-installed clone identities remain stable during upgrades.
 */

package dev.rikunode.fairemail

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "eu.faircode.email"
private const val DEFAULT_SUFFIX = ".morphe"
private const val TARGET_VERSION = "1.2338"

@Suppress("unused")
val cloneFairEmailPatch = resourcePatch(
    name = "Clone FairEmail alongside official app",
    description = "Install patched FairEmail alongside the official app using the same .morphe package suffix as Morphe's Clone app. Do NOT select Morphe's separate Clone app simultaneously.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "FairEmail",
            packageName = ORIGINAL_PACKAGE,
            apkFileType = ApkFileType.APK,
            appIconColor = 0x157B9B,
            targets = listOf(AppTarget(version = TARGET_VERSION, versionCode = 2338)),
        )
    )

    val packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Clone package name",
        description = "Default: eu.faircode.email.morphe. Keep unchanged on future updates to preserve data.",
        required = true,
    ) {
        it == "Default" || (it != null && it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")))
    }

    val updatePermissionsOption = booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update custom permissions",
        description = "Match the upstream Morphe Clone app default; prevents collisions with the official installation.",
    )

    val updateProvidersOption = booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update provider authorities",
        description = "Match upstream Morphe Clone app behavior; prevents collisions with the official installation.",
    )

    // Morphe's Clone app uses a resource-patch FINALIZER, rather than rewriting
    // package data before other resource patches have finished.
    finalize {
        val original = packageMetadata.packageName
        require(original == ORIGINAL_PACKAGE) {
            "Clone FairEmail: unexpected original package $original"
        }
        val chosen = packageNameOption.value
        val replacement = if (chosen == "Default") "$ORIGINAL_PACKAGE$DEFAULT_SUFFIX" else requireNotNull(chosen)
        require(replacement != ORIGINAL_PACKAGE && replacement.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))) {
            "Clone FairEmail: invalid clone package; refusing to overwrite official install identity"
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val actual = manifest.getAttribute("package")
            // This is an intentional fail-closed guard. Other sources' Clone
            // app may be selected too, but combining both is NOT supported.
            require(actual == ORIGINAL_PACKAGE || actual == replacement) {
                "Clone FairEmail: another clone patch has modified the manifest; disable Morphe's separate Clone app"
            }

            if (actual == replacement) {
                // If an upstream Clone app ran first with identical options,
                // avoid rewriting its provider authorities a second time.
                return@use
            }

            manifest.setAttribute("package", replacement)

            if (updatePermissionsOption.value == true) {
                val permissions = document.getElementsByTagName("permission")
                val usesPermissions = document.getElementsByTagName("uses-permission")

                for (index in 0 until permissions.length) {
                    val permission = permissions.item(index) as Element
                    val oldName = permission.getAttribute("android:name")
                    if (oldName.startsWith(".")) continue
                    val newName = if (oldName.startsWith("$original."))
                        replacement + oldName.removePrefix(original)
                    else
                        "${replacement}_$oldName"
                    permission.setAttribute("android:name", newName)

                    for (useIndex in 0 until usesPermissions.length) {
                        val uses = usesPermissions.item(useIndex) as Element
                        if (uses.getAttribute("android:name") == oldName)
                            uses.setAttribute("android:name", newName)
                    }
                }
            }

            if (updateProvidersOption.value == true) {
                val providers = document.getElementsByTagName("provider")
                for (index in 0 until providers.length) {
                    val provider = providers.item(index) as Element
                    val originalAuthorities = provider.getAttribute("android:authorities")
                    require(originalAuthorities.isNotBlank()) {
                        "Clone FairEmail: provider authority missing"
                    }
                    // Preserve upstream Morphe's exact fallback (including a bare
                    // original authority): replacement + '_' + prior authority.
                    val newAuthorities = originalAuthorities.split(';').map { authority ->
                        when {
                            authority.startsWith("$original.") -> replacement + authority.removePrefix(original)
                            authority == original -> "${replacement}_$authority"
                            authority.startsWith("@") -> error(
                                "Clone FairEmail: resource-based provider authority requires review"
                            )
                            else -> "${replacement}_$authority"
                        }
                    }
                    provider.setAttribute("android:authorities", newAuthorities.joinToString(";"))
                }
            }
        }
    }
}
