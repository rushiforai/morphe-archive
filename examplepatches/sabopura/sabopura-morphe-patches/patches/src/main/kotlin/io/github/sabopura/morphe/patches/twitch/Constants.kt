package io.github.sabopura.morphe.patches.twitch

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    private fun twitch(description: String, targets: List<AppTarget>) = Compatibility(
        name = "Twitch",
        packageName = "tv.twitch.android.app",
        description = description,
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x9146FF,
        signatures = setOf(
            "1338f9b049893cc70b78432a177582f90bd4bc6296ea4ed35bcc7df59687ac53",
        ),
        targets = targets,
    )

    private fun current(description: String) = listOf(
        AppTarget(version = "32.0.0", versionCode = 3200006, minSdk = 32, description = description),
        AppTarget(version = "31.9.0", versionCode = 3109006, minSdk = 32, description = description),
    )

    val TWITCH_SUPPORTED = twitch(
        "Official Twitch Android app with chat and playback enhancements.",
        current("Android 12L+ variant: patched and checked on the dedicated API 36 emulator. Signed-in behavior not tested.") +
            AppTarget(
                version = "30.7.2",
                versionCode = 3007026,
                minSdk = 26,
                description = "Patched, rebuilt, installed, and checked on the dedicated API 36 emulator.",
            ),
    )

    /** Ad blocking is analysed and hooked for these versions only. */
    val TWITCH_ADS = twitch(
        "Official Twitch Android app. Ad blocking is built for these versions only.",
        current("Android 12L+ variant."),
    )
}
