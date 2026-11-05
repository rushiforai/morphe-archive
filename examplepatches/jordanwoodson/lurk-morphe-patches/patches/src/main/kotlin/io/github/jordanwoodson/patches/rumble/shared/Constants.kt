package io.github.jordanwoodson.patches.rumble.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RUMBLE = Compatibility(
        name = "Rumble",
        packageName = "com.rumble.battles",
        // APKMirror ships it as a bundle. Manager only links to APKMirror/Uptodown when this matches.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x85C742,
        // Original signing cert (apksigner "certificate SHA-256 digest"). bin/apk-add pins it.
        signatures = setOf("eca34178cd915ce443fa1d3900ae6a3b3a3b6532488543d22a39ecb844872b5d"),
        targets = listOf(
            // apks/rumble/3.22.0: the Google Play release of 2026-11-04 (versionCode 913). APKMirror still lists
            // 3.21.0.
            AppTarget(version = "3.22.0"),
        ),
    )
}
