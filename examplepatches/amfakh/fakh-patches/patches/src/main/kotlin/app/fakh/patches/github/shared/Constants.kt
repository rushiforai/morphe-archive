package app.fakh.patches.github.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GITHUB = Compatibility(
        name = "GitHub",
        packageName = "com.github.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1F23,
        targets = listOf(AppTarget(version = "1.282.0", versionCode = 953), AppTarget(version = "1.283.0", versionCode = 954), AppTarget(version = "1.284.0", versionCode = 955), AppTarget(version = "1.285.0", versionCode = 956)),
    )
}
