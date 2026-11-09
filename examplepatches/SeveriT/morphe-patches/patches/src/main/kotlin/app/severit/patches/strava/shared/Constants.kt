package app.severit.patches.strava.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STRAVA = Compatibility(
        name = "Strava",
        packageName = "com.strava",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFC5200,
        targets = listOf(
            // Developed and verified against this release.
            AppTarget(version = "480.15"),
            // Colors are matched by value, not by obfuscated names,
            // so other releases are likely to work as well.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
