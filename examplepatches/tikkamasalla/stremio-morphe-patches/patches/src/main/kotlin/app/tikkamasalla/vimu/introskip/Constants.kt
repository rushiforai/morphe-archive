package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val VIMU_COMPATIBILITY = Compatibility(
        name = "Vimu",
        packageName = "net.gtvbox.videoplayer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1F6FEB,
        targets = listOf(
            AppTarget(
                version = "12.00 ST",
                isExperimental = true,
                description = "Targets Vimu 12.00. Patch your own copy of the app.",
            ),
            AppTarget(
                version = "12.00",
                isExperimental = true,
                description = "Targets Vimu 12.00. Patch your own copy of the app.",
            ),
        ),
    )
}
