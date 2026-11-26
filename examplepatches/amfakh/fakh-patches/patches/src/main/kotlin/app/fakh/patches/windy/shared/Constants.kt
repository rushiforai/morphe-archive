/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.windy.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WINDY = Compatibility(
        name = "Windy",
        packageName = "com.windyty.android",
        signatures = setOf("487e861a84064f74742069e3062759f273f3909ed7ff242d37e8206aa3082663"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0FA0EB,
        targets = listOf(AppTarget(version = "51.3.2", versionCode = 5103023), AppTarget(version = "51.4.4", versionCode = 5104042)),
    )
}
