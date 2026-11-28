/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.kompas.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KOMPAS = Compatibility(
        name = "KOMPAS.com",
        packageName = "com.ertanto.kompas.official",
        signatures = setOf("69ac94db6e70ceeb6011bbfaeaf6f94fcb1891620a0d33fc1340f87dbccba5d5"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x0067B1,
        targets = listOf(AppTarget(version = "9.8.7", versionCode = 9008007), AppTarget(version = "9.8.9", versionCode = 9008009)),
    )
}
