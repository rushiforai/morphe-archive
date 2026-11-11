package app.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_STRONG = Compatibility(
        name = "Strong",
        packageName = "io.strongapp.strong",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(
                version = "v6.2.8"
            )
        )
    )

    val COMPATIBILITY_HIPAINT = Compatibility(
        name = "HiPaint",
        packageName = "com.aige.hipaint",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget (
              version = null,
              isExperimental = true
            )
        )
    )

}
