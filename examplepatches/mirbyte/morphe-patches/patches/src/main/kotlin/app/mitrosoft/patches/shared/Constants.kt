package app.mitrosoft.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TRADINGVIEW = Compatibility(
        name = "TradingView",
        packageName = "com.tradingview.tradingviewapp",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2962FF,
        targets = listOf(
            AppTarget(
                version = "1.20.86.0.1002565"
            )
        )
    )

    val COMPATIBILITY_BLOOMBERG = Compatibility(
        name = "Bloomberg",
        packageName = "com.bloomberg.android.plus",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(version = "6.66.0.5604504"),
            AppTarget(version = "6.66.0.5604504.069af9ffeb"),
        )
    )
}
