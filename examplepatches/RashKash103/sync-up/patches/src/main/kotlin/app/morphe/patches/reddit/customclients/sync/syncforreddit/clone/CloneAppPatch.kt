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
 * Modified for this project: narrowed to the one app this bundle targets, so the per-app
 * special cases and the list of apps cloning is known to break are gone; the addresses the
 * app's own code names its content providers by are rewritten to match the renamed ones, which
 * is what lets a clone of this app actually work; and the clone can be given a name of its own.
 */

package app.morphe.patches.reddit.customclients.sync.syncforreddit.clone

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/** What the package name option holds while nothing has been chosen. */
private const val DEFAULT = "Default"

/** What is appended to the package name where nothing else was asked for. */
private const val DEFAULT_SUFFIX = ".morphe"

private lateinit var packageNameOption: Option<String>
private lateinit var updateProvidersOption: Option<Boolean>
private lateinit var appNameOption: Option<String>

private fun replacementPackageName(originalPackageName: String): String {
    val chosen = packageNameOption.value
    return if (chosen != null && chosen != DEFAULT) {
        chosen
    } else {
        originalPackageName + DEFAULT_SUFFIX
    }
}

/**
 * Points the app's own code at the content provider addresses a cloned copy really declares.
 *
 * <p>Renaming the providers is not optional for a clone that is to be installed beside the copy
 * it was cloned from: two installed apps may not declare the same authority, and the second
 * install is refused outright where they do. But this app does not ask Android what its own
 * providers are called. It writes the addresses down as whole strings — every
 * `content://<package>.provider.RedditProvider/...` it reads or writes a post through, and the
 * file provider it hands a shared picture to, seventy-odd of them — so renaming the providers in
 * the manifest and leaving the code alone points the whole app at something that is not
 * installed. Measured on a device, the feed then comes up empty with
 * `Failed to find provider info` and `IllegalArgumentException: Unknown URI` behind it, and
 * nothing the app does with a post works.
 *
 * <p>So the strings are rewritten the same way the manifest is. The two halves are kept in step
 * by both working the new name out from the same option rather than by one reading the other,
 * which also means it does not matter that the manifest is written at the very end.
 */
private val cloneProviderAddressesPatch = bytecodePatch(
    description = "Rewrites the content provider addresses in the app's own code to match the " +
            "package a cloned copy is installed under.",
) {
    execute {
        if (updateProvidersOption.value != true) {
            // The providers keep the names they had, so the code is already right about them.
            return@execute
        }

        val originalPackageName = packageMetadata.packageName
        val newPackageName = replacementPackageName(originalPackageName)
        if (newPackageName == originalPackageName) {
            return@execute
        }

        // Every authority the app's code names begins with this: the Reddit provider's, which is
        // `<package>.provider.RedditProvider`, and the file provider's, which is
        // `<package>.provider`.
        val prefix = "$originalPackageName.provider"
        var rewritten = 0

        classDefByStrings(prefix, StringComparisonType.CONTAINS)
            .map { mutableClassDefBy(it) }
            .forEach { mutableClass ->
                mutableClass.methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList()
                        ?: return@forEach

                    // Gathered before anything is written, rather than written while the list
                    // they came from is being read. Putting one instruction in the place of
                    // another leaves every later index where it was.
                    instructions.withIndex().mapNotNull { (index, instruction) ->
                        if (instruction.opcode != Opcode.CONST_STRING &&
                            instruction.opcode != Opcode.CONST_STRING_JUMBO
                        ) {
                            return@mapNotNull null
                        }

                        val value = ((instruction as ReferenceInstruction).reference
                                as StringReference).string
                        if (!value.contains(prefix)) {
                            return@mapNotNull null
                        }

                        Triple(index, (instruction as OneRegisterInstruction).registerA, value)
                    }.forEach { (index, register, value) ->
                        method.replaceInstruction(
                            index,
                            "const-string v$register, " +
                                    "\"${value.replace(originalPackageName, newPackageName)}\"",
                        )
                        rewritten++
                    }
                }
            }

        if (rewritten == 0) {
            throw PatchException(
                "Found no provider address in the app's own code to rewrite. Cloning with the " +
                        "providers renamed would leave the app unable to read or write " +
                        "anything, so nothing was changed",
            )
        }
    }
}

@Suppress("unused")
val cloneAppPatch = resourcePatch(
    name = "Clone Sync app",
    description = "Changes the app package name so that the app can be installed more than " +
            "once, with \".morphe\" appended to it unless another name is given. Each cloned " +
            "install needs a package name of its own. Use this rather than the universal " +
            "\"Clone app\" patch, which leaves the app unable to read or write anything once " +
            "its providers are renamed, and select only one of the two.",
    default = false,
) {
    category("8. Advanced")

    compatibleWith(*SyncForRedditCompatible)

    dependsOn(cloneProviderAddressesPatch)

    packageNameOption = stringOption(
        "packageName",
        DEFAULT,
        mapOf(DEFAULT to DEFAULT),
        "Package name",
        "Package name to use for the cloned app.",
        true,
        validator = { value ->
            value == DEFAULT || value != null && value.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
        },
    )

    val updatePermissionsOption = booleanOption(
        "updatePermissions",
        true,
        null,
        "Update permissions",
        "Update custom permissions declared by the app. Fixes installation conflicts, but can " +
                "break features in certain apps.",
    )

    updateProvidersOption = booleanOption(
        "updateProviders",
        true,
        null,
        "Update providers",
        "Update provider names declared by the app. Needed to install a clone beside the copy " +
                "it was cloned from, since two installed apps may not declare the same " +
                "provider. The addresses in the app's own code are rewritten to match.",
    )

    appNameOption = stringOption(
        "appName",
        null,
        null,
        "App name",
        "What the cloned app is called on the home screen, so that it can be told apart from " +
                "the copy it was cloned from. Left empty, it keeps the name it had.",
        false,
    )

    // Written at the end, after every other patch has had the manifest it was expecting.
    finalize {
        val packageName = packageMetadata.packageName
        val newPackageName = replacementPackageName(packageName)

        document("AndroidManifest.xml").use { document ->
            // Cloning twice is what happens when this and another bundle's clone patch are both
            // selected, and the second one renames what the first already renamed: the suffix
            // lands on the package name twice and the authorities come out doubled with it. It
            // cannot be stopped from here where the other one runs second, but it is worth
            // saying rather than shipping an app whose name reads .morphe.morphe.
            val written = document.documentElement.getAttribute("package")
            if (written.isNotEmpty() && written != packageName) {
                throw PatchException(
                    "The package name has already been changed to $written, so something else " +
                            "has cloned this app as well. Select one clone patch, not two",
                )
            }

            document.documentElement.setAttribute("package", newPackageName)

            appNameOption.value?.takeIf { it.isNotBlank() }?.let { name ->
                // Written as a literal rather than through the string resource, so that the name
                // holds in every language the app is translated into rather than only in English.
                (document.getElementsByTagName("application").item(0) as Element)
                    .setAttribute("android:label", name)
            }

            if (updatePermissionsOption.value == true) {
                val usesPermissions = document.getElementsByTagName("uses-permission")
                    .let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

                document.getElementsByTagName("permission")
                    .let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }
                    .forEach { permission ->
                        val oldName = permission.getAttribute("android:name")
                        val newName = when {
                            oldName.isEmpty() || oldName.startsWith('.') -> return@forEach
                            oldName.startsWith("$packageName.") ->
                                oldName.replaceFirst(packageName, newPackageName)
                            else -> "${newPackageName}_$oldName"
                        }
                        permission.setAttribute("android:name", newName)

                        // The app asks for its own permission as well, and the two have to go on
                        // naming the same thing.
                        usesPermissions
                            .firstOrNull { it.getAttribute("android:name") == oldName }
                            ?.setAttribute("android:name", newName)
                    }
            }

            if (updateProvidersOption.value == true) {
                document.getElementsByTagName("provider")
                    .let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }
                    .forEach { provider ->
                        val authorities = provider.getAttribute("android:authorities")
                        if (authorities.isEmpty()) {
                            return@forEach
                        }

                        provider.setAttribute(
                            "android:authorities",
                            authorities.split(';').joinToString(";") { authority ->
                                when {
                                    authority.startsWith("$packageName.") ->
                                        authority.replaceFirst(packageName, newPackageName)
                                    // This app names every one of its authorities outright. One
                                    // held in a string resource would have to be rewritten
                                    // there instead, and quietly leaving it alone is what would
                                    // break the clone, so it is said rather than guessed at.
                                    authority.startsWith('@') -> throw PatchException(
                                        "The provider authority $authority is held in a " +
                                                "resource rather than written in the manifest, " +
                                                "which this does not know how to rename",
                                    )
                                    else -> "${newPackageName}_$authority"
                                }
                            },
                        )
                    }
            }
        }
    }
}
