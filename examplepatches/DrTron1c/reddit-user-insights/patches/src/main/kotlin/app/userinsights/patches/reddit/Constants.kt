package app.userinsights.patches.reddit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /**
     * The patch only hooks MainActivity.onCreate and adds manifest entries,
     * so it does not depend on Reddit's obfuscated code and should work on any recent version.
     * The listed versions match the ones the official Morphe Reddit patches target.
     */
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        targets = listOf(
            // "version = null" without isExperimental: works with any Reddit version,
            // so Morphe Manager always shows the patch, whatever version is being patched.
            AppTarget(
                version = null
            ),
            AppTarget(
                version = "2026.46.0",
                minSdk = 29
            ),
            AppTarget(
                version = "2026.45.0",
                minSdk = 29
            ),
            AppTarget(
                version = "2026.44.0",
                minSdk = 29
            ),
            AppTarget(
                version = "2026.40.0",
                minSdk = 29
            )
        )
    )
}
