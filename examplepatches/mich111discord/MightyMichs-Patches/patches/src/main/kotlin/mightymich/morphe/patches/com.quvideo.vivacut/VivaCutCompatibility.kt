package mightymich.morphe.patches.com.quvideo.vivacut

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object VivaCutCompatibility {
    val VIVACUT = Compatibility(
        name = "VivaCut",
        packageName = "com.quvideo.vivacut",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "3.9.9")
        )
    )
}
