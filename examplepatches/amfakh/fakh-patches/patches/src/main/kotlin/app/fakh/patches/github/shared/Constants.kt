/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GITHUB = Compatibility(
        name = "GitHub",
        packageName = "com.github.android",
        signatures = setOf("df08c9f2d809189d9d506497c15745a7395a41536efb433e3aee1aedbe11b261"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1F23,
        targets = listOf(AppTarget(version = "1.282.0", versionCode = 953), AppTarget(version = "1.283.0", versionCode = 954), AppTarget(version = "1.284.0", versionCode = 955), AppTarget(version = "1.285.0", versionCode = 956)),
    )

    // The switches of the Fakh Patches section of Settings. The section shows them in the order the patches add their
    // rows; the shown tabs are a list setting, saved per tab outside these.
    val MATERIAL_YOU = Feature("fakh_material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("fakh_amoled", "Pitch black", "Appearance", restart = false, default = false)
    val HIDE_TAB_LABELS = Feature("fakh_hide_nav_labels", "Hide tab labels", "Navigation bar", default = false)
    val GLASS_NAVBAR = Feature("fakh_glass_navbar", "Liquid Glass navigation bar", "Navigation bar")
    val BACKGROUND_BLUR = Feature(
        "fakh_liquid_glass", "Background blur", "Navigation bar", dependsOn = GLASS_NAVBAR, default = false,
        description = "Blurs what's behind the glass. Uses more battery and might stutter.",
    )
    val NAV_RIGHT = Feature("fakh_nav_right", "Landscape navigation bar position", "Navigation bar", default = false)
    val SMALLER_NAVBAR = Feature("fakh_smaller_navbar", "Smaller navigation bar", "Navigation bar")
}
