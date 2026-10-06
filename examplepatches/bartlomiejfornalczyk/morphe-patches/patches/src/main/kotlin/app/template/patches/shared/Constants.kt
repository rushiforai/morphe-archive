package app.template.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GOOGLE_MAPS = Compatibility(
        name = "Google Maps",
        packageName = "com.google.android.apps.maps",
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(
                version = "26.36.04.973607363"
            )
        )
    )

    val COMPATIBILITY_YOUTUBE_MUSIC = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        appIconColor = 0xFF0000
    )

    val COMPATIBILITY_MORPHE_YOUTUBE_MUSIC = Compatibility(
        name = "YouTube Music (Morphe)",
        packageName = "app.morphe.android.apps.youtube.music",
        appIconColor = 0xFF0000
    )

    val COMPATIBILITY_REVANCED_YOUTUBE_MUSIC = Compatibility(
        name = "YouTube Music (ReVanced)",
        packageName = "app.revanced.android.apps.youtube.music",
        appIconColor = 0xFF0000
    )
}
