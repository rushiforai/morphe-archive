package app.belkart.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Exact package name of Belkart Pay
    const val BELKART_PAY_PACKAGE = "com.belkartpay.belkartpay"

    // App name must match the commit scope for changelog parser: fix(Белкарт Pay): ...
    val COMPATIBILITY_BELKART_PAY = Compatibility(
        name = "Белкарт Pay",
        packageName = BELKART_PAY_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A0E3,
        targets = listOf(
            AppTarget(
                version = "00.01.10",
                minSdk = 30
            )
        )
    )
}
