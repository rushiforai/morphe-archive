package com.bytedance.sdk.openadsdk.ycx.ycx;

import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdLoadListener;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class ycx implements PAGBannerAdLoadListener {
    private final PAGBannerAdLoadListener ycx;

    public ycx(PAGBannerAdLoadListener pAGBannerAdLoadListener) {
        this.ycx = pAGBannerAdLoadListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener, com.bytedance.sdk.openadsdk.common.ul
    public void onError(final int i5, final String str) {
        if (this.ycx == null) {
            return;
        }
        if (str == null) {
            str = "Unknown exception.";
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.ycx.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                ycx.this.ycx.onError(i5, str);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public void onAdLoaded(final PAGBannerAd pAGBannerAd) {
        if (this.ycx == null) {
            return;
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.ycx.ycx.2
            @Override // java.lang.Runnable
            public void run() {
                ycx.this.ycx.onAdLoaded(pAGBannerAd);
            }
        });
    }
}
