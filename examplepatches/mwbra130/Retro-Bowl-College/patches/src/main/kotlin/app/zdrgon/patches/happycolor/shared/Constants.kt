package app.zdrgon.patches.happycolor.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Happy Color by Good Job Games — Flutter title, ads via AppLovin MAX. Marked experimental 2026-11-02 at Matsen's request, together with RainViewer, Strava and Web Video Caster; BeReal, Geometry Dash Lite and Subway Surfers patch sets removed the same day.

    val COMPATIBILITY_HAPPY_COLOR = Compatibility(
        name = "Happy Color",
        packageName = "com.pixel.art.coloring.color.number",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF7043,
        targets = listOf(
            AppTarget(version = "2.24.1", isExperimental = true)
        )
    )
}
