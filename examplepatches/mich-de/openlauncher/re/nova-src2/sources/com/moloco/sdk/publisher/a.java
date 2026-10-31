package com.moloco.sdk.publisher;

import android.app.Activity;
import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38267a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Activity f38268b;

    public /* synthetic */ a(Activity activity, int i5) {
        this.f38267a = i5;
        this.f38268b = activity;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f38267a) {
            case 0:
                return BannerActivitySample.onCreate$lambda$0((BannerActivitySample) this.f38268b, (Banner) obj, (MolocoAdError.AdCreateError) obj2);
            case 1:
                return InterstitialAdActivitySample.onCreate$lambda$0((InterstitialAdActivitySample) this.f38268b, (InterstitialAd) obj, (MolocoAdError.AdCreateError) obj2);
            default:
                return RewardedInterstitialAdSample.onCreate$lambda$0((RewardedInterstitialAdSample) this.f38268b, (RewardedInterstitialAd) obj, (MolocoAdError.AdCreateError) obj2);
        }
    }
}
