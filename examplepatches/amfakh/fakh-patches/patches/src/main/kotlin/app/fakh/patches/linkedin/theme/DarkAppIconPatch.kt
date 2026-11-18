/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.fakh.patches.linkedin.theme

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

/**
 * The background of LinkedIn's unused test launcher icon (AATestDefaultActivityAlias), a copy of the stock blue square
 * the white "in" of the foreground layer sits on. It becomes the dark icon, so the stock icon stays as it is.
 */
private const val LAUNCHER_BACKGROUND = "res/drawable/ic_launcher_background_aa_test_icon.xml"

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

/** Paints the test icon's background black. */
private val darkAppIconResourcePatch = patch {
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

/** AppIconUpdateManagerImpl.changeAppIconIfApplicable(Context, String), LinkedIn's seasonal icon switch. */
private object ChangeAppIconFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/appactivations/AppIconUpdateManagerImpl;",
    name = "changeAppIconIfApplicable",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

/**
 * A switch in Fakh Patches turns the black launcher icon on and off, by swapping which launcher entry is enabled.
 * LinkedIn's own seasonal icon swaps are stopped, since they would undo that choice.
 *
 * The themed (monochrome) icon of Android 13 and later is unchanged: both entries use LinkedIn's monochrome layer.
 */
@Suppress("unused")
val darkAppIconPatch = patch(
    name = "Dark app icon",
    description = "Black app icon with the white \"in\". Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Theme")
    dependsOn(settingsPatch, darkAppIconResourcePatch)

    execute {
        markIncluded("isDarkAppIconIncluded")
        ChangeAppIconFingerprint.method.addInstruction(0, "return-void")
    }
}
