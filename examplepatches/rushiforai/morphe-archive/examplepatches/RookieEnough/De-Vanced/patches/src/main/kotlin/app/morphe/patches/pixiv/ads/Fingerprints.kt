/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/pixiv/ads/Fingerprints.kt
 */
package app.morphe.patches.pixiv.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object ShouldShowAdsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    custom = { methodDef, classDef ->
        classDef.type.endsWith("AdUtils;") && methodDef.name == "shouldShowAds"
    },
)

