package de.deconta.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val ROSSMANN_5_11_1 = "5.11.1"

    val COMPATIBILITY_ROSSMANN = Compatibility(
        name = "Rossmann",
        packageName = "de.rossmann.app.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE30613,
        targets = listOf(
            AppTarget(
                version = ROSSMANN_5_11_1,
                versionCode = 421000110,
            ),
        ),
    )
}
