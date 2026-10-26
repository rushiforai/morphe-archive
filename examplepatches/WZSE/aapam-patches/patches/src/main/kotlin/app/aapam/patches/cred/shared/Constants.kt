package app.aapam.patches.cred.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CRED = Compatibility(
        packageName = "com.dreamplug.androidapp",
        name = "CRED",
        description = "CRED Payments & Rewards",
        apkFileType = ApkFileType.APKM_REQUIRED,
        appIconColor = 0x000000,
        signatures = setOf(
            "6ed23b474eac65e9a24ee55340853d662e004312ff4fdafc483329a0c80bd9f2",
        ),
        targets = listOf(
            AppTarget(
                version = "6.1.6.170",
                minSdk = 28,
            ),
            AppTarget(
                version = "6.1.4.157",
                minSdk = 28,
            ),
            AppTarget(
                version = "6.1.2.144",
                minSdk = 28,
            ),
            AppTarget(
                version = null,
                minSdk = 28,
                isExperimental = true,
            ),
        ),
    )
}
