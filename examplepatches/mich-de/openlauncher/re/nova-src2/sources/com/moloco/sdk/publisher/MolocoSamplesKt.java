package com.moloco.sdk.publisher;

import android.content.Context;
import android.widget.FrameLayout;
import b10.o1;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.publisher.BannerAdSize;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.init.MolocoInitParams;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000 \n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0003\u001a\u0010\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0002\u001a\b\u0010\u0004\u001a\u00020\u0001H\u0002\u001a\u0010\u0010\u0005\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0007H\u0002\u001a\u0010\u0010\b\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0007H\u0002\u001a\u0010\u0010\t\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0007H\u0002\u001a\u0010\u0010\n\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0007H\u0002\u001a\u0010\u0010\u000b\u001a\u00020\u00012\u0006\u0010\f\u001a\u00020\rH\u0002\u001a\b\u0010\u000e\u001a\u00020\u0001H\u0002\u001a\b\u0010\u000f\u001a\u00020\u0001H\u0002¨\u0006\u0010"}, d2 = {"MolocoInitializeSample", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appContext", "Landroid/content/Context;", "MolocoIsInitializedSample", "MolocoCreateBanner", "frameLayout", "Landroid/widget/FrameLayout;", "MolocoCreateBannerTablet", "MolocoCreateMREC", "MolocoCreateMolocoBanner", "MolocoCreateNativeAd", "adUnitId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MolocoCreateInterstitialAd", "MolocoCreateRewardedInterstitialAd", "moloco-sdk_release"}, k = 2, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class MolocoSamplesKt {
    private static final void MolocoCreateBanner(FrameLayout frameLayout) {
        Moloco.createBanner$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", null, new c(frameLayout, 1), 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateBanner$lambda$2(FrameLayout frameLayout, Banner banner, MolocoAdError.AdCreateError adCreateError) {
        if (banner != null) {
            banner.load("bid_response", null);
            frameLayout.addView(banner);
            banner.destroy();
            frameLayout.removeView(banner);
        }
        return Unit.f71706a;
    }

    private static final void MolocoCreateBannerTablet(FrameLayout frameLayout) {
        Moloco.createBannerTablet$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", null, new c(frameLayout, 2), 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateBannerTablet$lambda$3(FrameLayout frameLayout, Banner banner, MolocoAdError.AdCreateError adCreateError) {
        if (banner != null) {
            banner.load("bid_response", null);
            frameLayout.addView(banner);
            banner.destroy();
            frameLayout.removeView(banner);
        }
        return Unit.f71706a;
    }

    private static final void MolocoCreateInterstitialAd() {
        Moloco.createInterstitial$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", null, new o1(9), 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateInterstitialAd$lambda$9(InterstitialAd interstitialAd, MolocoAdError.AdCreateError adCreateError) {
        if (interstitialAd != null) {
            interstitialAd.load("bid_response", null);
            interstitialAd.show(null);
            interstitialAd.destroy();
        }
        return Unit.f71706a;
    }

    private static final void MolocoCreateMREC(FrameLayout frameLayout) {
        Moloco.createMREC$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", null, new c(frameLayout, 0), 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateMREC$lambda$4(FrameLayout frameLayout, Banner banner, MolocoAdError.AdCreateError adCreateError) {
        if (banner != null) {
            banner.load("bid_response", null);
            frameLayout.addView(banner);
            banner.destroy();
            frameLayout.removeView(banner);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static final void MolocoCreateMolocoBanner(FrameLayout frameLayout) {
        Moloco.createMolocoBanner$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", BannerAdSize.Standard.INSTANCE, null, new c(frameLayout, 3), 8, null);
        Moloco.createMolocoBanner$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", new BannerAdSize.InlineAdaptive(Integer.valueOf(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE)), null, new c(frameLayout, 4), 8, null);
        Moloco.createMolocoBanner$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", new BannerAdSize.AnchoredAdaptive(null, 1, 0 == true ? 1 : 0), null, new c(frameLayout, 5), 8, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateMolocoBanner$lambda$5(FrameLayout frameLayout, Banner banner, MolocoAdError.AdCreateError adCreateError) {
        if (banner != null) {
            banner.load("bid_response", null);
            frameLayout.addView(banner);
            banner.destroy();
            frameLayout.removeView(banner);
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateMolocoBanner$lambda$6(FrameLayout frameLayout, Banner banner, MolocoAdError.AdCreateError adCreateError) {
        if (banner != null) {
            banner.load("bid_response", null);
            frameLayout.addView(banner);
            banner.destroy();
            frameLayout.removeView(banner);
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateMolocoBanner$lambda$7(FrameLayout frameLayout, Banner banner, MolocoAdError.AdCreateError adCreateError) {
        if (banner != null) {
            banner.load("bid_response", null);
            frameLayout.addView(banner);
            banner.destroy();
            frameLayout.removeView(banner);
        }
        return Unit.f71706a;
    }

    private static final void MolocoCreateNativeAd(String str) {
        Moloco.createNativeAd$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", null, new o1(8), 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateNativeAd$lambda$8(NativeAd nativeAd, MolocoAdError.AdCreateError adCreateError) {
        if (nativeAd != null) {
            nativeAd.load("bid_response", null);
        }
        return Unit.f71706a;
    }

    private static final void MolocoCreateRewardedInterstitialAd() {
        Moloco.createRewardedInterstitial$default(new MediationInfo("MY_MEDIATION"), "MOLOCO_ADUNIT_ID", null, new o1(7), 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit MolocoCreateRewardedInterstitialAd$lambda$10(RewardedInterstitialAd rewardedInterstitialAd, MolocoAdError.AdCreateError adCreateError) {
        if (rewardedInterstitialAd != null) {
            rewardedInterstitialAd.load("bid_response", null);
            rewardedInterstitialAd.show(null);
            rewardedInterstitialAd.destroy();
        }
        return Unit.f71706a;
    }

    private static final void MolocoInitializeSample(final Context context) {
        Moloco.initialize(new MolocoInitParams(context, "YOUR_APP_KEY", new MediationInfo("<YourMediationName>")), new MolocoInitializationListener() { // from class: com.moloco.sdk.publisher.b
            @Override // com.moloco.sdk.publisher.MolocoInitializationListener
            public final void onMolocoInitializationStatus(MolocoInitStatus molocoInitStatus) {
                MolocoSamplesKt.MolocoInitializeSample$lambda$1(context, molocoInitStatus);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void MolocoInitializeSample$lambda$1(Context context, MolocoInitStatus molocoInitStatus) {
        Intrinsics.g(molocoInitStatus, "molocoInitStatus");
        if (molocoInitStatus.getInitialization() == Initialization.SUCCESS) {
            Moloco.getBidToken(new MediationInfo("MY_MEDIATION"), context, new d());
        } else {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, "app", molocoInitStatus.getDescription(), null, false, 12, null);
        }
    }

    private static final void MolocoIsInitializedSample() {
        Moloco.isInitialized();
    }
}
