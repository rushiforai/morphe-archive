package mightymich.morphe.patches.ru.zdevs.zarchiver

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ZArchiverCompatibility {
    val ZARCHIVER = Compatibility(
        name = "ZArchiver",
        packageName = "ru.zdevs.zarchiver",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "1.0.10")
        )
    )
}
