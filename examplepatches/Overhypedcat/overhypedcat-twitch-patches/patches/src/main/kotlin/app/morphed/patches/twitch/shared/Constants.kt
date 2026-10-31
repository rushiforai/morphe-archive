package app.morphed.patches.twitch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TWITCH = Compatibility(
        name = "Twitch",
        packageName = "tv.twitch.android.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x9146FF,
        targets = listOf(
            // The hook only touches the Amazon IVS player SDK, whose class names Twitch does not obfuscate,
            // so newer app versions are expected to work.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "31.8.0"
            )
        )
    )
}
