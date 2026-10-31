package com.bytedance.sdk.openadsdk.api.interstitial;

import com.bytedance.sdk.openadsdk.api.model.PAGErrorModel;

/* loaded from: classes2.dex */
public abstract class PAGInterstitialAdInteractionCallback implements PAGInterstitialAdInteractionListener {
    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public void onAdClicked() {
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public void onAdDismissed() {
    }

    public void onAdShowFailed(PAGErrorModel pAGErrorModel) {
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public void onAdShowed() {
    }
}
