package app.zdrgon.patches.strava.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STRAVA = Compatibility(
        name = "Strava",
        packageName = "com.strava",
        // XAPK: Morphe merges the split bundle (base + config.arm64_v8a +
        // config.en + config.xxxhdpi) into a single APK before patching.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFC5200,
        targets = listOf(
            AppTarget(version = "486.9", isExperimental = true),
        ),
    )
}
