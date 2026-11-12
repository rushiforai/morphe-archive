package app.fakh.patches.coverscreen.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_COVERSCREEN = Compatibility(
        name = "CoverScreen OS",
        packageName = "apps.ijp.coverscreenos",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(version = "CSOS_9.0.1_BETA", versionCode = 244),
        ),
    )
}
