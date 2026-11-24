package app.aidan.patches.nhl.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val NHL_PACKAGE_NAME = "com.nhl.gc1112.free"

val COMPATIBILITY_NHL = Compatibility(
    name = "NHL",
    packageName = NHL_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x000000,
    signatures = setOf(
        "2309209340875f6f8a008ea25dbd98d8a03e482704d43211933d2b9a91923aff"
    ),
    targets = listOf(
        AppTarget(
            version = "17.2.0",
            minSdk = 32
        )
    )
)
