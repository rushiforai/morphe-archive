package hd;

import android.util.Log;
import com.fyber.inneractive.sdk.external.InneractiveMediationName;
import com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener;
import com.google.ads.mediation.fyber.FyberMediationAdapter;

/* loaded from: classes.dex */
public final class o implements OnFyberMarketplaceInitializedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ eg.c f59649a;

    public o(eg.c cVar) {
        this.f59649a = cVar;
    }

    @Override // com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener
    public final void onFyberMarketplaceInitialized(OnFyberMarketplaceInitializedListener.FyberInitStatus fyberInitStatus) {
        OnFyberMarketplaceInitializedListener.FyberInitStatus fyberInitStatus2 = OnFyberMarketplaceInitializedListener.FyberInitStatus.SUCCESSFULLY;
        eg.c cVar = this.f59649a;
        if (fyberInitStatus == fyberInitStatus2) {
            ((x7.l) cVar).onInitializationSucceeded();
            return;
        }
        String str = b.b(fyberInitStatus).f17862b;
        InneractiveMediationName inneractiveMediationName = FyberMediationAdapter.f31425c;
        Log.w("FyberMediationAdapter", str);
        ((x7.l) cVar).onInitializationFailed(str);
    }
}
