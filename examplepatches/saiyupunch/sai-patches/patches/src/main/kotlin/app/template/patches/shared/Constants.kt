package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * "slot. for Android" by Baggio94 (unofficial Android port of slot.).
     * Distributed as a plain APK on GitHub Releases, not through APKMirror/UpToDown.
     */
    val COMPATIBILITY_SLOT = Compatibility(
        name = "slot.",
        packageName = "fyi.slot.konkr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E2327,
        targets = listOf(
            // Release v2.1.0 (versionName "2.1.0", versionCode 313): latest.
            AppTarget(
                version = "2.1.0",
                // minSdk is the lowest *device* API level once patched: Android 11 = API 30.
                minSdk = 30
            ),
            // Release konkr-v2.0.0 (versionName "2.0.0").
            AppTarget(
                version = "2.0.0",
                minSdk = 30
            ),
            // Newer releases are expected to work, but are untested.
            AppTarget(
                version = null,
                isExperimental = true,
                minSdk = 30
            )
        )
    )
}
