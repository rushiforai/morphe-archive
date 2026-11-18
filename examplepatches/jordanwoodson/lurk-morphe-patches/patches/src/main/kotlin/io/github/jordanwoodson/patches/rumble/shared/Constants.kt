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
            // apks/rumble/3.22.0 (versionCode 913): APKMirror's universal APKM, the same build as Google Play's of
            // 2026-11-04 (identical base APK). Target only a version Manager can download: as of 2026-11-18
            // bin/manager-link rumble 3.22.0 doesn't pass yet (Morphe's API sends Manager to apkcube.com).
            AppTarget(version = "3.22.0"),
        ),
    )
}
