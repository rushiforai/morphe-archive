package com.bytedance.sdk.openadsdk.component.reward;

import android.content.Context;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.TTClientBidding;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAd;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdLoadListener;
import com.bytedance.sdk.openadsdk.component.reward.syc;

/* loaded from: classes2.dex */
public class pmi extends ycx<PAGRewardedAdLoadListener, TTClientBidding> {
    public pmi(Context context) {
        super(context);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public int lt() {
        return 6;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public int zb() {
        return 7;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public TTClientBidding ycx(Context context, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, AdSlot adSlot) {
        return new htf(context, ycxVar, adSlot);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public void zb(TTClientBidding tTClientBidding) {
        if (tTClientBidding instanceof htf) {
            ((htf) tTClientBidding).zb();
        }
    }

    public static pmi ycx(Context context) {
        return (pmi) thx.ycx(context, 7);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public syc ycx() {
        return syc.ycx(this.ycx, syc.ycx.REWARD_VIDEO);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public Object ycx(TTClientBidding tTClientBidding) {
        if (tTClientBidding instanceof htf) {
            return ((htf) tTClientBidding).ycx();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public void ycx(PAGRewardedAdLoadListener pAGRewardedAdLoadListener, int i5, String str) {
        pAGRewardedAdLoadListener.onError(i5, str);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx
    public void ycx(PAGRewardedAdLoadListener pAGRewardedAdLoadListener, Object obj) {
        if (pAGRewardedAdLoadListener == null || obj == null || !(obj instanceof PAGRewardedAd)) {
            return;
        }
        pAGRewardedAdLoadListener.onAdLoaded((PAGRewardedAd) obj);
    }
}
