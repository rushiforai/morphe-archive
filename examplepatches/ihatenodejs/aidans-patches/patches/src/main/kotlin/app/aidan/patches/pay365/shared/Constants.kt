package app.aidan.patches.pay365.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val PAY_365_PACKAGE_NAME = "com.avinside"

val COMPATIBILITY_365_PAY = Compatibility(
    name = "365 Pay",
    packageName = PAY_365_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x00A859,
    signatures = setOf(
        "8709f6fd781c4ba9a4f50df8c44f8c5a4ccb2fd2b114b71912e79eacf8857b1d"
    ),
    targets = listOf(
        AppTarget(version = "10.2605.0", minSdk = 27),
        AppTarget(version = "10.2606.1", minSdk = 27)
    )
)
