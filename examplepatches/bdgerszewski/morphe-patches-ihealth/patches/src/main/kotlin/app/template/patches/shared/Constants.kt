package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IHEALTH = Compatibility(
        name = "iHealth MyVitals",
        packageName = "com.ihealthlabs.MyVitalsPro",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x00AEEF,
        targets = listOf(
            AppTarget(version = "4.14.5")
        )
    )

    val COMPATIBILITY_MULTITIMER = Compatibility(
        name = "MultiTimer - Multiple Timers",
        packageName = "com.persapps.multitimer",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "1.12")
        )
    )

    val COMPATIBILITY_CLOCK = Compatibility(
        name = "OnePlus Clock",
        packageName = "com.oneplus.deskclock",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "16.13.2")
        )
    )
}
