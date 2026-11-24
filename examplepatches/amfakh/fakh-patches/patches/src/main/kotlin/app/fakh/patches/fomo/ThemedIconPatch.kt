/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch

/**
 * The adaptive icon the app is missing: its own foreground on white, plus the layer Android 13 tints. The logo fills
 * 68% of the canvas, more than the 66% the launcher mask keeps, so the foreground is inset 10% to clear the edge and
 * the monochrome layer 20%, since a tinted glyph reads larger than a colored logo and other themed icons stay near 55%
 * of the tile.
 */
private const val ADAPTIVE_ICON = """<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@android:color/white" />
    <foreground>
        <inset android:drawable="@mipmap/ic_launcher_foreground" android:inset="10%" />
    </foreground>
    <monochrome>
        <inset android:drawable="@drawable/ic_launcher_monochrome" android:inset="20%" />
    </monochrome>
</adaptive-icon>
"""

/**
 * FOMO ships a plain bitmap launcher icon (`mipmap/ic_launcher`) next to an unused `ic_launcher_foreground`, so
 * Android 13+ has no monochrome layer to tint with the wallpaper colors. An adaptive icon in `mipmap-anydpi-v26`
 * wins over the bitmap on Android 8+ without touching the manifest. Its monochrome layer is the foreground's logo
 * (bundled in resources/fomo) with the white check cut out.
 */
@Suppress("unused")
val fomoThemedIconPatch = resourcePatch(
    name = "Themed icon",
    description = "Adds the themed app icon of Android 13 and later, which follows the wallpaper colors.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FOMO)
    category("Theme")

    execute {
        val monochrome = object {}.javaClass.getResourceAsStream("/fomo/ic_launcher_monochrome.png")?.use { it.readBytes() }
            ?: throw PatchException("FOMO: monochrome icon not bundled.")

        resourceFile("res/drawable-nodpi/ic_launcher_monochrome.png").apply {
            parentFile.mkdirs()
            writeBytes(monochrome)
        }
        resourceFile("res/mipmap-anydpi-v26/ic_launcher.xml").apply {
            parentFile.mkdirs()
            writeText(ADAPTIVE_ICON)
        }
    }
}
