package app.lockhart.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HEADS_UP = Compatibility(
        name = "Heads Up!",
        packageName = "com.wb.headsup",
        apkFileType = ApkFileType.APKS,
        // Bright blue of the app icon background.
        appIconColor = 0x1CB0F6,
        targets = listOf(
            // Native ownership patch verified against this build (arm64-v8a split).
            AppTarget(
                version = "4.15.11",
                minSdk = 26,
            ),
        ),
    )
}
