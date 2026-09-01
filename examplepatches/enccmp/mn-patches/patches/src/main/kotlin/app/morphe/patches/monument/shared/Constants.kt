package app.morphe.patches.monument.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    /**
     * Monument photo-storage app.
     *
     * Note: the code lives under `com.getmonument.app.*`, but the installed
     * application id (package name) is `com.getmonument.android`.
     */
    val COMPATIBILITY_MONUMENT = Compatibility(
        name = "Monument",
        packageName = "com.getmonument.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xB8860B, // Monument gold.
        targets = listOf(
            // Confirmed working target.
            AppTarget(version = "4.3.5"),
        ),
    )
}
