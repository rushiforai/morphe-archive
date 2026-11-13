package app.olaelectric.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val OLA_PACKAGE_NAME = "com.olaelectric.companion"

    val COMPATIBILITY_OLA = Compatibility(
        name = "Ola Electric",
        packageName = OLA_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFFFF,
        targets = listOf(
            AppTarget(
                version = "5.4.1",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
            )
        )
    )
}
