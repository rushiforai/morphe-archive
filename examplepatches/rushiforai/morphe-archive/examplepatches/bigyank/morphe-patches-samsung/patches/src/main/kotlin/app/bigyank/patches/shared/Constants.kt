package app.bigyank.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SHEALTH = Compatibility(
        name = "Samsung Health",
        packageName = "com.sec.android.app.shealth",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1DC9A0,
        targets = listOf(
            // Major redesign (APKMirror, Jun 2026)
            AppTarget(version = "7.00.0.107"),
            // Previous 6.3x stable
            AppTarget(version = "6.32.0.001"),
            AppTarget(version = "6.31.3.013"),
        ),
    )
}
