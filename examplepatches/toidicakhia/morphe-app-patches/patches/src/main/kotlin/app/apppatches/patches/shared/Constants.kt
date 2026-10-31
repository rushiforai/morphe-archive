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

    // EZVIZ 7.6.1.0824 (version code 1961), distributed as an XAPK.
    val EZVIZ_COMPATIBILITY = Compatibility(
        name = "EZVIZ",
        packageName = "com.ezviz",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x00A0E9,
        targets = listOf(
            AppTarget(
                version = "7.6.1.0824",
                versionCode = 1961
            )
        )
    )

    // HTTP Sniffer 2.5.2-ad_mob (version code 170) and 2.4.9-ad_mob (167, last armv7 build),
    // distributed as XAPKs.
    val HTTPMOCK_COMPATIBILITY = Compatibility(
        name = "HTTP Sniffer",
        packageName = "com.anetcapture.mock",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(
                version = "2.5.2-ad_mob",
                versionCode = 170
            ),
            AppTarget(
                version = "2.4.9-ad_mob",
                versionCode = 167
            )
        )
    )

    // TeraBox 4.27.5 (version code 702), distributed as an XAPK.
    val TERABOX_COMPATIBILITY = Compatibility(
        name = "TeraBox",
        packageName = "com.dubox.drive",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x226DF6,
        signatures = setOf(
            "b75fd2b70084d7e0813b8f74dd74b62ab79b2aa0ce1372331a1841bd88eed993"
        ),
        targets = listOf(
            AppTarget(
                version = "4.27.5",
                versionCode = 702,
                minSdk = 23
            )
        )
    )

    // Universal Copy 7.1.0 (version code 104), distributed as an XAPK.
    val UNIVERSAL_COPY_COMPATIBILITY = Compatibility(
        name = "Universal Copy",
        packageName = "com.camel.corp.universalcopy",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4B5CBA,
        signatures = setOf(
            "b9e533d4e4bab571fb513666d485fbe32a208c02995208812ab5fcbeb9a085d8"
        ),
        targets = listOf(
            AppTarget(
                version = "7.1.0",
                versionCode = 104,
                minSdk = 29
            )
        )
    )

    // 1.1.1.1 6.38.11 (version code 5703), distributed as an APKM.
    val WARP_COMPATIBILITY = Compatibility(
        name = "1.1.1.1",
        packageName = "com.cloudflare.onedotonedotonedotone",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF48120,
        targets = listOf(
            AppTarget(
                version = "6.38.11",
                versionCode = 5703
            )
        )
    )
}
