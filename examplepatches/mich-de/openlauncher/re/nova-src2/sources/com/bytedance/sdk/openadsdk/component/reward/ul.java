package com.bytedance.sdk.openadsdk.component.reward;

import android.content.Context;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.TTClientBidding;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAd;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdLoadListener;
import com.bytedance.sdk.openadsdk.component.reward.syc;

/* loaded from: classes2.dex */
public class ul extends ycx<PAGInterstitialAdLoadListener, TTClientBidding> {
    public ul(Context context) {
        super(context);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public int lt() {
        return 5;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public int zb() {
        return 8;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public TTClientBidding ycx(Context context, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, AdSlot adSlot) {
        return new uh(context, ycxVar);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public void zb(TTClientBidding tTClientBidding) {
        if (tTClientBidding instanceof uh) {
            ((uh) tTClientBidding).zb();
        }
    }

    public static ul ycx(Context context) {
        return (ul) thx.ycx(context, 8);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public syc ycx() {
        return syc.ycx(this.ycx, syc.ycx.FULL_SCREEN_VIDEO);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public Object ycx(TTClientBidding tTClientBidding) {
        if (tTClientBidding instanceof uh) {
            return ((uh) tTClientBidding).ycx();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public void ycx(PAGInterstitialAdLoadListener pAGInterstitialAdLoadListener, int i5, String str) {
        pAGInterstitialAdLoadListener.onError(i5, str);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public void ycx(PAGInterstitialAdLoadListener pAGInterstitialAdLoadListener, Object obj) {
        if (pAGInterstitialAdLoadListener == null || obj == null || !(obj instanceof PAGInterstitialAd)) {
            return;
        }
        pAGInterstitialAdLoadListener.onAdLoaded((PAGInterstitialAd) obj);
    }
}
