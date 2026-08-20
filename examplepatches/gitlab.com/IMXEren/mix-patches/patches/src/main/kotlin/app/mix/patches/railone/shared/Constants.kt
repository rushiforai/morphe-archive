package app.mix.patches.railone.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_RAILONE = Compatibility(
        name = "RailOne",
        packageName = "org.cris.aikyam",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "2.1.62",
            )
        )
    )
}