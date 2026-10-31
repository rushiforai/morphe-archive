package com.bytedance.sdk.openadsdk.api.init;

/* loaded from: classes2.dex */
public interface PAGBidCallback {
    void onBiddingTokenCollected(String str);

    void onBiddingTokenFailed(PAGBidError pAGBidError);
}
