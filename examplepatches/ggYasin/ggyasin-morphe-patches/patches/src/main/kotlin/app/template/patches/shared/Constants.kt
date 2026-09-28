package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val ZEN_SMS_COMPATIBILITY = Compatibility(
        name = "ZenSMS",
        packageName = "com.zensms.app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x0066CC,
        targets = listOf(
            AppTarget(
                version = "1.2.04",
                versionCode = 141,
            ),
        ),
    )
}
