package io.github.sabopura.morphe.patches.twitch

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val TWITCH_SUPPORTED = Compatibility(
        name = "Twitch",
        packageName = "tv.twitch.android.app",
        description = "Official Twitch Android app with chat and playback enhancements.",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x9146FF,
        signatures = setOf(
            "1338f9b049893cc70b78432a177582f90bd4bc6296ea4ed35bcc7df59687ac53",
        ),
        targets = listOf(
            AppTarget(
                version = "31.8.0",
                versionCode = 3108006,
                minSdk = 32,
                description = "Android 12L+ variant: patched and checked on the dedicated API 36 emulator. Signed-in behavior not tested.",
            ),
            AppTarget(
                version = "31.7.0",
                versionCode = 3107006,
                minSdk = 32,
                description = "Android 12L+ variant: patched and checked on the dedicated API 36 emulator. Signed-in behavior not tested.",
            ),
            AppTarget(
                version = "30.7.2",
                versionCode = 3007026,
                minSdk = 26,
                description = "Patched, rebuilt, installed, and checked on the dedicated API 36 emulator.",
            ),
        ),
    )

    /** Ad blocking is analysed and hooked for these versions only. */
    val TWITCH_ADS = Compatibility(
        name = "Twitch",
        packageName = "tv.twitch.android.app",
        description = "Official Twitch Android app. Ad blocking is built for these versions only.",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x9146FF,
        signatures = setOf(
            "1338f9b049893cc70b78432a177582f90bd4bc6296ea4ed35bcc7df59687ac53",
        ),
        targets = listOf(
            AppTarget(
                version = "31.8.0",
                versionCode = 3108006,
                minSdk = 32,
                description = "Android 12L+ variant.",
            ),
            AppTarget(
                version = "31.7.0",
                versionCode = 3107006,
                minSdk = 32,
                description = "Android 12L+ variant.",
            ),
        ),
    )
}
