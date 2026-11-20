package app.rosaldivo.patches.music.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_YOUTUBE_MUSIC = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0000,
        signatures = setOf(
            // Android 13+
            "6a2f65ec694a6a632acdcb5080912a565f903d4b8d83f0eb8e44fbdf2660d8e1",
            // Android 7+
            "a2a1ad7ba7f41dfca4514e2afeb90691719af6d0fdbed4b09bbf0ed897701ceb"
        ),
        targets = listOf(
            AppTarget(
                version = "9.38.51",
                minSdk = 26,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.37.54",
                minSdk = 26,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.36.50",
                minSdk = 26,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.15.51",
                minSdk = 26
            )
        )
    )

    /**
     * Versions for the `No mix for single songs` patch.
     * Run on a patched 9.46.51 on a phone. 9.40.51 only patches without errors.
     * The queue code of 9.20.53 and older is different.
     */
    val COMPATIBILITY_YOUTUBE_MUSIC_SINGLE_SONG = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = COMPATIBILITY_YOUTUBE_MUSIC.apkFileType,
        appIconColor = COMPATIBILITY_YOUTUBE_MUSIC.appIconColor,
        signatures = COMPATIBILITY_YOUTUBE_MUSIC.signatures,
        targets = listOf(
            AppTarget(
                version = "9.46.51",
                minSdk = 28,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.40.51",
                minSdk = 26,
                isExperimental = true,
            )
        )
    )

    /**
     * Versions for the `Keep autoplay setting` patch.
     * Run on a patched 9.40.51 on a phone. 9.30.53 and 9.20.53 were checked against
     * the decompiled code only (same method), so they stay experimental. 9.46.51 was not tried at all.
     */
    val COMPATIBILITY_YOUTUBE_MUSIC_AUTOPLAY = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = COMPATIBILITY_YOUTUBE_MUSIC.apkFileType,
        appIconColor = COMPATIBILITY_YOUTUBE_MUSIC.appIconColor,
        signatures = COMPATIBILITY_YOUTUBE_MUSIC.signatures,
        targets = listOf(
            AppTarget(
                version = "9.46.51",
                minSdk = 28,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.40.51",
                minSdk = 26,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.30.53",
                minSdk = 26,
                isExperimental = true,
            ),
            AppTarget(
                version = "9.20.53",
                minSdk = 26,
                isExperimental = true,
            )
        )
    )
}
