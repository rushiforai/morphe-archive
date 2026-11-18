package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val ANDROPODS_COMPATIBILITY = Compatibility(
        name = "AndroPods",
        description = "AirPods battery status and controls on Android.",
        packageName = "pro.vitalii.andropods",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1DA1F2,
        targets = listOf(AppTarget(version = "1.5.30", versionCode = 86)),
    )
}
