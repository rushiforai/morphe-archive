/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4178
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-12
 */

package app.morphe.patches.shared.misc.announcements

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal const val PATCHES_UPDATE_NOTICE_EXTENSION_CLASS =
    "Lapp/morphe/extension/shared/patches/PatchesUpdateNoticePatch;"

internal val patchesUpdateNoticeResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val queries = manifest.getElementsByTagName("queries").item(0)
                ?: manifest.createElement("queries").also { root.appendChild(it) }

            // Android 11+ package visibility, including Manager's debug build.
            for (packageName in listOf("app.morphe.manager", "app.morphe.manager.debug")) {
                val packages = manifest.getElementsByTagName("package")
                val exists = (0 until packages.length).any {
                    (packages.item(it) as Element).getAttribute("android:name") == packageName
                }
                if (!exists) {
                    queries.appendChild(manifest.createElement("package").apply {
                        setAttribute("android:name", packageName)
                    })
                }
            }
        }
    }
}
