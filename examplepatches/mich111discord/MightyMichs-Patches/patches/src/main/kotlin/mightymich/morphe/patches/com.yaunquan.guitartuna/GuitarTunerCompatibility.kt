package mightymich.morphe.patches.com.yaunquan.guitartuna

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object GuitarTunerCompatibility {
    val GUITAR_TUNER = Compatibility(
        name = "Guitar Tuner",
        packageName = "com.ovelin.guitartuna",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "7.102.0")
        )
    )
}
