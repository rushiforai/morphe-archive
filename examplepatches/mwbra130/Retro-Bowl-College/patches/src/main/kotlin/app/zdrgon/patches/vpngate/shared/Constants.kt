package app.zdrgon.patches.vpngate.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_VPN_GATE = Compatibility(
        name = "VPN Gate",
        packageName = "com.giamping.sevpn",
        // Matsen's source file is an APKM bundle: Morphe merges the split
        // bundle (base + config.arm64_v8a/en/xxhdpi) into a single APK
        // before patching.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "20261111"),
        ),
    )
}
