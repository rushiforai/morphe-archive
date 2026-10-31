package app.morphe.patches.vkvideo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val VK_VIDEO_PACKAGE_NAME = "com.vk.vkvideo"

    val COMPATIBILITY_VK_VIDEO = Compatibility(
        name = "VK Video",
        packageName = VK_VIDEO_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        targets = listOf(
            AppTarget(
                version = "1.168",
                minSdk = 26,
                isExperimental = false
            )
        )
    )
}
