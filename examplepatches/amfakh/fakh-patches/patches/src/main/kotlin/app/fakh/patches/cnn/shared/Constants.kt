package app.fakh.patches.cnn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CNN = Compatibility(
        name = "CNN Indonesia",
        packageName = "com.cnn.indonesia",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget(version = "2.50.7", versionCode = 209)),
    )
}
