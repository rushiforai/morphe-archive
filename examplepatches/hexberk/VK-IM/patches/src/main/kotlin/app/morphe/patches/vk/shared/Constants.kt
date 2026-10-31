package app.morphe.patches.vk.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val VK_PACKAGE_NAME = "com.vk.im"

    val COMPATIBILITY_VK = Compatibility(
        name = "VK Messenger",
        packageName = VK_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        targets = listOf(
            AppTarget(
                version = "1.332",
                minSdk = 28,
                isExperimental = false
            )
        )
    )
}
