package semicoloncolonel.mobilestream.patches.yahoofinance.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Yahoo Finance",
        packageName = "com.yahoo.mobile.client.android.finance",
        description = "The Yahoo Finance app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6001D2,
        targets = listOf(AppTarget("26.22.2", versionCode = 1360050404))
    )
}
