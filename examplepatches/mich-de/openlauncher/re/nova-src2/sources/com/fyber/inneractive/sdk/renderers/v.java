package com.fyber.inneractive.sdk.renderers;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.CreativeType;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveFullScreenAdRewardedListener;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListener;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.flow.p0;
import com.fyber.inneractive.sdk.flow.q0;
import com.fyber.inneractive.sdk.flow.s0;
import com.fyber.inneractive.sdk.flow.x0;
import com.fyber.inneractive.sdk.ui.IAmraidWebViewController;
import com.fyber.inneractive.sdk.ui.IFyberAdIdentifier;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.l0;
import com.fyber.inneractive.sdk.util.u1;
import com.fyber.inneractive.sdk.util.w1;
import com.fyber.inneractive.sdk.web.i0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class v extends p0 implements com.fyber.inneractive.sdk.rtb.watermark.a {
    public w1 F;
    public com.fyber.inneractive.sdk.external.f J;
    public com.fyber.inneractive.sdk.util.viewtime.b K;

    /* renamed from: x, reason: collision with root package name */
    public u f31024x;

    /* renamed from: z, reason: collision with root package name */
    public IAmraidWebViewController f31026z;

    /* renamed from: y, reason: collision with root package name */
    public boolean f31025y = false;
    public boolean A = false;
    public boolean B = false;
    public boolean C = false;
    public boolean D = false;
    public boolean E = false;
    public UnitDisplayType G = UnitDisplayType.INTERSTITIAL;
    public boolean H = false;
    public boolean I = false;

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final boolean I() {
        return !this.C && this.f31026z.X;
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final int K() {
        com.fyber.inneractive.sdk.config.global.r rVar;
        Integer numA;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (rVar = ((q0) xVar).f28439c) == null || rVar.a(com.fyber.inneractive.sdk.config.global.features.e.class) == null || (numA = ((com.fyber.inneractive.sdk.config.global.features.e) ((q0) this.f28031b).f28439c.a(com.fyber.inneractive.sdk.config.global.features.e.class)).a("close_clickable_area_dp")) == null) {
            return -1;
        }
        return numA.intValue();
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final int L() {
        com.fyber.inneractive.sdk.config.global.r rVar;
        Integer numA;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar == null || (rVar = ((q0) xVar).f28439c) == null || rVar.a(com.fyber.inneractive.sdk.config.global.features.e.class) == null || (numA = ((com.fyber.inneractive.sdk.config.global.features.e) ((q0) this.f28031b).f28439c.a(com.fyber.inneractive.sdk.config.global.features.e.class)).a("close_visible_size_dp")) == null) {
            return -1;
        }
        return numA.intValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00bb  */
    @Override // com.fyber.inneractive.sdk.flow.p0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long M() {
        int iB;
        com.fyber.inneractive.sdk.response.e eVar;
        x0 x0Var;
        int iMin = 5;
        if (this.G == UnitDisplayType.REWARDED) {
            IAmraidWebViewController iAmraidWebViewController = this.f31026z;
            if (iAmraidWebViewController != null) {
                synchronized (i0.f31322s0) {
                    x0Var = iAmraidWebViewController.f31339q0;
                }
            } else {
                x0Var = x0.f28443c;
            }
            iB = x0Var.a() ? x0Var.f28444a : IAConfigManager.Q.f27761u.f27936b.a("rewarded_mraid_delay", 31, 30);
            IAlog.a("%sGetting rewarded total delay of %d seconds", IAlog.a(this), Integer.valueOf(iB));
        } else {
            x0 x0VarO = O();
            if (x0VarO.a()) {
                iB = x0VarO.f28444a;
            } else {
                com.fyber.inneractive.sdk.config.v vVar = IAConfigManager.Q.f27761u;
                if (vVar == null) {
                    iB = 5;
                } else {
                    com.fyber.inneractive.sdk.config.r rVar = vVar.f27936b;
                    int iB2 = rVar.b("mraid_x_delay_v2", 5, 0);
                    com.fyber.inneractive.sdk.config.o oVarA = rVar.a("int_configuration");
                    if (oVarA != null && oVarA.f27871a.containsKey("close_d")) {
                        iB = oVarA.f27871a.containsKey("close_d") ? Integer.parseInt((String) oVarA.f27871a.get("close_d")) : 5;
                        if (iB < 0 || iB > 30) {
                            iB = 5;
                        }
                        this.f28272t = true;
                    } else if (this.G == UnitDisplayType.INTERSTITIAL) {
                        CreativeType creativeType = CreativeType.PLAYABLE;
                        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
                        iB = creativeType.equals((xVar == null || (eVar = ((q0) xVar).f28438b) == null) ? null : ((com.fyber.inneractive.sdk.response.f) eVar).J) ? rVar.b("d_ad_int_pl", iB2, 5) : iB2;
                    }
                }
            }
        }
        if (InneractiveAdManager.isCurrentUserAChild()) {
            if (A()) {
                Integer numA = ((com.fyber.inneractive.sdk.config.global.features.c) ((q0) this.f28031b).f28439c.a(com.fyber.inneractive.sdk.config.global.features.c.class)).a("skip_time_sec");
                int iIntValue = numA != null ? numA.intValue() : 5;
                if (iIntValue >= 0 && iIntValue <= 8) {
                    iMin = iIntValue;
                }
            } else {
                iMin = Math.min(iB, 5);
            }
            iB = Math.min(iMin, iB);
        }
        return iB * 1000;
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final boolean N() {
        return false;
    }

    public final x0 O() {
        x0 x0Var;
        IAmraidWebViewController iAmraidWebViewController = this.f31026z;
        if (iAmraidWebViewController == null) {
            return x0.f28443c;
        }
        synchronized (i0.f31322s0) {
            x0Var = iAmraidWebViewController.f31339q0;
        }
        return x0Var;
    }

    public final void P() {
        IAlog.a("%sprovide reward called", IAlog.a(this));
        if (this.I) {
            IAlog.a("%sreward was already provided", IAlog.a(this));
            return;
        }
        IAlog.a("%sreward sent", IAlog.a(this));
        if (this.J != null) {
            com.fyber.inneractive.sdk.cache.session.enums.a aVar = com.fyber.inneractive.sdk.cache.session.enums.a.COMPLETION;
            com.fyber.inneractive.sdk.cache.session.enums.c cVar = com.fyber.inneractive.sdk.cache.session.enums.c.REWARDED_DISPLAY;
            com.fyber.inneractive.sdk.cache.session.e eVar = IAConfigManager.Q.f27764x.f27770a;
            if (eVar != null) {
                com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.cache.session.d(eVar, aVar, cVar));
            }
            com.fyber.inneractive.sdk.external.f fVar = this.J;
            com.fyber.inneractive.sdk.flow.i0 i0Var = (com.fyber.inneractive.sdk.flow.i0) com.fyber.inneractive.sdk.util.v.a(((s0) fVar.f28018a).mAdSpot);
            InneractiveFullScreenAdRewardedListener inneractiveFullScreenAdRewardedListener = fVar.f28018a.f27997b;
            if (inneractiveFullScreenAdRewardedListener != null && i0Var != null) {
                inneractiveFullScreenAdRewardedListener.onAdRewarded(i0Var);
            }
        }
        IAmraidWebViewController iAmraidWebViewController = this.f31026z;
        if (iAmraidWebViewController == null || !iAmraidWebViewController.D) {
            H();
        }
        this.I = true;
    }

    public final void Q() {
        IAmraidWebViewController iAmraidWebViewController;
        if (this.f28031b == null || (iAmraidWebViewController = this.f31026z) == null) {
            IAlog.a("updateWebViewLayoutParams called, but web view is invalid", new Object[0]);
            return;
        }
        com.fyber.inneractive.sdk.web.m mVar = iAmraidWebViewController.f31304b;
        if (mVar != null) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
            layoutParams.gravity = 17;
            mVar.setLayoutParams(layoutParams);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.interfaces.f
    public final void a(com.fyber.inneractive.sdk.interfaces.e eVar, Activity activity) throws InneractiveUnitController.AdDisplayError {
        x0 x0Var;
        com.fyber.inneractive.sdk.config.x0 x0Var2;
        super.a(eVar, activity);
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        com.fyber.inneractive.sdk.config.q0 q0Var = (xVar == null || (x0Var2 = ((q0) xVar).f28440d) == null) ? null : ((w0) x0Var2).f27945c;
        if (q0Var == null) {
            IAlog.f("%sNo display config for full screen mraid ad renderer! Cannot render", IAlog.a(this));
            throw new InneractiveUnitController.AdDisplayError("No display config for full screen mraid");
        }
        IAmraidWebViewController iAmraidWebViewController = xVar != null ? ((q0) xVar).f28277i : null;
        this.f31026z = iAmraidWebViewController;
        if (iAmraidWebViewController == null || iAmraidWebViewController.f31304b == null) {
            IAlog.f("%sWeb view controller content is not valid. Web view might have crashed", IAlog.a(this));
            throw new InneractiveUnitController.AdDisplayError("Web view could not be loaded");
        }
        ((q0) xVar).e();
        this.G = q0Var.f27882b;
        this.A = false;
        this.B = false;
        this.K = new com.fyber.inneractive.sdk.util.viewtime.b(this.f28030a);
        this.f28265k = eVar;
        if (this.f31026z == null) {
            IAlog.f("InneractiveFullscreenMraidAdRenderer.renderAd: Spot ad content is not the right content :( %s", this.f28031b);
            return;
        }
        View closeButton = eVar.getCloseButton();
        if (closeButton != null) {
            this.f31026z.a(closeButton, com.fyber.inneractive.sdk.measurement.tracker.d.CloseButton);
        }
        com.fyber.inneractive.sdk.response.f fVar = (com.fyber.inneractive.sdk.response.f) ((q0) this.f28031b).f28438b;
        int i5 = fVar.f31046e;
        int i11 = fVar.f31047f;
        boolean z11 = (i5 == 300 && i11 == 250) || (i5 == 600 && i11 == 500);
        this.C = z11;
        if (z11) {
            this.f31026z.setAdDefaultSize(com.fyber.inneractive.sdk.util.o.a(i5), com.fyber.inneractive.sdk.util.o.a(i11));
        }
        if (this.f31024x == null) {
            this.f31024x = new u(this);
        }
        this.f31026z.setListener(this.f31024x);
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        if (inneractiveAdSpot != null && inneractiveAdSpot.getAdContent() != null && activity != null) {
            com.fyber.inneractive.sdk.flow.x adContent = this.f28030a.getAdContent();
            com.fyber.inneractive.sdk.flow.g gVar = new com.fyber.inneractive.sdk.flow.g(activity, false, adContent.f28437a, adContent.f28438b, adContent.f28439c);
            ViewGroup viewGroup = (ViewGroup) activity.findViewById(R.id.ia_identifier_overlay);
            IFyberAdIdentifier.Corner corner = IFyberAdIdentifier.Corner.BOTTOM_LEFT;
            IFyberAdIdentifier iFyberAdIdentifier = gVar.f28149d;
            iFyberAdIdentifier.f31149k = corner;
            iFyberAdIdentifier.a(viewGroup);
            viewGroup.setVisibility(0);
            this.f31026z.a(viewGroup, com.fyber.inneractive.sdk.measurement.tracker.d.IdentifierView);
        }
        Q();
        IAmraidWebViewController iAmraidWebViewController2 = this.f31026z;
        ViewGroup layout = this.f28265k.getLayout();
        InneractiveAdRequest inneractiveAdRequest = ((q0) this.f28031b).f28437a;
        com.fyber.inneractive.sdk.web.m mVar = iAmraidWebViewController2.f31304b;
        if (mVar != null) {
            layout.addView(mVar);
            l0.f31201a.a(layout.getContext(), iAmraidWebViewController2.f31304b, iAmraidWebViewController2);
            com.fyber.inneractive.sdk.web.m mVar2 = iAmraidWebViewController2.f31304b;
            if (mVar2 != null) {
                mVar2.setTapListener(iAmraidWebViewController2);
            }
        }
        this.A = true;
        if (this.G == UnitDisplayType.REWARDED) {
            TimeUnit timeUnit = TimeUnit.SECONDS;
            IAmraidWebViewController iAmraidWebViewController3 = this.f31026z;
            if (iAmraidWebViewController3 != null) {
                synchronized (i0.f31322s0) {
                    x0Var = iAmraidWebViewController3.f31339q0;
                }
            } else {
                x0Var = x0.f28443c;
            }
            w1 w1Var = new w1(timeUnit, x0Var.a() ? x0Var.f28444a : IAConfigManager.Q.f27761u.f27936b.a("rewarded_mraid_delay", 31, 30));
            this.F = w1Var;
            w1Var.f31250e = new t(this);
            w1Var.f31249d = false;
            w1Var.f31248c.sendEmptyMessage(1932593528);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final /* bridge */ /* synthetic */ boolean b(com.fyber.inneractive.sdk.flow.x xVar) {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final void d(View view) {
        IAmraidWebViewController iAmraidWebViewController = this.f31026z;
        if (iAmraidWebViewController != null) {
            iAmraidWebViewController.a(view, com.fyber.inneractive.sdk.measurement.tracker.d.ProgressOverlay);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void destroy() {
        InneractiveUnitController.EventsListener eventsListener;
        if (this.A && !this.B && (eventsListener = this.f28032c) != null) {
            this.B = true;
            ((InneractiveFullscreenAdEventsListener) eventsListener).onAdDismissed(this.f28030a);
        }
        this.f31024x = null;
        w1 w1Var = this.F;
        if (w1Var != null) {
            w1Var.f31250e = null;
            this.F = null;
        }
        super.destroy();
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final void e(View view) {
        com.fyber.inneractive.sdk.measurement.tracker.e eVar;
        xn.f fVar;
        IAmraidWebViewController iAmraidWebViewController = this.f31026z;
        if (iAmraidWebViewController == null || (eVar = iAmraidWebViewController.I) == null) {
            return;
        }
        try {
            un.b bVar = eVar.f28527a;
            if (bVar == null || view == null) {
                return;
            }
            un.k kVar = (un.k) bVar;
            if (kVar.f91404g) {
                return;
            }
            xn.g gVar = kVar.f91400c;
            gVar.getClass();
            ArrayList arrayList = gVar.f96193a;
            Pattern pattern = xn.g.f96192b;
            Iterator it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    fVar = null;
                    break;
                } else {
                    fVar = (xn.f) it.next();
                    if (fVar.f96188a.get() == view) {
                        break;
                    }
                }
            }
            if (fVar != null) {
                arrayList.remove(fVar);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void k() {
        com.fyber.inneractive.sdk.config.global.r rVar;
        InneractiveUnitController.EventsListener eventsListener;
        if (this.G == UnitDisplayType.REWARDED && this.H) {
            P();
        }
        if (!this.B && (eventsListener = this.f28032c) != null) {
            this.B = true;
            ((InneractiveFullscreenAdEventsListener) eventsListener).onAdDismissed(this.f28030a);
        }
        com.fyber.inneractive.sdk.util.viewtime.b bVar = this.K;
        if (bVar != null && bVar.f31240c != 0) {
            String strA = com.fyber.inneractive.sdk.util.c0.a(System.currentTimeMillis(), bVar.f31240c, bVar.f31242e);
            InneractiveAdSpot inneractiveAdSpot = bVar.f31239b;
            com.fyber.inneractive.sdk.flow.x adContent = inneractiveAdSpot != null ? inneractiveAdSpot.getAdContent() : null;
            com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.INTERSTITIAL_VIEW_TIME;
            InneractiveAdRequest inneractiveAdRequest = adContent != null ? adContent.f28437a : null;
            com.fyber.inneractive.sdk.response.e eVar = adContent != null ? adContent.f28438b : null;
            JSONArray jSONArrayB = (adContent == null || (rVar = adContent.f28439c) == null) ? null : rVar.b();
            com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
            wVar.f28820c = uVar;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArrayB;
            wVar.a("time", strA);
            wVar.a((String) null);
            bVar.f31240c = 0L;
            bVar.f31241d = 0L;
            bVar.f31242e = 0L;
        }
        InneractiveAdSpot inneractiveAdSpot2 = this.f28030a;
        if (inneractiveAdSpot2 == null || !(inneractiveAdSpot2 instanceof com.fyber.inneractive.sdk.flow.i0)) {
            return;
        }
        ((com.fyber.inneractive.sdk.flow.i0) inneractiveAdSpot2).a();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void m() {
        w1 w1Var;
        w1 w1Var2 = this.f28267m;
        if (w1Var2 != null) {
            w1Var2.f31249d = false;
            w1Var2.a(SystemClock.uptimeMillis());
        }
        w1 w1Var3 = this.o;
        if (w1Var3 != null) {
            w1Var3.f31249d = false;
            w1Var3.a(SystemClock.uptimeMillis());
        }
        if (this.G == UnitDisplayType.REWARDED && (w1Var = this.F) != null) {
            w1Var.f31249d = false;
            w1Var.a(SystemClock.uptimeMillis());
        }
        com.fyber.inneractive.sdk.util.viewtime.b bVar = this.K;
        if (bVar != null) {
            if (bVar.f31240c == 0) {
                bVar.f31240c = System.currentTimeMillis();
            }
            if (bVar.f31241d > 0) {
                bVar.f31242e += System.currentTimeMillis() - bVar.f31241d;
                bVar.f31241d = 0L;
            }
        }
        this.f28274v.a();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void r() {
        w1 w1Var;
        w1 w1Var2 = this.f28267m;
        if (w1Var2 != null) {
            w1Var2.f31249d = true;
            u1 u1Var = w1Var2.f31248c;
            if (u1Var != null) {
                u1Var.removeMessages(1932593528);
            }
        }
        w1 w1Var3 = this.o;
        if (w1Var3 != null) {
            w1Var3.f31249d = true;
            u1 u1Var2 = w1Var3.f31248c;
            if (u1Var2 != null) {
                u1Var2.removeMessages(1932593528);
            }
        }
        if (this.G == UnitDisplayType.REWARDED && (w1Var = this.F) != null) {
            w1Var.f31249d = true;
            u1 u1Var3 = w1Var.f31248c;
            if (u1Var3 != null) {
                u1Var3.removeMessages(1932593528);
            }
        }
        com.fyber.inneractive.sdk.util.viewtime.b bVar = this.K;
        if (bVar != null) {
            bVar.f31241d = System.currentTimeMillis();
        }
        com.fyber.inneractive.sdk.util.a aVar = this.f28274v;
        if (aVar.f31167b && aVar.f31170e == 0) {
            aVar.f31170e = System.currentTimeMillis();
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final boolean u() {
        boolean z11;
        if (this.f28265k == null) {
            z11 = true;
        } else if (this.G == UnitDisplayType.REWARDED) {
            if (this.H) {
                P();
            }
            z11 = this.H;
        } else {
            z11 = this.f28268p;
        }
        if (!z11) {
            return true;
        }
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
        if (eVar == null) {
            return false;
        }
        eVar.dismissAd(true);
        return true;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final Context w() {
        IAmraidWebViewController iAmraidWebViewController = this.f31026z;
        return c(iAmraidWebViewController != null ? iAmraidWebViewController.f31304b : null);
    }

    @Override // com.fyber.inneractive.sdk.flow.p0, com.fyber.inneractive.sdk.interfaces.f
    public final void b(boolean z11) throws JSONException {
        if (!I()) {
            if (z11) {
                this.f28274v.a((String) null);
            } else {
                com.fyber.inneractive.sdk.util.a aVar = this.f28274v;
                aVar.f31169d = 0L;
                aVar.f31170e = 0L;
                aVar.f31171f = 0L;
                aVar.f31167b = false;
            }
        }
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
        if (eVar != null) {
            eVar.destroy();
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void a() {
        Q();
    }

    @Override // com.fyber.inneractive.sdk.flow.p0
    public final long a(long j11) {
        if (this.G == UnitDisplayType.REWARDED) {
            return 0L;
        }
        if (this.f28272t) {
            return j11;
        }
        long j12 = 13;
        try {
            j12 = Long.parseLong(IAConfigManager.Q.f27761u.f27936b.a("mraid_x_fallback_delay", Long.toString(13L)));
        } catch (Throwable unused) {
        }
        return j12 * 1000;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public final void a(com.fyber.inneractive.sdk.external.f fVar) {
        this.J = fVar;
    }

    @Override // com.fyber.inneractive.sdk.rtb.watermark.a
    public final void a(FrameLayout frameLayout) {
        IAmraidWebViewController iAmraidWebViewController = this.f31026z;
        if (iAmraidWebViewController != null) {
            iAmraidWebViewController.a(frameLayout, com.fyber.inneractive.sdk.measurement.tracker.d.Watermark);
        }
    }
}
