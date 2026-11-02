package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TwitchTarget {
    const val PACKAGE_NAME = "tv.twitch.android.app"
    const val BASELINE_VERSION = "31.8.0"

    val compatibility = Compatibility(
        name = "Twitch",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x9146FF,
        targets = listOf(
            AppTarget(
                version = BASELINE_VERSION,
                isExperimental = false,
                description = "Latest stable Twitch release. ARM64 build verification.",
            ),
            AppTarget(
                version = "31.9.0_BETA",
                isExperimental = true,
                description = "Latest Twitch beta. ARM64 build verification.",
            ),
        ),
    )
}
