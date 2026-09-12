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

}
