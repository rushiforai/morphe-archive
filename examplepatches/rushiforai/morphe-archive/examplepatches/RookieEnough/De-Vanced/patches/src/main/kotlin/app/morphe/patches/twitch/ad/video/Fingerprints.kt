/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/video/Fingerprints.kt
 */
package app.morphe.patches.twitch.ad.video

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object CheckAdEligibilityLambdaMethodFingerprint : Fingerprint(
    returnType = "Lio/reactivex/Single;",
    custom = { method, classDef ->
        method.name == "shouldRequestAd" &&
            classDef.type.endsWith("AdEligibilityFetcher;")
    },
)

internal object ContentConfigShowAdsMethodFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "getShowAds" && classDef.type.endsWith("ContentConfigData;")
    },
)

internal object GetReadyToShowAdMethodFingerprint : Fingerprint(
    returnType = "Ltv/twitch/android/core/mvp/presenter/StateAndAction;",
    custom = { method, classDef ->
        method.name == "getReadyToShowAdOrAbort" &&
            classDef.type.endsWith("StreamDisplayAdsPresenter;")
    },
)

