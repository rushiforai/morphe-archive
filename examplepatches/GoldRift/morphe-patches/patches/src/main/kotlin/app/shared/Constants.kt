package app.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STRONG = Compatibility(
        name = "Strong",
        packageName = "io.strongapp.strong",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(
                version = "v6.2.2"
            )
        )
    )

}
