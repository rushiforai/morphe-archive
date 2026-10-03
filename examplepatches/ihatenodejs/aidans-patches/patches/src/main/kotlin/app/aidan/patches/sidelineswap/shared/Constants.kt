package app.aidan.patches.sidelineswap.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val SIDELINESWAP_PACKAGE_NAME = "com.sidelineswap.android"

val COMPATIBILITY_SIDELINESWAP = Compatibility(
    name = "SidelineSwap",
    packageName = SIDELINESWAP_PACKAGE_NAME,
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0x02C874,
    signatures = setOf(
        "e434334ea79d8702a5d023ce7bfae4da9fa5539796cb9e0ba515cb471528697f"
    ),
    targets = listOf(
        AppTarget(version = "1.52.0", minSdk = 28)
    )
)
