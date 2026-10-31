package com.bytedance.sdk.openadsdk.component.sya;

import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdLoadListener;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class zb implements PAGInterstitialAdLoadListener {
    final PAGInterstitialAdLoadListener ycx;

    public zb(PAGInterstitialAdLoadListener pAGInterstitialAdLoadListener) {
        this.ycx = pAGInterstitialAdLoadListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener, com.bytedance.sdk.openadsdk.common.ul
    public void onError(final int i5, final String str) {
        if (this.ycx != null) {
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.sya.zb.1
                @Override // java.lang.Runnable
                public void run() {
                    PAGInterstitialAdLoadListener pAGInterstitialAdLoadListener = zb.this.ycx;
                    if (pAGInterstitialAdLoadListener != null) {
                        pAGInterstitialAdLoadListener.onError(i5, str);
                    }
                }
            });
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public void onAdLoaded(final PAGInterstitialAd pAGInterstitialAd) {
        if (this.ycx != null) {
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.sya.zb.2
                @Override // java.lang.Runnable
                public void run() {
                    PAGInterstitialAdLoadListener pAGInterstitialAdLoadListener = zb.this.ycx;
                    if (pAGInterstitialAdLoadListener != null) {
                        pAGInterstitialAdLoadListener.onAdLoaded(pAGInterstitialAd);
                    }
                }
            });
        }
    }
}
