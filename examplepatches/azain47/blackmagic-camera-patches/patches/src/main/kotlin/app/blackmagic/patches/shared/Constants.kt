package app.blackmagic.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Compatibility declaration for Blackmagic Camera.
 *
 * The app ships as a **split APK bundle** on Google Play (`apkFileType = APKM`), so Manager
 * fetches/patches the bundle rather than a single APK; all patched code lives in the base module.
 *
 * No specific version is pinned: the patches anchor on stable (non-obfuscated) types and strings
 * and rediscover obfuscated references from bytecode, so they are meant to apply across versions,
 * and a fingerprint that no longer matches fails loudly instead of corrupting the app. Pinning a
 * single version also broke downloads in Manager — the build installed from Play (e.g. 3.5.1.0040)
 * is often a step newer than the latest mirror build, so an exact-version match finds nothing.
 * Leaving the version open lets Manager download whatever build is currently available and patch it.
 *
 * `signatures` is the SHA-256 of the genuine Play signing certificate, so Manager can verify the
 * supplied/downloaded APK is the real upstream build before patching.
 *
 * Verified end-to-end against 3.5.1.0040. Earlier builds (3.5.0 and below) have a different internal
 * structure — a float-based bitrate formula and the pre-rewrite gallery fetcher — so the fingerprints,
 * which target the 3.5.1 structure, no longer match them and fail loudly rather than mis-patching.
 */
object Constants {
    val COMPATIBILITY_BLACKMAGIC_CAM = Compatibility(
        name = "Blackmagic Camera",
        packageName = "com.blackmagicdesign.android.blackmagiccam",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF1A1A,
        signatures = setOf(
            "8a889ddc2cac452968c5f2c62d339dd2f7f9dab526864b48ab53ee0a3e140cd9"
        ),
        // A null version means "any version": Manager downloads whatever build is available.
        targets = listOf(AppTarget(version = null))
    )
}
