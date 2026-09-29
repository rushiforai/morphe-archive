package io.github.bakwudo.uyu.patches.twitch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Each uyu release supports exactly one Twitch version.
     * When moving to a new version, follow docs/updating.md.
     */
    const val TWITCH_VERSION = "31.3.1"

    const val TWITCH_PACKAGE_NAME = "tv.twitch.android.app"

    val COMPATIBILITY_TWITCH = Compatibility(
        name = "Twitch",
        packageName = TWITCH_PACKAGE_NAME,
        // APKMirror only distributes Twitch as a split bundle.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x9147FF,
        targets = listOf(AppTarget(version = TWITCH_VERSION)),
    )
}
