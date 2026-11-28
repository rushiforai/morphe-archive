/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.detik.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DETIK = Compatibility(
        name = "detikcom",
        packageName = "org.detikcom.rss",
        signatures = setOf("49d342821df6ca0c3b7119214b28bf866f2ac79870f63f8c300d187d22e9e3a1"),
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A4D9C,
        targets = listOf(AppTarget(version = "7.15.0", versionCode = 466), AppTarget(version = "7.15.1", versionCode = 472)),
    )
}
