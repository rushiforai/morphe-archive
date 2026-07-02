/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/audio/Fingerprints.kt
 */
package app.morphe.patches.twitch.ad.audio

import app.morphe.patcher.Fingerprint

internal object AudioAdsPresenterPlayMethodFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.name == "playAd" && classDef.type.endsWith("/AudioAdsPlayerPresenter;")
    },
)

