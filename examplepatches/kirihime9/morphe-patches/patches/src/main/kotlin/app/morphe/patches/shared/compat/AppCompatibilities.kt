/*
 * Copyright (C) 2026 kirihime
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object AppCompatibilities {
    val LOCK_MY_PHONE = Compatibility(
        name = "Lock My Phone",
        packageName = "tomka.lockmyphone",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE2D9C3,
        signatures = setOf(
            "d22c22324652e899974ebc7c6bc0d2da70d3482852543d2e5727714d997eb1ed"
        ),
        targets = listOf(AppTarget(version = "2.4.3", versionCode = 118, minSdk = 23)),
    )

}
