package app.arylive.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Stock ARY PLUS (phone).
     *
     * Latest verified: 3.8.0 (versionCode 180) — Sep 2026 (APKPure / APKCombo).
     * Single APK (not a Reddit-style split APKM). Morphe Manager will ask users
     * for this version via [targets].
     */
    val ARY_PLUS = Compatibility(
        name = "ARY PLUS",
        packageName = "com.release.arylive",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xC8102E,
        targets = listOf(
            AppTarget(
                version = "3.8.0",
            ),
            // Try newer builds; may need fingerprint updates.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
