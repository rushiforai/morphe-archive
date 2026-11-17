package app.instaprime.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_INSTAPRIME = Compatibility(
        name = "InstaPrime",
        packageName = "com.instaprime.android",
        // InstaPrime is distributed as a single arm64-v8a APK.
        apkFileType = ApkFileType.APK_REQUIRED,
        // Background color of the app icon.
        appIconColor = 0xE1306C,
        targets = listOf(
            // Version the patches were developed and verified with
            // (InstaPrime V7.2 64bit Clone).
            AppTarget(
                version = "435.0.0.37.76"
            ),
            // Future builds are expected to work until the native library changes.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
