package app.uakino.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_UAKINO = Compatibility(
        name = "UAKino",
        packageName = "ua.kino",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            // Перевірена версія (versionCode 28).
            AppTarget(version = "1.15"),
            // Новіші версії: fingerprints спираються на рядки, тож, імовірно, працюватимуть.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
