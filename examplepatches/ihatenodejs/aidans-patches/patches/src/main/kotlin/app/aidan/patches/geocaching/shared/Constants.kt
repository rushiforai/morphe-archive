package app.aidan.patches.geocaching.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val GEOCACHING_PACKAGE_NAME = "com.groundspeak.geocaching.intro"

val COMPATIBILITY_GEOCACHING = Compatibility(
    name = "Geocaching",
    packageName = GEOCACHING_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x007D46,
    signatures = setOf(
        "7f000458070a8272e5960f2b3c9d3348372f31b0e600c86af34fc06e85f8db8c",
        "6959a7790bff42cc28fbe41c20d457401e32f4854f414dbc390de9f1529c9295"
    ),
    targets = listOf(
        AppTarget(version = "10.24.0", minSdk = 31)
    )
)
