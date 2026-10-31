package id;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.NativeAd;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes3.dex */
public final class m extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ o f61543j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(o oVar) {
        super(2);
        this.f61543j = oVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        NativeAd nativeAd = (NativeAd) obj;
        MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) obj2;
        o oVar = this.f61543j;
        if (nativeAd == null) {
            oVar.f61546q.onFailure(adCreateError != null ? new bg.a(adCreateError.getErrorCode(), adCreateError.getDescription(), "com.moloco.sdk") : new bg.a(103, MolocoMediationAdapter.ERROR_MSG_AD_IS_NULL, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
        } else {
            oVar.f61547r = nativeAd;
            nativeAd.load(oVar.o, oVar);
        }
        return Unit.f71706a;
    }
}
