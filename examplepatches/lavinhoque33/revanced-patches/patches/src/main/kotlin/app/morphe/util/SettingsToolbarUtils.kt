/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-29
 */

package app.morphe.util

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.util.Utils.printWarn
import org.w3c.dom.Element

/** Thickens only the extension's toolbar vectors, leaving the app's native toolbars unchanged. */
fun ResourcePatchContext.makeSettingsToolbarIconsBold() {
    arrayOf("revanced_settings_toolbar_arrow_left", "revanced_settings_search_icon").forEach { name ->
        val drawable = "res/drawable/$name.xml"
        if (!get(drawable).exists()) {
            printWarn("Bold settings toolbar: $name not found; keeping the regular icon.")
            return@forEach
        }

        document(drawable).use { document ->
            val paths = document.getElementsByTagName("path")
            for (index in 0 until paths.length) {
                (paths.item(index) as? Element)?.apply {
                    setAttribute("android:strokeColor", getAttribute("android:fillColor"))
                    // These toolbar vectors use a 24-unit viewport, not the preference icons' 960 units.
                    setAttribute("android:strokeWidth", "1")
                    setAttribute("android:strokeLineJoin", "round")
                }
            }
        }
    }
}
