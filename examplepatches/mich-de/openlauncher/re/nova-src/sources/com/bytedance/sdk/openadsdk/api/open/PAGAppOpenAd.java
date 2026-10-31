package com.bytedance.sdk.openadsdk.api.open;

import android.app.Activity;
import com.bytedance.sdk.openadsdk.api.PAGClientBidding;
import com.bytedance.sdk.openadsdk.api.PangleAd;
import com.bytedance.sdk.openadsdk.api.factory.ISDKTypeFactory;
import com.bytedance.sdk.openadsdk.api.model.PAGErrorModel;
import com.bytedance.sdk.openadsdk.common.lt;

/* loaded from: classes2.dex */
public abstract class PAGAppOpenAd implements PAGClientBidding, PangleAd {
    public static void loadAd(String str, PAGAppOpenRequest pAGAppOpenRequest, PAGAppOpenAdLoadListener pAGAppOpenAdLoadListener) {
        ISDKTypeFactory iSDKTypeFactoryYcx = lt.ycx(pAGAppOpenAdLoadListener);
        if (iSDKTypeFactoryYcx != null) {
            iSDKTypeFactoryYcx.createADTypeLoaderFactory(str).createOpenAdLoader().loadAd(str, pAGAppOpenRequest, pAGAppOpenAdLoadListener);
        }
    }

    public abstract boolean isReady();

    public abstract void setAdInteractionCallback(PAGAppOpenAdInteractionCallback pAGAppOpenAdInteractionCallback);

    public abstract void setAdInteractionListener(PAGAppOpenAdInteractionListener pAGAppOpenAdInteractionListener);

    public abstract void show(Activity activity);

    public static void loadAd(String str, PAGAppOpenRequest pAGAppOpenRequest, final PAGAppOpenAdLoadCallback pAGAppOpenAdLoadCallback) {
        loadAd(str, pAGAppOpenRequest, new PAGAppOpenAdLoadListener() { // from class: com.bytedance.sdk.openadsdk.api.open.PAGAppOpenAd.1
            @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener, com.bytedance.sdk.openadsdk.common.ul
            public void onError(int i5, String str2) {
                pAGAppOpenAdLoadCallback.onError(new PAGErrorModel(i5, str2));
            }

            @Override // com.bytedance.sdk.openadsdk.api.PAGLoadListener
            public void onAdLoaded(PAGAppOpenAd pAGAppOpenAd) {
                pAGAppOpenAdLoadCallback.onAdLoaded(pAGAppOpenAd);
            }
        });
    }
}
