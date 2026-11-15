package app.morphe.patches.movielab

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val MOVIELAB_COMPATIBILITY = Compatibility(
    name = "MovieLab",
    packageName = "com.movielab.mobile",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xE50914,
    signatures = setOf("d3c9b686825fdd5bf8a09e30187a280755f513916de8d02761a8b22fe54588da"),
    targets = listOf(
        AppTarget(
            version = "2.0.22-movielab-mobile",
            versionCode = 1,
            minSdk = 24,
            description = "MovieLab для Android",
        ),
    ),
)
