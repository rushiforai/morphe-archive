package mightymich.morphe.patches.pl.mobimax.cameraopus

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object CameraOpusCompatibility {
    val CAMERA_OPUS = Compatibility(
        name = "Camera Opus Companion",
        packageName = "pl.mobimax.cameraopus",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722, // Orange color
        targets = listOf(
            AppTarget(
                version = "1.2.21",
                isExperimental = true
            )
        )
    )
}
