/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FOMO = Compatibility(
        name = "FOMO Indonesia",
        packageName = "id.anon.android",
        signatures = setOf("5dd4df3b640ebdb164dab5c96ef23d86bb8b4fa4640e952f12c1e18dfc60c5f7"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x8A3BF5,
        targets = listOf(AppTarget(version = "9.0.64", versionCode = 340)),
    )

    // The switches of Fakh Patches, in the order the dialog lists them.
    val HIDE_ADS = Feature("hide_ads", "Hide ads", "Ads")
    val MATERIAL_YOU = Feature("material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("pitch_black", "Pitch black", "Appearance", dependsOn = MATERIAL_YOU)
    val HIDE_POST_DIVIDER = Feature("hide_post_divider", "Hide gaps and dividers", "Appearance")
}
