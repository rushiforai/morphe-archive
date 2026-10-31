package od;

import com.vungle.ads.AdConfig;
import eg.f;
import eg.q;
import kotlin.jvm.internal.Intrinsics;
import md.d;

/* loaded from: classes3.dex */
public final class c extends d {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(f mediationAdLoadCallback, ld.a vungleFactory) {
        super(mediationAdLoadCallback, vungleFactory);
        Intrinsics.g(mediationAdLoadCallback, "mediationAdLoadCallback");
        Intrinsics.g(vungleFactory, "vungleFactory");
    }

    @Override // md.d
    public final String a(q mediationInterstitialAdConfiguration) {
        Intrinsics.g(mediationInterstitialAdConfiguration, "mediationInterstitialAdConfiguration");
        return null;
    }

    @Override // md.d
    public final void b(AdConfig adConfig, q mediationInterstitialAdConfiguration) {
        Intrinsics.g(mediationInterstitialAdConfiguration, "mediationInterstitialAdConfiguration");
    }
}
