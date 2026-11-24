/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.jira.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_JIRA = Compatibility(
        name = "Jira",
        packageName = "com.atlassian.android.jira.core",
        signatures = setOf("0d9ab6d69e7e34705b4a1d69474a70e694b5a273b1ef9a9a691768d183c00a04", "f6c89315169de0080ab7ea3615262425609377f7617989e95205f409b30e5944"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1868DB,
        targets = listOf(AppTarget(version = "2026.22.0", versionCode = 202616079), AppTarget(version = "2026.22.1", versionCode = 202616088)),
    )

    // The switches of the Fakh Patches page, in the order it lists them. The page shows the tabs section as one row
    // that opens a picker sheet.
    val MATERIAL_YOU = Feature("fakh_material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("fakh_pitch_black", "Pitch black", "Appearance", default = false)
    val GLASS_NAVBAR = Feature("fakh_glass_navbar", "Liquid Glass navigation bar", "Navigation bar")
    val BACKGROUND_BLUR = Feature(
        "fakh_liquid_glass", "Background blur", "Navigation bar", dependsOn = GLASS_NAVBAR, default = false,
        description = "Blurs what's behind the glass. Uses more battery and might stutter.",
    )
    val HIDE_TAB_LABELS = Feature("fakh_hide_tab_labels", "Hide tab labels", "Navigation bar", default = false)
    val TABS = listOf("Spaces", "All work", "Dashboards", "Notifications").map { Feature("fakh_tab_$it", it, "Navigation bar tabs") }
    val HIDE_ROVO = Feature("fakh_hide_rovo", "Hide Rovo", "Other")
}
