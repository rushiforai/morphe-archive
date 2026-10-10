package mightymich.morphe.patches.pl.mobimax.photex

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PhotexCompatibility {
    val PHOTEX = Compatibility(
        name = "Photex Companion",
        packageName = "pl.mobimax.photex",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = null, isExperimental = true)
        )
    )
}
