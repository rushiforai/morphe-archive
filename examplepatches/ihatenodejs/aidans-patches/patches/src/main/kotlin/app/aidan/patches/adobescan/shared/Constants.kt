package app.aidan.patches.adobescan.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val ADOBE_SCAN_PACKAGE_NAME = "com.adobe.scan.android"

val COMPATIBILITY_ADOBE_SCAN = Compatibility(
    name = "Adobe Scan",
    packageName = ADOBE_SCAN_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1473E6,
    signatures = setOf(
        "b6dd0562256487fcd6c98cde137858ef50d9adb9f9cd2f1ca58c5357efdf0faf"
    ),
    targets = listOf(
        AppTarget(version = "26.09.25", minSdk = 32)
    )
)
