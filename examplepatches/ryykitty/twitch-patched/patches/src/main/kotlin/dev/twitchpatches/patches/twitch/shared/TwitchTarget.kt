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
        targets = listOf(
            AppTarget(
                version = BASELINE_VERSION,
                isExperimental = false,
                description = "Primary stable target. ARM64 build verification.",
            ),
            AppTarget(
                version = "31.9.0_BETA",
                isExperimental = true,
                description = "ARM64 evaluation of a Twitch prerelease.",
            ),
            AppTarget(
                version = "31.7.0",
                isExperimental = false,
                description = "Tested on ARM64 with native and swipe-feed players.",
            ),
        ),
    )
}
