package app.paresh.patches.sdmaidse.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SDMAIDSE = Compatibility(
        name = "SD Maid SE",
        packageName = "eu.darken.sdmse",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(version = "1.7.3-rc0")
        )
    )
}
