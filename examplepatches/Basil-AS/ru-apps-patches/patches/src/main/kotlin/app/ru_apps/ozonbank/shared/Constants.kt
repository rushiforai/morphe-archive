// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozonbank/shared/Constants.kt.
package app.ru_apps.ozonbank.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_OZON_BANK_CURRENT = Compatibility(
        name = "Ozon Bank",
        packageName = "ru.ozon.fintech.finance",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x005BFF,
        targets = listOf(
            AppTarget(
                version = "19.37.0",
                versionCode = 16030352,
                minSdk = 26,
            ),
            AppTarget(
                version = "19.31.0",
                versionCode = 16030335,
                minSdk = 26,
            ),
        ),
    )
}
