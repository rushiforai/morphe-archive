/*
 * Forked from https://github.com/SysAdminDoc/HushGram at b0a3eca5 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.threads.misc.versioncode

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import org.w3c.dom.Document

/**
 * Raises the version code in [manifest] from [real] to [HIGHEST_VERSION_CODE]. Refused before
 * anything changes when the manifest has no such code, a different one than the patcher read, or
 * a versionCodeMajor, whose high half would put the build past the highest code anyway.
 */
internal fun raiseVersionCode(manifest: Document, real: Int) {
    val root = manifest.documentElement
    if (root == null || root.tagName != "manifest") refuse("AndroidManifest.xml has no manifest element")
    if (root.hasAttribute("android:versionCodeMajor")) refuse("AndroidManifest.xml sets a versionCodeMajor")
    val code = root.getAttribute("android:versionCode")
    if (code.trim().toIntOrNull() != real) refuse("AndroidManifest.xml says its version code is \"$code\", not $real")
    root.setAttribute("android:versionCode", HIGHEST_VERSION_CODE.toString())
}

/**
 * Sends Threads' reads of its own version code through the extension, which answers the code Meta
 * built while the manifest says [HIGHEST_VERSION_CODE]. It runs before the manifest half, so a
 * build whose reads it can't prove keeps Meta's version code: the manifest changes only once its
 * own checks are taken care of.
 *
 * A hooked read borrows no register: the field read becomes a call on the register that held the
 * PackageInfo and a move-result into the register the read wrote, so nothing else in the method
 * sees a change.
 */
private val versionCodeReadsPatch = bytecodePatch {
    dependsOn(settingsPatch, threadsExtensionPatch)

    execute {
        val prepared = prepareVersionCode(packageMetadata.packageName, realVersionCode(packageMetadata.versionCode))
        applyVersionCode(prepared)
        enableStatus("versionCode")
    }
}

/**
 * Raises Threads' version code to the highest Android takes, so Google Play stops offering Meta's
 * updates over the patched build, and any later build that carries it installs over this one, an
 * older Threads included.
 *
 * A resource patch, so Manager decodes the manifest to edit it (see Remove the advertising ID), and
 * the named half, so it runs after the bytecode half it depends on: if that half refuses, this one
 * doesn't run and the manifest keeps Meta's code.
 */
@Suppress("unused")
val changeVersionCodePatch = resourcePatch(
    name = "Change version code",
    description = "Raises the version number as high as Android allows, so Google Play won't offer Meta's updates " +
        "over it. Going back to stock Threads means uninstalling, which deletes its data. It isn't " +
        "selected by default. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Updates")
    dependsOn(settingsPatch, threadsExtensionPatch, versionCodeReadsPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        val real = realVersionCode(packageMetadata.versionCode)
        document("AndroidManifest.xml").use { raiseVersionCode(it, real) }
    }
}
