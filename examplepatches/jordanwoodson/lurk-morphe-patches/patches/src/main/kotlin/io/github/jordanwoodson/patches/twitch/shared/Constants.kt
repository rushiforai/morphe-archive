package io.github.jordanwoodson.patches.twitch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TWITCH = Compatibility(
        name = "Twitch",
        packageName = "tv.twitch.android.app",
        // APKMirror ships it as a bundle. Manager only links to APKMirror/Uptodown when this matches.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x9146FF,
        // Original signing cert (apksigner "certificate SHA-256 digest"). bin/apk-add pins it.
        signatures = setOf("1338f9b049893cc70b78432a177582f90bd4bc6296ea4ed35bcc7df59687ac53"),
        targets = listOf(
            // Latest stable on Google Play and Uptodown on 2026-11-04 (versionCode 3109006); APKMirror lists it
            // only as 31.9.0_BETA so far. Update to the version you develop against.
            AppTarget(version = "31.9.0"),
        ),
    )

    /**
     * The Twitch version the patches are written and tested against, the single target above. Messages
     * and checks use this, so a version bump changes one line.
     */
    val TWITCH_VERSION: String
        get() = COMPATIBILITY_TWITCH.targets.single().version
            ?: error("Twitch: the target has no version")
}
