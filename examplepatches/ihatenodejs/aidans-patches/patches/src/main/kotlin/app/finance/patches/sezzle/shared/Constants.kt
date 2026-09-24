package app.finance.patches.sezzle.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val SEZZLE_PACKAGE_NAME = "com.sezzle.sezzlemobile"

    val COMPATIBILITY_SEZZLE = Compatibility(
        name = "Sezzle",
        packageName = SEZZLE_PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5C2C94,
        targets = listOf(
            AppTarget(
                version = "5.3.9",
                minSdk = 24
            )
        )
    )
}
