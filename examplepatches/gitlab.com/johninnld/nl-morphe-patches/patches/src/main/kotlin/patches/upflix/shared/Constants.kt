package patches.upflix.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Upflix Streaming Guide 5.12.10 (423), Titanium/Appcelerator, shipped as an APKS bundle. */
internal val COMPATIBILITY_UPFLIX = Compatibility(
    name = "upflix",
    packageName = "com.douglas.upflix",
    apkFileType = ApkFileType.APKS,
    appIconColor = 0xE50914,
    signatures = setOf(
        "f353b78a9eb823d58cd45fc3ba1afba336346969c8b78809b91638444ec39007",
    ),
    targets = listOf(
        AppTarget(
            version = "5.12.10",
            versionCode = 423,
            minSdk = 29,
        ),
    ),
)
