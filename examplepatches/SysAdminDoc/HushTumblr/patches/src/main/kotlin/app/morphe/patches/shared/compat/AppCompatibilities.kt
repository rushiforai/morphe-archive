/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
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
 * with the Telegram one, HushPinterest with the Pinterest one and HushTumblr with the Tumblr
 * one.
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal object AppCompatibilities {
    /** Tumblr's navy. */
    private const val TUMBLR_COLOR = 0x001935

    /** Tumblr's package, the same for every build Tumblr hands out. */
    const val TUMBLR_PACKAGE = "com.tumblr"

    /**
     * SHA-256 of Tumblr's signing certificate (CN=Tumblr, OU=Tumblr, O=Tumblr, L=New York): the
     * "certificate SHA-256 digest" that `apksigner verify --print-certs` prints for a genuine
     * build. Morphe Manager holds an APK picked from storage to it and warns before patching one
     * another key signed.
     */
    const val TUMBLR_SIGNER_SHA256 = "39ac9c821ad2d605e4849f066e8aad3cca27d5e13eb03ad8755be234a2985dfd"

    /** The newest Tumblr build every patch here was applied to and read against. */
    const val TUMBLR_TARGET_VERSION = "46.9.1.100"

    /**
     * The version code of the [TUMBLR_TARGET_VERSION] bundle. Tumblr ships one split bundle for
     * every device: its base carries this code and its native code comes as config splits for
     * arm64-v8a, armeabi-v7a, x86 and x86_64, so the one code stands for all four ABIs. Unlike
     * Facebook's per-ABI builds, the DEX is the same on each.
     */
    const val TUMBLR_TARGET_VERSION_CODE = 1460901100

    /**
     * Tumblr's own floor on this build, Android 8.0. Manager offers the patches only where the
     * build itself installs.
     */
    const val TUMBLR_TARGET_MIN_SDK = 26

    fun tumblr(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "Tumblr",
            packageName = TUMBLR_PACKAGE,
            apkFileType = ApkFileType.APKM,
            appIconColor = TUMBLR_COLOR,
            signatures = setOf(TUMBLR_SIGNER_SHA256),
            targets = listOf(
                AppTarget(
                    version = TUMBLR_TARGET_VERSION,
                    versionCodes = mapOf(
                        SupportedAbi.ARM64_V8A to TUMBLR_TARGET_VERSION_CODE,
                        SupportedAbi.ARMEABI_V7A to TUMBLR_TARGET_VERSION_CODE,
                        SupportedAbi.X86 to TUMBLR_TARGET_VERSION_CODE,
                        SupportedAbi.X86_64 to TUMBLR_TARGET_VERSION_CODE,
                    ),
                    minSdk = TUMBLR_TARGET_MIN_SDK,
                ),
            ),
        ),
    )
}
