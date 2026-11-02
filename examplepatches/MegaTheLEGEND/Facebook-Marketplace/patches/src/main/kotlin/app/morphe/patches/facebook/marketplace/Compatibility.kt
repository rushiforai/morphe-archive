package app.morphe.patches.facebook.marketplace

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Facebook (com.facebook.katana), the only app and version these patches are written for.
 * Signing-certificate SHA-256 was read from the v2 signing block of the 582.0.0.50.54 APK
 * (also visible as META-INF/IMPORTED.RSA). Redex-obfuscated names change every build, so the
 * version stays pinned.
 */
internal val COMPATIBILITY_FACEBOOK = Compatibility(
    name = "Facebook",
    packageName = "com.facebook.katana",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x1877F2,
    signatures = setOf("e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1"),
    targets = listOf(AppTarget(version = "582.0.0.50.54", minSdk = 30))
)
