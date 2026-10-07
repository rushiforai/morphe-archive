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

    /** The build telegram.org hands out as a single APK, with its own updater. */
    const val TELEGRAM_WEB_PACKAGE = "org.telegram.messenger.web"

    /** The separately installed universal beta APK Telegram distributes. */
    const val TELEGRAM_BETA_PACKAGE = "org.telegram.messenger.beta"

    /**
     * SHA-256 of Telegram's signing certificate (CN=Nikolay Kudashov, OU=VK, O=VK): the
     * "certificate SHA-256 digest" that `apksigner verify --print-certs` prints for a genuine
     * build. Morphe Manager holds an APK picked from storage to it and warns before patching one
     * another key signed.
     */
    const val TELEGRAM_SIGNER_SHA256 = "49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1"

    /** The default web build every patch here was applied to and read against. */
    const val TELEGRAM_TARGET_VERSION = "12.10.6"

    /**
     * The version code of telegram.org's [TELEGRAM_TARGET_VERSION] APK. It carries every ABI, so
     * the one code stands for arm64-v8a too.
     */
    const val TELEGRAM_TARGET_VERSION_CODE = 71129

    const val TELEGRAM_BETA_TARGET_VERSION = "12.10.7"
    const val TELEGRAM_BETA_TARGET_VERSION_CODE = 71239

    /**
     * HushTelegram's floor, Android 9. Telegram itself runs from Android 5, but the extension's
     * settings screen and diagnostics use Android 9 APIs, the same floor as HushThreads.
     */
    const val TELEGRAM_TARGET_MIN_SDK = 28

    fun telegram(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "Telegram",
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
            name = "Telegram Beta",
            packageName = TELEGRAM_BETA_PACKAGE,
            apkFileType = ApkFileType.APK,
            appIconColor = TELEGRAM_COLOR,
            signatures = setOf(TELEGRAM_SIGNER_SHA256),
            targets = listOf(
                AppTarget(
                    version = TELEGRAM_BETA_TARGET_VERSION,
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to TELEGRAM_BETA_TARGET_VERSION_CODE),
                    minSdk = TELEGRAM_TARGET_MIN_SDK,
                ),
            ),
        ),
    )
}
