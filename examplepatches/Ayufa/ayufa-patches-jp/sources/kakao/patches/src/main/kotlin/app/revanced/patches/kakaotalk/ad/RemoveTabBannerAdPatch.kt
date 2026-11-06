package app.revanced.patches.kakaotalk.ad

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.ad.fingerprints.TailBannerRenderFingerprint
import app.revanced.patches.kakaotalk.ad.fingerprints.TalkBannerLoadFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val removeTabBannerAdPatch = bytecodePatch(
    name = "Remove tab banner ads",
    description = "メインタブのバナーを除去し、AdFitのトークバナーを無効化します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        TailBannerRenderFingerprint.method.returnEarly()
        TalkBannerLoadFingerprint.method.returnEarly()
    }
}