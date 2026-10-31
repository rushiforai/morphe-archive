package hd;

import ads_mobile_sdk.vo1;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.NativeAdEventsListener;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class e extends NativeAdEventsListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f59616a;

    public e(g gVar) {
        this.f59616a = gVar;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdViewEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdClicked(InneractiveAdSpot adSpot) {
        Intrinsics.g(adSpot, "adSpot");
        g gVar = this.f59616a;
        vo1 vo1Var = gVar.o;
        if (vo1Var != null) {
            vo1Var.reportAdClicked();
        }
        vo1 vo1Var2 = gVar.o;
        if (vo1Var2 != null) {
            vo1Var2.onAdOpened();
        }
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdViewEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdImpression(InneractiveAdSpot adSpot) {
        Intrinsics.g(adSpot, "adSpot");
        g gVar = this.f59616a;
        vo1 vo1Var = gVar.o;
        if (vo1Var != null) {
            vo1Var.onAdOpened();
        }
        vo1 vo1Var2 = gVar.o;
        if (vo1Var2 != null) {
            vo1Var2.reportAdImpression();
        }
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdViewEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdWillCloseInternalBrowser(InneractiveAdSpot adSpot) {
        Intrinsics.g(adSpot, "adSpot");
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdViewEventsListener, com.fyber.inneractive.sdk.external.InneractiveUnitController.EventsListener
    public final void onAdWillOpenExternalApp(InneractiveAdSpot adSpot) {
        Intrinsics.g(adSpot, "adSpot");
        vo1 vo1Var = this.f59616a.o;
        if (vo1Var != null) {
            vo1Var.onAdLeftApplication();
        }
    }
}
