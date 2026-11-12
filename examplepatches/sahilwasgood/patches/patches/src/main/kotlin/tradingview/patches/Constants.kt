package tradingview.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_TRADINGVIEW = Compatibility(
    name = "TradingView",
    packageName = "com.tradingview.tradingviewapp",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x131722,
    targets = listOf(
        AppTarget(version = "1.20.86.0.1002565", minSdk = 26),
        AppTarget(version = "1.20.85.0.1002535", minSdk = 26),
        AppTarget(version = "1.20.84.0.1002505", minSdk = 26),
        AppTarget(version = "1.20.83.0.1002475", minSdk = 26),
        AppTarget(version = "1.20.82.0.1002445", minSdk = 26),
        AppTarget(version = "1.20.81.1.1002420", minSdk = 26),
        AppTarget(version = "1.20.81.0.1002415", minSdk = 26),
        AppTarget(version = "1.20.80.0.1002385", minSdk = 26),
        AppTarget(version = "1.20.75.0.1002235", minSdk = 26),
        AppTarget(version = "1.20.74.0.1002205", minSdk = 26),
        AppTarget(version = "1.20.70.0.1002085", minSdk = 26),
    )
)
