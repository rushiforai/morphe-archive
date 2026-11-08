/*
 * Forked from:
 * https://github.com/RookieEnough/De-Vanced/blob/9ac979883a6b6eeab5cefb4fc5d955073f2f2bc2/patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt
 * (GPL-3.0), by way of
 * https://github.com/icysymmetra/tiktok-patches-for-morphe/blob/ebf6296845cb889608cdc6681348ccb2e550f2bc/patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt
 * That copy cites a ReVanced path that never held this file; `AppTarget` is Morphe's own API.
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object AppCompatibilities {
    private const val PINEDRAMA_COLOR = 0xFE2C55

    /** PineDrama's package, TikTok's drama app. */
    const val PINEDRAMA_PACKAGE = "com.ss.android.ttmd.video"

    /**
     * SHA-256 of PineDrama's signing certificate (CN=TikTok Drama), as `apksigner verify
     * --print-certs` prints it for the APKMirror 47.1.4, 47.4.3, 47.5.3 and 47.6.3 bundles. Morphe Manager
     * holds an APK picked from storage to it and warns before patching one another key signed.
     */
    const val PINEDRAMA_SIGNER_SHA256 = "e97ca0c8835c5a9e4f7702a0382b103ede9c5d51e5194c8db54f4c8833f54e18"

    /** PineDrama 47.6.3's version code. It's the newest stable build on APKMirror (2026-11-02). */
    const val PINEDRAMA_4763_VERSION_CODE = 2024706030

    /** The version codes of every declared build, for the patches that read one off the manifest. */
    val DECLARED_VERSION_CODES = setOf(PINEDRAMA_4763_VERSION_CODE)

    /**
     * PineDrama 47.6.3. Only the newest stable build is declared: when a newer one is supported, the
     * one before it is dropped in the same release, so every patch is read against one fixture.
     */
    fun pineDrama(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "PineDrama",
            packageName = PINEDRAMA_PACKAGE,
            appIconColor = PINEDRAMA_COLOR,
            signatures = setOf(PINEDRAMA_SIGNER_SHA256),
            targets = listOf(
                AppTarget(version = "47.6.3", versionCode = PINEDRAMA_4763_VERSION_CODE),
            ),
        ),
    )
}
