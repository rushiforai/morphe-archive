package app.sircoderin.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KVAESITSO = Compatibility(
        name = "Kvaesitso",
        packageName = "de.mm20.launcher2.release",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4F46E5,
        targets = listOf(
            // Developed and verified against the official GitHub release.
            AppTarget(version = "1.41.0"),
            // The patched method is a stable, unobfuscated class name; likely fine on later versions.
            AppTarget(version = null, isExperimental = true),
        )
    )

    val COMPATIBILITY_TWILIGHT = Compatibility(
        name = "Twilight",
        packageName = "com.urbandroid.lux",
        // Play Store split install (base + config splits), merged by Morphe Manager.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xC62828,
        targets = listOf(
            // Developed and verified against this version.
            AppTarget(version = "14.32"),
            // The patched classes are unobfuscated; likely fine on nearby versions.
            AppTarget(version = null, isExperimental = true),
        )
    )

    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        // Play Store split install (base + config splits), merged by Morphe Manager.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1DB954,
        targets = listOf(
            // Developed and verified against this version.
            AppTarget(version = "9.2.0.2053"),
            // Class names are obfuscated, but the fingerprints key on string literals and androidx calls; may survive other versions.
            AppTarget(version = null, isExperimental = true),
        )
    )
}
