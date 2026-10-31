package com.bytedance.sdk.openadsdk.ycx.zb;

import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAd;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdInteractionListener;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class ul implements lt {
    private final PAGNativeAdInteractionListener ycx;

    public ul(PAGNativeAdInteractionListener pAGNativeAdInteractionListener) {
        this.ycx = pAGNativeAdInteractionListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdWrapperListener
    public void onAdClicked() {
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ul.1
            @Override // java.lang.Runnable
            public void run() {
                if (ul.this.ycx != null) {
                    ul.this.ycx.onAdClicked();
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.zb.lt
    public boolean zb() {
        return this.ycx != null;
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.zb.lt
    public void ycx(PAGNativeAd pAGNativeAd) {
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ul.2
            @Override // java.lang.Runnable
            public void run() {
                if (ul.this.ycx != null) {
                    ul.this.ycx.onAdShowed();
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.ycx.zb.lt
    public void ycx() {
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ul.3
            @Override // java.lang.Runnable
            public void run() {
                if (ul.this.ycx != null) {
                    ul.this.ycx.onAdDismissed();
                }
            }
        });
    }
}
