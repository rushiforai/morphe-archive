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
 *
 * ---------------------------------------------------------------------------
 * Adapted for this repository (same GPL-3.0 licence) from the official patch at
 * https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt
 * Dropped from the original because nothing here applies to YouTube VR: its bytecode fix for the
 * Reddit app, its per-app option overrides for the phone YouTube/Music apps, and its list of
 * incompatible apps. Credited in ACKNOWLEDGEMENTS.md.
 * ---------------------------------------------------------------------------
 */

package app.ytvr.patches.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR
import app.ytvr.patches.storedChoice
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.util.logging.Logger

/** The package this project's builds install under, and this option's default. */
private const val CLONE_PACKAGE_NAME = "app.morphe.android.youtube"

/** The store app's id. Selecting it means "replace the store app", not "clone it". */
private const val OFFICIAL_PACKAGE_NAME = "com.google.android.apps.youtube.vr.oculus"

/** The package-id shape the official patch accepts for a custom id: dotted, lower-case segments. */
private val PACKAGE_NAME_PATTERN = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")

/**
 * The two presets, display name to package name, in the patcher 2.x `values` orientation
 * (`storedChoice` explains the 1.x orientation this replaces, issue #45). A package name typed
 * by hand matches neither entry and is validated against [PACKAGE_NAME_PATTERN] instead.
 */
internal val clonePackageChoices: Map<String, String> = linkedMapOf(
    "Clone — separate app next to the store app (recommended)" to CLONE_PACKAGE_NAME,
    "Replace the official app — removes the store copy; " +
        "Meta then treats this build as YouTube VR" to OFFICIAL_PACKAGE_NAME,
)

/**
 * Installs the patched app as a clone, chosen at patch time, by default.
 *
 * This is the official "Clone app" patch's job, and the official patch still does it -- but it is
 * *universal*, and the patcher refuses a universal patch declared default-on ("Universal patches
 * must be declared with default false"). A universal patch is therefore never part of a default
 * run, which is why Morphe Manager's Simple mode could not install a clone for this app at all:
 * Simple mode applies only default-selected patches, and the official bundle contributes none of
 * those for YouTube VR. This patch declares `compatibleWith(COMPATIBILITY_YOUTUBE_VR)`, so
 * `default = true` is legal, it is part of the default set, and the clone step needs no Expert mode.
 *
 * Manager recognises a package renamer by exactly one thing -- an option keyed `packageName`
 * (`PatchRunTargeting.PACKAGE_NAME_OPTION_KEY`). That key is what earns the patch its "Clone" badge
 * and the post-patch "will install as `<pkg>`" warning, so it is load-bearing and must not change.
 *
 * The rewrite itself is the official patch's, ported: the manifest `package` attribute, the custom
 * permissions the app declares, and its providers' authorities. The last two genuinely matter for
 * this app rather than being a precaution -- the stock manifest declares
 * `com.google.android.apps.youtube.vr.oculus.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` and providers
 * at `...oculus.tracing`, `...oculus.mlkitinitprovider` and `...oculus.firebaseinitprovider`, plus a
 * `@string/authorities` value. A permission or an authority that still names the store app is a
 * conflict with the store app, which is precisely what a clone is supposed to avoid.
 */
@Suppress("unused")
val installAsClonePatch = resourcePatch(
    name = "Install as clone",
    description = "Installs the patched app as a separate app by default, so it sits alongside the " +
        "store's YouTube VR instead of replacing it. Replace mode keeps the official package name: " +
        "the store copy has to be removed to satisfy the signing difference, Horizon OS then treats " +
        "this build as the YouTube VR app (a restore prompt, and a warning on every reboot), and a " +
        "store update will collide with it because this build is signed differently.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    val packageName by stringOption(
        key = "packageName",
        default = CLONE_PACKAGE_NAME,
        values = clonePackageChoices,
        title = "Package name",
        description = "Clone installs a second app under its own package name and leaves the store " +
            "app untouched (recommended). Replace keeps com.google.android.apps.youtube.vr.oculus: " +
            "the store app must be uninstalled first, Meta then warns on every reboot, and the next " +
            "store update fails on the signature mismatch.",
        required = true,
    ) {
        it != null && (storedChoice(clonePackageChoices, it) != null || it.matches(PACKAGE_NAME_PATTERN))
    }

    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Update custom permissions declared by the app. " +
            "Fixes installation conflicts, but can break features in certain apps.",
    )

    val updateProviders by booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Update provider names declared by the app. " +
            "Fixes installation conflicts, but can break features in certain apps.",
    )

    finalize {
        // Both names are certain here -- `compatibleWith` pins the app's own, and the option is
        // required with a default -- so the null check is only the type system's price for that.
        val originalPackageName = requireNotNull(packageMetadata.packageName)
        val storedPackageName = requireNotNull(packageName) { "the packageName option is required" }
        // A preset picked in a 2.x host arrives as the package name already; a display name left
        // in storage by a host that rendered the 1.x map (issue #45) resolves here. A custom typed
        // id matches neither and passes through, as the validator let it.
        val newPackageName = storedChoice(clonePackageChoices, storedPackageName) ?: storedPackageName

        // Replace mode asks for the package name the app already has. Nothing below may run then:
        // a permission "renamed" to itself or an authority prefixed with its own package name is a
        // corrupted manifest, and the patcher's own package post-processing has nothing to do
        // anyway. Say what the user has chosen instead of doing it silently.
        if (newPackageName == originalPackageName) {
            Logger.getLogger(this::class.java.name).severe(
                "Package name left at '$originalPackageName': this build replaces the store app. " +
                    "The store copy has to be uninstalled first (the signatures differ), Horizon OS " +
                    "then treats this build as YouTube VR, and the next store update will fail.",
            )
            return@finalize
        }

        // `use` hands back the lambda's value, so the authority resources the provider pass finds
        // come out of the manifest edit and into the strings edit below, as in the original.
        val authorityStringResources = document("AndroidManifest.xml").use { manifest ->
            manifest.documentElement.setAttribute("package", newPackageName)

            if (updatePermissions == true) {
                renameDeclaredPermissions(manifest, originalPackageName, newPackageName)
            }

            if (updateProviders == true) {
                rewriteProviderAuthorities(manifest, originalPackageName, newPackageName)
            } else {
                emptySet()
            }
        }

        if (authorityStringResources.isNotEmpty()) {
            document("res/values/strings.xml").use { strings ->
                strings.documentElement.childNodes.elements().forEach { node ->
                    if (node.getAttribute("name") !in authorityStringResources) return@forEach

                    val authority = node.textContent
                    node.textContent = if (authority.startsWith("$originalPackageName.")) {
                        authority.replaceFirst(originalPackageName, newPackageName)
                    } else {
                        "${newPackageName}_$authority"
                    }
                }
            }
        }
    }
}

/**
 * Renames the custom permissions the app declares, and the `<uses-permission>` requests that point
 * at them, from [oldPackageName] to [newPackageName].
 *
 * A custom permission is part of the app's identity: declaration and request are matched by name at
 * install time, so a clone that keeps the store app's permission name conflicts with it in the same
 * way as keeping its package name would. Only names that carry the package are rewritten --
 * `android.permission.*` and `.relative` names are left alone, as the official patch leaves them.
 */
private fun renameDeclaredPermissions(
    manifest: Document,
    oldPackageName: String,
    newPackageName: String,
) {
    val usesPermissions = manifest.getElementsByTagName("uses-permission")

    manifest.getElementsByTagName("permission").elements().forEach { permission ->
        val oldName = permission.getAttribute("android:name")
        val newName = when {
            oldName.startsWith('.') -> return@forEach

            oldName.startsWith("$oldPackageName.") ->
                oldName.replaceFirst(oldPackageName, newPackageName)

            else -> "${newPackageName}_$oldName"
        }
        permission.setAttribute("android:name", newName)

        // The declaration and the request for it have to move together: a permission that is
        // requested but no longer declared is a broken install.
        val request = usesPermissions.elements().firstOrNull { it.getAttribute("android:name") == oldName }
        request?.setAttribute("android:name", newName)
    }
}

/**
 * Rewrites every provider authority that names [oldPackageName], and returns the names of the
 * `@string/...` resources those authorities point at -- `res/values/strings.xml` has to follow, in
 * a document of its own.
 *
 * An authority is a process-wide name, so two apps under different package names still collide on
 * `...oculus.tracing`, `...oculus.mlkitinitprovider` and `...oculus.firebaseinitprovider`. Names
 * that are already package-scoped are re-scoped; the `@string/authorities` indirection this app
 * uses for its file provider resolves to a name that is *not* package-scoped, so it is prefixed to
 * keep it unique, exactly as the official patch does.
 */
private fun rewriteProviderAuthorities(
    manifest: Document,
    oldPackageName: String,
    newPackageName: String,
): Set<String> {
    val stringResources = mutableSetOf<String>()

    manifest.getElementsByTagName("provider").elements().forEach { provider ->
        val authorities = provider.getAttribute("android:authorities").split(';')
        val newAuthorities = authorities.map { authority ->
            when {
                authority.startsWith("$oldPackageName.") ->
                    authority.replaceFirst(oldPackageName, newPackageName)

                authority.startsWith('@') -> {
                    stringResources.add(authority.removePrefix("@string/"))
                    authority
                }

                else -> "${newPackageName}_$authority"
            }
        }
        provider.setAttribute("android:authorities", newAuthorities.joinToString(";"))
    }

    return stringResources
}

/** DOM nodes as a sequence: `NodeList` is not `Iterable` and is index-based. */
private fun NodeList.elements(): Sequence<Element> = (0 until length).asSequence().mapNotNull { item(it) as? Element }
