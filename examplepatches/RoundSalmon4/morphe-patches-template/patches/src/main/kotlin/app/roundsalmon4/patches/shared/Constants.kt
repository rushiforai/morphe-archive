package app.roundsalmon4.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SERIESGUIDE = Compatibility(
        name = "SeriesGuide",
        packageName = "com.battlelancer.seriesguide",
        apkFileType = ApkFileType.APK,
        appIconColor = "#E53935",
        targets = listOf(
            AppTarget(version = "2026.2.2"),
            AppTarget(version = "2026.3.0")
        )
    )
}
