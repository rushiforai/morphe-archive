/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/icysymmetra/tiktok-patches-for-morphe/blob/main/patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt
 *
 * Modified for Hushfacebook (Facebook), 2026. The Facebook target followed
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/shared/Constants.kt
 * (GPL-3.0, Andrew Liang). HushThreads replaced it with the Threads target, and HushTelegram
 * with the Telegram one.
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal object AppCompatibilities {
    /** Telegram's icon blue. */
    private const val TELEGRAM_COLOR = 0x2AABEE

    /** The Google Play build, the one APKMirror and Uptodown mirror. */
    const val TELEGRAM_PACKAGE = "org.telegram.messenger"

    /** The build telegram.org hands out as a single APK, with its own updater. */
    const val TELEGRAM_WEB_PACKAGE = "org.telegram.messenger.web"

    /**
     * SHA-256 of Telegram's signing certificate (CN=Nikolay Kudashov, OU=VK, O=VK): the
     * "certificate SHA-256 digest" that `apksigner verify --print-certs` prints for a genuine
     * build. Morphe Manager holds an APK picked from storage to it and warns before patching one
     * another key signed.
     */
    const val TELEGRAM_SIGNER_SHA256 = "49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1"

    /**
     * The telegram.org release every patch here was applied to and read against. telegram.org
     * moves on its own schedule, so it can trail [TELEGRAM_PLAY_TARGET_VERSION].
     */
    const val TELEGRAM_TARGET_VERSION = "13.3.1"

    /** The Play release every patch here was applied to and read against. */
    const val TELEGRAM_PLAY_TARGET_VERSION = "13.3.1"

    /**
     * The version code of the Play build's universal [TELEGRAM_PLAY_TARGET_VERSION] APK on
     * APKMirror. It carries every ABI, so the one code stands for arm64-v8a too.
     */
    const val TELEGRAM_PLAY_TARGET_VERSION_CODE = 73461

    /** The version code of telegram.org's [TELEGRAM_TARGET_VERSION] APK, also universal. */
    const val TELEGRAM_TARGET_VERSION_CODE = 73469

    /**
     * HushTelegram's floor, Android 9. Telegram itself runs from Android 5, but the extension's
     * settings screen and diagnostics use Android 9 APIs, the same floor as HushThreads.
     */
    const val TELEGRAM_TARGET_MIN_SDK = 28

    /** Plus Messenger's icon teal. */
    private const val PLUS_COLOR = 0x009688

    /**
     * Plus Messenger, a Telegram fork on Google Play built from the same 13.2 sources under its own
     * package and key. Play hands it out as a bundle, so APKMirror carries it as an .apkm.
     */
    const val PLUS_PACKAGE = "org.telegram.plus"

    /** SHA-256 of Plus Messenger's signing certificate (CN=rafalense, O=android developer plus). */
    const val PLUS_SIGNER_SHA256 = "6ebb622268aad319dbe8a1f414837d2843a9b35856aefb7dee2971a3d493f276"

    /** The Plus release every patch here was applied to and read against. */
    const val PLUS_TARGET_VERSION = "13.2.2.1"

    /** The version code of the Plus bundle on APKMirror, which carries all four ABIs. */
    const val PLUS_TARGET_VERSION_CODE = 22710

    fun telegram(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "Telegram",
            packageName = TELEGRAM_PACKAGE,
            apkFileType = ApkFileType.APK,
            appIconColor = TELEGRAM_COLOR,
            signatures = setOf(TELEGRAM_SIGNER_SHA256),
            targets = listOf(
                AppTarget(
                    version = TELEGRAM_PLAY_TARGET_VERSION,
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to TELEGRAM_PLAY_TARGET_VERSION_CODE),
                    minSdk = TELEGRAM_TARGET_MIN_SDK,
                ),
            ),
        ),
        Compatibility(
            name = "Telegram (telegram.org)",
            packageName = TELEGRAM_WEB_PACKAGE,
            apkFileType = ApkFileType.APK,
            appIconColor = TELEGRAM_COLOR,
            signatures = setOf(TELEGRAM_SIGNER_SHA256),
            targets = listOf(
                AppTarget(
                    version = TELEGRAM_TARGET_VERSION,
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to TELEGRAM_TARGET_VERSION_CODE),
                    minSdk = TELEGRAM_TARGET_MIN_SDK,
                ),
            ),
        ),
        Compatibility(
            name = "Plus Messenger",
            packageName = PLUS_PACKAGE,
            apkFileType = ApkFileType.APKM,
            appIconColor = PLUS_COLOR,
            signatures = setOf(PLUS_SIGNER_SHA256),
            targets = listOf(
                AppTarget(
                    version = PLUS_TARGET_VERSION,
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to PLUS_TARGET_VERSION_CODE),
                    minSdk = TELEGRAM_TARGET_MIN_SDK,
                ),
            ),
        ),
    )

    /**
     * Telegram's own two builds, for a patch whose sites Plus Messenger's compiler lays out another
     * way and that hasn't been read against Plus yet. Manager doesn't offer such a patch for Plus.
     */
    fun telegramOnly(): Array<Compatibility> = telegram().filter { it.packageName != PLUS_PACKAGE }.toTypedArray()
}
