/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_DAILY_BOARD = Compatibility(
        name = "Samsung Daily Board",
        packageName = "com.samsung.android.homemode",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1428A0,
        targets = listOf(
            AppTarget(
                version = "15.1.01.3",
                minSdk = 34,
            )
        )
    )
}
