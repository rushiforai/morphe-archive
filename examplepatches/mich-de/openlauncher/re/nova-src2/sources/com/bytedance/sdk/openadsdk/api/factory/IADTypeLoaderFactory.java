package com.bytedance.sdk.openadsdk.api.factory;

import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdLoadListener;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerRequest;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialAdLoadListener;
import com.bytedance.sdk.openadsdk.api.interstitial.PAGInterstitialRequest;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAdLoadListener;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeRequest;
import com.bytedance.sdk.openadsdk.api.open.PAGAppOpenAdLoadListener;
import com.bytedance.sdk.openadsdk.api.open.PAGAppOpenRequest;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedAdLoadListener;
import com.bytedance.sdk.openadsdk.api.reward.PAGRewardedRequest;

/* loaded from: classes.dex */
public interface IADTypeLoaderFactory {
    IADLoader<PAGBannerRequest, PAGBannerAdLoadListener> createBannerAdLoader();

    IADLoader<PAGInterstitialRequest, PAGInterstitialAdLoadListener> createInterstitialAdLoader();

    IADLoader<PAGNativeRequest, PAGNativeAdLoadListener> createNativeAdLoader();

    IADLoader<PAGAppOpenRequest, PAGAppOpenAdLoadListener> createOpenAdLoader();

    IADLoader<PAGRewardedRequest, PAGRewardedAdLoadListener> createRewardAdLoader();
}
