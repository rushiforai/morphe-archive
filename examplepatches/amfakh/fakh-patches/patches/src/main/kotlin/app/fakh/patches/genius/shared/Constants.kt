/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.genius.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GENIUS = Compatibility(
        name = "Genius",
        packageName = "com.genius.android",
        signatures = setOf("8cde06147a5084f1aec989298e788574d6a341bb46ad108c0ed5167291045c55"),
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFF64,
        targets = listOf(AppTarget(version = "8.2.3.5414", versionCode = 80230)),
    )
}
