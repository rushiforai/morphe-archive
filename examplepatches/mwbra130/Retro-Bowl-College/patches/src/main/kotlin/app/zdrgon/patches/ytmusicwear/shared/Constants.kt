package app.zdrgon.patches.ytmusicwear.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YOUTUBE_MUSIC_WEAR = Compatibility(
        name = "YouTube Music (Wear OS)",
        packageName = "com.google.android.apps.youtube.music",
        appIconColor = 0xFF0000,
        targets = listOf(
            AppTarget(version = "9.45.41-WEAR_RELEASE", isExperimental = true),
        ),
    )
}
