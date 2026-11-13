package app.vi.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val VI_PACKAGE_NAME = "com.mventus.selfcare.activity"

    val COMPATIBILITY_VI = Compatibility(
        name = "Vi App",
        packageName = VI_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE60000,
        targets = listOf(
            AppTarget(
                version = "10.33.1",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
            )
        )
    )
}
