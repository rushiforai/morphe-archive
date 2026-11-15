package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Morphe patch metadata has no dedicated stock-app download field. Exact stock download
     * links and file hashes intentionally live in the project README instead of user-facing
     * descriptions, so Manager's version cards stay readable.
     */

    /** SHA-256 of the official Vicky Bonick signing certificate used by 1DM 20.0 (30257). */
    private const val ONEDM_SIGNER_SHA256 = "9f48b6b2741fe7e4f78ea7375f469e99086c07f45a6c7f38407f0483d2451ce7"

    /** SHA-256 of the official signing certificate used by CRICFy TV 7.4 (54). */
    private const val CRICFY_SIGNER_SHA256 = "f2cd86fcbc92461a3300cec47b6f74d20f0c89dd7162ecc333b3dd2c16e79841"

    /** SHA-256 of the official signing certificate used by CricZ TV 7.3 (10). */
    private const val CRICZ_SIGNER_SHA256 = "9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2"

    /** SHA-256 of the official signing certificate used by PlayZ TV 2.3.1 (8). */
    private const val PLAYZ_TV_SIGNER_SHA256 = "05ecca660d7656ce2c65a878c9e49a169558c2a44976f26c369393eccf9dc44b"

    /** SHA-256 of the official signing certificate used by MX Player (com.mxtech.videoplayer.ad). */
    private const val MXPLAYER_SIGNER_SHA256 = "0d9b4c778672e753d45aba4f10df31e1d10bf75b1245469131ef01b82f0f91b6"

    /** SHA-256 of the official signing certificate used by SK Tech TV 2.7 (17).
     *  Identical to CRICZ_SIGNER_SHA256 — same developer key. */
    private const val SK_TECH_SIGNER_SHA256 = "9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2"

    /** SHA-256 of the official signing certificate used by Playfy TV 1.7 (8). */
    private const val PLAYFY_TV_SIGNER_SHA256 = "38cde288f060fa8f476ab6811ff215767c35117bf6248fd8ad157cd4566898cc"

    /** SHA-256 of the official WPS Office signing certificate (CN "KSO Agent", Zhuhai Kingsoft). */
    private const val WPS_OFFICE_SIGNER_SHA256 = "643990878d3ca83952a5be5f3e58d9f8bb6cdc57bf0f228700212071c68db3d7"

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
                version = "7.4",
                versionCode = 54,
                minSdk = 24,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 7.0+), build 54"
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

    /** Signing certificate of the tested CrexiFy TV 4.5 (12) universal APK. */
    val COMPATIBILITY_CREXIFY_TV = Compatibility(
        name = "CrexiFy TV",
        packageName = "com.crexify.tv",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x08C7D6,
        signatures = setOf("17e2ae241663794ce890f350e1e0d884c59727418bac22518a62ac2e66131062"),
        targets = listOf(
            AppTarget(
                version = "4.5",
                versionCode = 12,
                minSdk = 23,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 12"
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
            AppTarget(
                version = "3.4.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2001003553, SupportedAbi.ARMEABI_V7A to 2001003553),
                minSdk = 24,
                description = "Standalone APK (arm64-v8a / armeabi-v7a, Android 7.0+), build 2001003553"
            ),
        )
    )

    val COMPATIBILITY_SK_TECH_TV = Compatibility(
        name = "SK Tech TV",
        packageName = "com.live.sktechtv",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x08C7D6,
        signatures = setOf(SK_TECH_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "2.7",
                versionCode = 17,
                minSdk = 23,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 17"
            )
        )
    )

    val COMPATIBILITY_PLAYFY_TV = Compatibility(
        name = "Playfy TV",
        packageName = "com.playfy.tv",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x5E35B1,
        signatures = setOf(PLAYFY_TV_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "1.7",
                versionCode = 8,
                minSdk = 21,
                description = "Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 5.0+), build 8"
            )
        )
    )

    val COMPATIBILITY_APK_DECOMPILER = Compatibility(
        name = "APK Decompiler",
        packageName = "com.apktools.app.decompile",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x456BDB,
        signatures = setOf("80c8e7990b68af1301f76057e7eabe63de4240e3ca74da46c36a9c8084c68386"),
        targets = listOf(
            AppTarget(
                version = "4.12.0",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 4120, SupportedAbi.ARMEABI_V7A to 4120),
                isExperimental = false,
                minSdk = 28,
                description = "Standalone APK (arm64-v8a / armeabi-v7a, Android 9.0+), build 4120"
            )
        )
    )

    val COMPATIBILITY_WPS_OFFICE = Compatibility(
        name = "WPS Office",
        packageName = "cn.wps.moffice_eng",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE64A19,
        signatures = setOf(WPS_OFFICE_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "26.11.0",
                versionCode = 1650,
                minSdk = 29,
                description = "XAPK bundle (base + config splits, arm64-v8a, Android 10+), build 1650"
            )
        )
    )

    val COMPATIBILITY_DAYLIO = Compatibility(
        name = "Daylio",
        packageName = "net.daylio",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00BFA5,
        signatures = setOf("6afb7e4100413a77e13b6a1e4f8ac1f9e3421862b3678fb9abe6aa531e859a9d"),
        targets = listOf(
            AppTarget(
                version = "1.71.1", versionCode = 289, isExperimental = false, minSdk = 26,
                description = "APKM (arm64-v8a / armeabi-v7a / x86 / x86_64, 480-640 dpi, Android 8.0+), build 289"
            )
        )
    )


    /** SHA-256 of the official AdGuard signing certificate (C=RU, ST=Moscow, O=Adguard). */
    private const val ADGUARD_SIGNER_SHA256 = "bdcc3c69c26d4627773ae6d7e7e5b2c89e94ed8dc02261525ff80ac4c9412db7"

    /** AdGuard for Android. Single universal APK, no splits. */
    val COMPATIBILITY_ADGUARD = Compatibility(
        name = "AdGuard",
        packageName = "com.adguard.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x67B346,
        signatures = setOf(ADGUARD_SIGNER_SHA256),
        targets = listOf(
            AppTarget(
                version = "4.15.2",
                versionCode = 42321001,
                minSdk = 28,
                description = "Universal APK (arm64-v8a, armeabi-v7a, x86, x86_64), Android 9+"
            )
        )
    )
}
