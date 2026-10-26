package app.markpaul099.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = "com.google.android.inputmethod.latin",
        // APKMirror ships Gboard as an APK bundle.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4888F4,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Version the patch was developed against.
            AppTarget(
                version = "18.3.2.977415014-release-arm64-v8a"
            )
        )
    )
}
