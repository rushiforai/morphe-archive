package app.abeja.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val GAME_SPACE = Compatibility(
        name = "Game Space",
        packageName = "cn.nubia.gamelauncher",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            // Experimental support for future versions.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Version this patch was developed for.
            AppTarget(
                version = "16.5.000.000.2604151714"
            )
        )
    )

    val ZTE_GALLERY = Compatibility(
        name = "ZTE Gallery", // App name as it appears in the Android launcher.
        packageName = "com.android.gallery3d",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF0045, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version you developed your patches for
            // or the last version you have confirmed as 100% working.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "16.0.002.000.2601041449"
            )
        )
    )


    val ZTE_VIDEO_PLAYER = Compatibility(
        name = "ZTE Video Player",
        packageName = "com.zte.videoplayer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00FF45, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // 'any' version supported experimentally.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // App version confirmed 100% working.
            AppTarget(
                version = "16.0.000.000.2601071548"
            )
        )
    )

}
