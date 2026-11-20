package app.southstar21.patches.youtubemusic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YOUTUBE_MUSIC = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF0033,
        targets = listOf(
            // The hooks target unobfuscated methods (MusicActivity.onWindowFocusChanged,
            // WatchWhileLayout.onMeasure) and the bar is found by its resource id, so newer
            // versions will probably work too, but only this is verified.
            AppTarget(
                version = "9.46.51",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
