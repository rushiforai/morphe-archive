package mightymich.morphe.patches.com.zhiliaoapp.musically

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TikTokCompatibility {
    val TIKTOK = Compatibility(
        name = "TikTok",
        packageName = "com.zhiliaoapp.musically",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x010101,
        targets = listOf(
            AppTarget(version = "47.4.3")
        )
    )
}
