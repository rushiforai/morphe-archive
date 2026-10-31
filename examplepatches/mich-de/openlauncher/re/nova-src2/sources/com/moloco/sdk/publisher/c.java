package com.moloco.sdk.publisher;

import android.widget.FrameLayout;
import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38270a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FrameLayout f38271b;

    public /* synthetic */ c(FrameLayout frameLayout, int i5) {
        this.f38270a = i5;
        this.f38271b = frameLayout;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        Banner banner = (Banner) obj;
        MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) obj2;
        switch (this.f38270a) {
            case 0:
                return MolocoSamplesKt.MolocoCreateMREC$lambda$4(this.f38271b, banner, adCreateError);
            case 1:
                return MolocoSamplesKt.MolocoCreateBanner$lambda$2(this.f38271b, banner, adCreateError);
            case 2:
                return MolocoSamplesKt.MolocoCreateBannerTablet$lambda$3(this.f38271b, banner, adCreateError);
            case 3:
                return MolocoSamplesKt.MolocoCreateMolocoBanner$lambda$5(this.f38271b, banner, adCreateError);
            case 4:
                return MolocoSamplesKt.MolocoCreateMolocoBanner$lambda$6(this.f38271b, banner, adCreateError);
            default:
                return MolocoSamplesKt.MolocoCreateMolocoBanner$lambda$7(this.f38271b, banner, adCreateError);
        }
    }
}
