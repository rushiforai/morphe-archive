package app.morphe.patches.instagram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Instagram (arm64-v8a, Android 9+).
 *
 * The Apple emoji patch finds its hooks by strings, framework calls and unobfuscated classes rather
 * than Meta's obfuscated names, so it is not tied to one build. The two listed versions were checked
 * hook by hook; any other version is allowed as experimental, and the patch log names any part it
 * could not find.
 */
val INSTAGRAM_COMPATIBILITY = Compatibility(
    name = "Instagram",
    packageName = "com.instagram.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xE1306C,
    targets = listOf(
        AppTarget(version = "452.1.0.53.64", versionCode = 385811006, minSdk = 28),
        AppTarget(version = "447.0.0.55.81", versionCode = 385311895, minSdk = 28),
        AppTarget(version = null, isExperimental = true, minSdk = 28),
    ),
)