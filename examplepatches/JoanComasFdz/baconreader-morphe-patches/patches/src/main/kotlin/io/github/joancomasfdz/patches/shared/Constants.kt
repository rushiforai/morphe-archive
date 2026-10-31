// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    private val BACONREADER_TARGETS = listOf(
        // Version the patches were developed and tested against.
        AppTarget(
            version = "6.1.4"
        )
    )

    val COMPATIBILITY_BACONREADER = Compatibility(
        name = "BaconReader", // App name as it appears in the Android launcher.
        packageName = "com.onelouder.baconreader",
        // Must match the file type on APKMirror/UpToDown, or Morphe Manager will not link to it.
        apkFileType = ApkFileType.APK,
        // Icon color in Morphe Manager.
        appIconColor = 0xF26522,
        targets = BACONREADER_TARGETS
    )

    val COMPATIBILITY_BACONREADER_PREMIUM = Compatibility(
        name = "BaconReader Premium",
        packageName = "com.onelouder.baconreader.premium",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF26522,
        targets = BACONREADER_TARGETS
    )
}
