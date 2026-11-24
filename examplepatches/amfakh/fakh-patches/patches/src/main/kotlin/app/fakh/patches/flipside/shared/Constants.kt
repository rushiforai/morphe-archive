/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.flipside.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FLIPSIDE = Compatibility(
        name = "FlipSide",
        packageName = "com.dinoster.flipside",
        signatures = setOf("9b6e8858a075bd5c3176187bfe52c5c3da082b958c39b029d4821cc1eca5f959"),
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "1.6", versionCode = 71), AppTarget(version = "1.7.1", versionCode = 73)),
    )
}
