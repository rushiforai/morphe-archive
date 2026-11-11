package app.aapam.patches.indwealth.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_INDWEALTH = Compatibility(
        packageName = "in.indwealth",
        name = "INDmoney",
        description = "INDmoney: Stocks, Mutual Funds & Wealth",
        apkFileType = ApkFileType.APKM_REQUIRED,
        appIconColor = 0x00A0E3,
        signatures = setOf(
            "fcf4876f0fc649cac0ca0280a07b188c62511a6a526d116c2cfeb2428da486c8",
        ),
        targets = listOf(
            AppTarget(
                version = "9.9.92",
                minSdk = 24,
            ),
            AppTarget(
                version = null,
                minSdk = 24,
                isExperimental = true,
            ),
        ),
    )
}
