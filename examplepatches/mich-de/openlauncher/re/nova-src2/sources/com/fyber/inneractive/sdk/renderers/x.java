package com.fyber.inneractive.sdk.renderers;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.activities.InneractiveRichMediaVideoPlayerActivityCore;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.c1;
import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.q0;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.y0;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveContentController;
import com.fyber.inneractive.sdk.external.InneractiveFullScreenAdRewardedListener;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenUnitController;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenVideoContentController;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.external.WebViewRendererProcessHasGoneError;
import com.fyber.inneractive.sdk.flow.i0;
import com.fyber.inneractive.sdk.flow.m0;
import com.fyber.inneractive.sdk.flow.p0;
import com.fyber.inneractive.sdk.flow.s0;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.x0;
import com.fyber.inneractive.sdk.player.controller.g0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.u1;
import com.fyber.inneractive.sdk.util.w1;
import java.lang.ref.WeakReference;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class x extends p0 implements g0, com.fyber.inneractive.sdk.flow.storepromo.observer.a, com.fyber.inneractive.sdk.rtb.watermark.a {
    public WeakReference A;
    public com.fyber.inneractive.sdk.external.f E;
    public f0 G;
    public com.fyber.inneractive.sdk.util.viewtime.c M;

    /* renamed from: x, reason: collision with root package name */
    public com.fyber.inneractive.sdk.interfaces.e f31028x;

    /* renamed from: y, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.ui.m f31029y;

    /* renamed from: z, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.controller.b f31030z;
    public boolean B = false;
    public boolean C = false;
    public boolean D = false;
    public UnitDisplayType F = UnitDisplayType.INTERSTITIAL;
    public boolean H = false;
    public final w I = new w(this);
    public final RelativeLayout.LayoutParams J = new RelativeLayout.LayoutParams(-1, -1);
    public boolean K = false;
    public boolean L = false;

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final boolean B() {
        com.fyber.inneractive.sdk.player.ui.m mVar = this.f31029y;
        return mVar != null && mVar.b();
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final void G() {
        View view = this.f28039j;
        if (view != null) {
            view.setVisibility(8);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final boolean I() {
        return this.K;
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final int K() {
        com.fyber.inneractive.sdk.config.global.r rVar;
        Integer numA;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (rVar = ((t0) xVar).f28439c) == null || (numA = ((com.fyber.inneractive.sdk.config.global.features.s) rVar.a(com.fyber.inneractive.sdk.config.global.features.s.class)).a("close_clickable_area_dp")) == null) {
            return -1;
        }
        return numA.intValue();
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final int L() {
        com.fyber.inneractive.sdk.config.global.r rVar;
        Integer numA;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (rVar = ((t0) xVar).f28439c) == null || (numA = ((com.fyber.inneractive.sdk.config.global.features.s) rVar.a(com.fyber.inneractive.sdk.config.global.features.s.class)).a("close_visible_size_dp")) == null) {
            return -1;
        }
        return numA.intValue();
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final long M() {
        int iA;
        f0 f0Var;
        boolean zA = x0.a(P()).a();
        if (InneractiveAdManager.isCurrentUserAChild() && !zA) {
            if (A()) {
                Integer numA = ((com.fyber.inneractive.sdk.config.global.features.c) ((t0) this.f28031b).f28439c.a(com.fyber.inneractive.sdk.config.global.features.c.class)).a("end_card_skip_time_sec");
                int iIntValue = numA != null ? numA.intValue() : 0;
                if (iIntValue < 0 || iIntValue > 5) {
                    iIntValue = 0;
                }
                if (iIntValue > 0) {
                    IAlog.a("%s: overriding endcard dismiss time with child mode with %d", IAlog.a(this), Integer.valueOf(iIntValue));
                    return iIntValue;
                }
            }
            IAlog.a("%s: overriding endcard dismiss time with child mode with %d", IAlog.a(this), 0);
            return 0L;
        }
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f31030z;
        if (bVar == null && (f0Var = this.G) != null) {
            bVar = f0Var.f30986a;
        }
        com.fyber.inneractive.sdk.flow.endcard.k kVarJ = bVar != null ? ((com.fyber.inneractive.sdk.player.controller.z) bVar).j() : null;
        if (kVarJ != null) {
            com.fyber.inneractive.sdk.flow.endcard.b bVarA = kVarJ.f28081g.get() ? kVarJ.f28076b.a() : kVarJ.a();
            iA = bVarA != null ? bVarA.f28060f : kVarJ.f28080f;
        } else {
            String str = com.fyber.inneractive.sdk.flow.endcard.h.f28069d;
            iA = IAConfigManager.Q.f27761u.f27936b.a("vast_endcard_x_delay", 5, 0);
        }
        long j11 = iA;
        if (x0.a(P()).f28444a >= 0 && j11 < 0) {
            j11 = 0;
        }
        com.fyber.inneractive.sdk.config.o oVarA = IAConfigManager.Q.f27761u.f27936b.a("endcard");
        if (!zA && !InneractiveAdManager.isCurrentUserAChild()) {
            if (oVarA.f27871a.containsKey("endcard_cr") || oVarA.f27871a.containsKey("endcard_ci")) {
                String str2 = this.F != UnitDisplayType.REWARDED ? "endcard_ci" : "endcard_cr";
                long j12 = oVarA.f27871a.containsKey(str2) ? Long.parseLong((String) oVarA.f27871a.get(str2)) : j11;
                if (j12 >= 0 && j12 <= 5) {
                    IAlog.a("%s : overriding endcard dismiss time for type: %s with: %d sec.", IAlog.a(this), this.F, Long.valueOf(j12));
                    this.f28272t = true;
                    j11 = j12;
                }
            }
        }
        return j11 * 1000;
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final boolean N() {
        com.fyber.inneractive.sdk.player.ui.m mVar = this.f31029y;
        return mVar != null && mVar.c();
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void O() {
        if (this.C || this.f28032c == null) {
            return;
        }
        this.C = true;
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar != null) {
            if (eVar.wasDismissedByUser() || IAConfigManager.Q.f27761u.f27936b.a("endcard").a()) {
                com.fyber.inneractive.sdk.model.vast.x xVar = com.fyber.inneractive.sdk.model.vast.x.EVENT_CLOSE;
                com.fyber.inneractive.sdk.flow.x xVar2 = this.f28031b;
                if (xVar2 != null) {
                    t0 t0Var = (t0) xVar2;
                    if (t0Var.f28389i != null) {
                        String[] strArr = {xVar.a()};
                        com.fyber.inneractive.sdk.player.t tVar = t0Var.f28389i;
                        if (tVar != null) {
                            tVar.a("EVENT_TRACKING", strArr);
                        }
                    }
                }
                com.fyber.inneractive.sdk.model.vast.x xVar3 = com.fyber.inneractive.sdk.model.vast.x.EVENT_CLOSE_LINEAR;
                com.fyber.inneractive.sdk.flow.x xVar4 = this.f28031b;
                if (xVar4 != null) {
                    t0 t0Var2 = (t0) xVar4;
                    if (t0Var2.f28389i != null) {
                        String[] strArr2 = {xVar3.a()};
                        com.fyber.inneractive.sdk.player.t tVar2 = t0Var2.f28389i;
                        if (tVar2 != null) {
                            tVar2.a("EVENT_TRACKING", strArr2);
                        }
                    }
                }
            } else {
                x0 x0VarA = x0.a(P());
                if (x0VarA.f28444a >= 0 && x0VarA.f28445b <= -1) {
                }
            }
        }
        ((InneractiveFullscreenAdEventsListener) this.f28032c).onAdDismissed(this.f28030a);
    }

    public final com.fyber.inneractive.sdk.player.n P() {
        com.fyber.inneractive.sdk.player.t tVar;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (tVar = ((t0) xVar).f28389i) == null) {
            return null;
        }
        com.fyber.inneractive.sdk.player.a aVar = tVar.f30657f;
        if (aVar instanceof com.fyber.inneractive.sdk.player.n) {
            return (com.fyber.inneractive.sdk.player.n) aVar;
        }
        return null;
    }

    public final void Q() {
        com.fyber.inneractive.sdk.config.x0 x0Var;
        q0 q0Var;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (x0Var = ((t0) xVar).f28440d) == null || (q0Var = ((w0) x0Var).f27945c) == null) {
            return;
        }
        UnitDisplayType unitDisplayType = q0Var.f27882b;
        c1 c1Var = IAConfigManager.Q.f27764x;
        com.fyber.inneractive.sdk.cache.session.enums.c cVar = unitDisplayType == UnitDisplayType.REWARDED ? com.fyber.inneractive.sdk.cache.session.enums.c.REWARDED_VIDEO : com.fyber.inneractive.sdk.cache.session.enums.c.INTERSTITIAL_VIDEO;
        com.fyber.inneractive.sdk.cache.session.enums.a aVar = com.fyber.inneractive.sdk.cache.session.enums.a.CLICK;
        com.fyber.inneractive.sdk.cache.session.e eVar = c1Var.f27770a;
        if (eVar != null) {
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.cache.session.d(eVar, aVar, cVar));
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void a() {
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final boolean b(com.fyber.inneractive.sdk.flow.x xVar) {
        Boolean boolC;
        com.fyber.inneractive.sdk.config.global.r rVar;
        f0 f0Var;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        com.fyber.inneractive.sdk.config.r rVar2 = iAConfigManager.f27761u.f27936b;
        rVar2.getClass();
        String str = iAConfigManager.f27746d;
        if (!(rVar2.f27886b.containsKey(str) ? (com.fyber.inneractive.sdk.config.p) rVar2.f27886b.get(str) : new com.fyber.inneractive.sdk.config.p()).f27873a.containsKey("endcard")) {
            com.fyber.inneractive.sdk.ui.controller.b bVar = this.f31030z;
            if (bVar == null && (f0Var = this.G) != null) {
                bVar = f0Var.f30986a;
            }
            com.fyber.inneractive.sdk.config.global.features.v vVar = null;
            com.fyber.inneractive.sdk.flow.endcard.k kVarJ = bVar != null ? ((com.fyber.inneractive.sdk.player.controller.z) bVar).j() : null;
            com.fyber.inneractive.sdk.flow.endcard.b bVarA = kVarJ != null ? kVarJ.f28076b.a() : null;
            if (bVarA != null && bVarA.i() == com.fyber.inneractive.sdk.model.vast.i.Static) {
                com.fyber.inneractive.sdk.flow.x xVar2 = this.f28031b;
                if (xVar2 != null && (rVar = ((t0) xVar2).f28439c) != null) {
                    vVar = (com.fyber.inneractive.sdk.config.global.features.v) rVar.a(com.fyber.inneractive.sdk.config.global.features.v.class);
                }
                UnitDisplayType unitDisplayType = this.F;
                vVar.getClass();
                int i5 = com.fyber.inneractive.sdk.config.global.features.t.f27821a[unitDisplayType.ordinal()];
                if (i5 != 1) {
                    if (i5 == 2 && (boolC = vVar.c("countdown_iv")) != null) {
                        return boolC.booleanValue();
                    }
                    return false;
                }
                Boolean boolC2 = vVar.c("countdown_rv");
                if (boolC2 != null) {
                    return boolC2.booleanValue();
                }
            }
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void c() {
        if (!this.D) {
            this.f28273u.a(true);
        }
        this.D = true;
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void destroy() {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar != null) {
            eVar.destroy();
        }
        if (this.B) {
            O();
        }
        com.fyber.inneractive.sdk.player.controller.b bVar = this.f31030z;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.player.controller.z) bVar).b(this);
            this.f31030z.destroy();
            this.f31030z = null;
        }
        com.fyber.inneractive.sdk.player.ui.m mVar = this.f31029y;
        if (mVar != null) {
            mVar.destroy();
            this.f31029y = null;
        }
        this.f31028x = null;
        this.A = null;
        this.M = null;
        super.destroy();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void e() {
        Q();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void f() throws JSONException {
        this.K = true;
        m0 m0Var = this.f28275w;
        if (m0Var != null) {
            m0Var.cancel();
            this.f28275w = null;
        }
        if (!this.f28271s) {
            this.f28271s = true;
            com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
            if (eVar != null) {
                d(eVar.isCloseButtonDisplay());
            }
        }
        com.fyber.inneractive.sdk.interfaces.e eVar2 = this.f31028x;
        if (eVar2 == null || !eVar2.isCloseButtonDisplay()) {
            return;
        }
        e(true ^ this.f28272t);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void g() {
        com.fyber.inneractive.sdk.util.viewtime.c cVar = this.M;
        if (cVar != null) {
            com.fyber.inneractive.sdk.player.ui.m mVar = this.f31029y;
            cVar.f31245d = mVar != null && mVar.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void h() {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar != null) {
            eVar.dismissAd(false);
        }
        a(new WebViewRendererProcessHasGoneError());
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void i() {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar != null) {
            eVar.dismissAd(true);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void j() {
        c1 c1Var = IAConfigManager.Q.f27764x;
        com.fyber.inneractive.sdk.cache.session.enums.c cVar = this.F == UnitDisplayType.INTERSTITIAL ? com.fyber.inneractive.sdk.cache.session.enums.c.INTERSTITIAL_VIDEO : com.fyber.inneractive.sdk.cache.session.enums.c.REWARDED_VIDEO;
        com.fyber.inneractive.sdk.cache.session.enums.a aVar = com.fyber.inneractive.sdk.cache.session.enums.a.IMPRESSION;
        com.fyber.inneractive.sdk.cache.session.e eVar = c1Var.f27770a;
        if (eVar != null) {
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.cache.session.d(eVar, aVar, cVar));
        }
        E();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void k() {
        O();
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        if (inneractiveAdSpot == null || !(inneractiveAdSpot instanceof i0)) {
            return;
        }
        ((i0) inneractiveAdSpot).a();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void m() {
        w1 w1Var = this.f28267m;
        if (w1Var != null) {
            w1Var.f31249d = false;
            w1Var.a(SystemClock.uptimeMillis());
        }
        w1 w1Var2 = this.o;
        if (w1Var2 != null) {
            w1Var2.f31249d = false;
            w1Var2.a(SystemClock.uptimeMillis());
        }
        this.f28274v.a();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void onPlayerError() {
        InneractiveFullscreenVideoContentController inneractiveFullscreenVideoContentController = (InneractiveFullscreenVideoContentController) com.fyber.inneractive.sdk.util.v.a(this.A);
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar != null) {
            eVar.dismissAd(false);
        }
        if (inneractiveFullscreenVideoContentController != null) {
            inneractiveFullscreenVideoContentController.onPlayerError();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void onProgress(int i5, int i11) {
        com.fyber.inneractive.sdk.util.viewtime.c cVar = this.M;
        if (cVar != null && i11 > -1) {
            cVar.f31238a = i11;
        }
        this.f28273u.a();
        InneractiveFullscreenVideoContentController inneractiveFullscreenVideoContentController = (InneractiveFullscreenVideoContentController) com.fyber.inneractive.sdk.util.v.a(this.A);
        if (inneractiveFullscreenVideoContentController != null) {
            inneractiveFullscreenVideoContentController.onProgress(i5, i11);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void r() {
        w1 w1Var = this.f28267m;
        if (w1Var != null) {
            w1Var.f31249d = true;
            u1 u1Var = w1Var.f31248c;
            if (u1Var != null) {
                u1Var.removeMessages(1932593528);
            }
        }
        w1 w1Var2 = this.o;
        if (w1Var2 != null) {
            w1Var2.f31249d = true;
            u1 u1Var2 = w1Var2.f31248c;
            if (u1Var2 != null) {
                u1Var2.removeMessages(1932593528);
            }
        }
        com.fyber.inneractive.sdk.util.a aVar = this.f28273u;
        if (aVar.f31167b && aVar.f31170e == 0) {
            aVar.f31170e = System.currentTimeMillis();
        }
        com.fyber.inneractive.sdk.util.a aVar2 = this.f28274v;
        if (aVar2.f31167b && aVar2.f31170e == 0) {
            aVar2.f31170e = System.currentTimeMillis();
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final boolean u() throws JSONException {
        com.fyber.inneractive.sdk.player.t tVar;
        com.fyber.inneractive.sdk.player.controller.b bVar;
        com.fyber.inneractive.sdk.interfaces.e eVar;
        com.fyber.inneractive.sdk.player.ui.m mVar;
        com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar2;
        com.fyber.inneractive.sdk.flow.storepromo.ui.c cVar;
        View view;
        com.fyber.inneractive.sdk.flow.storepromo.ui.c cVar2;
        View view2;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (tVar = ((t0) xVar).f28389i) == null || (bVar = this.f31030z) == null || (eVar = this.f31028x) == null || (mVar = this.f31029y) == null) {
            return false;
        }
        com.fyber.inneractive.sdk.player.n nVar = (com.fyber.inneractive.sdk.player.n) tVar.f30657f;
        com.fyber.inneractive.sdk.flow.storepromo.b bVar3 = nVar.f30644w;
        if (bVar3 == null || (bVar2 = bVar3.f28284d) == null || (cVar = bVar2.f28294d) == null || cVar.f28380b == null || (view = cVar.f28379a) == null || view.getParent() == null || cVar.f28380b.getVisibility() != 0) {
            if (mVar.c()) {
                if (this.f28268p) {
                    eVar.dismissAd(true);
                    return true;
                }
            } else if (bVar.b()) {
                com.fyber.inneractive.sdk.player.controller.z zVar = (com.fyber.inneractive.sdk.player.controller.z) bVar;
                if (zVar.C()) {
                    zVar.f(true);
                    return true;
                }
                zVar.d(true);
            }
            return true;
        }
        com.fyber.inneractive.sdk.flow.storepromo.b bVar4 = nVar.f30644w;
        com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar5 = bVar4.f28284d;
        if (bVar5 == null || (cVar2 = bVar5.f28294d) == null || cVar2.f28380b == null || (view2 = cVar2.f28379a) == null || view2.getParent() == null || cVar2.f28380b.getVisibility() != 0) {
            IAlog.f("StorePromoManager: hidePromo: unable hide promo: controller null or not ready", new Object[0]);
            return true;
        }
        bVar4.f28284d.a();
        return true;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final void v() {
        View view = this.f28039j;
        if (view != null) {
            view.setVisibility(0);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.interfaces.f
    public final void a(com.fyber.inneractive.sdk.interfaces.e eVar, Activity activity) throws InneractiveUnitController.AdDisplayError {
        y0 y0Var;
        super.a(eVar, activity);
        this.f31028x = eVar;
        boolean z11 = false;
        this.B = false;
        this.C = false;
        this.L = false;
        InneractiveUnitController selectedUnitController = this.f28030a.getSelectedUnitController();
        if (selectedUnitController != null) {
            if (selectedUnitController instanceof InneractiveFullscreenUnitController) {
                InneractiveContentController selectedContentController = selectedUnitController.getSelectedContentController();
                if (selectedContentController != null) {
                    if (selectedContentController instanceof InneractiveFullscreenVideoContentController) {
                        this.A = new WeakReference((InneractiveFullscreenVideoContentController) selectedContentController);
                    } else {
                        IAlog.f("%sContent controller expected to be InneractiveFullscreenVideoContentController and is %s", IAlog.a(this), selectedContentController.getClass().getSimpleName());
                    }
                }
            } else {
                IAlog.f("%sWrong type of unit controller found. Expecting InneractiveFullscreenUnitController", IAlog.a(this));
            }
        }
        com.fyber.inneractive.sdk.config.x0 x0Var = this.f28030a.getAdContent().f28440d;
        if (x0Var != null && (y0Var = ((w0) x0Var).f27948f) != null) {
            this.F = y0Var.f27963j;
        }
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar != null) {
            ((t0) xVar).e();
        }
        com.fyber.inneractive.sdk.flow.x xVar2 = this.f28031b;
        com.fyber.inneractive.sdk.util.viewtime.c cVar = null;
        com.fyber.inneractive.sdk.player.t tVar = xVar2 != null ? ((t0) xVar2).f28389i : null;
        Context context = this.f31028x.getLayout().getContext();
        if (tVar != null) {
            com.fyber.inneractive.sdk.player.a aVar = tVar.f30657f;
            if (aVar == null || ((com.fyber.inneractive.sdk.player.n) aVar).f30579a == null) {
                IAlog.f("%sFull screen video ad renderer is not valid.", IAlog.a(this));
                throw new InneractiveUnitController.AdDisplayError("Full screen video could not be loaded");
            }
            f fVar = new f(tVar);
            this.G = fVar;
            this.f31029y = fVar.a(context, ((t0) this.f28031b).f28439c);
            com.fyber.inneractive.sdk.player.controller.b bVarA = this.G.a(this.f28030a, (t0) this.f28031b);
            this.f31030z = bVarA;
            this.G.b();
            bVarA.b(false);
            com.fyber.inneractive.sdk.player.controller.z zVar = (com.fyber.inneractive.sdk.player.controller.z) this.f31030z;
            zVar.getClass();
            zVar.f28951g = this;
            ((com.fyber.inneractive.sdk.player.controller.z) this.f31030z).a(this);
            ((com.fyber.inneractive.sdk.player.ui.e) this.f31029y).f();
            this.J.addRule(13);
            this.f31028x.getLayout().addView((View) this.f31029y, this.J);
            this.f28039j = ((View) this.f31029y).findViewById(R.id.ia_click_overlay);
            this.G.a(this.I);
            this.B = true;
            com.fyber.inneractive.sdk.player.n nVarP = P();
            if (nVarP == null || this.f31030z == null) {
                IAlog.b("%s%s is null, cannot create VideoViewTime", IAlog.a(this), nVarP == null ? "mediaPlayerFlowManager" : "mUIController");
            } else {
                int iC = nVarP.f30579a.c();
                com.fyber.inneractive.sdk.flow.x xVar3 = this.f28031b;
                com.fyber.inneractive.sdk.util.a aVar2 = this.f28273u;
                int iL = ((com.fyber.inneractive.sdk.player.controller.z) this.f31030z).l() * 1000;
                boolean zA = com.fyber.inneractive.sdk.player.f.a(nVarP);
                boolean zA2 = x0.a(P()).a();
                if (InneractiveAdManager.isCurrentUserAChild() || zA2 || this.F != UnitDisplayType.REWARDED) {
                    z11 = zA;
                } else if (iC > iL) {
                    z11 = true;
                }
                cVar = new com.fyber.inneractive.sdk.util.viewtime.c(xVar3, aVar2, z11);
            }
            this.M = cVar;
        }
    }

    public final void f(boolean z11) throws JSONException {
        if (N() && this.K) {
            return;
        }
        if (z11) {
            com.fyber.inneractive.sdk.player.controller.b bVar = this.f31030z;
            com.fyber.inneractive.sdk.flow.endcard.k kVarJ = bVar != null ? ((com.fyber.inneractive.sdk.player.controller.z) bVar).j() : null;
            com.fyber.inneractive.sdk.flow.endcard.o oVar = kVarJ != null ? (com.fyber.inneractive.sdk.flow.endcard.o) kVarJ.f28076b.a(com.fyber.inneractive.sdk.model.vast.i.FMP_End_Card) : null;
            this.f28274v.a(oVar != null ? oVar.g().toString() : null);
            return;
        }
        com.fyber.inneractive.sdk.util.a aVar = this.f28274v;
        aVar.f31169d = 0L;
        aVar.f31170e = 0L;
        aVar.f31171f = 0L;
        aVar.f31167b = false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x003f, code lost:
    
        if (((r3 == null || (r3 = r3.B) == null || !android.text.TextUtils.equals(r3, "1")) ? false : true) != false) goto L57;
     */
    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.interfaces.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(boolean z11) throws JSONException {
        com.fyber.inneractive.sdk.model.vast.o oVar;
        ViewGroup viewGroup;
        f(z11);
        com.fyber.inneractive.sdk.player.controller.b bVar = this.f31030z;
        com.fyber.inneractive.sdk.flow.endcard.k kVarJ = bVar != null ? ((com.fyber.inneractive.sdk.player.controller.z) bVar).j() : null;
        com.fyber.inneractive.sdk.player.ui.m mVar = this.f31029y;
        if ((mVar == null || (viewGroup = ((com.fyber.inneractive.sdk.player.ui.s) mVar).f30737r) == null || viewGroup.getVisibility() != 0) && !this.H) {
            if (kVarJ != null) {
                com.fyber.inneractive.sdk.response.g gVar = kVarJ.f28075a.f28456d;
            }
            com.fyber.inneractive.sdk.flow.endcard.b bVarB = kVarJ != null ? kVarJ.b() : null;
            boolean z12 = x0.a(P()).f28444a >= 0;
            if (bVarB != null && (oVar = bVarB.f28057c.f28457e.f28573f) != null && oVar.f28625d && !z12) {
                this.K = false;
                this.f28268p = false;
                com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
                if (eVar != null) {
                    eVar.disableCloseButton();
                }
                com.fyber.inneractive.sdk.util.a aVar = this.f28274v;
                aVar.f31169d = 0L;
                aVar.f31170e = 0L;
                aVar.f31171f = 0L;
                aVar.f31167b = false;
                Runnable runnable = this.f28266l;
                if (runnable != null) {
                    com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable);
                    this.f28266l = null;
                }
                Runnable runnable2 = this.n;
                if (runnable2 != null) {
                    com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable2);
                    this.n = null;
                }
                J();
                this.G.f30986a.a(bVarB);
                com.fyber.inneractive.sdk.interfaces.e eVar2 = this.f31028x;
                if (eVar2 != null) {
                    eVar2.secondEndCardWasDisplayed();
                    return;
                }
                return;
            }
            com.fyber.inneractive.sdk.interfaces.e eVar3 = this.f31028x;
            if (eVar3 != null) {
                eVar3.destroy();
                return;
            }
            return;
        }
        com.fyber.inneractive.sdk.interfaces.e eVar4 = this.f31028x;
        if (eVar4 != null) {
            eVar4.destroy();
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void a(com.fyber.inneractive.sdk.external.f fVar) {
        this.E = fVar;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final com.fyber.inneractive.sdk.util.d0 a(g1 g1Var, com.fyber.inneractive.sdk.util.g gVar) {
        Context context;
        com.fyber.inneractive.sdk.response.e eVar;
        com.fyber.inneractive.sdk.model.vast.b bVar;
        Q();
        if (this.f31029y.getContext() == null) {
            context = com.fyber.inneractive.sdk.util.o.f31210a;
        } else {
            context = this.f31029y.getContext();
        }
        Context context2 = context;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        return a(context2, (xVar == null || (eVar = ((t0) xVar).f28438b) == null || (bVar = ((com.fyber.inneractive.sdk.response.g) eVar).N) == null) ? null : bVar.f28569b, g1Var, gVar, false, null);
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.interfaces.f
    public final boolean b(com.fyber.inneractive.sdk.flow.storepromo.observer.a aVar) {
        com.fyber.inneractive.sdk.player.controller.b bVar = this.f31030z;
        if (bVar == null) {
            IAlog.f("Unable to register store promo observer - ui controller unavailable", new Object[0]);
            return false;
        }
        return ((com.fyber.inneractive.sdk.player.controller.z) bVar).a(aVar);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void a(boolean z11, Orientation orientation) {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar != null) {
            eVar.setActivityOrientation(z11, orientation);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void a(String str, String str2) throws JSONException {
        IAlog.a(IAlog.a(this) + "full screen video ad renderer callback: onSuspiciousNoUserWebActionDetected", new Object[0]);
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
        if (eVar == null || eVar.getLayout() == null || this.f31028x.getLayout().getContext() == null) {
            return;
        }
        if (!this.L) {
            com.fyber.inneractive.sdk.network.b0.a(this.f31028x.getLayout().getContext(), str, str2, this.f28031b);
            this.L = true;
            IAlog.a(IAlog.a(this) + "reporting auto redirect", new Object[0]);
            return;
        }
        IAlog.a(IAlog.a(this) + "redirect already reported for this ad", new Object[0]);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final com.fyber.inneractive.sdk.util.d0 a(String str, g1 g1Var, boolean z11) {
        f0 f0Var;
        if (this.F == UnitDisplayType.INTERSTITIAL) {
            this.H = true;
        }
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f31030z;
        if (bVar == null && (f0Var = this.G) != null) {
            bVar = f0Var.f30986a;
        }
        com.fyber.inneractive.sdk.flow.endcard.k kVarJ = bVar != null ? ((com.fyber.inneractive.sdk.player.controller.z) bVar).j() : null;
        com.fyber.inneractive.sdk.flow.endcard.b bVarA = kVarJ != null ? kVarJ.f28076b.a() : null;
        if (bVarA != null) {
            Q();
            com.fyber.inneractive.sdk.util.d0 d0VarA = a(bVarA.f28057c.f28453a, str, g1Var, bVarA.g(), false, null);
            if (d0VarA.f31180a != com.fyber.inneractive.sdk.util.g0.FAILED) {
                t0 t0Var = bVarA.f28057c.f28454b;
                String[] strArr = {com.fyber.inneractive.sdk.model.vast.x.EVENT_CLICK.toString()};
                com.fyber.inneractive.sdk.player.t tVar = t0Var.f28389i;
                if (tVar != null) {
                    tVar.a("EVENT_TRACKING", strArr);
                }
            }
            return d0VarA;
        }
        return new com.fyber.inneractive.sdk.util.d0(com.fyber.inneractive.sdk.util.g0.FAILED, new Exception("No Companion clicked"));
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void a(int i5, boolean z11) {
        com.fyber.inneractive.sdk.util.viewtime.c cVar = this.M;
        if (cVar != null && i5 > -1) {
            cVar.f31238a = i5;
        }
        if (cVar != null) {
            cVar.a(z11);
            this.M = null;
        }
        InneractiveFullscreenVideoContentController inneractiveFullscreenVideoContentController = (InneractiveFullscreenVideoContentController) com.fyber.inneractive.sdk.util.v.a(this.A);
        if (inneractiveFullscreenVideoContentController != null) {
            inneractiveFullscreenVideoContentController.onCompleted();
        }
        c1 c1Var = IAConfigManager.Q.f27764x;
        UnitDisplayType unitDisplayType = this.F;
        UnitDisplayType unitDisplayType2 = UnitDisplayType.REWARDED;
        com.fyber.inneractive.sdk.cache.session.enums.c cVar2 = unitDisplayType == unitDisplayType2 ? com.fyber.inneractive.sdk.cache.session.enums.c.REWARDED_VIDEO : com.fyber.inneractive.sdk.cache.session.enums.c.INTERSTITIAL_VIDEO;
        com.fyber.inneractive.sdk.cache.session.enums.a aVar = com.fyber.inneractive.sdk.cache.session.enums.a.COMPLETION;
        com.fyber.inneractive.sdk.cache.session.e eVar = c1Var.f27770a;
        if (eVar != null) {
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.cache.session.d(eVar, aVar, cVar2));
        }
        if (this.F == unitDisplayType2) {
            com.fyber.inneractive.sdk.external.f fVar = this.E;
            if (fVar != null) {
                i0 i0Var = (i0) com.fyber.inneractive.sdk.util.v.a(((s0) fVar.f28018a).mAdSpot);
                InneractiveFullScreenAdRewardedListener inneractiveFullScreenAdRewardedListener = fVar.f28018a.f27997b;
                if (inneractiveFullScreenAdRewardedListener != null && i0Var != null) {
                    inneractiveFullScreenAdRewardedListener.onAdRewarded(i0Var);
                }
            }
            H();
        }
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || ((t0) xVar).f28389i == null) {
            return;
        }
        J();
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0077  */
    @Override // com.fyber.inneractive.sdk.player.controller.g0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(boolean z11) throws JSONException {
        com.fyber.inneractive.sdk.player.t tVar;
        com.fyber.inneractive.sdk.util.viewtime.c cVar;
        if (z11) {
            com.fyber.inneractive.sdk.model.vast.x xVar = com.fyber.inneractive.sdk.model.vast.x.EVENT_SKIP;
            com.fyber.inneractive.sdk.flow.x xVar2 = this.f28031b;
            if (xVar2 != null) {
                t0 t0Var = (t0) xVar2;
                if (t0Var.f28389i != null) {
                    String[] strArr = {xVar.a()};
                    com.fyber.inneractive.sdk.player.t tVar2 = t0Var.f28389i;
                    if (tVar2 != null) {
                        tVar2.a("EVENT_TRACKING", strArr);
                    }
                }
            }
        }
        com.fyber.inneractive.sdk.flow.x xVar3 = this.f28031b;
        if (xVar3 == null || (tVar = ((t0) xVar3).f28389i) == null) {
            return;
        }
        tVar.a("TRACKING_COMPLETED", new String[0]);
        J();
        String[] strArr2 = new String[0];
        com.fyber.inneractive.sdk.player.t tVar3 = ((t0) this.f28031b).f28389i;
        if (tVar3 != null) {
            tVar3.a("TRACKING_COMPLETED", strArr2);
        }
        x0 x0VarA = x0.a(P());
        if (z11) {
            if (x0VarA.f28444a >= 0 && x0VarA.f28445b <= -1) {
                com.fyber.inneractive.sdk.interfaces.e eVar = this.f31028x;
                if (eVar != null) {
                    eVar.destroy();
                }
            }
            cVar = this.M;
            if (cVar != null) {
                cVar.a(z11);
                this.M = null;
            }
            f(z11);
        }
        x0VarA.getClass();
        if (IAConfigManager.Q.f27761u.f27936b.a("endcard").a() && z11) {
        }
        cVar = this.M;
        if (cVar != null) {
        }
        f(z11);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void a(View view, String str) {
        if (view != null) {
            InneractiveRichMediaVideoPlayerActivityCore.startRichMediaIntent(c(view), str);
            c(view);
            c(false);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.g0
    public final void a(View view) {
        c(view);
        c(false);
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final long a(long j11) {
        if (this.f28272t) {
            return j11;
        }
        long j12 = 12;
        try {
            j12 = Long.parseLong(IAConfigManager.Q.f27761u.f27936b.a("vast_endcard_x_fallback_delay", Long.toString(12L)));
        } catch (Throwable unused) {
        }
        return j12 * 1000;
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.interfaces.f
    public final void a(com.fyber.inneractive.sdk.flow.storepromo.observer.a aVar) {
        com.fyber.inneractive.sdk.player.controller.b bVar = this.f31030z;
        if (bVar == null) {
            IAlog.f("Unable to unregister store promo observer - ui controller unavailable", new Object[0]);
        } else {
            ((com.fyber.inneractive.sdk.player.controller.z) bVar).b(aVar);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.observer.a
    public final void a(com.fyber.inneractive.sdk.flow.storepromo.observer.b bVar) {
        if (this.F == UnitDisplayType.INTERSTITIAL) {
            IAlog.a("InneractiveFullscreenVideoAdRenderer: update: StorePromo isClicked: %s", Boolean.valueOf(bVar.f28376b));
            this.H = bVar.f28376b;
        }
    }

    @Override // com.fyber.inneractive.sdk.rtb.watermark.a
    public final void a(FrameLayout frameLayout) {
        com.fyber.inneractive.sdk.player.ui.m mVar = this.f31029y;
        if (mVar != null) {
            ((com.fyber.inneractive.sdk.player.ui.e) mVar).setWatermarkView(frameLayout);
        }
    }
}
