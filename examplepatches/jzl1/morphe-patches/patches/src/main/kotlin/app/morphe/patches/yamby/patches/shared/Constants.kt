package lab.yamby.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_YAMBY = Compatibility(
    name = "Yamby",
    packageName = "com.hush.yamby",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x1A73E8,
    targets = listOf(
        AppTarget(
            version = "2.1.0.11",
            description = "versionCode 20010012",
        ),
    ),
)