package id;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.Banner;
import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c f61521a;

    public b(c cVar) {
        this.f61521a = cVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        Banner banner = (Banner) obj;
        MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) obj2;
        c cVar = this.f61521a;
        eg.f fVar = cVar.f61522a;
        if (adCreateError != null) {
            fVar.onFailure(new bg.a(adCreateError.getErrorCode(), adCreateError.getDescription(), "com.moloco.sdk"));
        } else if (banner == null) {
            fVar.onFailure(new bg.a(103, MolocoMediationAdapter.ERROR_MSG_AD_IS_NULL, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
        } else {
            cVar.f61527f = banner;
            banner.setAdShowListener(cVar);
            Banner banner2 = cVar.f61527f;
            if (banner2 == null) {
                Intrinsics.m("molocoAd");
                throw null;
            }
            banner2.load(cVar.f61525d, cVar);
        }
        return Unit.f71706a;
    }
}
