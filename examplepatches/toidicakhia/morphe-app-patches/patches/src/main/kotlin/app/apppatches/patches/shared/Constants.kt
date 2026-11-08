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
        appIconColor = 0x0A995B,
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
        appIconColor = 0xFFFFFF,
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
        appIconColor = 0x673AB7,
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

    // Universal Copy 7.2.0 (version code 106), distributed as an XAPK.
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
                version = "7.2.0",
                versionCode = 106,
                minSdk = 26
            )
        )
    )

    // VTVGo 12.11.05 (version code 260933), distributed as XAPK/APKM bundles with
    // arm64-v8a, armeabi-v7a and x86_64 splits (Android 7.0+).
    val VTVGO_COMPATIBILITY = Compatibility(
        name = "VTVGo",
        packageName = "vn.vtv.vtvgo",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xDC0000,
        signatures = setOf(
            "651a068b47d26e1a79ba6fcdae64eab8b512bde27d1ca60e20686cf06c94f227"
        ),
        targets = listOf(
            AppTarget(
                version = "12.11.05",
                versionCode = 260933,
                minSdk = 24
            )
        )
    )

    // 1.1.1.1 6.38.11 (version code 5703), distributed as an APKM.
    val WARP_COMPATIBILITY = Compatibility(
        name = "1.1.1.1",
        packageName = "com.cloudflare.onedotonedotonedotone",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF16F69,
        targets = listOf(
            AppTarget(
                version = "6.38.11",
                versionCode = 5703
            )
        )
    )
}
