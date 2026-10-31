package id;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.RewardedInterstitialAd;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes3.dex */
public final class q extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ r f61548j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(r rVar) {
        super(2);
        this.f61548j = rVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        RewardedInterstitialAd rewardedInterstitialAd = (RewardedInterstitialAd) obj;
        MolocoAdError.AdCreateError adCreateError = (MolocoAdError.AdCreateError) obj2;
        r rVar = this.f61548j;
        eg.f fVar = rVar.f61549a;
        if (adCreateError != null) {
            fVar.onFailure(new bg.a(adCreateError.getErrorCode(), adCreateError.getDescription(), "com.moloco.sdk"));
        } else if (rewardedInterstitialAd == null) {
            fVar.onFailure(new bg.a(103, MolocoMediationAdapter.ERROR_MSG_AD_IS_NULL, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
        } else {
            rVar.f61553e = rewardedInterstitialAd;
            rewardedInterstitialAd.load(rVar.f61551c, rVar);
        }
        return Unit.f71706a;
    }
}
