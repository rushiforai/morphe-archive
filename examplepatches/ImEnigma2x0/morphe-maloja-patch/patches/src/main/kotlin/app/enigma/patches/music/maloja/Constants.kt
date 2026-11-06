package app.enigma.patches.music.maloja

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    // Mirrors the targets of the official Morphe patches, since this patch is meant
    // to be applied together with them.
    val COMPATIBILITY_YOUTUBE_MUSIC = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0000,
        targets = listOf(
            AppTarget(version = "9.43.51", minSdk = 26, isExperimental = true),
            AppTarget(version = "9.42.52", minSdk = 26, isExperimental = true),
            AppTarget(version = "9.41.52", minSdk = 26, isExperimental = true),
            // First stable target, so the recommended version, as in the official patches.
            AppTarget(version = "9.30.53", minSdk = 26),
            AppTarget(version = "9.20.53", minSdk = 26),
            AppTarget(version = "9.15.51", minSdk = 26)
        )
    )
}
