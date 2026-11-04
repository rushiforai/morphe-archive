package app.proxypatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        targets = listOf(
            // Tested end to end (traffic capture on a real device).
            AppTarget(version = "2026.40.0"),
            // The patch only touches stable, non-obfuscated classes, so newer versions
            // are expected to work.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
