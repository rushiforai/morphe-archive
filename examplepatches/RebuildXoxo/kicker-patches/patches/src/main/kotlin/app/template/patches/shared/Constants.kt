package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KICKER = Compatibility(
        name = "kicker",
        packageName = "com.netbiscuits.kicker",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE30613,
        targets = listOf(
            AppTarget(
                version = "7.15.1",
            ),
        ),
    )
}
