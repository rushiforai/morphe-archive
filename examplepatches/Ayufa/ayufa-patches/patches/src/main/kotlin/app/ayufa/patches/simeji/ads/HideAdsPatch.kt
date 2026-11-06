package app.ayufa.patches.simeji.ads

import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.returnFalseIfEnabled
import app.ayufa.patches.simeji.shared.returnThisIfEnabled
import app.ayufa.patches.simeji.shared.returnVoidIfEnabled

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "広告を非表示",
    description = "Simeji の広告（候補欄の広告、ストア入口の全画面広告、" +
        "Webキャンペーンのポップアップ）を非表示にします。リワード広告も" +
        "ブロックします。有効・無効はアプリ内設定（Ayufaパッチ設定）で" +
        "いつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        // Central ad gate: report "cannot show" while the toggle is on.
        AdFilterHelperCanShowFingerprint.method
            .returnFalseIfEnabled("hideAds", "ayufa_hide_ads_gate")

        // Suggestion bar ad candidates: never prepare or store them.
        AdCandidateManagerPrepareFingerprint.method
            .returnVoidIfEnabled("hideAds", "ayufa_hide_ads_prepare")
        AdCandidateManagerRefreshFingerprint.method
            .returnVoidIfEnabled("hideAds", "ayufa_hide_ads_refresh")

        // Store entry interstitial: startGoing() returns itself
        // without starting anything.
        StoreEntryAdTriggerStartGoingFingerprint.method
            .returnThisIfEnabled("hideAds", "ayufa_hide_ads_store")

        // Web campaign / EC popup: never show.
        WebOperationPopupShowFingerprint.method
            .returnFalseIfEnabled("hideAds", "ayufa_hide_ads_web")

        // Rewarded ads: gated by their own toggle on top of the
        // master ads toggle (see SimejiSettings.rewardedAdsBlocked).
        AdShowHelperPreloadRewardedFingerprint.method
            .returnVoidIfEnabled("rewardedAdsBlocked", "ayufa_block_rewarded_preload")
        AdShowHelperShowRewardedFingerprint.method
            .returnVoidIfEnabled("rewardedAdsBlocked", "ayufa_block_rewarded_show")
    }
}
