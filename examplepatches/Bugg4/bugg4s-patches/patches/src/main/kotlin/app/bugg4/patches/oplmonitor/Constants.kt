package app.bugg4.patches.oplmonitor

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_OPL_MONITOR = Compatibility(
        name = "OPL Monitor",
        packageName = "com.insigniadpfgmailcom.oplmonitor",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE54701,
        targets = listOf(
            AppTarget(
                version = "1.0.3.65",
                minSdk = 23
            )
        )
    )
}
