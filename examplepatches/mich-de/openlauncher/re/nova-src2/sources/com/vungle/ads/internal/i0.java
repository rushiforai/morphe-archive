package com.vungle.ads.internal;

import android.content.Context;
import com.vungle.ads.AdConfig;
import com.vungle.ads.BaseAd;
import com.vungle.ads.VungleAdSize;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i0 extends BaseAd {

    /* renamed from: s, reason: collision with root package name */
    public final VungleAdSize f46854s;

    /* renamed from: t, reason: collision with root package name */
    public final j0 f46855t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(Context context, String placementId, VungleAdSize adSize, AdConfig adConfig) {
        super(context, placementId, adConfig);
        Intrinsics.g(context, "context");
        Intrinsics.g(placementId, "placementId");
        Intrinsics.g(adSize, "adSize");
        Intrinsics.g(adConfig, "adConfig");
        this.f46854s = adSize;
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.BannerAdInternal");
        this.f46855t = ((k0) adInternal$vungle_ads_release).a(new h0(this));
    }

    public final j0 a() {
        return this.f46855t;
    }

    @Override // com.vungle.ads.BaseAd
    public final s constructAdInternal$vungle_ads_release(Context context) {
        Intrinsics.g(context, "context");
        return new k0(context, this.f46854s);
    }

    public final VungleAdSize getAdViewSize() {
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.BannerAdInternal");
        return ((k0) adInternal$vungle_ads_release).m();
    }
}
