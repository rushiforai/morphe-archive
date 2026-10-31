package com.google.android.gms.ads.mediation.rtb;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eg.f;
import eg.j;
import eg.l;
import eg.q;
import eg.s;
import eg.w;
import gg.a;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b&\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H&¢\u0006\u0004\b\t\u0010\nJ+\u0010\u0010\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000b2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000f0\rH\u0016¢\u0006\u0004\b\u0010\u0010\u0011J+\u0010\u0013\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000b2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u000f0\rH\u0016¢\u0006\u0004\b\u0013\u0010\u0011J+\u0010\u0017\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u00142\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00160\rH\u0016¢\u0006\u0004\b\u0017\u0010\u0018J+\u0010\u001c\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u00192\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u001b0\rH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ+\u0010\u001e\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u00192\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u001b0\rH\u0016¢\u0006\u0004\b\u001e\u0010\u001dJ+\u0010\"\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u001f2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020!0\rH\u0016¢\u0006\u0004\b\"\u0010#J+\u0010%\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u001f2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020!0\rH\u0016¢\u0006\u0004\b%\u0010#J+\u0010)\u001a\u00020\b2\u0006\u0010\f\u001a\u00020&2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020'\u0012\u0004\u0012\u00020(0\rH\u0016¢\u0006\u0004\b)\u0010*¨\u0006+"}, d2 = {"Lcom/google/android/gms/ads/mediation/rtb/RtbAdapter;", "Leg/b;", "<init>", "()V", "Lgg/a;", "data", "Lgg/b;", "callback", b.f42142b, "collectSignals", "(Lgg/a;Lgg/b;)V", "Leg/l;", "adConfiguration", "Leg/f;", "Leg/k;", "Lads_mobile_sdk/ro1;", "loadRtbBannerAd", "(Leg/l;Leg/f;)V", b.f42142b, "loadRtbInterscrollerAd", "Leg/q;", "Leg/p;", "Lads_mobile_sdk/to1;", "loadRtbInterstitialAd", "(Leg/q;Leg/f;)V", "Leg/w;", "Leg/u;", "Leg/v;", "loadRtbRewardedAd", "(Leg/w;Leg/f;)V", "loadRtbRewardedInterstitialAd", "Leg/s;", "Leg/z;", "Lads_mobile_sdk/vo1;", "loadRtbNativeAd", "(Leg/s;Leg/f;)V", "Leg/x;", "loadRtbNativeAdMapper", "Leg/j;", "Leg/i;", "Lads_mobile_sdk/po1;", "loadRtbAppOpenAd", "(Leg/j;Leg/f;)V", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class RtbAdapter extends eg.b {
    public abstract void collectSignals(@NotNull a data, @NotNull gg.b callback);

    public void loadRtbAppOpenAd(@NotNull j adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadAppOpenAd(adConfiguration, callback);
    }

    public void loadRtbBannerAd(@NotNull l adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadBannerAd(adConfiguration, callback);
    }

    public void loadRtbInterscrollerAd(@NotNull l adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadInterscrollerAd(adConfiguration, callback);
    }

    public void loadRtbInterstitialAd(@NotNull q adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadInterstitialAd(adConfiguration, callback);
    }

    public void loadRtbNativeAd(@NotNull s adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadNativeAd(adConfiguration, callback);
    }

    public void loadRtbNativeAdMapper(@NotNull s adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadNativeAdMapper(adConfiguration, callback);
    }

    public void loadRtbRewardedAd(@NotNull w adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadRewardedAd(adConfiguration, callback);
    }

    public void loadRtbRewardedInterstitialAd(@NotNull w adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        loadRewardedInterstitialAd(adConfiguration, callback);
    }
}
