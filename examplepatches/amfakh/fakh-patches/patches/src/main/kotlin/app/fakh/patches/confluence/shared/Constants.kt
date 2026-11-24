/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.confluence.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CONFLUENCE = Compatibility(
        name = "Confluence",
        packageName = "com.atlassian.android.confluence.core",
        signatures = setOf("f6c89315169de0080ab7ea3615262425609377f7617989e95205f409b30e5944"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1868DB,
        targets = listOf(AppTarget(version = "5.26.1.1", versionCode = 5260101)),
    )

    // The switches of the Fakh Patches page, in the order it lists them.
    val MATERIAL_YOU = Feature("fakh_material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("fakh_pitch_black", "Pitch black", "Appearance")
    val GLASS_NAVBAR = Feature("fakh_glass_navbar", "Liquid Glass navigation bar", "Navigation bar")
    val BACKGROUND_BLUR = Feature(
        "fakh_liquid_glass", "Background blur", "Navigation bar", dependsOn = GLASS_NAVBAR, default = false,
        description = "Blurs what's behind the glass. Uses more battery and might stutter.",
    )
}
