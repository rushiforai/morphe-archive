package io.github.matthewriley05.machu.patches.earthwallpaper

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_EARTH_SUPER_WALLPAPER = Compatibility(
        name = "Earth Super Wallpaper",
        packageName = "com.miui.miwallpaper.earth",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        targets = listOf(
            // Ouxyl's port used to develop and test the patch.
            AppTarget(version = "ALPHA-2.6.561-11211547-ogl-64-fix1"),
            // Other ports/versions may work, but the smali context must match.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
