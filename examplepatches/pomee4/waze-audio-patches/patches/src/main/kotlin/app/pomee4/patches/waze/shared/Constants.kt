package app.pomee4.patches.waze.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        // Waze is distributed as a split bundle on APKMirror.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            // Version the patch was developed against.
            AppTarget(version = "5.26.5.0"),
            // The Waze audio SDK code has been stable for a long time, so newer versions likely work.
            AppTarget(version = null, isExperimental = true),
        )
    )
}
