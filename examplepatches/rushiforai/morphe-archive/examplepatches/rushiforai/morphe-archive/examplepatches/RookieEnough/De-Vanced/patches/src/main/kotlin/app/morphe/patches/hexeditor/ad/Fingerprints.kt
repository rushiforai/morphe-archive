/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/hexeditor/ad/Fingerprints.kt
 */
package app.morphe.patches.hexeditor.ad

import app.morphe.patcher.Fingerprint

internal object PrimaryAdsMethodFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "isAdsDisabled" && classDef.type.endsWith("/PreferencesHelper;")
    },
)

