package com.bytedance.sdk.openadsdk.ycx.sya;

import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdLoadListener;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class ycx implements PAGInterstitialAdLoadListener {
    private final PAGInterstitialAdLoadListener ycx;

    public ycx(PAGInterstitialAdLoadListener pAGInterstitialAdLoadListener) {
        this.ycx = pAGInterstitialAdLoadListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener, com.bytedance.sdk.openadsdk.common.ul
    public void onError(final int i5, final String str) {
        if (this.ycx == null) {
            return;
        }
        if (str == null) {
            str = "Unknown exception.";
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.sya.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                if (ycx.this.ycx != null) {
                    ycx.this.ycx.onError(i5, str);
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public void onAdLoaded(final PAGInterstitialAd pAGInterstitialAd) {
        if (this.ycx == null) {
            return;
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.sya.ycx.2
            @Override // java.lang.Runnable
            public void run() {
                if (ycx.this.ycx != null) {
                    ycx.this.ycx.onAdLoaded(pAGInterstitialAd);
                }
            }
        });
    }
}
