package app.aidan.patches.creditkarma.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val CREDIT_KARMA_PACKAGE_NAME = "com.creditkarma.mobile"

val COMPATIBILITY_CREDIT_KARMA = Compatibility(
    name = "Credit Karma",
    packageName = CREDIT_KARMA_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x008600,
    signatures = setOf(
        "f5ae9364524d92be9eb436eb7436d7c9efa9e1b4e823b0db6bc3989a4d84d0bf"
    ),
    targets = listOf(
        AppTarget(version = "26.40", minSdk = 32)
    )
)
