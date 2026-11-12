package app.vancedlight.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Target truth mirrors Morphe's own YouTube / YT Music blocks (same apps, same
// file types, signatures and colors), plus 21.41.525 experimental: the version
// this bundle is being proven on. Pins stay experimental until a version is
// verified on device; the patches themselves validate resources at patch time
// and fail loudly instead of shipping broken output.
val COMPATIBILITY_YOUTUBE = Compatibility(
    name = "YouTube",
    packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = setOf(
        // Android 13+
        "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
        // Android 7+
        "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
    ),
    targets = listOf(
        AppTarget(version = "21.41.525", minSdk = 29, isExperimental = true),
        AppTarget(version = "21.40.161", minSdk = 29, isExperimental = true),
        AppTarget(version = "21.39.522", minSdk = 29, isExperimental = true),
        AppTarget(version = "21.38.130", minSdk = 29, isExperimental = true),
        AppTarget(version = "21.28.208", minSdk = 29, isExperimental = true),
        AppTarget(version = "21.23.492", minSdk = 28, isExperimental = true),
        AppTarget(version = "21.20.405", minSdk = 28),
        AppTarget(version = "21.16.256", minSdk = 28),
        AppTarget(version = "20.51.39", minSdk = 28),
        AppTarget(version = "20.21.37", minSdk = 26)
    )
)

val COMPATIBILITY_YOUTUBE_MUSIC = Compatibility(
    name = "YouTube Music",
    packageName = "com.google.android.apps.youtube.music",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0000,
    signatures = setOf(
        // Android 13+
        "6a2f65ec694a6a632acdcb5080912a565f903d4b8d83f0eb8e44fbdf2660d8e1",
        // Android 7+
        "a2a1ad7ba7f41dfca4514e2afeb90691719af6d0fdbed4b09bbf0ed897701ceb"
    ),
    targets = listOf(
        AppTarget(version = "9.40.51", minSdk = 26, isExperimental = true),
        AppTarget(version = "9.39.52", minSdk = 26, isExperimental = true),
        AppTarget(version = "9.38.51", minSdk = 26, isExperimental = true),
        AppTarget(version = "9.20.53", minSdk = 26),
        AppTarget(version = "9.15.51", minSdk = 26)
    )
)

val COMPATIBILITY_TRADINGVIEW = Compatibility(
    name = "TradingView",
    packageName = "com.tradingview.tradingviewapp",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x131722,
    signatures = setOf(
        "44f047fc6b34b0ba0c491f825bb4e43770d2bc941220d290a70f3a8467aed601",
    ),
    targets = listOf(
        AppTarget(version = "1.20.86.0.1002565", minSdk = 26, isExperimental = true)
    )
)

