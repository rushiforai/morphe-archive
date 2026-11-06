/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.patches.applemusic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_APPLE_MUSIC = Compatibility(
        name = "Apple Music", // App name as it appears in the Android launcher.
        packageName = "com.apple.android.music",
        // APKMirror publishes Apple Music as an APKM bundle (base + splits).
        apkFileType = ApkFileType.APKM,
        // Apple Music icon red.
        appIconColor = 0xFA2D48,
        targets = listOf(
            // Version the patch was developed and analysed with (versionCode 1606).
            AppTarget(
                version = "7.0.0-beta",
                description = "Floating tab bar and mini player redesign",
            ),
            // The patch only relies on names that survive obfuscation (BlurView.draw and
            // resource ids), so later 7.x releases are expected to work.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
