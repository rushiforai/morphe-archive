package app.template.patches.tiktok_lite

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val TIKTOK_LITE_4683_COMPATIBILITY = Compatibility(
    name = "TikTok Lite",
    packageName = "com.zhiliaoapp.musically.go",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFE2C55,
    targets = listOf(
        AppTarget(version = "46.8.3", versionCode = 460803)
    )
)
