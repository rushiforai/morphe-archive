/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.gphotos.patches.clone

import app.gphotos.patches.shared.Constants.COMPATIBILITY_GPHOTOS
import app.loki.patches.universal.OriginalApp
import app.loki.patches.universal.menuPatch
import app.loki.patches.universal.recordOriginalAppPatch
import app.loki.patches.universal.renamePackage
import app.loki.patches.universal.replaceStrings
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Google Photos ships with the phone on most devices and cannot be removed, so the patched copy installs beside it. */
private const val SUFFIX = ".loki"

/** Photos' own provider authorities, old name to new, as the manifest step renamed them. */
private val renamedAuthorities = mutableMapOf<String, String>()

private val renameManifest = resourcePatch {
    dependsOn(recordOriginalAppPatch)
    execute {
        renamedAuthorities.clear()
        renamedAuthorities.putAll(renamePackage(SUFFIX))
        if (renamedAuthorities.isEmpty()) return@execute
        val renamedPackage = OriginalApp.packageName + SUFFIX

        // Two providers are not named after the package (Samsung's media-sync status and the Locked Folder API), so
        // the package rename leaves them alone; installed next to the original they would clash with it and Android
        // would refuse the install. Every remaining authority gets the suffix too.
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            for (index in 0 until providers.length) {
                val provider = providers.item(index) as Element
                val authorities = provider.getAttribute("android:authorities")
                if (authorities.isEmpty()) continue
                provider.setAttribute(
                    "android:authorities",
                    authorities.split(";").joinToString(";") { authority ->
                        if (authority.startsWith(renamedPackage)) authority
                        else (authority + SUFFIX).also { renamedAuthorities[authority] = it }
                    },
                )
            }
        }
    }
}

/**
 * Install next to the original, on by default.
 *
 * The package becomes `com.google.android.apps.photos.loki`, so the patched Photos installs as a second app and the
 * preinstalled one stays untouched. Photos also names its own content providers in its code (for sharing, file
 * access and its widgets); those names are rewritten the same way, so the copy talks to its own providers and not
 * to the original app's. Google sign-in still presents the original package to Google through GmsCore.
 */
@Suppress("unused")
val installAlongsidePatch = bytecodePatch(
    name = "Install next to the original (Google Photos)",
    description = "Installs the patched Google Photos as a separate app (package name + \".loki\"), so the Photos " +
        "that came with the phone does not have to be removed. Needs \"GmsCore support (Google Photos)\" to sign " +
        "in. Turn backup off in the original Photos so the two do not both upload.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GPHOTOS)
    dependsOn(menuPatch, renameManifest)

    execute {
        if (renamedAuthorities.isEmpty()) return@execute
        replaceStrings { string ->
            renamedAuthorities[string]
                ?: renamedAuthorities.entries.firstOrNull { (old, _) ->
                    string == "content://$old" || string.startsWith("content://$old/")
                }?.let { (old, new) -> "content://$new" + string.removePrefix("content://$old") }
        }
    }
}
