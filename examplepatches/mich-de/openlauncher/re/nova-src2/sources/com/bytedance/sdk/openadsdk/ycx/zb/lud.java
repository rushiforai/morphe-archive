package com.bytedance.sdk.openadsdk.ycx.zb;

import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAd;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdLoadListener;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class lud implements PAGNativeAdLoadListener {
    private final PAGNativeAdLoadListener ycx;

    public lud(PAGNativeAdLoadListener pAGNativeAdLoadListener) {
        this.ycx = pAGNativeAdLoadListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener, com.bytedance.sdk.openadsdk.common.ul
    public void onError(final int i5, final String str) {
        if (this.ycx == null) {
            return;
        }
        if (str == null) {
            str = "Unknown exception.";
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.lud.1
            @Override // java.lang.Runnable
            public void run() {
                if (lud.this.ycx != null) {
                    lud.this.ycx.onError(i5, str);
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public void onAdLoaded(final PAGNativeAd pAGNativeAd) {
        if (this.ycx == null) {
            return;
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.lud.2
            @Override // java.lang.Runnable
            public void run() {
                if (lud.this.ycx != null) {
                    lud.this.ycx.onAdLoaded(pAGNativeAd);
                }
            }
        });
    }
}
