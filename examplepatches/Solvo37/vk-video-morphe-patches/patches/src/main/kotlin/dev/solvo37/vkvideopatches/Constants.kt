package dev.solvo37.vkvideopatches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val VK_VIDEO = Compatibility(
        name = "VK Video",
        packageName = "com.vk.vkvideo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        targets = listOf(
            AppTarget(version = "1.163"),
            // Future versions are compatibility-tested in CI with --force before release.
            AppTarget(version = null, isExperimental = true)
        )
    )
}
