// Ported from Solvo37/VK-Video-Morphe-Patches (GPLv3), dev/solvo37/vkvideopatches/Constants.kt.
package app.ru_apps.vkvideo

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
            AppTarget(version = "1.165"),
            // Verified 2026-10-08 against a fresh RuStore download: same split0+split1(lib)
            // merge technique, all 15 default-on patches applied cleanly with --force.
            AppTarget(version = "1.163"),
            // Future versions are compatibility-tested in CI with --force before release.
            AppTarget(version = null, isExperimental = true)
        )
    )
}
