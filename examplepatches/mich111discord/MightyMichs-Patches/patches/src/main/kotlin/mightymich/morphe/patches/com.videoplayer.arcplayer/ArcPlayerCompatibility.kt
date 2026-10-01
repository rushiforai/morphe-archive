package mightymich.morphe.patches.com.videoplayer.arcplayer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ArcPlayerCompatibility {
    val ARC_PLAYER = Compatibility(
        name = "Arc Player",
        packageName = "com.videoplayer.arcplayer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "1.2.9.3")
        )
    )
}
