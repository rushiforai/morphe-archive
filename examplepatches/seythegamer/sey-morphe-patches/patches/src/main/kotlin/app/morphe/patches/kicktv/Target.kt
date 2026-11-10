package app.morphe.patches.kicktv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

/**
 * Compatibility declaration shared by every KICK TV patch.
 *
 * The icon colour is KICK's brand green so Morphe Manager shows a different
 * tile for each app in the combined bundle. The SEYTTINGS UI itself stays red.
 */
internal val KICK_TV = Compatibility(
    packageName = "com.kick.mobile",
    name = "KICK: Live Streaming",
    description = "Patched tweaks by Sey for KICK (Android TV).",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x53FC18,
    formFactor = FormFactor.TV,
    targets = listOf(
        AppTarget(version = "1.9.0", versionCode = 208),
    ),
)
