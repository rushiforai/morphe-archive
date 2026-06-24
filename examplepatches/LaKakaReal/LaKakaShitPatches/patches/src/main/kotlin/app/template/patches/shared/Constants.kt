package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Depth Wallpapers & Live Clock by JustNewDesigns
    val DEPTH_WALLPAPERS_COMPATIBILITY = Compatibility(
        name = "Depth Wallpapers & Live Clock",
        packageName = "com.jndapp.depth.live.wallpaper",
        appIconColor = 0x1A1A2E,
        targets = listOf(AppTarget(version = null))
    )
}