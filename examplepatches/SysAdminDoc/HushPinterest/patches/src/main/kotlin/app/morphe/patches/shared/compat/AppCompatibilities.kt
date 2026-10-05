/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
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
 * (GPL-3.0, Andrew Liang). HushThreads replaced it with the Threads target, HushTelegram
 * with the Telegram one and HushPinterest with the Pinterest one.
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal object AppCompatibilities {
    /** Pinterest's brand red. */
    private const val PINTEREST_COLOR = 0xE60023

    /** Pinterest's package, the same for every build Pinterest hands out. */
    const val PINTEREST_PACKAGE = "com.pinterest"

    /**
     * SHA-256 of Pinterest's signing certificate (CN=Carl Rice, OU=Android, O=Pinterest Inc): the
     * "certificate SHA-256 digest" that `apksigner verify --print-certs` prints for a genuine
     * build. Morphe Manager holds an APK picked from storage to it and warns before patching one
     * another key signed.
     */
    const val PINTEREST_SIGNER_SHA256 = "341d6881b1ecf38361fbf8c8fbae0aa516b45375c39ef5e78b161869acc1bcfa"

    /** The newest Pinterest build every patch here was applied to and read against. */
    const val PINTEREST_TARGET_VERSION = "14.38.0"

    /**
     * The version code of the universal [PINTEREST_TARGET_VERSION] APK. It carries every ABI, so
     * the one code stands for arm64-v8a too.
     */
    const val PINTEREST_TARGET_VERSION_CODE = 14388010

    /** Pinterest's own floor on this build, Android 10. */
    const val PINTEREST_TARGET_MIN_SDK = 29

    /**
     * HushPinterest's floor, Android 9, which 14.25.0 keeps. It's Pinterest's own floor for that
     * build too, and the extension's settings screen and diagnostics use Android 9 APIs.
     */
    const val PINTEREST_FLOOR_MIN_SDK = 28

    fun pinterest(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "Pinterest",
            packageName = PINTEREST_PACKAGE,
            apkFileType = ApkFileType.APK,
            appIconColor = PINTEREST_COLOR,
            signatures = setOf(PINTEREST_SIGNER_SHA256),
            targets = listOf(
                AppTarget(
                    version = PINTEREST_TARGET_VERSION,
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to PINTEREST_TARGET_VERSION_CODE),
                    minSdk = PINTEREST_TARGET_MIN_SDK,
                ),
                AppTarget(
                    version = "14.25.0",
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to 14258020),
                    minSdk = PINTEREST_FLOOR_MIN_SDK,
                ),
            ),
        ),
    )
}
