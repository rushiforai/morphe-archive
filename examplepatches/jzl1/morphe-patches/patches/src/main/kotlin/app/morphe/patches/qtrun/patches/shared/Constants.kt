package lab.qtrun.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_QUICKTEST = Compatibility(
    name = "Network Signal Guru",
    packageName = "com.qtrun.QuickTest",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x1A73E8,
    targets = listOf(
        AppTarget(
            version = "4.8.8",
            description = "versionCode 4080830",
        ),
    ),
)
