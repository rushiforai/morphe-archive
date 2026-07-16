package app.jouss.patches.protonvpn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PROTONVPN = Compatibility(
        name = "Proton VPN",
        packageName = "ch.protonvpn.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6D4AFF,
        targets = listOf(
            AppTarget(version = "5.19.16.0")
        )
    )
}
