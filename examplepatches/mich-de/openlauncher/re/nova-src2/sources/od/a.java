package od;

import com.vungle.ads.AdConfig;
import eg.f;
import eg.j;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a extends md.b {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(f mediationAdLoadCallback, ld.a vungleFactory) {
        super(mediationAdLoadCallback, vungleFactory);
        Intrinsics.g(mediationAdLoadCallback, "mediationAdLoadCallback");
        Intrinsics.g(vungleFactory, "vungleFactory");
    }

    @Override // md.b
    public final String a(j mediationAppOpenAdConfiguration) {
        Intrinsics.g(mediationAppOpenAdConfiguration, "mediationAppOpenAdConfiguration");
        return null;
    }

    @Override // md.b
    public final void b(AdConfig adConfig, j mediationAppOpenAdConfiguration) {
        Intrinsics.g(mediationAppOpenAdConfiguration, "mediationAppOpenAdConfiguration");
    }
}
