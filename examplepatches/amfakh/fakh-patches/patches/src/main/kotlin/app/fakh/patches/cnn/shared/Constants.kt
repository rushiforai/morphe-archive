/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.cnn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CNN = Compatibility(
        name = "CNN Indonesia",
        packageName = "com.cnn.indonesia",
        signatures = setOf("181d3d5ac0705311e3690f2e807bc909efb131a7a08c68aed0f9196211dd566d"),
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCC0000,
        targets = listOf(
            AppTarget(version = "2.50.7", versionCode = 209),
            AppTarget(version = "2.50.8", versionCode = 224),
        ),
    )
}
