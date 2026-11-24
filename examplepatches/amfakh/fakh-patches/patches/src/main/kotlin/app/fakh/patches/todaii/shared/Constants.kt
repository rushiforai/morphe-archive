/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaii.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TODAII = Compatibility(
        name = "Todaii: Learn Japanese N5-N1",
        packageName = "mobi.eup.jpnews",
        signatures = setOf("3859708fe49914e2bcefdb5ef2bf74d427b5b10a040d7eb98ec5433316d75e91"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4B405C,
        targets = listOf(AppTarget(version = "5.6.0", versionCode = 100014433)),
    )
}
