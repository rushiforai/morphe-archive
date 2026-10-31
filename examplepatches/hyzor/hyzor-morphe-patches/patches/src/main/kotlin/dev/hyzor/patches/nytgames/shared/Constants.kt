package dev.hyzor.patches.nytgames.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val NYT_GAMES = Compatibility(
        name = "NYT Games",
        packageName = "com.nytimes.crossword",

        // The tested artifact is the 6.48.0 APKM (base.apk + arm64-v8a + language/dpi splits).
        // The patch only touches code, which lives in the base APK.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3C9C3C,

        targets = listOf(
            // Version the fingerprint below was verified against.
            AppTarget(version = "6.48.0", versionCode = 6428192),
        ),
    )
}
