package app.merak.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GOOGLE_AUTHENTICATOR = Compatibility(
        name = "Google Authenticator",
        packageName = "com.google.android.apps.authenticator2",
        // Google Play delivers this app as split APKs (base + config splits).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        targets = listOf(
            // Version used to develop and test the patches (versionCode 7002015).
            AppTarget(
                version = "7.2"
            )
        )
    )
}
