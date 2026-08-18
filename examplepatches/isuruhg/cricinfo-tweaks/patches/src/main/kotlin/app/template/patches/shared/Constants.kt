package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CRICINFO = Compatibility(
        name = "ESPNcricinfo",
        packageName = "com.july.cricinfo",
        // Distributed as a split bundle (base + config.* splits) on APKPure/Play.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xC8102E, // ESPNcricinfo red, shown in Morphe Manager
        targets = listOf(
            // The app's UI is Flutter, so ad/tracking SDK glue lives in named
            // (non-obfuscated) classes -- io.flutter.plugins.googlemobileads.* and
            // com.cricinfo.app.android.initializers.* -- which we match by name.
            // Verified unchanged between 26.05.11 and 26.07.24, so minor bumps
            // usually need only a rebuild.
            AppTarget(
                version = "26.07.24", // versionCode 9240
            ),
            AppTarget(
                version = "26.05.11", // versionCode 9148
            ),
        ),
    )
}
