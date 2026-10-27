package app.immersivekeyboard.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = "com.google.android.inputmethod.latin",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            // The hook only relies on Android framework method names, so other versions should work.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Same Gboard build that jasonwu1994/Gboard-patches 4.x targets.
            AppTarget(
                version = "18.5.4.993608717-release-arm64-v8a"
            ),
            // The build that jasonwu1994/Gboard-patches 3.x targets.
            AppTarget(
                version = "18.0.3.954559732-release-arm64-v8a"
            )
        )
    )
}
