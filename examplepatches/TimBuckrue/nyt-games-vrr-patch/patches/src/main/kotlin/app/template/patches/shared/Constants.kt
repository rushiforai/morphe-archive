package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val NYT_GAMES_COMPATIBILITY = Compatibility(
        name = "NYT Games", // App name as it appears in the Android launcher.
        packageName = "com.nytimes.crossword",
        apkFileType = ApkFileType.XAPK, // Distributed as a split-APK bundle (.xapk).
        appIconColor = 0x000000, // Icon color in Morphe Manager.
        targets = listOf(
            // Version the patch was developed and confirmed against.
            AppTarget(
                version = "6.34.0",
                versionCode = 6426458,
            ),
            // Also allow newer builds experimentally: the injection point
            // (Application.onCreate) is not version-specific, so it is likely
            // to keep working across app updates.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
