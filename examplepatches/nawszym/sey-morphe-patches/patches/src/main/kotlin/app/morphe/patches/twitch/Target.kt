package app.morphe.patches.twitch

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

/**
 * Compatibility declaration shared by every Twitch TV patch.
 *
 * The icon colour is Twitch's brand purple so Morphe Manager shows a different
 * tile for each app in the combined bundle. The SEYTTINGS UI itself stays red.
 */
internal val TWITCH_TV = Compatibility(
    packageName = "tv.twitch.android.app",
    name = "Twitch (Android TV)",
    description = "Patched tweaks by Sey for Twitch (Android TV).",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x9146FF,
    formFactor = FormFactor.TV,
    targets = listOf(
        AppTarget(version = "13.0.0.2", versionCode = 1100000018),
    ),
)
