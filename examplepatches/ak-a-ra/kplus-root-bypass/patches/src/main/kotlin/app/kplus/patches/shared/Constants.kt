package app.kplus.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_KPLUS = Compatibility(
        name = "K PLUS",
        packageName = "com.kasikorn.retail.mbanking.wap",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(version = "6.1.0")
        )
    )
}
