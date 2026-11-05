package com.torbenstriegel.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WETTERRADAR = Compatibility(
        name = "Weather&Radar",
        packageName = "de.wetteronline.wetterapp",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x10658E,
        targets = listOf(
            AppTarget(
                version = "2026.19"
            ),
            AppTarget(
                version = "2026.21",
                versionCode = 2324828
            )
        )
    )

    val COMPATIBILITY_SKAT = Compatibility(
        name = "Skat",
        packageName = "com.isarinteractive.skat.android.ad",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x870800,
        targets = listOf(
            AppTarget(
                version = "19.2.4"
            )
        )
    )

    val COMPATIBILITY_ONEFOOTBALL = Compatibility(
        name = "OneFootball",
        packageName = "de.motain.iliga",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00C853,
        targets = listOf(
            AppTarget(
                version = "15.145.0",
                versionCode = 1044999406
            ),
            AppTarget(
                version = "15.148.0",
                versionCode = 1045029590
            )
        )
    )

    val COMPATIBILITY_TORALARM = Compatibility(
        name = "Toralarm",
        packageName = "com.eisterhues_media_2",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x73B285,
        targets = listOf(
            AppTarget(
                version = "7.6.3",
                versionCode = 202609180
            )
        )
    )

    val COMPATIBILITY_NTV = Compatibility(
        name = "ntv",
        packageName = "de.lineas.lit.ntv.android",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFFCC00,
        targets = listOf(
            AppTarget(
                version = "8.5.7.1",
                versionCode = 586
            ),
            AppTarget(
                version = "8.6.0.1",
                versionCode = 589
            )
        )
    )

    val COMPATIBILITY_CHARGEPRICE = Compatibility(
        name = "Chargeprice",
        packageName = "fr.chargeprice.app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x007AFF,
        targets = listOf(
            AppTarget(
                version = "4.4.0",
                versionCode = 44000000
            )
        )
    )

    val COMPATIBILITY_PARK4NIGHT = Compatibility(
        name = "Park4Night",
        packageName = "fr.tramb.park4night",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(
                version = "7.1.62",
                versionCode = 378
            )
        )
    )
}