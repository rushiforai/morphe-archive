package app.aidan.patches.adobereader.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val ADOBE_READER_PACKAGE_NAME = "com.adobe.reader"

val COMPATIBILITY_ADOBE_READER = Compatibility(
    name = "Adobe Reader",
    packageName = ADOBE_READER_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xFA0F00,
    signatures = setOf(
        "b6dd0562256487fcd6c98cde137858ef50d9adb9f9cd2f1ca58c5357efdf0faf"
    ),
    targets = listOf(
        AppTarget(version = "26.9.2.50367", minSdk = 28)
    )
)
