package hd;

import ads_mobile_sdk.xo1;
import android.app.Activity;
import android.content.Context;
import android.util.Log;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdSpotManager;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveFullScreenAdRewardedListener;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenUnitController;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenVideoContentController;
import com.fyber.inneractive.sdk.external.InneractiveMediationName;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import eg.u;
import eg.v;
import eg.w;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class p implements u, InneractiveAdSpot.RequestListener, InneractiveFullscreenAdEventsListener, InneractiveFullScreenAdRewardedListener {

    /* renamed from: a, reason: collision with root package name */
    public final eg.f f59650a;

    /* renamed from: b, reason: collision with root package name */
    public v f59651b;

    /* renamed from: c, reason: collision with root package name */
    public InneractiveAdSpot f59652c;

    /* renamed from: d, reason: collision with root package name */
    public InneractiveFullscreenUnitController f59653d;

    public p(eg.f fVar) {
        this.f59650a = fVar;
    }

    public final void a(w wVar) {
        InneractiveAdSpot inneractiveAdSpotCreateSpot = InneractiveAdSpotManager.get().createSpot();
        Intrinsics.f(inneractiveAdSpotCreateSpot, "createSpot(...)");
        this.f59652c = inneractiveAdSpotCreateSpot;
        InneractiveFullscreenUnitController inneractiveFullscreenUnitController = new InneractiveFullscreenUnitController();
        this.f59653d = inneractiveFullscreenUnitController;
        this.f59652c.addUnitController(inneractiveFullscreenUnitController);
        this.f59652c.setRequestListener(this);
        bh.g.m0(wVar.f52744e);
    }

    public final void b(w wVar) {
        String str = wVar.f52742c;
        a(wVar);
        this.f59652c.loadAd(str, wVar.f52747h);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdClicked(InneractiveAdSpot inneractiveAdSpot) {
        ((xo1) this.f59651b).reportAdClicked();
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener
    public final void onAdDismissed(InneractiveAdSpot inneractiveAdSpot) {
        ((xo1) this.f59651b).onAdClosed();
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdEnteredErrorState(InneractiveAdSpot inneractiveAdSpot, InneractiveUnitController.AdDisplayError adDisplayError) {
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdImpression(InneractiveAdSpot inneractiveAdSpot) {
        ((xo1) this.f59651b).onAdOpened();
        InneractiveFullscreenUnitController inneractiveFullscreenUnitController = this.f59653d;
        if (inneractiveFullscreenUnitController != null && inneractiveFullscreenUnitController.getSelectedContentController() != null && (inneractiveFullscreenUnitController.getSelectedContentController() instanceof InneractiveFullscreenVideoContentController)) {
            ((xo1) this.f59651b).f11791a.a();
        }
        ((xo1) this.f59651b).reportAdImpression();
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullScreenAdRewardedListener
    public final void onAdRewarded(InneractiveAdSpot inneractiveAdSpot) {
        ((xo1) this.f59651b).onUserEarnedReward();
        ((xo1) this.f59651b).f11791a.f();
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdWillCloseInternalBrowser(InneractiveAdSpot inneractiveAdSpot) {
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdWillOpenExternalApp(InneractiveAdSpot inneractiveAdSpot) {
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot.RequestListener
    public final void onInneractiveFailedAdRequest(InneractiveAdSpot inneractiveAdSpot, InneractiveErrorCode inneractiveErrorCode) {
        bg.a aVarA = b.a(inneractiveErrorCode);
        InneractiveMediationName inneractiveMediationName = FyberMediationAdapter.f31425c;
        Log.w("FyberMediationAdapter", aVarA.f17862b);
        this.f59650a.onFailure(aVarA);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot.RequestListener
    public final void onInneractiveSuccessfulAdRequest(InneractiveAdSpot inneractiveAdSpot) {
        this.f59651b = (v) this.f59650a.onSuccess(this);
        this.f59653d.setEventsListener(this);
        this.f59653d.setRewardedListener(this);
        this.f59653d.addContentController(new InneractiveFullscreenVideoContentController());
    }

    @Override // eg.u
    public final void showAd(Context context) {
        if (!(context instanceof Activity)) {
            bg.a aVar = new bg.a(107, "Cannot show a rewarded ad without an activity context.", "com.google.ads.mediation.dtexchange");
            InneractiveMediationName inneractiveMediationName = FyberMediationAdapter.f31425c;
            Log.w("FyberMediationAdapter", "Cannot show a rewarded ad without an activity context.");
            v vVar = this.f59651b;
            if (vVar != null) {
                ((xo1) vVar).f11791a.a(aVar);
                return;
            }
            return;
        }
        InneractiveAdSpot inneractiveAdSpot = this.f59652c;
        if (inneractiveAdSpot != null && this.f59653d != null && inneractiveAdSpot.isReady()) {
            this.f59653d.show((Activity) context);
        } else if (this.f59651b != null) {
            bg.a aVar2 = new bg.a(106, "DT Exchange's rewarded spot is not ready.", "com.google.ads.mediation.dtexchange");
            InneractiveMediationName inneractiveMediationName2 = FyberMediationAdapter.f31425c;
            Log.w("FyberMediationAdapter", "DT Exchange's rewarded spot is not ready.");
            ((xo1) this.f59651b).f11791a.a(aVar2);
        }
    }
}
