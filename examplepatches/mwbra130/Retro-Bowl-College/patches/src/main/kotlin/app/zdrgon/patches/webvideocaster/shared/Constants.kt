package app.zdrgon.patches.webvideocaster.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WEB_VIDEO_CASTER = Compatibility(
        name = "Web Video Caster",
        packageName = "com.instantbits.cast.webvideo",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x3F51B5,
        targets = listOf(
            AppTarget(version = "6.1.0", isExperimental = true),
        ),
    )
}
