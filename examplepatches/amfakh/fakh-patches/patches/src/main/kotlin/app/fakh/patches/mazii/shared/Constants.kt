/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.mazii.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MAZII = Compatibility(
        name = "Mazii: Japanese Dictionary",
        packageName = "com.mazii.dictionary",
        signatures = setOf("3859708fe49914e2bcefdb5ef2bf74d427b5b10a040d7eb98ec5433316d75e91"),
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2E7D32,
        targets = listOf(AppTarget(version = "6.8.64", versionCode = 20261120)),
    )
}
