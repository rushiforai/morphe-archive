package app.ak800i.patches.waze.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        // Waze is published on APKMirror as a split bundle.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            AppTarget(version = "5.27.5.0"),
            // The patch only relies on names that Waze does not obfuscate, so other versions likely work.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
