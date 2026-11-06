package app.zdrgon.patches.videocutter.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_VIDEO_CUTTER = Compatibility(
        name = "Video Cutter",
        packageName = "com.losslessvideocutter",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF6B4C,
        targets = listOf(
            AppTarget(version = "4.4.6")
        )
    )
}
