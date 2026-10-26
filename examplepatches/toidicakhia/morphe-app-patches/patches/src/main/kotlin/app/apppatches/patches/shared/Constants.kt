package app.apppatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // NetMonster 4.0.5 (version code 277), distributed as an APKM.
    // Keep the version pinned to the build the fingerprints were verified against.
    val NETMONSTER_COMPATIBILITY = Compatibility(
        name = "NetMonster",
        packageName = "cz.mroczis.netmonster",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(
                version = "4.0.5",
                versionCode = 277
            )
        )
    )

    // HTTP Sniffer 2.5.2-ad_mob (version code 170), distributed as an XAPK.
    val HTTPMOCK_COMPATIBILITY = Compatibility(
        name = "HTTP Sniffer",
        packageName = "com.anetcapture.mock",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(
                version = "2.5.2-ad_mob",
                versionCode = 170
            )
        )
    )
}
