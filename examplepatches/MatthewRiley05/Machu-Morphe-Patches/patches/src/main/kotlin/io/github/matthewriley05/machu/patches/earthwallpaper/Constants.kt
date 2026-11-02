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
            // Official Filament release (versionCode 206000575).
            AppTarget(version = "ALPHA-2.6.575-09041449-ogl-64"),
            // Future official releases may work but are not verified.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
