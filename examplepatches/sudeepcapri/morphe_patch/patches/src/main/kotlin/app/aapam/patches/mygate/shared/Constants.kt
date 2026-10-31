package app.aapam.patches.mygate.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MYGATE = Compatibility(
        packageName = "com.mygate.user",
        name = "MyGate",
        description = "MyGate Community & Security App",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x00A0E3,
        targets = listOf(
            AppTarget(
                version = "7.37.0",
                minSdk = 24,
            ),
            AppTarget(
                version = "7.38.2",
                minSdk = 24,
            ),
            AppTarget(
                version = "7.39.0",
                minSdk = 24,
                ),
        ),
    )
}
