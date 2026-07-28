package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Roost (a.k.a. "Roost Social") — the pigeon social/care game that contains
     * the "Bullet Hell" minigame these patches target.
     *
     * Patches were developed and confirmed against v1.4.12 (versionCode 37).
     */
    val COMPATIBILITY_ROOST = Compatibility(
        name = "Roost", // App name as it appears in the Android launcher (manifest "name").
        packageName = "com.rookery.courier",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2A1E9E, // Deep indigo icon background (approximate).
        targets = listOf(
            // The exact version the bullet-hell fingerprint/edits were verified against.
            AppTarget(
                version = "1.4.12"
            )
        )
    )
}
