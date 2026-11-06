package app.revanced.patches.kakaotalk.ad

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.ad.fingerprints.PayBannerLoadFingerprint
import app.revanced.patches.kakaotalk.ad.fingerprints.PayBannerRenderFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

@Suppress("unused")
val disablePayBannerAdPatch = bytecodePatch(
    name = "Disable Pay banner ad",
    description = "KakaoPayバナー広告の読み込みと表示を無効化します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        PayBannerLoadFingerprint.method.returnEarly()
        PayBannerRenderFingerprint.method.returnEarly()
    }
}