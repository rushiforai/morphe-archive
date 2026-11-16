package app.danielthemaniel.patches.campfire

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Niantic Campfire is a Capacitor/Ionic app: a thin Java shell around a Next.js web bundle in
 * assets/public. No PairIP or other packer. Hooks target unobfuscated Capacitor classes and CSS
 * patterns rather than hashed chunk names, so other versions are allowed as experimental.
 */
internal val COMPATIBILITY_CAMPFIRE = Compatibility(
    name = "Campfire",
    packageName = "com.nianticlabs.campfire",
    apkFileType = ApkFileType.APKS,
    appIconColor = 0x16BCF0,
    targets = listOf(
        AppTarget(version = "2026.42.1", versionCode = 10219),
        AppTarget(version = null, isExperimental = true),
    ),
)
