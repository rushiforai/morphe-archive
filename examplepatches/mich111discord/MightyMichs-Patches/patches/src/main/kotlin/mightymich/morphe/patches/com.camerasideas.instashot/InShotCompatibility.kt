package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object InShotCompatibility {
    val INSHOT = Compatibility(
        name = "InShot",
        packageName = "com.camerasideas.instashot",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "2.243.1555")
        )
    )
}
