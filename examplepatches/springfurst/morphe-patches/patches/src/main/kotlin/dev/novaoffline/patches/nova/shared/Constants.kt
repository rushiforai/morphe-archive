package dev.novaoffline.patches.nova.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val NOVA_LAUNCHER = Compatibility(
        name = "Nova Launcher",
        packageName = "com.teslacoilsw.launcher",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE53935,
        targets = listOf(
            AppTarget(version = "89700 (8.9.7)", versionCode = 89700),
        ),
    )
}
