package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object InShotCompatibility {
    val INSHOT = Compatibility(
        name = "InShot",
        packageName = "com.camerasideas.instashot",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF2558,
        targets = listOf(
            AppTarget(version = "2.243.1555"),
            AppTarget(version = "2.214.1539"),
            AppTarget(version = "2.240.1552", isExperimental = true),
            AppTarget(version = "2.238.1550", isExperimental = true),
            AppTarget(version = "2.230.1545", isExperimental = true),
        ),
    )
}
