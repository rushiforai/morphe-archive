package dev.rikunode.pupil

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Official Codeberg release 6.1.1:
 * https://codeberg.org/pupil/Pupil/releases/tag/6.1.1
 * package=xyz.quaver.pupil, versionName=6.1.1, versionCode=1510.
 * SHA256 of release APK:
 * 9a3513f1f6a0a132a6e187d78e5837eefb086115f2ec19a7de6f7e8e38e2aa09
 */
val PupilCompatibility = Compatibility(
    name = "Pupil",
    packageName = "xyz.quaver.pupil",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFFFFFF,
    targets = listOf(AppTarget(version = "6.1.1")),
)
