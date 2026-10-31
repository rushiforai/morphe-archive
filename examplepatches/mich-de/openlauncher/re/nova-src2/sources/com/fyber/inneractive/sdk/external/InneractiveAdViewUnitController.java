package com.fyber.inneractive.sdk.external;

import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.activities.InneractiveFullscreenAdActivity;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.q0;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.y0;
import com.fyber.inneractive.sdk.factories.h;
import com.fyber.inneractive.sdk.flow.g0;
import com.fyber.inneractive.sdk.flow.h0;
import com.fyber.inneractive.sdk.flow.i0;
import com.fyber.inneractive.sdk.flow.r0;
import com.fyber.inneractive.sdk.flow.s0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.r;
import com.fyber.inneractive.sdk.util.v;
import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes.dex */
public class InneractiveAdViewUnitController extends s0 implements g0, InneractiveFullscreenAdActivity.FullScreenRendererProvider {
    public static final int DISABLED_REFRESH_INTERVAL = -1;

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f27992a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f27993b;

    /* renamed from: c, reason: collision with root package name */
    public ViewGroup f27994c;

    /* renamed from: d, reason: collision with root package name */
    public final int f27995d;
    protected int mAdContentHeight;
    protected int mAdContentWidth;

    public InneractiveAdViewUnitController() {
        this.f27993b = false;
        this.mAdContentWidth = -1;
        this.mAdContentHeight = -1;
        this.f27995d = 0;
        this.f27992a = new HashSet();
    }

    public final void a() {
        this.f27993b = true;
        Iterator it = new HashSet(this.f27992a).iterator();
        while (it.hasNext()) {
            ((InneractiveAdRenderer) it.next()).destroy();
        }
        this.f27992a.clear();
        this.f27994c = null;
        super.destroy();
    }

    public void bindView(ViewGroup viewGroup) {
        com.fyber.inneractive.sdk.interfaces.d dVarA;
        IAlog.a("%sPPPP bindView called with parent: %s", logPrefix(), viewGroup);
        InneractiveAdSpot adSpot = getAdSpot();
        if (adSpot == null) {
            IAlog.f("InneractiveFullscreenUnitController was not attached to an ad spot", new Object[0]);
            return;
        }
        IAlog.a("%sPPPP bindView spot is %s", logPrefix(), adSpot);
        Iterator it = new HashSet(this.f27992a).iterator();
        while (it.hasNext()) {
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if (inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) {
                com.fyber.inneractive.sdk.interfaces.d dVar = (com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer;
                if (dVar.b(viewGroup)) {
                    dVar.l();
                    IAlog.a("%sPPPP bindAdToRenderer returning an already attached renderer %s", logPrefix(), dVar);
                    return;
                }
            }
        }
        this.f27994c = viewGroup;
        Iterator it2 = com.fyber.inneractive.sdk.factories.b.f28020a.f28021a.iterator();
        while (true) {
            if (!it2.hasNext()) {
                dVarA = null;
                break;
            }
            com.fyber.inneractive.sdk.factories.a aVar = (com.fyber.inneractive.sdk.factories.a) it2.next();
            if (aVar.a(adSpot)) {
                dVarA = aVar.a();
                break;
            }
        }
        int i5 = this.f27995d;
        if (i5 != 0) {
            dVarA.a(i5);
        }
        if (dVarA == null) {
            IAlog.f("%sCould not find a renderer for the given spot! Did you add the appropriate module to your project?", logPrefix());
            return;
        }
        dVarA.initialize(adSpot);
        selectContentController();
        dVarA.a(viewGroup);
        this.f27992a.add(dVarA);
        IAlog.a("%sPPPP bindView created renderer %s", logPrefix(), dVarA);
    }

    @Override // com.fyber.inneractive.sdk.flow.s0
    public boolean canRefreshAd() {
        if (!supportsRefresh()) {
            return false;
        }
        Iterator it = this.f27992a.iterator();
        while (it.hasNext()) {
            if (!((InneractiveAdRenderer) it.next()).canRefreshAd()) {
                return false;
            }
        }
        return true;
    }

    @Override // com.fyber.inneractive.sdk.flow.s0, com.fyber.inneractive.sdk.external.InneractiveUnitController
    public void destroy() {
        if (Looper.myLooper() == null || Looper.getMainLooper() != Looper.myLooper()) {
            r.f31216b.post(new e(this));
        } else {
            a();
        }
    }

    public int getAdContentHeight() {
        int iN;
        Iterator it = this.f27992a.iterator();
        while (it.hasNext()) {
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if ((inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) && (iN = ((com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer).n()) > 0) {
                return iN;
            }
        }
        return this.mAdContentHeight;
    }

    public int getAdContentWidth() {
        int iD;
        Iterator it = this.f27992a.iterator();
        while (it.hasNext()) {
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if ((inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) && (iD = ((com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer).d()) > 0) {
                return iD;
            }
        }
        return this.mAdContentWidth;
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveFullscreenAdActivity.FullScreenRendererProvider
    public com.fyber.inneractive.sdk.interfaces.f getFullscreenRenderer() {
        com.fyber.inneractive.sdk.interfaces.f fVarB;
        InneractiveAdSpot inneractiveAdSpot = (InneractiveAdSpot) v.a(this.mAdSpot);
        Iterator it = h.f28024a.f28025a.iterator();
        while (true) {
            if (!it.hasNext()) {
                fVarB = null;
                break;
            }
            com.fyber.inneractive.sdk.factories.g gVar = (com.fyber.inneractive.sdk.factories.g) it.next();
            if (gVar.a(inneractiveAdSpot)) {
                fVarB = gVar.b(inneractiveAdSpot);
                break;
            }
        }
        this.f27992a.add(fVarB);
        return fVarB;
    }

    @Override // com.fyber.inneractive.sdk.flow.s0, com.fyber.inneractive.sdk.external.InneractiveUnitController
    public InneractiveContentController getSelectedContentController() {
        return this.mSelectedContentController;
    }

    @Override // com.fyber.inneractive.sdk.flow.g0
    public void onAdRefreshFailed(InneractiveAdSpot inneractiveAdSpot, InneractiveErrorCode inneractiveErrorCode) {
        Iterator it = new HashSet(this.f27992a).iterator();
        while (it.hasNext()) {
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if (inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) {
                ((com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer).p();
                return;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.g0
    public void onAdRefreshed(InneractiveAdSpot inneractiveAdSpot) {
        com.fyber.inneractive.sdk.interfaces.d dVar;
        Iterator it = new HashSet(this.f27992a).iterator();
        while (true) {
            if (!it.hasNext()) {
                dVar = null;
                break;
            }
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if (inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) {
                dVar = (com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer;
                if (dVar.a(inneractiveAdSpot.getAdContent())) {
                    break;
                }
            }
        }
        if (dVar != null) {
            dVar.a((ViewGroup) null);
        } else {
            onAdRefreshFailed(inneractiveAdSpot, InneractiveErrorCode.SDK_INTERNAL_ERROR);
        }
        try {
            if (inneractiveAdSpot instanceof h0) {
                int i5 = IAlog.f31163a;
                IAlog.d("%s %s", "AD_REFRESH", ((h0) inneractiveAdSpot).f28157h.f28260d.b());
            }
        } catch (Exception unused) {
        }
        IAlog.a("InneractiveFullscreenUnitController onAdRefreshed called", new Object[0]);
    }

    public void refreshAd() {
        IAlog.a("InneractiveFullscreenUnitController refreshAd called", new Object[0]);
        InneractiveAdSpot inneractiveAdSpot = (InneractiveAdSpot) v.a(this.mAdSpot);
        if (inneractiveAdSpot == null || !(inneractiveAdSpot instanceof r0)) {
            return;
        }
        ((r0) inneractiveAdSpot).a(this);
    }

    @Override // com.fyber.inneractive.sdk.flow.s0
    public boolean supports(InneractiveAdSpot inneractiveAdSpot) {
        w0 w0Var = (w0) inneractiveAdSpot.getAdContent().f28440d;
        if (w0Var.f27947e != null) {
            return false;
        }
        q0 q0Var = w0Var.f27945c;
        if (q0Var != null) {
            if (UnitDisplayType.BANNER.equals(q0Var.f27882b) || UnitDisplayType.MRECT.equals(q0Var.f27882b)) {
                return true;
            }
            if (UnitDisplayType.INTERSTITIAL.equals(q0Var.f27882b)) {
                return inneractiveAdSpot.getCurrentProcessedRequest() != null && inneractiveAdSpot.getCurrentProcessedRequest().getAllowFullscreen();
            }
        }
        y0 y0Var = w0Var.f27948f;
        return y0Var != null && (UnitDisplayType.LANDSCAPE.equals(y0Var.f27963j) || UnitDisplayType.SQUARE.equals(y0Var.f27963j) || UnitDisplayType.MRECT.equals(y0Var.f27963j));
    }

    @Override // com.fyber.inneractive.sdk.flow.s0
    public boolean supportsRefresh() {
        return true;
    }

    public void unbindFullscreenRenderer(com.fyber.inneractive.sdk.interfaces.f fVar) {
        WeakReference<i0> weakReference;
        IAlog.a("%sremoving full screen ad renderer %s", logPrefix(), fVar);
        HashSet hashSet = this.f27992a;
        if (hashSet != null) {
            hashSet.remove(fVar);
        }
        if (this.f27993b) {
            return;
        }
        Iterator it = new HashSet(this.f27992a).iterator();
        while (it.hasNext()) {
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if (inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) {
                ((com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer).q();
                if (this.mEventsListener != null && (weakReference = this.mAdSpot) != null && weakReference.get() != null) {
                    ((InneractiveAdViewEventsListener) this.mEventsListener).onAdCollapsed(this.mAdSpot.get());
                }
            }
        }
    }

    public void unbindView(View view) {
        if (this.f27994c != view) {
            IAlog.f("%s unbindView invoked with incorrect view, was - %s received - %s", logPrefix(), this.f27994c, view);
        } else {
            this.f27994c = null;
        }
        IAlog.a("%sPPPP unbindView called with %s", logPrefix(), view);
        IAlog.a("%sPPPP spot is %s", logPrefix(), this.mAdSpot);
        Iterator it = new HashSet(this.f27992a).iterator();
        while (it.hasNext()) {
            InneractiveAdRenderer inneractiveAdRenderer = (InneractiveAdRenderer) it.next();
            if (inneractiveAdRenderer instanceof com.fyber.inneractive.sdk.interfaces.d) {
                com.fyber.inneractive.sdk.interfaces.d dVar = (com.fyber.inneractive.sdk.interfaces.d) inneractiveAdRenderer;
                if (dVar.b(view)) {
                    IAlog.a("%sPPPP unbindView unbinding renderer %s", logPrefix(), inneractiveAdRenderer);
                    dVar.s();
                    this.f27992a.remove(dVar);
                    return;
                }
            }
        }
    }

    public InneractiveAdViewUnitController(int i5) {
        this();
        if (i5 >= 30) {
            IAlog.a("InneractiveAdViewUnitController: Overriding remote config refresh interval to: %d", Integer.valueOf(i5));
            this.f27995d = i5;
        } else {
            IAlog.a("InneractiveAdViewUnitController: Overriding remote config refresh interval - value too low. Setting to default: %d -> %d", Integer.valueOf(i5), 30);
            this.f27995d = 30;
        }
    }

    public InneractiveAdViewUnitController(boolean z11) {
        this();
        if (z11) {
            this.f27995d = -1;
        }
    }
}
