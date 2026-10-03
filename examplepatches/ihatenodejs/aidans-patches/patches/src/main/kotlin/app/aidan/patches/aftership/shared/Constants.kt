package app.aidan.patches.aftership.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val AFTERSHIP_PACKAGE_NAME = "com.aftership.AfterShip"

    val COMPATIBILITY_AFTERSHIP = Compatibility(
        name = "AfterShip",
        packageName = AFTERSHIP_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFD5B26,
        targets = listOf(
            AppTarget(
                version = "5.25.8",
                minSdk = 23
            )
        )
    )
}
