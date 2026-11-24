package app.deadcrossing.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val PACKAGE_NAME = "com.feelingtouch.crossx"
    const val UNITY_ANDROID_ACTIVITY = "Lcom/feelingtouch/unityandroid/UnityAndroidActivity;"
    const val ORIGINAL_APK = "Dead Crossing 1.06 APK"

    val COMPATIBILITY = Compatibility(
        name = "Dead Crossing",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x71563B,
        targets = listOf(
            AppTarget(version = "1.06"),
        ),
    )
}
