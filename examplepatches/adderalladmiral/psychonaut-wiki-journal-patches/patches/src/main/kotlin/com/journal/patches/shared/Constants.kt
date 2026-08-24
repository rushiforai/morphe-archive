package com.journal.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_JOURNAL = Compatibility(
        name = "Journal",
        packageName = "com.isaakhanimann.journal",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6B6BBD,
        // version = null targets the latest known build and every future one,
        // since the patch below anchors on RevenueCat API shapes, not on
        // obfuscated class/method names that shift between releases.
        targets = listOf(
            AppTarget(version = null),
        ),
    )
}
