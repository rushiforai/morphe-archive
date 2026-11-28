package semicoloncolonel.mobilestream.patches.yonhap.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Yonhap News English",
        packageName = "kr.co.yna.YonhapNewsEnglish",
        description = "The English edition of the Yonhap News app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x005BAC,
        targets = listOf(AppTarget("1.1.01", versionCode = 14, isExperimental = true))
    )
}
