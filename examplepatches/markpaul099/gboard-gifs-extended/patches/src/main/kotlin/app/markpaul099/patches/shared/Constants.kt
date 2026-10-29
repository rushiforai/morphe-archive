package app.markpaul099.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"

    const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = GBOARD_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4888F4,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Version the patches were developed against.
            AppTarget(
                version = "18.5.4.993608717-release-arm64-v8a"
            )
        )
    )
}
