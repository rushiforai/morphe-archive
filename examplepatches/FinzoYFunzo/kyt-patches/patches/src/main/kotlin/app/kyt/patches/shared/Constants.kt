package app.kyt.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TIDAL = Compatibility(
        name = "TIDAL", // App name as it appears in the Android launcher.
        packageName = "com.aspiro.tidal",
        // Must match the file type on APKMirror, otherwise Morphe Manager
        // will not send users to APKMirror to download the app.
        apkFileType = ApkFileType.APKM,
        // Icon color in Morphe Manager. TIDAL's icon background is black.
        appIconColor = 0x000000,
        targets = listOf(
            // App version the patches were developed and tested with.
            AppTarget(
                version = "2.215.0"
            )
        )
    )
}
