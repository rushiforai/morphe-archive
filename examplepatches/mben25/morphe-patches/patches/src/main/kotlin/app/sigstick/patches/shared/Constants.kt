package app.sigstick.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Verified against the decompiled `apps/sigstick/5.25.0_sm`
     * (apktool.yml: versionCode 242, versionName 5.25.0). Universal APK (arm64 + armv7 libs).
     */
    val COMPATIBILITY_SIGSTICK = Compatibility(
        name = "SigStick",
        packageName = "com.sigstick.myapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x527AE9,
        targets = listOf(
            AppTarget(version = "5.25.0"),
        ),
    )
}
