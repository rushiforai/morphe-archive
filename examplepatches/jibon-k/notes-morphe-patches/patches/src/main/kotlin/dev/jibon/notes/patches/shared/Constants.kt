package dev.jibon.notes.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_NOTES = Compatibility(
        name = "Samsung Notes",
        packageName = "com.samsung.android.app.notes",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF5A623,
        targets = listOf(
            // The version the patches were made from and tested on.
            AppTarget(version = "4.4.48.15"),
        ),
    )
}
