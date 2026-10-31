package app.morphe.patches.vk.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val VK_PACKAGE_NAME = "com.vkontakte.android"

    val COMPATIBILITY_VK = Compatibility(
        name = "VKontakte",
        packageName = VK_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        targets = listOf(
            AppTarget(
                version = "8.201",
                minSdk = 26,
                isExperimental = false
            ),
            AppTarget(
                version = "8.200",
                minSdk = 26,
                isExperimental = false
            ),
            AppTarget(
                version = "8.195",
                minSdk = 26,
                isExperimental = false
            )
        )
    )
}
