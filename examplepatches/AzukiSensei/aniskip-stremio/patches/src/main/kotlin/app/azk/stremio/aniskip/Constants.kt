package app.azk.stremio.aniskip

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val STREMIO_COMPATIBILITY = Compatibility(
        name = "Stremio",
        packageName = "com.stremio.one",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x5B67F1,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Experimental support for Stremio Android versions.",
            ),
        ),
    )
}
