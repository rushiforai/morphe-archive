package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TwitchTarget {
    const val PACKAGE_NAME = "tv.twitch.android.app"
    const val CANDIDATE_VERSION = "31.4.2"

    val candidateCompatibility = Compatibility(
        name = "Twitch",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(
                version = CANDIDATE_VERSION,
                isExperimental = false,
                description = "Tested on ARM64 with native and swipe-feed players.",
            ),
            AppTarget(
                version = "31.3.0",
                isExperimental = false,
                description = "Evaluated on ARM64 with native and swipe-feed players.",
            ),
        ),
    )
}
