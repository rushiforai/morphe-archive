package app.unison.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DEEZER = Compatibility(
        name = "Deezer",
        packageName = "deezer.android.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xA238FF,
        targets = listOf(
            AppTarget(version = "9.0.26.3"),
        ),
    )
}
