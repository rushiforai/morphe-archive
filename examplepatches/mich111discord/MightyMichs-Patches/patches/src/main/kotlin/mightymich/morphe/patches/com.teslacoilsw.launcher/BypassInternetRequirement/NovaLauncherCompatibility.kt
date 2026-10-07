package mightymich.morphe.patches.com.teslacoilsw.launcher.BypassInternetRequirement

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object NovaLauncherCompatibility {
    val NOVA_LAUNCHER = Compatibility(
        name = "Nova Launcher",
        packageName = "com.teslacoilsw.launcher",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x070437,
        targets = listOf(
            AppTarget(
                version = 8.8.9,
                isExperimental = false
            )
        )
    )
}
