package app.aidan.patches.fizz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val FIZZ_PACKAGE_NAME = "com.ashtoncofer.Buzz"

val COMPATIBILITY_FIZZ = Compatibility(
    name = "Fizz",
    packageName = FIZZ_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x7F00FF,
    signatures = setOf(
        "622850867847ccb7a1371bc42c865b1137fa51bd19987dc81b53815c9a9817bf"
    ),
    targets = listOf(
        AppTarget(version = "1.54.0", minSdk = 23)
    )
)
