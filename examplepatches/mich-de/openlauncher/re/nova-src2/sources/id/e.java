package id;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.InterstitialAd;
import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes3.dex */
public final class e extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ f f61529j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar) {
        super(2);
        this.f61529j = fVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        InterstitialAd interstitialAd = (InterstitialAd) obj;
        MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) obj2;
        f fVar = this.f61529j;
        eg.f fVar2 = fVar.f61530a;
        if (adCreateError != null) {
            fVar2.onFailure(new bg.a(adCreateError.getErrorCode(), adCreateError.getDescription(), "com.moloco.sdk"));
        } else if (interstitialAd == null) {
            fVar2.onFailure(new bg.a(103, MolocoMediationAdapter.ERROR_MSG_AD_IS_NULL, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
        } else {
            fVar.f61534e = interstitialAd;
            interstitialAd.load(fVar.f61532c, fVar);
        }
        return Unit.f71706a;
    }
}
