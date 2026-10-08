package dev.solvo37.vkvideopatches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    // GitHub Actions rewrites this to the newest version that passed the full
    // compatibility gate before compiling the public Morphe bundle.
    private const val VERIFIED_VERSION = "1.165"

    val VK_VIDEO = Compatibility(
        name = "VK Video",
        packageName = "com.vk.vkvideo",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        targets = listOf(
            AppTarget(version = VERIFIED_VERSION),
            // Keep future versions available only as an explicit experimental target.
            AppTarget(version = null, isExperimental = true)
        )
    )
}
