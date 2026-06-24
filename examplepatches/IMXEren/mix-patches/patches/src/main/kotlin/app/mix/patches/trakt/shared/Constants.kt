package app.mix.patches.trakt.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_TRAKT = Compatibility(
        name = "Trakt",
        packageName = "tv.trakt.trakt",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "3.4.1",
            )
        )
    )
}
