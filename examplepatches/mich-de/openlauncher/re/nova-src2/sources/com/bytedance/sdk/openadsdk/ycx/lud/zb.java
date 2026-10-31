package com.bytedance.sdk.openadsdk.ycx.lud;

import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAd;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdLoadListener;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class zb implements PAGRewardedAdLoadListener {
    private final PAGRewardedAdLoadListener ycx;

    public zb(PAGRewardedAdLoadListener pAGRewardedAdLoadListener) {
        this.ycx = pAGRewardedAdLoadListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener, com.bytedance.sdk.openadsdk.common.ul
    public void onError(final int i5, final String str) {
        if (this.ycx == null) {
            return;
        }
        if (str == null) {
            str = "Unknown exception.";
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.lud.zb.1
            @Override // java.lang.Runnable
            public void run() {
                if (zb.this.ycx != null) {
                    zb.this.ycx.onError(i5, str);
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public void onAdLoaded(final PAGRewardedAd pAGRewardedAd) {
        if (this.ycx == null) {
            return;
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.lud.zb.2
            @Override // java.lang.Runnable
            public void run() {
                if (zb.this.ycx != null) {
                    zb.this.ycx.onAdLoaded(pAGRewardedAd);
                }
            }
        });
    }
}
