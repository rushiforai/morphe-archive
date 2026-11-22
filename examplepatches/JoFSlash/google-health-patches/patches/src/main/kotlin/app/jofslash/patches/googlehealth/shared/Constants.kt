package app.jofslash.patches.googlehealth.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.fitbit.FitbitMobile"

    /**
     * SHA-1 of Fitbit's original signing certificate. Google later rotated the key, but MicroG-RE knows
     * the app by this certificate and only then treats it as a Google app that may use the account.
     */
    const val SIGNATURE = "29a4514c3b90b90cb6badc79614262195c6a5747"

    val COMPATIBILITY_GOOGLE_HEALTH = Compatibility(
        name = "Google Health",
        packageName = PACKAGE_NAME,
        // APKMirror ships Google Health as a bundle (APKM).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3084FF,
        targets = listOf(
            AppTarget(version = "5.13.health-mobile-1104148438-1023845615"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
