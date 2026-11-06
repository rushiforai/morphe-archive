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
            // apks/rumble/3.21.0 (APKMirror, versionCode 887). Target only a version APKMirror lists as stable:
            // Manager's download link can't find anything else (bin/manager-link). Google Play's 3.22.0 of
            // 2026-11-04 (commit 6b6b2fa) waits for APKMirror.
            AppTarget(version = "3.21.0"),
        ),
    )
}
