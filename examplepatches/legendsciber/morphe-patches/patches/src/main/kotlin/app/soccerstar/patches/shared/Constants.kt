package app.soccerstar.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SOCCERSTAR = Compatibility(
        name = "Soccer Star",
        packageName = "com.soccer.score.star",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2E7D32,
        targets = listOf(
            AppTarget(version = "0.3.88")
        )
    )
}
