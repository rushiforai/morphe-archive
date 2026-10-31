package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val ES_EXPLORER_COMPATIBILITY = Compatibility(
        name = "ES File Explorer",
        packageName = "com.estrongs.android.pop",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1976D2,
        targets = listOf(
            AppTarget(version = "4.4.2.2.1", versionCode = 15036),
            AppTarget(version = "4.4.3.7", versionCode = 10353),
        )
    )
}
