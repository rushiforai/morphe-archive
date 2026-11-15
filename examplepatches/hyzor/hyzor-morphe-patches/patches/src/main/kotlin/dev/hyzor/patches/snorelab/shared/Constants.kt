package dev.hyzor.patches.snorelab.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SNORELAB = Compatibility(
        name = "SnoreLab",
        packageName = "com.snorelab.app",

        // The tested artifact is the base APK (`com.snorelab.app.apk`) of the 2.33.7.7953
        // XAPK, which also carries ABI, locale and density splits. The patch only touches
        // code, which lives in the base APK.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1B5A9A,

        targets = listOf(
            // Version the fingerprints below were verified against.
            AppTarget(version = "2.33.7.7953", versionCode = 79530),
        ),
    )
}
