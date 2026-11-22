package app.akkay.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ESTRONGS = Compatibility(
        name = "ES File Explorer",
        packageName = "com.estrongs.android.pop",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x228B22,
        targets = listOf(
            AppTarget(
                version = "4.4.3.9"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )

    val COMPATIBILITY_BATTERYGURU = Compatibility(
        name = "Battery Guru",
        packageName = "com.paget96.batteryguru",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x146478,
        targets = listOf(
            AppTarget(
                version = "2.5.1.1"
            )
        )
    )

    val COMPATIBILITY_ADGUARD = Compatibility(
        name = "AdGuard",
        packageName = "com.adguard.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x67B279,
        targets = listOf(
            AppTarget(
                version = "4.17.0"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
