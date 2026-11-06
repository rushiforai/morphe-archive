package app.ru_apps.banks.mirpay

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MIR_PAY = Compatibility(
        name = "Mir Pay",
        packageName = "ru.nspk.mirpay",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A5DAD,
        targets = listOf(
            AppTarget(
                version = "1.64.5.350",
                versionCode = 405,
            ),
        ),
    )
}
