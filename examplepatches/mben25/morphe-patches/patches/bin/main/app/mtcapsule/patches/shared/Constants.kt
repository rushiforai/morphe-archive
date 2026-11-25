package app.mtcapsule.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MT_CAPSULE = Compatibility(
        name = "MT Capsule", // App name as it appears in the Android launcher.
        packageName = "com.pryshedko.mtisland",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF0045, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // Version the patches were developed and verified against.
            AppTarget(
                version = "15.9",
                minSdk = 32
            ),
            // Any newer version, experimentally.
            AppTarget(
                version = null,
                minSdk = 32,
                isExperimental = true
            )
        )
    )
}
