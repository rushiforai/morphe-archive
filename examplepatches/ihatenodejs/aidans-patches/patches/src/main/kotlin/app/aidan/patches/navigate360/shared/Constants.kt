package app.aidan.patches.navigate360.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val NAVIGATE360_PACKAGE_NAME = "com.eab.se"

val COMPATIBILITY_NAVIGATE360 = Compatibility(
    name = "Navigate360 Student",
    packageName = NAVIGATE360_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0071CE,
    signatures = setOf(
        "7253620866df0a00048e7c1f43976992330e2fdb06f094d47fbf20045f56ec4b"
    ),
    targets = listOf(
        AppTarget(version = "26.19.22", minSdk = 31)
    )
)
