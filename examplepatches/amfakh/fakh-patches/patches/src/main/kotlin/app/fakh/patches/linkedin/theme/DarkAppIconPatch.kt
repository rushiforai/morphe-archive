/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.theme

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.DARK_APP_ICON
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

/** The end of LinkedIn blue (#0A66C2), however the vector writes the alpha in front of it. */
private const val BLUE = "0a66c2"

/**
 * LinkedIn ships a second launcher entry, AATestDefaultActivityAlias, that nothing uses. Its background is a copy of
 * the stock blue square, so painting that square black gives the dark icon without touching the stock one.
 */
private val blackIconBackground = patch {
    execute {
        val fills = mutableListOf<String>()
        document("res/drawable/ic_launcher_background_aa_test_icon.xml").use { xml ->
            val paths = xml.getElementsByTagName("path")
            for (index in 0 until paths.length) {
                val attributes = (paths.item(index) as Element).attributes
                val fill = (0 until attributes.length).map(attributes::item).firstOrNull { it.nodeName.endsWith("fillColor") }
                    ?: continue
                fills += fill.nodeValue
                if (fill.nodeValue.lowercase().endsWith(BLUE)) fill.nodeValue = "#ff000000"
            }
        }
        if (fills.none { it.lowercase().endsWith(BLUE) }) throw PatchException("Launcher icon background color not found among $fills")
    }
}

/** LinkedIn's seasonal icon switch, which would undo the user's choice of icon. */
private object SeasonalIconFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/appactivations/AppIconUpdateManagerImpl;",
    name = "changeAppIconIfApplicable",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

/**
 * Adds a switch in Fakh Patches that swaps which launcher entry is enabled, the stock blue icon or the black one, and
 * stops LinkedIn's own seasonal icon changes. The themed (monochrome) icon of Android 13 and later is the same in both,
 * since both entries use LinkedIn's monochrome layer.
 */
@Suppress("unused")
val darkAppIconPatch = patch(
    name = "Dark app icon",
    description = "Black app icon with the white \"in\". Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Theme")
    dependsOn(settingsPatch, blackIconBackground)

    execute {
        register(DARK_APP_ICON)
        SeasonalIconFingerprint.method.addInstruction(0, "return-void")
    }
}
