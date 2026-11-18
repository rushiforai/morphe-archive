package app.ghostknow.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LIHKG = Compatibility(
        name = "LIHKG",
        packageName = "com.lihkg.app",
        // LIHKG ships as a split APK archive on APKMirror (.apks).
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xFF00A0,
        signatures = setOf(
            // CN=LIHKG, C=HK
            "b0dfb049866ff1a6a018d74a7c2daa30560a86be0a16ae264a27e095c4724bf8",
        ),
        targets = listOf(
            // Any newer release is accepted experimentally: the fingerprints below match
            // by shape and by un-obfuscated model field names, so they usually survive
            // app updates, but they are not verified against those versions.
            AppTarget(
                version = null,
                minSdk = 24,
                isExperimental = true,
            ),
            // Confirmed working version.
            AppTarget(
                version = "19.1.4",
                minSdk = 24,
            ),
        ),
    )
}
