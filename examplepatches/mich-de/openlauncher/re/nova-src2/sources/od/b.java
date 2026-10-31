package od;

import com.vungle.ads.VungleBannerView;
import eg.f;
import eg.l;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class b extends md.c {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(f mediationAdLoadCallback, ld.a vungleFactory) {
        super(mediationAdLoadCallback, vungleFactory);
        Intrinsics.g(mediationAdLoadCallback, "mediationAdLoadCallback");
        Intrinsics.g(vungleFactory, "vungleFactory");
    }

    @Override // md.c
    public final void a(VungleBannerView bannerAdView, l mediationBannerAdConfiguration) {
        Intrinsics.g(bannerAdView, "bannerAdView");
        Intrinsics.g(mediationBannerAdConfiguration, "mediationBannerAdConfiguration");
        bannerAdView.load((String) null);
    }
}
