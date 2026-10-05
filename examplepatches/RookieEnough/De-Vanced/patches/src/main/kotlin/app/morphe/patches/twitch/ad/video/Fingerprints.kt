/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/video/Fingerprints.kt
 */
package app.morphe.patches.twitch.ad.video

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object CheckAdEligibilityLambdaMethodFingerprint : Fingerprint(
    definingClass = "AdEligibilityFetcher;",
    name = "shouldRequestAd",
    returnType = "Lio/reactivex/Single;"
)

internal object ContentConfigShowAdsMethodFingerprint : Fingerprint(
    definingClass = "ContentConfigData;",
    name = "getShowAds",
    returnType = "Z"
)

internal object GetReadyToShowAdMethodFingerprint : Fingerprint(
    definingClass = "StreamDisplayAdsPresenter;",
    name = "getReadyToShowAdOrAbort",
    returnType = "Ltv/twitch/android/core/mvp/presenter/StateAndAction;"
)

