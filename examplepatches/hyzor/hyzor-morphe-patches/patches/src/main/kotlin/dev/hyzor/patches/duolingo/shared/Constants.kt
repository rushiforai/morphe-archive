package dev.hyzor.patches.duolingo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val DUOLINGO = Compatibility(
        name = "Duolingo",
        packageName = "com.duolingo",

        // The tested artifact is the 6.104.3 APKM (base.apk + arm64-v8a + dpi splits).
        // All patched code lives in the base APK.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x58CC02,

        targets = listOf(
            AppTarget(version = "6.104.3", versionCode = 2492),
        ),
    )
}
