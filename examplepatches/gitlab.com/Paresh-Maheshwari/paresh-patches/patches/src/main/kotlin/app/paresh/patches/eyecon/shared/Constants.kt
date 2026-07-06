package app.paresh.patches.eyecon.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_EYECON = Compatibility(
        name = "Eyecon Caller ID & Spam Block",
        packageName = "com.eyecon.global",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x085CE8,
        targets = listOf(
            AppTarget(version = "4.2026.04.05.1300")
        )
    )
}
