package app.braintropy.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RP_HYPERTROPHY = Compatibility(
        name = "RP Hypertrophy",
        packageName = "com.rp.hypertrophy",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xEC0915,
        targets = listOf(
            AppTarget(
                version = "1.6.0"
            )
        )
    )

    val COMPATIBILITY_WAKING_UP = Compatibility(
        name = "Waking Up",
        packageName = "org.wakingup.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1C1B33,
        targets = listOf(
            AppTarget(
                version = "3.24.1"
            ),
            AppTarget(
                version = "3.27.0"
            )
        )
    )
}
