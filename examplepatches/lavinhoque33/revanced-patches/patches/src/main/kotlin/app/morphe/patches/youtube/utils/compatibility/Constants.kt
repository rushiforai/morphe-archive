package app.morphe.patches.youtube.utils.compatibility

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    internal const val YOUTUBE_PACKAGE_NAME = "com.google.android.youtube"

    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = YOUTUBE_PACKAGE_NAME,
        targets = listOf(
            // Keep the recommended stable target first; newer targets are opt-in in Managers.
            AppTarget(version = "21.39.525", minSdk = 32),
            AppTarget(version = "21.45.90", minSdk = 29, isExperimental = true),
            AppTarget(version = "21.13.164", minSdk = 28),
            AppTarget(version = "20.05.46", minSdk = 26),
        )
    )

    val COMPATIBILITY_YOUTUBE_RELOAD_VIDEO = COMPATIBILITY_YOUTUBE.excluding(
        "19.43.41",
    )
}
