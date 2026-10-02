package io.github.bakwudo.uyu.patches.twitch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val TWITCH_VERSION = "31.3.1"
    const val TWITCH_PACKAGE_NAME = "tv.twitch.android.app"

    val COMPATIBILITY_TWITCH = Compatibility(
        name = "Twitch",
        packageName = TWITCH_PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x9147FF,
        targets = listOf(AppTarget(version = TWITCH_VERSION)),
    )
}
