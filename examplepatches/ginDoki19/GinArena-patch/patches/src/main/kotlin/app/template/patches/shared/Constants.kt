package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Morphe patch metadata has no dedicated stock-app download field. Exact stock download
     * links and file hashes intentionally live in the project README instead of user-facing
     * descriptions, so Manager's version cards stay readable.
     */

    /** SHA-256 of the official Vicky Bonick signing certificate used by 1DM 20.0 (30257). */
    private const val ONEDM_SIGNER_SHA256 = "9f48b6b2741fe7e4f78ea7375f469e99086c07f45a6c7f38407f0483d2451ce7"

    /** SHA-256 of the official signing certificate used by CRICFy TV 7.3 (53). */
    private const val CRICFY_SIGNER_SHA256 = "f2cd86fcbc92461a3300cec47b6f74d20f0c89dd7162ecc333b3dd2c16e79841"

    /** SHA-256 of the official signing certificate used by CricZ TV 7.3 (10). */
    private const val CRICZ_SIGNER_SHA256 = "9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2"

    /** SHA-256 of the official signing certificate used by PlayZ TV 2.3.1 (8). */
    private const val PLAYZ_TV_SIGNER_SHA256 = "05ecca660d7656ce2c65a878c9e49a169558c2a44976f26c369393eccf9dc44b"

    /** SHA-256 of the official signing certificate used by MX Player (com.mxtech.videoplayer.ad). */
    private const val MXPLAYER_SIGNER_SHA256 = "0d9b4c778672e753d45aba4f10df31e1d10bf75b1245469131ef01b82f0f91b6"

    val COMPATIBILITY_ONEDM = Compatibility(
        name = "1DM",
        packageName = "idm.internet.download.manager",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x43A047,
        signatures = setOf(ONEDM_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "20.0",
                versionCode = 30257,
                minSdk = 24,
                description = "Universal APKM (160-640 dpi, Android 7.0+), build 30257"
            )
        )
    )

    val COMPATIBILITY_CRICFY_TV = Compatibility(
        name = "CRICFy TV",
        packageName = "com.cricfytv.sports",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xEE4326,
        signatures = setOf(CRICFY_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "7.3",
                versionCode = 53,
                minSdk = 24,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 7.0+), build 53"
            )
        )
    )

    val COMPATIBILITY_CRICZ_TV = Compatibility(
        name = "CricZ TV",
        packageName = "com.pro.cricztv",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x08C7D6,
        signatures = setOf(CRICZ_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "7.3",
                versionCode = 10,
                minSdk = 23,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 10"
            )
        )
    )

    val COMPATIBILITY_PLAYZ_TV = Compatibility(
        name = "PlayZ TV",
        packageName = "com.playz.tv",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A6A6,
        signatures = setOf(PLAYZ_TV_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "2.3.1",
                versionCode = 8,
                minSdk = 23,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 8"
            )
        )
    )

    val COMPATIBILITY_MX_PLAYER_AD = Compatibility(
        name = "MX Player",
        packageName = "com.mxtech.videoplayer.ad",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0080FF,
        signatures = setOf(MXPLAYER_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "3.4.1",
                versionCode = 2001003551,
                minSdk = 24,
                description = "Standalone APK (arm64-v8a / armeabi-v7a, Android 7.0+), build 2001003551"
            ),
        )
    )
}
