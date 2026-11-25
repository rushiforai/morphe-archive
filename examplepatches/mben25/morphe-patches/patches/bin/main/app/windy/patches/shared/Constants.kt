package app.windy.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WINDY = Compatibility(
        name = "Windy", // App name as it appears in the Android launcher.
        packageName = "com.windyty.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x9D0300, // Windy red.
        targets = listOf(
            // Versions the patches were verified against. The JS sites are matched by
            // shape, not minified names, but a bundle rewrite can still break them, so no
            // experimental "any version" target.
            AppTarget(
                version = "51.2.1"
            ),
            AppTarget(
                version = "51.0.1"
            ),
        )
    )
}
