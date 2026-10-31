package hd;

import android.text.TextUtils;
import android.util.Log;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveMediationName;
import com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import eg.w;

/* loaded from: classes3.dex */
public final class n implements OnFyberMarketplaceInitializedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ eg.f f59646a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w f59647b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ FyberMediationAdapter f59648c;

    public n(FyberMediationAdapter fyberMediationAdapter, eg.f fVar, w wVar) {
        this.f59648c = fyberMediationAdapter;
        this.f59646a = fVar;
        this.f59647b = wVar;
    }

    @Override // com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener
    public final void onFyberMarketplaceInitialized(OnFyberMarketplaceInitializedListener.FyberInitStatus fyberInitStatus) {
        OnFyberMarketplaceInitializedListener.FyberInitStatus fyberInitStatus2 = OnFyberMarketplaceInitializedListener.FyberInitStatus.SUCCESSFULLY;
        eg.f fVar = this.f59646a;
        if (fyberInitStatus != fyberInitStatus2) {
            bg.a aVarB = b.b(fyberInitStatus);
            InneractiveMediationName inneractiveMediationName = FyberMediationAdapter.f31425c;
            Log.w("FyberMediationAdapter", aVarB.f17862b);
            fVar.onFailure(aVarB);
            return;
        }
        p pVar = new p(fVar);
        this.f59648c.f31426a = pVar;
        w wVar = this.f59647b;
        String string = wVar.f52743d.getString("spotId");
        if (!TextUtils.isEmpty(string)) {
            pVar.a(wVar);
            pVar.f59652c.requestAd(new InneractiveAdRequest(string));
        } else {
            bg.a aVar = new bg.a(101, "Spot ID is null or empty.", "com.google.ads.mediation.dtexchange");
            InneractiveMediationName inneractiveMediationName2 = FyberMediationAdapter.f31425c;
            Log.w("FyberMediationAdapter", "Spot ID is null or empty.");
            fVar.onFailure(aVar);
        }
    }
}
