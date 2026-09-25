/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/shared/compat/AppCompatibilities.kt
 *
 * Central Morphe `Compatibility` metadata so Morphe Manager shows human-readable app names.
 */
package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object AppCompatibilities {
    private const val TIKTOK_COLOR = 0xFE2C55

    /**
     * SHA-256 of TikTok's signing certificate (CN=musical.ly): the "certificate SHA-256 digest"
     * that `apksigner verify --print-certs` prints for every retained vendor build. Morphe Manager
     * holds an APK picked from storage to it and warns before patching one another key signed,
     * which is the only check a user gets against a repackaged "TikTok mod".
     */
    const val TIKTOK_SIGNER_SHA256 = "9041803e91bcb814b4b4399fb5c85a91640b755e5e8ba76813814bf4cf2ab5ba"

    /** TikTok 47.0.3's version code. APKMirror lists three variants of the release, all with this one. */
    const val TIKTOK_4703_VERSION_CODE = 2024700030

    /** Target: TikTok 47.0.3 global package. */
    fun tiktok4703(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "TikTok",
            packageName = "com.zhiliaoapp.musically",
            appIconColor = TIKTOK_COLOR,
            signatures = setOf(TIKTOK_SIGNER_SHA256),
            targets = listOf(AppTarget(version = "47.0.3", versionCode = TIKTOK_4703_VERSION_CODE)),
        ),
    )
}
