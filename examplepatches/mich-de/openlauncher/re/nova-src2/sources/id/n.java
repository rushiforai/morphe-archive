package id;

import ads_mobile_sdk.vo1;
import com.moloco.sdk.publisher.NativeAd;

/* loaded from: classes3.dex */
public final class n implements NativeAd.InteractionListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ vo1 f61544a;

    public n(vo1 vo1Var) {
        this.f61544a = vo1Var;
    }

    @Override // com.moloco.sdk.publisher.NativeAd.InteractionListener
    public final void onGeneralClickHandled() {
        this.f61544a.reportAdClicked();
    }

    @Override // com.moloco.sdk.publisher.NativeAd.InteractionListener
    public final void onImpressionHandled() {
        this.f61544a.reportAdImpression();
    }
}
