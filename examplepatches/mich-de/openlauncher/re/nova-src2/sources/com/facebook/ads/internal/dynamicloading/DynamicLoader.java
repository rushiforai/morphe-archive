package com.facebook.ads.internal.dynamicloading;

import android.content.Context;
import androidx.annotation.Keep;
import com.facebook.ads.AdOptionsView;
import com.facebook.ads.AdSize;
import com.facebook.ads.AdView;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.InterstitialAd;
import com.facebook.ads.NativeAd;
import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdLayout;
import com.facebook.ads.NativeAdScrollView;
import com.facebook.ads.NativeAdView;
import com.facebook.ads.NativeAdViewAttributes;
import com.facebook.ads.NativeAdsManager;
import com.facebook.ads.NativeBannerAd;
import com.facebook.ads.RewardedInterstitialAd;
import com.facebook.ads.RewardedVideoAd;
import com.facebook.ads.internal.api.AdOptionsViewApi;
import com.facebook.ads.internal.api.AdSettingsApi;
import com.facebook.ads.internal.api.AdSizeApi;
import com.facebook.ads.internal.api.AdViewApi;
import com.facebook.ads.internal.api.AdViewParentApi;
import com.facebook.ads.internal.api.AudienceNetworkActivityApi;
import com.facebook.ads.internal.api.AudienceNetworkAdsApi;
import com.facebook.ads.internal.api.BidderTokenProviderApi;
import com.facebook.ads.internal.api.DefaultMediaViewVideoRendererApi;
import com.facebook.ads.internal.api.InitApi;
import com.facebook.ads.internal.api.InterstitialAdApi;
import com.facebook.ads.internal.api.MediaViewApi;
import com.facebook.ads.internal.api.MediaViewVideoRendererApi;
import com.facebook.ads.internal.api.NativeAdApi;
import com.facebook.ads.internal.api.NativeAdBaseApi;
import com.facebook.ads.internal.api.NativeAdImageApi;
import com.facebook.ads.internal.api.NativeAdLayoutApi;
import com.facebook.ads.internal.api.NativeAdRatingApi;
import com.facebook.ads.internal.api.NativeAdScrollViewApi;
import com.facebook.ads.internal.api.NativeAdViewApi;
import com.facebook.ads.internal.api.NativeAdViewAttributesApi;
import com.facebook.ads.internal.api.NativeAdViewTypeApi;
import com.facebook.ads.internal.api.NativeAdsManagerApi;
import com.facebook.ads.internal.api.NativeBannerAdApi;
import com.facebook.ads.internal.api.NativeBannerAdViewApi;
import com.facebook.ads.internal.api.NativeComponentTagApi;
import com.facebook.ads.internal.api.RewardedInterstitialAdApi;
import com.facebook.ads.internal.api.RewardedVideoAdApi;
import org.json.JSONObject;

@Keep
/* loaded from: classes.dex */
public interface DynamicLoader {
    AdOptionsViewApi createAdOptionsView(Context context, NativeAdBase nativeAdBase, NativeAdLayout nativeAdLayout, AdOptionsView.Orientation orientation, int i5, AdOptionsView adOptionsView);

    AdOptionsViewApi createAdOptionsView(Context context, NativeAdBase nativeAdBase, NativeAdLayout nativeAdLayout, AdOptionsView adOptionsView);

    AdSettingsApi createAdSettingsApi();

    AdSizeApi createAdSizeApi(int i5);

    AdViewApi createAdViewApi(Context context, String str, AdSize adSize, AdViewParentApi adViewParentApi, AdView adView);

    AdViewApi createAdViewApi(Context context, String str, String str2, AdViewParentApi adViewParentApi, AdView adView) throws Exception;

    AudienceNetworkActivityApi createAudienceNetworkActivity(AudienceNetworkActivity audienceNetworkActivity, AudienceNetworkActivityApi audienceNetworkActivityApi);

    AudienceNetworkAdsApi createAudienceNetworkAdsApi();

    BidderTokenProviderApi createBidderTokenProviderApi();

    DefaultMediaViewVideoRendererApi createDefaultMediaViewVideoRendererApi();

    InterstitialAdApi createInterstitialAd(Context context, String str, InterstitialAd interstitialAd);

    MediaViewApi createMediaViewApi();

    MediaViewVideoRendererApi createMediaViewVideoRendererApi();

    NativeAdApi createNativeAdApi(NativeAd nativeAd, NativeAdBaseApi nativeAdBaseApi);

    NativeAdApi createNativeAdApi(NativeAdBase nativeAdBase, NativeAd nativeAd, NativeAdBaseApi nativeAdBaseApi);

    NativeAdBaseApi createNativeAdBaseApi(Context context, String str);

    NativeAdBaseApi createNativeAdBaseApi(NativeAdBaseApi nativeAdBaseApi);

    NativeAdBase createNativeAdBaseFromBidPayload(Context context, String str, String str2) throws Exception;

    NativeAdImageApi createNativeAdImageApi(JSONObject jSONObject);

    NativeAdLayoutApi createNativeAdLayoutApi();

    NativeAdRatingApi createNativeAdRatingApi(JSONObject jSONObject);

    NativeAdScrollViewApi createNativeAdScrollViewApi(NativeAdScrollView nativeAdScrollView, Context context, NativeAdsManager nativeAdsManager, NativeAdScrollView.AdViewProvider adViewProvider, int i5, NativeAdView.Type type, NativeAdViewAttributes nativeAdViewAttributes, int i11);

    NativeAdViewApi createNativeAdViewApi();

    NativeAdViewAttributesApi createNativeAdViewAttributesApi();

    NativeAdViewTypeApi createNativeAdViewTypeApi(int i5);

    NativeAdsManagerApi createNativeAdsManagerApi(Context context, String str, int i5);

    NativeBannerAdApi createNativeBannerAdApi(NativeBannerAd nativeBannerAd, NativeAdBaseApi nativeAdBaseApi);

    NativeBannerAdViewApi createNativeBannerAdViewApi();

    NativeComponentTagApi createNativeComponentTagApi();

    RewardedInterstitialAdApi createRewardedInterstitialAd(Context context, String str, RewardedInterstitialAd rewardedInterstitialAd);

    RewardedVideoAdApi createRewardedVideoAd(Context context, String str, RewardedVideoAd rewardedVideoAd);

    InitApi getInitApi();

    void maybeInitInternally(Context context);
}
