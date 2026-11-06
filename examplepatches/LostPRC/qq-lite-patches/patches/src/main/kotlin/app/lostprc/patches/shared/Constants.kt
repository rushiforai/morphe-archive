package app.lostprc.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_QQ = Compatibility(
        name = "QQ",
        packageName = "com.tencent.mobileqq",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x12B7F5,
        targets = listOf(
            // Version the patches were developed against (versionCode 16580, arm64-v8a).
            AppTarget(version = "9.3.75"),
        ),
    )
}
