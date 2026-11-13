/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/RookieEnough/De-Vanced/blob/9ac979883a6b6eeab5cefb4fc5d955073f2f2bc2/patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt
 * (GPL-3.0), by way of
 * https://github.com/icysymmetra/tiktok-patches-for-morphe/blob/ebf6296845cb889608cdc6681348ccb2e550f2bc/patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt
 * and Hushfeed. The tiktok-patches-for-morphe and Hushfacebook c15d4f79 copies, and Hushfeed's
 * until 7e3f278bd, cite a ReVanced path that never held this file; De-Vanced's cites none.
 * `AppTarget` and `ApkFileType` are Morphe's own API.
 *
 * Modified for Hushfacebook (Facebook), 2026. The Facebook target followed
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/shared/Constants.kt
 * (GPL-3.0, Andrew Liang). HushThreads replaced it with the Threads target.
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object AppCompatibilities {
    /** Threads' icon is black. */
    private const val THREADS_COLOR = 0x000000

    const val THREADS_PACKAGE = "com.instagram.barcelona"

    /**
     * SHA-256 of Threads' original signing certificate (CN=Meta Platforms Inc., OU=Meta Mobile): the
     * "certificate SHA-256 digest" that `apksigner verify --print-certs` prints for the APK v3.0
     * signer of a genuine build, the one Android reads up to API 32. Morphe Manager holds an APK
     * picked from storage to it and warns before patching one another key signed.
     */
    const val THREADS_SIGNER_SHA256 = "5367570bad488d8da6a0fab78d9766a1a4c23c3c70fac0ad2e91c8f0bd58b432"

    /**
     * SHA-256 of Threads' newer signing certificate, the APK v3.1 signer Android reads from API 33,
     * whose lineage the original authorizes. Every declared build carries these signers.
     */
    const val THREADS_ROTATED_SIGNER_SHA256 = "8f38da6b4dc34b1900353bde4630043198cbe3ef7214151f86679cd000c90500"

    /**
     * The one Threads build every patch here declares, was applied to and read against: the newest
     * stable release. A newer stable build replaces it in the same release, and the one before
     * goes.
     */
    const val THREADS_TARGET_VERSION = "455.0.0.55.72"

    /**
     * The version code of the arm64-v8a build of [THREADS_TARGET_VERSION] the fixtures were read
     * from: APKMirror's 480-640dpi ARM64 bundle. Other density variants have different codes.
     */
    const val THREADS_TARGET_VERSION_CODE = 512508359

    /**
     * The version code of the armeabi-v7a build of [THREADS_TARGET_VERSION], APKMirror's 480dpi
     * ARM bundle.
     */
    const val THREADS_TARGET_ARMV7_VERSION_CODE = 512508358

    /**
     * Every version code APKMirror shipped for [THREADS_TARGET_VERSION] when it was read
     * (2026-11-12): four arm64-v8a density variants, two armeabi-v7a, two x86 and one x86_64. The
     * bundle names the version without pinning a code, so any genuine build of this version
     * patches, including a variant APKMirror adds later.
     */
    internal val THREADS_TARGET_VERSION_CODES = setOf(
        512508344, // arm64-v8a, 640dpi
        512508348, // arm64-v8a, 480-640dpi
        512508358, // armeabi-v7a, 480dpi, Android 8.0+
        512508359, // arm64-v8a, 480-640dpi
        512508360, // x86, 480dpi, Android 8.0+
        512508368, // armeabi-v7a, 480dpi, Android 8.0+
        512508369, // arm64-v8a, 160-480dpi
        512508370, // x86, 480dpi, Android 8.0+
        512508371, // x86_64, 480dpi
    )

    /** Threads' own floor on this build, Android 9. */
    const val THREADS_TARGET_MIN_SDK = 28

    fun threads(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "Threads",
            packageName = THREADS_PACKAGE,
            apkFileType = ApkFileType.APKM,
            appIconColor = THREADS_COLOR,
            signatures = setOf(THREADS_SIGNER_SHA256, THREADS_ROTATED_SIGNER_SHA256),
            targets = listOf(
                // No version codes: APKMirror ships several density and ABI variants under this
                // one version, and Morphe accepts any code when a target names none.
                AppTarget(
                    version = THREADS_TARGET_VERSION,
                    minSdk = THREADS_TARGET_MIN_SDK,
                ),
            ),
        ),
    )
}
