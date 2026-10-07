package mightymich.morphe.patches.com.scaleup.photofx

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PhotoAppCompatibility {
    val PHOTOAPP = Compatibility(
        name = "PhotoApp",
        packageName = "com.scaleup.photofx",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "2.8.1")
        )
    )
}
