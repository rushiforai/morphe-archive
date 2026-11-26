package me.toidicakhia.patches.shared

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

    // TeraBox 4.29.0 (version code 710), distributed as an APKCube/APKM bundle
    // with arm64-v8a and armeabi-v7a splits (Android 6.0+).
    val TERABOX_COMPATIBILITY = Compatibility(
        name = "TeraBox",
        packageName = "com.dubox.drive",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x226DF6,
        signatures = setOf(
            "b75fd2b70084d7e0813b8f74dd74b62ab79b2aa0ce1372331a1841bd88eed993"
        ),
        targets = listOf(
            AppTarget(
                version = "4.29.0",
                versionCode = 710,
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

    // VTVGo 12.11.19 (version code 260938), distributed as XAPK/APKM bundles with
    // arm64-v8a, armeabi-v7a and x86_64 splits (Android 12L+).
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
                version = "12.11.19",
                versionCode = 260938,
                minSdk = 32
            )
        )
    )

    // Locket Widget 1.247.1 (version code 632), distributed as an XAPK/APKM
    // with a base APK plus config.arm64_v8a, config.en and config.xxhdpi splits.
    val LOCKET_COMPATIBILITY = Compatibility(
        name = "Locket Widget",
        packageName = "com.locket.Locket",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFFB201,
        signatures = setOf(
            "f7dd2c755cbbdf342b216c453e76e2ffcb34d688e5f91499bec0341648cbcb16"
        ),
        targets = listOf(
            AppTarget(
                version = "1.247.1",
                versionCode = 632,
                minSdk = 27
            )
        )
    )

    // WeDJ 1.1.4.5 (version code 1145), distributed as an APKM with arm64-v8a and
    // armeabi-v7a splits (Android 13+).
    val WEDJ_COMPATIBILITY = Compatibility(
        name = "WeDJ",
        packageName = "com.pioneerdj.WeDJ",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x007CFC,
        signatures = setOf(
            "f17221c501b8a3b13a6903419fe9afd62653c5898f6c80be698f9e10ade998c1"
        ),
        targets = listOf(
            AppTarget(
                version = "1.1.4.5",
                versionCode = 1145,
                minSdk = 33,
                description = "Latest release; requires Android 13+."
            )
        )
    )

    // WeDJ 1.1.1.3 (version code 1113), the last release that runs on older
    // Android versions (Android 5.0+). Use this build on Android 9-12: the
    // 1.1.4.5 build requires Android 13 and its native engine needs Android 11+
    // libc unwind symbols.
    val WEDJ_LEGACY_COMPATIBILITY = Compatibility(
        name = "WeDJ",
        packageName = "com.pioneerdj.WeDJ",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x007CFC,
        signatures = setOf(
            "f17221c501b8a3b13a6903419fe9afd62653c5898f6c80be698f9e10ade998c1"
        ),
        targets = listOf(
            AppTarget(
                version = "1.1.1.3",
                versionCode = 1113,
                minSdk = 28,
                description = "Use on Android 9-12."
            )
        )
    )

    // Proxyman 1.33.0 (version code 70), distributed as an XAPK with a base APK
    // plus config.arm64_v8a, config.en, config.fr and config.xxhdpi splits
    // (Android 12L+).
    val PROXYMAN_COMPATIBILITY = Compatibility(
        name = "Proxyman",
        packageName = "com.proxyman.proxymanandroid",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4F46E5,
        targets = listOf(
            AppTarget(
                version = "1.33.0",
                versionCode = 70,
                minSdk = 32
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
