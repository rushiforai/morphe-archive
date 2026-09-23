package app.epxec.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_Touch_The_Notch = Compatibility(
        name = "Touch The Notch", 
        packageName = "com.notch.touch", 
        apkFileType = ApkFileType.XAPK, 
        appIconColor = 0xFF0045,
        targets = listOf(
            AppTarget(
                version = "2.1.7", 
                versionCode = 117
            )
            
        )
    )

    val COMPATIBILITY_Decompile = Compatibility(
        name = "Decompile",
        packageName = "com.apktools.app.decompile",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "3.3.2",
                versionCode = 332
            )
        )
    )

    val COMPATIBILITY_Remindio = Compatibility(
        name = "Remindio",
        packageName = "dmytro.palamarchuk.dailyreminder",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "2.25.8",
                versionCode = 181
            )
        )
    )

    val COMPATIBILITY_Haloreelspro = Compatibility(
        name = "Halo Reels Pro",
        packageName = "com.halo.reels.movie.fast.pro",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "1.1.0",
                versionCode = 1100
            )
        )
    )

    val COMPATIBILITY_Freereels = Compatibility(
        name = "FreeReels",
        packageName = "com.freereels.app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "2.4.70",
                versionCode = 200470001
            )
        )
    )

    val COMPATIBILITY_Daylio = Compatibility(
        name = "Daylio",
        packageName = "net.daylio",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "1.69.2",
                versionCode = 276
            )
        )
    )

    val COMPATIBILITY_XEQ = Compatibility(
        name = "XEQ Equalizer",
        packageName = "com.frack.xeq",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "38.7.0",
                versionCode = 437
            )
        )
    )

    val COMPATIBILITY_Wavelet = Compatibility(
        name = "Wavelet",
        packageName = "com.pittvandewitt.wavelet",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "26.05",
                versionCode = 260508
            )
        )
    )

    val COMPATIBILITY_Todai = Compatibility(
        name = "Todaii Japanese",
        packageName = "mobi.eup.jpnews",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "5.5.5",
                versionCode = 100014427
            )
        )
    ) 

    val COMPATIBILITY_Wallet = Compatibility(
        name = "Wallet",
        packageName = "com.droid4you.application.wallet",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "9.3.10",
                versionCode = 90175
            )
        )
    ) 

    val COMPATIBILITY_Vaulty = Compatibility(
        name = "Vaulty",
        packageName = "com.theronrogers.vaultyfree",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "26.09.09",
                versionCode = 461225
            )
        )
    ) 

    val COMPATIBILITY_Mazii = Compatibility(
        name = "Mazii",
        packageName = "com.mazii.dictionary",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1234,
        targets = listOf(
            AppTarget(
                version = "6.8.53",
                versionCode = 20260904
            )
        )
    ) 

}
