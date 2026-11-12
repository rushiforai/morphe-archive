/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.badfella.patches.linkedin.theme

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** LinkedIn's launcher icon background: the blue square the white "in" of the foreground layer sits on. */
private const val LAUNCHER_BACKGROUND = "res/drawable/ic_launcher_background.xml"

/** LinkedIn blue (0A66C2) as the last six digits of whatever form the vector writes it in, and the black it becomes. */
private const val LINKEDIN_BLUE_RGB = "0a66c2"
private const val BLACK = "#ff000000"

/** The path attribute that paints the square, named with or without the android namespace prefix. */
private fun Element.fillColorName(): String? {
    val attributes = attributes
    for (i in 0 until attributes.length) {
        val attribute = attributes.item(i)
        if (attribute.nodeName.endsWith("fillColor")) return attribute.nodeName
    }
    return null
}

/**
 * The launcher icon of the patched app, black instead of LinkedIn blue, keeping the white "in".
 * <p>
 * A launcher icon is drawn by the launcher, from resources fixed when the app is patched, so it cannot follow
 * dark mode by itself: this is chosen once, and it shows in light mode as well. The themed (monochrome) icon that
 * Android 13 and later draw from the wallpaper needs nothing from here, because LinkedIn already ships its
 * monochrome layer.
 */
@Suppress("unused")
val darkAppIconPatch = resourcePatch(
    name = "Dark app icon",
    description = "Black launcher icon with the white \"in\", instead of LinkedIn's blue. Chosen when patching: " +
        "a launcher icon cannot switch with dark mode on its own.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Theme")

    execute {
        var painted = 0
        val found = mutableListOf<String>()
        document(LAUNCHER_BACKGROUND).use { document ->
            val paths = document.getElementsByTagName("path")
            for (i in 0 until paths.length) {
                val path = paths.item(i) as Element
                val attribute = path.fillColorName() ?: continue
                val value = path.getAttribute(attribute)
                found += value
                if (!value.lowercase().removePrefix("#").endsWith(LINKEDIN_BLUE_RGB)) continue
                path.setAttribute(attribute, BLACK)
                painted++
            }
        }
        if (painted == 0) throw PatchException("Launcher icon background color not found among $found")
    }
}
