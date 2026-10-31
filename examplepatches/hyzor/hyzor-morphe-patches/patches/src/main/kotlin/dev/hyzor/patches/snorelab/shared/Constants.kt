package dev.hyzor.patches.snorelab.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SNORELAB = Compatibility(
        name = "SnoreLab",
        packageName = "com.snorelab.app",

        // The tested artifact is the base APK of the 2.33.5.7814 XAPK (base + arm64-v8a +
        // en + hdpi splits). The patch only touches code, which lives in the base APK.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1B5A9A,

        targets = listOf(
            // Version the fingerprints below were verified against.
            AppTarget(version = "2.33.5.7814", versionCode = 78140),
        ),
    )
}
