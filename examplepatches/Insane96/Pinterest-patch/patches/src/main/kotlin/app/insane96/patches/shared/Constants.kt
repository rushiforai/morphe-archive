package app.insane96.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Fingerprints in this project were built against this exact APK.
    // Source: apkmirror.com, com.pinterest_14.35.0-14358020, minSdk 29,
    // arm64-v8a/armeabi-v7a/x86/x86_64, nodpi.
    val COMPATIBILITY_PINTEREST = Compatibility(
        name = "Pinterest",
        packageName = "com.pinterest",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE60023,
        targets = listOf(
            AppTarget(
                version = "14.35.0"
            )
        )
    )
}
