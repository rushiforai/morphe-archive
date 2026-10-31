package com.fyber.inneractive.sdk.player.controller;

import android.app.Application;
import android.content.Context;
import android.media.AudioManager;
import android.text.TextUtils;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.b1;
import com.fyber.inneractive.sdk.config.c1;
import com.fyber.inneractive.sdk.config.enums.Skip;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.x0;
import com.fyber.inneractive.sdk.config.y0;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.player.enums.VideoClickOrigin;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.web.i1;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class z implements b, p, o, com.fyber.inneractive.sdk.player.ui.n {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.f f28945a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f28946b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f28947c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.ui.s f28948d;

    /* renamed from: e, reason: collision with root package name */
    public x f28949e;

    /* renamed from: g, reason: collision with root package name */
    public g0 f28951g;

    /* renamed from: j, reason: collision with root package name */
    public Runnable f28954j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f28955k;

    /* renamed from: m, reason: collision with root package name */
    public u f28957m;
    public final boolean n;

    /* renamed from: u, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.ui.g f28963u;

    /* renamed from: v, reason: collision with root package name */
    public final String f28964v;

    /* renamed from: f, reason: collision with root package name */
    public int f28950f = 0;

    /* renamed from: h, reason: collision with root package name */
    public boolean f28952h = false;

    /* renamed from: i, reason: collision with root package name */
    public float f28953i = -0.1f;

    /* renamed from: l, reason: collision with root package name */
    public boolean f28956l = false;
    public boolean o = false;

    /* renamed from: p, reason: collision with root package name */
    public boolean f28958p = false;

    /* renamed from: q, reason: collision with root package name */
    public boolean f28959q = false;

    /* renamed from: r, reason: collision with root package name */
    public boolean f28960r = false;

    /* renamed from: s, reason: collision with root package name */
    public boolean f28961s = false;

    /* renamed from: t, reason: collision with root package name */
    public com.fyber.inneractive.sdk.ignite.m f28962t = com.fyber.inneractive.sdk.ignite.m.NONE;

    /* renamed from: w, reason: collision with root package name */
    public boolean f28965w = false;

    /* renamed from: y, reason: collision with root package name */
    public boolean f28967y = false;

    /* renamed from: x, reason: collision with root package name */
    public final Skip f28966x = null;

    public z(com.fyber.inneractive.sdk.player.f fVar, com.fyber.inneractive.sdk.player.ui.s sVar, x0 x0Var, com.fyber.inneractive.sdk.config.global.r rVar, boolean z11, String str) {
        q qVar;
        this.f28945a = fVar;
        this.f28946b = x0Var;
        this.f28947c = rVar;
        this.f28948d = sVar;
        this.n = z11;
        this.f28964v = str;
        sVar.setListener(this);
        if (fVar == null || (qVar = fVar.f30579a) == null) {
            return;
        }
        if (!qVar.f28923b.contains(this)) {
            qVar.f28923b.add(this);
        }
        q qVar2 = fVar.f30579a;
        if (qVar2.f28924c.contains(this)) {
            return;
        }
        qVar2.f28924c.add(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0058  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A() {
        q qVar;
        int ringerMode;
        int streamVolume;
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar2;
        q qVar3;
        AudioManager audioManager;
        com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
        if (fVar2 == null || (qVar = fVar2.f30579a) == null || qVar.n) {
            return;
        }
        try {
            audioManager = (AudioManager) this.f28948d.getContext().getSystemService("audio");
            ringerMode = audioManager.getRingerMode();
        } catch (Throwable unused) {
            ringerMode = 0;
        }
        try {
            streamVolume = audioManager.getStreamVolume(2);
        } catch (Throwable unused2) {
            streamVolume = 0;
            if (((w0) this.f28946b).f27948f.f27957d.booleanValue()) {
                fVar = this.f28945a;
                if (fVar != null) {
                    qVar2.b(false);
                }
                this.f28948d.setMuteButtonState(true);
            }
            this.f28948d.setMuteButtonState(p());
        }
        if (!((w0) this.f28946b).f27948f.f27957d.booleanValue() || IAConfigManager.Q.f27754l || p()) {
            fVar = this.f28945a;
            if (fVar != null && (qVar2 = fVar.f30579a) != null) {
                qVar2.b(false);
            }
            this.f28948d.setMuteButtonState(true);
        } else if (streamVolume > 0 && ringerMode == 2) {
            com.fyber.inneractive.sdk.player.f fVar3 = this.f28945a;
            if (fVar3 != null && (qVar3 = fVar3.f30579a) != null) {
                qVar3.d(false);
            }
            this.f28948d.setMuteButtonState(false);
        }
        this.f28948d.setMuteButtonState(p());
    }

    public abstract boolean B();

    public boolean C() {
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar;
        y0 y0Var;
        x0 x0Var = this.f28946b;
        boolean z11 = (x0Var == null || (y0Var = ((w0) x0Var).f27948f) == null || y0Var.f27963j != UnitDisplayType.REWARDED) ? false : true;
        boolean zA = com.fyber.inneractive.sdk.flow.x0.a(this.f28945a).a();
        if ((!InneractiveAdManager.isCurrentUserAChild() && !zA) || !z11 || this.f28948d == null || (fVar = this.f28945a) == null || (qVar = fVar.f30579a) == null) {
            return false;
        }
        int iB = qVar.b() / 1000;
        return (this.f28945a.f30579a.c() / 1000) - iB <= 0 || iB < l();
    }

    public void D() {
        Boolean boolC;
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28947c;
        com.fyber.inneractive.sdk.config.global.features.v vVar = rVar != null ? (com.fyber.inneractive.sdk.config.global.features.v) rVar.a(com.fyber.inneractive.sdk.config.global.features.v.class) : null;
        boolean zBooleanValue = (vVar == null || (boolC = vVar.c("show_cta")) == null) ? true : boolC.booleanValue();
        g0 g0Var = this.f28951g;
        if (g0Var != null) {
            this.f28962t = g0Var.o();
        }
        com.fyber.inneractive.sdk.ignite.m mVar = this.f28962t;
        this.f28948d.a(mVar == com.fyber.inneractive.sdk.ignite.m.NONE ? zBooleanValue : true, mVar);
    }

    public final void E() throws JSONException {
        g0 g0Var;
        com.fyber.inneractive.sdk.flow.storepromo.controller.c cVar;
        boolean z11;
        com.fyber.inneractive.sdk.flow.storepromo.ui.c cVar2;
        com.fyber.inneractive.sdk.flow.storepromo.ui.c cVar3;
        View view;
        View view2;
        this.f28948d.i();
        com.fyber.inneractive.sdk.flow.endcard.k kVarJ = j();
        com.fyber.inneractive.sdk.flow.endcard.b bVarA = kVarJ != null ? kVarJ.a() : null;
        boolean z12 = com.fyber.inneractive.sdk.flow.x0.a(this.f28945a).f28444a >= 0;
        if (bVarA == null) {
            if (e() || (g0Var = this.f28951g) == null) {
                return;
            }
            g0Var.i();
            return;
        }
        a(bVarA);
        if (n() == null || z12) {
            return;
        }
        com.fyber.inneractive.sdk.flow.storepromo.b bVarN = n();
        com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
        com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar = bVarN.f28284d;
        if (bVar == null || (cVar = bVar.f28293c) == null || !(z11 = cVar.f28304e)) {
            bVarN.f28281a.a();
            bVarN.a();
            bVarN.a((bVarN.f28284d == null ? com.fyber.inneractive.sdk.flow.storepromo.events.a.CONTROLLER_NOT_INITIALIZED : com.fyber.inneractive.sdk.flow.storepromo.events.a.TEMPLATE_NOT_LOADED).name(), (String) null, (String) null);
            return;
        }
        bVar.f28299i = kVarJ;
        if (!z11 || (cVar2 = bVar.f28294d) == null || bVar.f28297g) {
            return;
        }
        if (cVar2.f28380b == null || (view2 = cVar2.f28379a) == null || view2.getParent() == null || cVar2.f28380b.getVisibility() != 0) {
            com.fyber.inneractive.sdk.flow.storepromo.ui.c cVar4 = bVar.f28294d;
            if (cVar4.f28380b == null || cVar4.f28379a == null) {
                IAlog.f("StorePromoView: show: missing container or content", new Object[0]);
                return;
            }
            cVar4.a();
            com.fyber.inneractive.sdk.util.v.a(cVar4.f28380b);
            sVar.addView(cVar4.f28380b);
            cVar4.f28379a.setAnimation(cVar4.f28381c);
            cVar4.f28380b.setVisibility(0);
            com.fyber.inneractive.sdk.flow.storepromo.b bVar2 = cVar4.f28384f;
            if (bVar2 != null) {
                com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar3 = bVar2.f28284d;
                com.fyber.inneractive.sdk.flow.storepromo.observer.b bVar4 = new com.fyber.inneractive.sdk.flow.storepromo.observer.b((bVar3 == null || (cVar3 = bVar3.f28294d) == null || cVar3.f28380b == null || (view = cVar3.f28379a) == null || view.getParent() == null || cVar3.f28380b.getVisibility() != 0) ? false : true, bVar2.f28289i);
                Iterator it = bVar2.f28288h.iterator();
                while (it.hasNext()) {
                    ((com.fyber.inneractive.sdk.flow.storepromo.observer.a) it.next()).a(bVar4);
                }
                JSONObject jSONObject = new JSONObject();
                Integer numValueOf = Integer.valueOf(bVar2.f28287g);
                try {
                    jSONObject.put("screenshots", numValueOf);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "screenshots", numValueOf);
                }
                com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.VAST_EVENT_SP_IMPRESSION;
                InneractiveAdRequest inneractiveAdRequest = bVar2.f28283c;
                com.fyber.inneractive.sdk.response.e eVar = bVar2.f28282b;
                String str = bVar2.f28286f;
                com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(uVar, inneractiveAdRequest, eVar);
                try {
                    jSONObject.put("templateURL", str);
                } catch (Exception unused2) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "templateURL", str);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
            }
        }
    }

    public void F() {
        boolean z11;
        q qVar;
        q qVar2;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && (((qVar2 = fVar.f30579a) != null && qVar2.f28926e == com.fyber.inneractive.sdk.player.enums.b.Completed) || this.f28959q)) {
            fVar.a();
        }
        boolean zA = IAConfigManager.Q.f27761u.f27936b.a("endcard").a();
        com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
        com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
        sVar.e((fVar2 == null || (qVar = fVar2.f30579a) == null || qVar.f28926e != com.fyber.inneractive.sdk.player.enums.b.Completed) && !(((z11 = this.f28959q) && !zA) || this.f28960r || (z11 && zA)));
    }

    public void a() {
    }

    public abstract void b(g1 g1Var);

    @Override // com.fyber.inneractive.sdk.player.controller.b
    public boolean b() {
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null) {
            return false;
        }
        if (this.f28952h || fVar.f30579a == null) {
            return true;
        }
        com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
        if (sVar == null || !sVar.a()) {
            return com.fyber.inneractive.sdk.player.f.a(this.f28945a) && !this.f28952h && this.f28950f == 0;
        }
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.p
    public final void c(boolean z11) {
    }

    @Override // com.fyber.inneractive.sdk.player.controller.p
    public final void d() {
        if (this.o && !this.f28956l) {
            this.f28956l = true;
        }
    }

    @Override // com.fyber.inneractive.sdk.ui.controller.b
    public void destroy() {
        q qVar;
        Application application;
        u uVar = this.f28957m;
        if (uVar != null && (application = com.fyber.inneractive.sdk.util.o.f31210a) != null) {
            application.unregisterActivityLifecycleCallbacks(uVar);
        }
        IAlog.a("%sdestroy called", IAlog.a(this));
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && (qVar = fVar.f30579a) != null) {
            qVar.f28923b.remove(this);
            this.f28945a.f30579a.f28924c.remove(this);
        }
        g();
        Runnable runnable = this.f28954j;
        if (runnable != null) {
            this.f28948d.removeCallbacks(runnable);
            this.f28954j = null;
        }
        this.f28951g = null;
    }

    public boolean e() {
        String str;
        com.fyber.inneractive.sdk.flow.endcard.k kVarJ = j();
        if (kVarJ != null) {
            com.fyber.inneractive.sdk.response.g gVar = kVarJ.f28075a.f28456d;
            if (!((gVar == null || (str = gVar.B) == null || !TextUtils.equals(str, "1")) ? false : true)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void f(boolean z11) {
        com.fyber.inneractive.sdk.config.global.features.c cVar;
        Context context = this.f28948d.getContext();
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28947c;
        if (rVar != null) {
            com.fyber.inneractive.sdk.config.global.features.c cVar2 = (com.fyber.inneractive.sdk.config.global.features.c) rVar.a(com.fyber.inneractive.sdk.config.global.features.c.class);
            cVar2.getClass();
            cVar = new ArrayList(cVar2.f27819c.values()).size() > 0 ? (com.fyber.inneractive.sdk.config.global.features.c) this.f28947c.a(com.fyber.inneractive.sdk.config.global.features.c.class) : null;
        }
        new f0(context, cVar, new v(this, z11)).f28909b.show();
    }

    public void g() {
        if (this.f28963u != null) {
            IAlog.a("%sdestroyTextureView", IAlog.a(this));
        }
    }

    public void h() {
        if (B()) {
            com.fyber.inneractive.sdk.config.global.r rVar = this.f28947c;
            String str = null;
            com.fyber.inneractive.sdk.config.global.features.d dVar = rVar != null ? (com.fyber.inneractive.sdk.config.global.features.d) rVar.a(com.fyber.inneractive.sdk.config.global.features.d.class) : null;
            if (dVar != null) {
                dVar.d(IAConfigManager.Q.f27756p);
                com.fyber.inneractive.sdk.model.vast.a aVar = dVar.f27817e;
                if (aVar != null && aVar.f28566d) {
                    str = aVar.f28564b;
                }
            }
            if (!TextUtils.isEmpty(this.f28964v) || str == null) {
                com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
                sVar.setSkipText(sVar.getContext().getString(R.string.ia_video_skip_text));
            } else {
                this.f28948d.setSkipText(str);
            }
            this.f28948d.h();
            this.f28950f = 0;
            g0 g0Var = this.f28951g;
            if (g0Var != null) {
                g0Var.c();
            }
        }
    }

    public abstract int i();

    public final com.fyber.inneractive.sdk.flow.endcard.k j() {
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null) {
            return ((com.fyber.inneractive.sdk.player.n) fVar).f30642u;
        }
        return null;
    }

    public com.fyber.inneractive.sdk.web.b0 k() {
        return new w(this);
    }

    public final int l() {
        int i5;
        try {
            i5 = Integer.parseInt(IAConfigManager.Q.f27761u.f27936b.a("max_rv_tsec", Integer.toString(30)));
        } catch (Throwable unused) {
            i5 = 30;
        }
        if (i5 < 1) {
            return 30;
        }
        return i5;
    }

    public final float m() {
        try {
            return ((AudioManager) this.f28948d.getContext().getSystemService("audio")).getStreamVolume(3);
        } catch (Throwable unused) {
            return 1.0f;
        }
    }

    public com.fyber.inneractive.sdk.flow.storepromo.b n() {
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null) {
            return ((com.fyber.inneractive.sdk.player.n) fVar).f30644w;
        }
        return null;
    }

    public abstract int o();

    public final boolean p() {
        q qVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        return (fVar == null || (qVar = fVar.f30579a) == null || (!qVar.g() && ((double) m()) != 0.0d)) ? false : true;
    }

    public final void q() {
        this.f28948d.a(true);
        this.f28948d.e(false);
        Runnable runnable = this.f28954j;
        if (runnable == null) {
            if (runnable == null) {
                this.f28954j = new t(this);
            }
            int i5 = i();
            IAlog.a("%s Starting buffering timeout with %d", IAlog.a(this), Integer.valueOf(i5));
            this.f28948d.postDelayed(this.f28954j, i5);
        }
    }

    public abstract void r();

    public void s() throws JSONException {
        if (C()) {
            f(false);
        } else {
            d(false);
        }
    }

    public abstract void t();

    public void u() {
        Runnable runnable = this.f28954j;
        if (runnable != null) {
            this.f28948d.removeCallbacks(runnable);
            this.f28954j = null;
        }
        this.f28948d.a(false);
        F();
    }

    public abstract void v();

    public void w() {
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void x() {
        q qVar;
        this.f28948d.a(false);
        this.f28948d.e(false);
        Runnable runnable = this.f28954j;
        if (runnable != null) {
            this.f28948d.removeCallbacks(runnable);
            this.f28954j = null;
        }
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && B() && !this.f28952h && com.fyber.inneractive.sdk.player.f.a(fVar)) {
            if (this.f28950f <= 0) {
                this.f28948d.g(true);
                h();
            } else {
                com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
                if (fVar2 == null || (qVar = fVar2.f30579a) == null) {
                    if (!this.f28958p) {
                        this.f28948d.g(true);
                        b(this.f28950f);
                        this.f28958p = true;
                    }
                } else if (this.f28950f >= qVar.c() / 1000) {
                    this.f28948d.g(false);
                }
            }
        }
        g0 g0Var = this.f28951g;
        if (g0Var != null && !this.f28955k) {
            this.f28955k = true;
            g0Var.j();
        }
        this.f28959q = false;
    }

    public final void y() {
        com.fyber.inneractive.sdk.player.ui.g gVar;
        com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
        if (sVar != null) {
            sVar.o();
        }
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && fVar.f30579a != null && (gVar = this.f28963u) != null) {
            gVar.invalidate();
            this.f28963u.requestLayout();
        }
        com.fyber.inneractive.sdk.player.ui.s sVar2 = this.f28948d;
        if (sVar2 != null) {
            sVar2.invalidate();
            this.f28948d.requestLayout();
        }
    }

    public void z() {
        q qVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || (qVar = fVar.f30579a) == null) {
            return;
        }
        if (qVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Paused) {
            IAlog.a("%spauseVideo called in bad state! %s", IAlog.a(this), qVar.f28926e);
            return;
        }
        IAlog.a("%spauseVideo %s", IAlog.a(this), this.f28948d);
        TextureView textureView = qVar.f28931j;
        if (textureView == null || textureView.getParent() == null || textureView.getParent() != this.f28948d.getTextureHost()) {
            return;
        }
        qVar.i();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.p
    public final void a(com.fyber.inneractive.sdk.player.mediaplayer.o oVar) {
    }

    @Override // com.fyber.inneractive.sdk.player.ui.n
    public void c() {
        IAlog.a("%sonVideoViewDetachedFromWindow", IAlog.a(this));
        g();
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00b6  */
    @Override // com.fyber.inneractive.sdk.player.controller.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void a(com.fyber.inneractive.sdk.flow.endcard.b bVar) {
        i1 i1Var;
        IAlog.a("IAVideoUIControllerBase: showEndCard: dismiss time: %d sec.", Integer.valueOf(bVar.f28060f));
        if (bVar instanceof com.fyber.inneractive.sdk.flow.endcard.c) {
            com.fyber.inneractive.sdk.flow.endcard.c cVar = (com.fyber.inneractive.sdk.flow.endcard.c) bVar;
            com.fyber.inneractive.sdk.player.ui.b bVar2 = new com.fyber.inneractive.sdk.player.ui.b(a(cVar.d()));
            if (bVar2.f30660a) {
                com.fyber.inneractive.sdk.web.b0 b0VarK = k();
                com.fyber.inneractive.sdk.flow.endcard.a aVar = (com.fyber.inneractive.sdk.flow.endcard.a) cVar.f();
                if ((aVar instanceof com.fyber.inneractive.sdk.flow.endcard.u) && (i1Var = ((com.fyber.inneractive.sdk.flow.endcard.u) aVar).e().f28889a) != null) {
                    i1Var.setListener(b0VarK);
                }
                this.f28948d.e(false);
                this.f28948d.a(cVar, bVar2);
                ViewGroup viewGroup = this.f28948d.f30734m;
                if (viewGroup != null) {
                    viewGroup.setVisibility(4);
                    return;
                }
                return;
            }
            return;
        }
        if (bVar instanceof com.fyber.inneractive.sdk.flow.endcard.o) {
            com.fyber.inneractive.sdk.flow.endcard.o oVar = (com.fyber.inneractive.sdk.flow.endcard.o) bVar;
            com.fyber.inneractive.sdk.player.ui.b bVar3 = new com.fyber.inneractive.sdk.player.ui.b(a(oVar.d()));
            if (bVar3.f30660a) {
                com.fyber.inneractive.sdk.web.b0 b0VarK2 = k();
                i1 i1Var2 = ((com.fyber.inneractive.sdk.flow.endcard.p) oVar.f()).e().f28889a;
                if (i1Var2 != null) {
                    i1Var2.setListener(b0VarK2);
                }
                this.f28948d.a(oVar, bVar3);
                return;
            }
            return;
        }
        if (bVar instanceof com.fyber.inneractive.sdk.flow.endcard.d) {
            com.fyber.inneractive.sdk.flow.endcard.d dVar = (com.fyber.inneractive.sdk.flow.endcard.d) bVar;
            com.fyber.inneractive.sdk.player.ui.c cVarD = dVar.d();
            String str = this.f28964v;
            if (str == null) {
                com.fyber.inneractive.sdk.config.global.r rVar = this.f28947c;
                if (rVar != null) {
                    com.fyber.inneractive.sdk.config.global.features.d dVar2 = (com.fyber.inneractive.sdk.config.global.features.d) rVar.a(com.fyber.inneractive.sdk.config.global.features.d.class);
                    dVar2.d(IAConfigManager.Q.f27756p);
                    com.fyber.inneractive.sdk.model.vast.a aVar2 = dVar2.f27817e;
                    str = (aVar2 == null || !aVar2.f28566d) ? null : aVar2.f28563a;
                }
            }
            cVarD.f30671c = str;
            com.fyber.inneractive.sdk.player.ui.b bVar4 = new com.fyber.inneractive.sdk.player.ui.b(a(cVarD));
            if (bVar4.f30660a) {
                this.f28948d.e(false);
                this.f28948d.a(dVar, bVar4);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:87:0x0119  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(boolean z11) throws JSONException {
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar;
        q qVar2;
        y0 y0Var;
        int iB;
        com.fyber.inneractive.sdk.measurement.f fVar2;
        q qVar3;
        x0 x0Var;
        y0 y0Var2;
        boolean z12 = true;
        this.f28959q = true;
        c1 c1Var = IAConfigManager.Q.f27764x;
        if (z11 && c1Var != null && (x0Var = this.f28946b) != null && (y0Var2 = ((w0) x0Var).f27948f) != null) {
            c1Var.a(y0Var2.f27963j, "LAST_VAST_SKIPED", "1");
        }
        com.fyber.inneractive.sdk.player.f fVar3 = this.f28945a;
        if (fVar3 != null && (qVar3 = fVar3.f30579a) != null) {
            qVar3.k();
            this.f28945a.f30579a.i();
        }
        com.fyber.inneractive.sdk.player.f fVar4 = this.f28945a;
        if (fVar4 != null && z11 && (fVar2 = fVar4.f30583e) != null && fVar2.f28513c != null) {
            IAlog.a("%s skipped", "OMVideo");
            try {
                un.k kVar = fVar2.f28513c.f92861a;
                x7.f.l(kVar);
                kVar.f91402e.b("skipped", null);
            } catch (Throwable th2) {
                fVar2.a(th2);
            }
        }
        if (!this.f28948d.c()) {
            this.f28948d.a(false);
            Runnable runnable = this.f28954j;
            if (runnable != null) {
                this.f28948d.removeCallbacks(runnable);
                this.f28954j = null;
            }
            this.f28955k = false;
            this.f28952h = true;
            x0 x0Var2 = this.f28946b;
            if (x0Var2 != null && (y0Var = ((w0) x0Var2).f27948f) != null && y0Var.f27963j == UnitDisplayType.REWARDED && this.f28951g != null) {
                com.fyber.inneractive.sdk.player.f fVar5 = this.f28945a;
                q qVar4 = fVar5 != null ? fVar5.f30579a : null;
                if ((fVar5 != null ? fVar5.f30579a : null) != null) {
                    iB = (fVar5 != null ? fVar5.f30579a : null).b();
                } else {
                    iB = -1;
                }
                boolean z13 = this.f28959q;
                if (z13 && this.f28945a != null && qVar4 != null) {
                    int iB2 = qVar4.b();
                    int iC = qVar4.c() - iB2;
                    int iL = l() * 1000;
                    if (iC > 0 && iB2 < iL) {
                        this.f28967y = true;
                    } else {
                        this.f28951g.a(iB, this.f28959q);
                    }
                } else {
                    this.f28951g.a(iB, z13);
                }
            }
        }
        if (z11) {
            boolean zA = IAConfigManager.Q.f27761u.f27936b.a("endcard").a();
            com.fyber.inneractive.sdk.flow.x0 x0VarA = com.fyber.inneractive.sdk.flow.x0.a(this.f28945a);
            boolean z14 = x0VarA.f28444a >= 0 && x0VarA.f28445b <= -1;
            if (!zA && !z14) {
                z12 = false;
            }
            com.fyber.inneractive.sdk.player.f fVar6 = this.f28945a;
            if ((fVar6 != null && (qVar2 = fVar6.f30579a) != null && qVar2.f28926e == com.fyber.inneractive.sdk.player.enums.b.Completed) || ((this.f28959q && !z12) || this.f28960r)) {
                E();
            }
        }
        g0 g0Var = this.f28951g;
        if (g0Var != null && (this.f28950f <= 0 || this.f28952h || ((fVar = this.f28945a) != null && (qVar = fVar.f30579a) != null && qVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Completed))) {
            g0Var.a(z11);
        }
        g();
    }

    public void g(boolean z11) {
        q qVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null) {
            if (!fVar.f30585g) {
                F();
                return;
            }
            if (z11 && (qVar = fVar.f30579a) != null) {
                qVar.a(0, true);
                return;
            }
            q qVar2 = fVar.f30579a;
            if (qVar2 != null) {
                com.fyber.inneractive.sdk.player.enums.b bVar = qVar2.f28926e;
                if (bVar != com.fyber.inneractive.sdk.player.enums.b.Completed && bVar != com.fyber.inneractive.sdk.player.enums.b.Prepared) {
                    qVar2.j();
                } else {
                    qVar2.a(1, true);
                }
            }
        }
    }

    public final void e(boolean z11) {
        q qVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || (qVar = fVar.f30579a) == null) {
            return;
        }
        com.fyber.inneractive.sdk.player.enums.b bVar = qVar.f28926e;
        if (z11 && bVar != com.fyber.inneractive.sdk.player.enums.b.Completed && !this.f28948d.c()) {
            g(false);
            return;
        }
        if (!z11 && bVar == com.fyber.inneractive.sdk.player.enums.b.Paused && this.f28948d.c()) {
            int iB = qVar.b();
            int iC = qVar.c();
            if (iB <= 0 || iB > iC) {
                return;
            }
            qVar.a(iB - 1, false);
            qVar.a(iB, false);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.b
    public void b(boolean z11) throws JSONException {
        IAlog.a("%sinitUI", IAlog.a(this));
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || fVar.f30579a == null) {
            return;
        }
        this.f28948d.setUnitConfig(this.f28946b);
        this.f28948d.a(this.n, this.f28945a.f30579a.f(), this.f28945a.f30579a.e());
        if (B()) {
            this.f28950f = o();
        } else {
            this.f28948d.g(false);
        }
        if (!z11) {
            a(this.f28945a.f30579a.b());
            a(this.f28945a.f30579a.f28926e, false);
        }
        this.f28948d.setMuteButtonState(p());
    }

    public void f() {
        q qVar;
        q qVar2;
        com.fyber.inneractive.sdk.measurement.f fVar;
        if (this.f28963u == null) {
            com.fyber.inneractive.sdk.player.ui.g gVar = new com.fyber.inneractive.sdk.player.ui.g(this.f28948d);
            this.f28963u = gVar;
            gVar.setId(R.id.ia_inn_texture_view);
            com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
            if (fVar2 != null && (fVar = fVar2.f30583e) != null) {
                com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
                View[] trackingFriendlyView = sVar.getTrackingFriendlyView();
                un.b bVar = fVar.f28511a;
                if (bVar != null) {
                    try {
                        bVar.d(sVar);
                    } catch (Throwable th2) {
                        fVar.a(th2);
                    }
                }
                if (fVar.f28511a != null && trackingFriendlyView != null) {
                    for (View view : trackingFriendlyView) {
                        if (view != null) {
                            try {
                                fVar.f28511a.a(view, un.f.f91380a, null);
                            } catch (Throwable th3) {
                                fVar.a(th3);
                            }
                        }
                    }
                }
                View[] trackingFriendlyViewObstructionPurposeOther = this.f28948d.getTrackingFriendlyViewObstructionPurposeOther();
                if (fVar.f28511a != null) {
                    for (View view2 : trackingFriendlyViewObstructionPurposeOther) {
                        if (view2 != null) {
                            try {
                                fVar.f28511a.a(view2, un.f.f91383d, null);
                            } catch (Throwable th4) {
                                fVar.a(th4);
                            }
                        }
                    }
                }
                if (this.f28948d.getWatermarkView() != null) {
                    View watermarkView = this.f28948d.getWatermarkView();
                    un.b bVar2 = fVar.f28511a;
                    if (bVar2 != null) {
                        bVar2.a(watermarkView, un.f.f91382c, com.fyber.inneractive.sdk.measurement.tracker.d.Watermark.name());
                    }
                }
            }
        }
        IAlog.a("%sconnectToTextureView called %s", IAlog.a(this), this.f28948d.getTextureHost());
        if (this.f28963u != null && this.f28948d.getTextureHost().equals(this.f28963u.getParent())) {
            IAlog.a("%sconnectToTextureView called but already connected", IAlog.a(this));
            return;
        }
        com.fyber.inneractive.sdk.player.f fVar3 = this.f28945a;
        if (fVar3 != null && (qVar2 = fVar3.f30579a) != null) {
            qVar2.a(this.f28963u);
        }
        com.fyber.inneractive.sdk.player.ui.g gVar2 = this.f28963u;
        if (gVar2 != null && gVar2.getParent() == null) {
            IAlog.a("%supdateView adding texture to parent", IAlog.a(this));
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
            layoutParams.gravity = 17;
            this.f28948d.getTextureHost().addView(this.f28963u, layoutParams);
        }
        this.f28956l = false;
        x xVar = new x(this);
        this.f28949e = xVar;
        com.fyber.inneractive.sdk.player.f fVar4 = this.f28945a;
        if (fVar4 == null || (qVar = fVar4.f30579a) == null) {
            return;
        }
        qVar.f28925d = xVar;
    }

    public final void b(int i5) {
        if (this.f28948d != null) {
            com.fyber.inneractive.sdk.config.global.r rVar = this.f28947c;
            String str = null;
            com.fyber.inneractive.sdk.config.global.features.d dVar = rVar != null ? (com.fyber.inneractive.sdk.config.global.features.d) rVar.a(com.fyber.inneractive.sdk.config.global.features.d.class) : null;
            if (dVar != null) {
                dVar.d(IAConfigManager.Q.f27756p);
                com.fyber.inneractive.sdk.model.vast.a aVar = dVar.f27817e;
                if (aVar != null && aVar.f28566d) {
                    str = aVar.f28565c;
                }
            }
            if (TextUtils.isEmpty(this.f28964v) && str != null) {
                this.f28948d.setSkipText(str.replaceFirst("\\[TIME\\]", Integer.toString(i5)));
            } else {
                this.f28948d.setSkipText(String.valueOf(i5));
            }
        }
    }

    public final void b(com.fyber.inneractive.sdk.flow.storepromo.observer.a aVar) {
        com.fyber.inneractive.sdk.flow.storepromo.b bVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && (bVar = ((com.fyber.inneractive.sdk.player.n) fVar).f30644w) != null) {
            bVar.getClass();
            synchronized (com.fyber.inneractive.sdk.flow.storepromo.b.f28280k) {
                bVar.f28288h.remove(aVar);
            }
            return;
        }
        IAlog.f("Unable to remove store promo observer, promo manager is unavailable", new Object[0]);
    }

    public final com.fyber.inneractive.sdk.player.ui.c a(com.fyber.inneractive.sdk.player.ui.c cVar) {
        String string;
        cVar.f30676h = this.f28945a != null && com.fyber.inneractive.sdk.player.f.a(this.f28947c, this.f28962t);
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28947c;
        com.fyber.inneractive.sdk.config.global.features.o oVar = rVar != null ? (com.fyber.inneractive.sdk.config.global.features.o) rVar.a(com.fyber.inneractive.sdk.config.global.features.o.class) : null;
        if (oVar != null) {
            string = oVar.a("app_info_button_text", "App Info");
            if (string != null && string.length() > 30) {
                string = string.substring(0, 30);
            }
        } else {
            string = this.f28948d.getContext().getString(R.string.ia_video_app_info_text);
        }
        cVar.f30677i = string;
        cVar.f30675g = this.f28962t;
        return cVar;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.p
    public final void a(com.fyber.inneractive.sdk.player.enums.b bVar) throws JSONException {
        IAlog.a("%sonPlayerStateChanged with %s", IAlog.a(this), bVar);
        a(bVar, true);
    }

    public final void a(com.fyber.inneractive.sdk.player.enums.b bVar, boolean z11) throws JSONException {
        g0 g0Var;
        int iB;
        com.fyber.inneractive.sdk.player.ui.s sVar;
        switch (y.f28943a[bVar.ordinal()]) {
            case 1:
                boolean z12 = this.f28965w;
                if (z12) {
                    IAlog.a("IAVideoUIControllerBase playerStateUpdated=%s mBuffering=%s", bVar, String.valueOf(z12));
                    q();
                    break;
                }
                break;
            case 2:
                if (this.o) {
                    F();
                    w();
                    break;
                }
                break;
            case 3:
                if (this.o) {
                    this.f28965w = true;
                    q();
                    break;
                }
                break;
            case 4:
                if (this.f28965w) {
                    this.f28965w = false;
                }
                if (this.o) {
                    x();
                    break;
                }
                break;
            case 5:
                u();
                break;
            case 6:
                if (this.o || (!e() && !this.f28961s)) {
                    this.f28961s = true;
                    if (!this.f28948d.c()) {
                        this.f28948d.a(false);
                        Runnable runnable = this.f28954j;
                        if (runnable != null) {
                            this.f28948d.removeCallbacks(runnable);
                            this.f28954j = null;
                        }
                        F();
                        E();
                        this.f28955k = false;
                        this.f28952h = true;
                    }
                    if (z11 && (g0Var = this.f28951g) != null) {
                        boolean z13 = this.f28959q;
                        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
                        if ((fVar != null ? fVar.f30579a : null) != null) {
                            iB = (fVar != null ? fVar.f30579a : null).b();
                        } else {
                            iB = -1;
                        }
                        g0Var.a(iB, z13);
                        break;
                    }
                }
                break;
            case 7:
                if (this.o || ((sVar = this.f28948d) != null && sVar.isShown())) {
                    s();
                    break;
                }
                break;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.o
    public final void a(int i5) {
        x0 x0Var;
        y0 y0Var;
        q qVar;
        q qVar2;
        q qVar3;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || fVar.f30579a == null) {
            return;
        }
        float fM = m();
        com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
        if (fVar2 != null && (qVar = fVar2.f30579a) != null && qVar.h()) {
            float f11 = this.f28953i;
            if (fM != f11) {
                if (fM > 0.0f && f11 >= 0.0f && p()) {
                    com.fyber.inneractive.sdk.player.f fVar3 = this.f28945a;
                    if (fVar3 != null && (qVar3 = fVar3.f30579a) != null) {
                        qVar3.d(true);
                    }
                    this.f28948d.setMuteButtonState(false);
                } else if (fM == 0.0d) {
                    com.fyber.inneractive.sdk.player.f fVar4 = this.f28945a;
                    if (fVar4 != null && (qVar2 = fVar4.f30579a) != null) {
                        qVar2.b(true);
                    }
                    this.f28948d.setMuteButtonState(true);
                }
            }
            this.f28948d.setMuteButtonState(p());
        }
        this.f28953i = fM;
        int iC = this.f28945a.f30579a.c();
        int iB = this.f28945a.f30579a.b();
        int i11 = iB / 1000;
        int i12 = iC / 1000;
        int i13 = i12 - i11;
        if (i13 < 0 || (!this.f28945a.f30579a.h() && iB == iC)) {
            i13 = 0;
        }
        g0 g0Var = this.f28951g;
        if (g0Var != null) {
            g0Var.onProgress(iC, iB);
        }
        if (this.f28948d.l()) {
            return;
        }
        this.f28948d.setRemainingTime(Integer.toString(i13));
        if (this.f28950f < i12) {
            com.fyber.inneractive.sdk.player.f fVar5 = this.f28945a;
            if (B() && !this.f28952h && com.fyber.inneractive.sdk.player.f.a(fVar5)) {
                int i14 = this.f28950f;
                if (i11 < i14) {
                    b(i14 - i11);
                } else {
                    this.f28950f = 0;
                    h();
                }
                this.f28948d.g(true);
            } else {
                this.f28948d.g(false);
            }
        } else {
            this.f28948d.g(false);
            b(i13);
        }
        if (this.f28945a.f30579a.f28926e != com.fyber.inneractive.sdk.player.enums.b.Paused) {
            this.f28948d.a(iC, iB);
            int iL = l();
            if (i12 <= iL || i11 <= iL || (x0Var = this.f28946b) == null || (y0Var = ((w0) x0Var).f27948f) == null || y0Var.f27963j != UnitDisplayType.REWARDED) {
                return;
            }
            h();
            this.f28948d.g(true);
        }
    }

    public final void a(String str) {
        y0 y0Var;
        c1 c1Var = IAConfigManager.Q.f27764x;
        x0 x0Var = this.f28946b;
        if (x0Var == null || (y0Var = ((w0) x0Var).f27948f) == null) {
            return;
        }
        c1Var.a(y0Var.f27963j, "LAST_VAST_CLICKED_TYPE", str);
    }

    public void a(boolean z11) throws JSONException {
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar;
        x xVar;
        com.fyber.inneractive.sdk.player.ui.s sVar;
        int iB;
        Application application;
        if (this.o == z11 || (fVar = this.f28945a) == null || fVar.f30579a == null) {
            return;
        }
        IAlog.a("%sonVisibilityChanged: %s my video view is%s", IAlog.a(this), Boolean.valueOf(z11), this.f28948d);
        if (z11) {
            this.o = true;
            com.fyber.inneractive.sdk.player.enums.b bVar = this.f28945a.f30579a.f28926e;
            if (bVar != com.fyber.inneractive.sdk.player.enums.b.Completed && !this.f28948d.c()) {
                if (bVar != com.fyber.inneractive.sdk.player.enums.b.Error) {
                    if (bVar == com.fyber.inneractive.sdk.player.enums.b.Idle) {
                        this.f28945a.getClass();
                    } else {
                        if (bVar == com.fyber.inneractive.sdk.player.enums.b.Start_in_progress || bVar == com.fyber.inneractive.sdk.player.enums.b.Playing) {
                            x();
                        }
                        com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
                        if (!fVar2.f30588j) {
                            com.fyber.inneractive.sdk.player.n nVar = (com.fyber.inneractive.sdk.player.n) fVar2;
                            nVar.a(nVar.f30638q, VideoClickOrigin.InvalidOrigin, com.fyber.inneractive.sdk.model.vast.x.EVENT_CREATIVE_VIEW);
                            fVar2.f30588j = true;
                        }
                        f();
                        if (this.f28957m != null || (application = com.fyber.inneractive.sdk.util.o.f31210a) == null) {
                            return;
                        }
                        u uVar = new u(this);
                        this.f28957m = uVar;
                        application.registerActivityLifecycleCallbacks(uVar);
                        return;
                    }
                }
                s();
                return;
            }
            if (!this.f28961s) {
                this.f28961s = true;
                if (!this.f28967y) {
                    if (!this.f28948d.c()) {
                        this.f28948d.a(false);
                        Runnable runnable = this.f28954j;
                        if (runnable != null) {
                            this.f28948d.removeCallbacks(runnable);
                            this.f28954j = null;
                        }
                        F();
                        E();
                        this.f28955k = false;
                        this.f28952h = true;
                    }
                    g0 g0Var = this.f28951g;
                    if (g0Var != null) {
                        boolean z12 = this.f28959q;
                        com.fyber.inneractive.sdk.player.f fVar3 = this.f28945a;
                        if ((fVar3 != null ? fVar3.f30579a : null) != null) {
                            iB = (fVar3 != null ? fVar3.f30579a : null).b();
                        } else {
                            iB = -1;
                        }
                        g0Var.a(iB, z12);
                    }
                }
            }
            com.fyber.inneractive.sdk.player.ui.s sVar2 = this.f28948d;
            if (sVar2 != null) {
                sVar2.k();
                return;
            }
            return;
        }
        this.o = false;
        com.fyber.inneractive.sdk.player.f fVar4 = this.f28945a;
        if (fVar4 != null && (qVar = fVar4.f30579a) != null && (xVar = qVar.f28925d) != null && xVar.equals(this.f28949e)) {
            IAlog.a("%sonVisibilityChanged pausing video", IAlog.a(this));
            z();
            if (this.f28945a.f30579a.f28926e == com.fyber.inneractive.sdk.player.enums.b.Completed || ((sVar = this.f28948d) != null && sVar.c())) {
                this.f28948d.j();
            }
        }
        com.fyber.inneractive.sdk.player.ui.s sVar3 = this.f28948d;
        if (sVar3 == null || !sVar3.f30687h) {
            g();
        }
    }

    public final void a(int i5, g1 g1Var) throws JSONException {
        q qVar;
        q qVar2;
        IAlog.a("onClicked called with %d", Integer.valueOf(i5));
        switch (i5) {
            case 1:
                if (p()) {
                    com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
                    if (fVar != null && (qVar2 = fVar.f30579a) != null) {
                        qVar2.d(true);
                    }
                    this.f28948d.setMuteButtonState(false);
                    com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
                    if (fVar2 != null) {
                        com.fyber.inneractive.sdk.player.n nVar = (com.fyber.inneractive.sdk.player.n) fVar2;
                        nVar.a(nVar.f30638q, VideoClickOrigin.MUTE, com.fyber.inneractive.sdk.model.vast.x.EVENT_UNMUTE);
                    }
                } else {
                    com.fyber.inneractive.sdk.player.f fVar3 = this.f28945a;
                    if (fVar3 != null && (qVar = fVar3.f30579a) != null) {
                        qVar.b(true);
                    }
                    this.f28948d.setMuteButtonState(true);
                    com.fyber.inneractive.sdk.player.f fVar4 = this.f28945a;
                    if (fVar4 != null) {
                        com.fyber.inneractive.sdk.player.n nVar2 = (com.fyber.inneractive.sdk.player.n) fVar4;
                        nVar2.a(nVar2.f30638q, VideoClickOrigin.MUTE, com.fyber.inneractive.sdk.model.vast.x.EVENT_MUTE);
                    }
                }
                this.f28948d.setMuteButtonState(p());
                break;
            case 2:
                v();
                break;
            case 3:
                a(b1.CTA_BUTTON.a());
                a(false, VideoClickOrigin.CTA, g1Var);
                break;
            case 4:
                a(b1.COMPANION.a());
                com.fyber.inneractive.sdk.player.f fVar5 = this.f28945a;
                String str = null;
                if (fVar5 != null) {
                    com.fyber.inneractive.sdk.player.n nVar3 = (com.fyber.inneractive.sdk.player.n) fVar5;
                    com.fyber.inneractive.sdk.flow.endcard.b bVarA = nVar3.f30642u.f28076b.a();
                    if (bVarA instanceof com.fyber.inneractive.sdk.flow.endcard.c) {
                        com.fyber.inneractive.sdk.flow.endcard.c cVar = (com.fyber.inneractive.sdk.flow.endcard.c) bVarA;
                        String str2 = cVar.f28061g.f28588g;
                        if (TextUtils.isEmpty(str2)) {
                            com.fyber.inneractive.sdk.model.vast.b bVar = nVar3.f30638q;
                            if (bVar != null) {
                                str = bVar.f28569b;
                            }
                        } else {
                            str = str2;
                        }
                        fVar5.a(cVar, VideoClickOrigin.COMPANION, com.fyber.inneractive.sdk.model.vast.x.EVENT_CLICK);
                    }
                }
                com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
                if (sVar != null) {
                    sVar.g();
                }
                g0 g0Var = this.f28951g;
                if (g0Var != null) {
                    g0Var.a(str, g1Var, false);
                    break;
                }
                break;
            case 5:
                t();
                break;
            case 6:
                if (C()) {
                    f(true);
                    break;
                } else {
                    d(true);
                    break;
                }
            case 7:
                b(g1Var);
                break;
            case 8:
                a(b1.COMPANION.a());
                a(true, VideoClickOrigin.COMPANION, g1Var);
                break;
            case 9:
                com.fyber.inneractive.sdk.player.f fVar6 = this.f28945a;
                if (fVar6 != null && !this.f28948d.f30687h) {
                    fVar6.f30585g = true;
                    g(false);
                    break;
                }
                break;
            case 10:
                a(b1.APP_INFO.a());
                a(false, VideoClickOrigin.APP_INFO, g1Var);
                break;
            case 11:
                a(b1.STORE_PROMO.a());
                a(false, VideoClickOrigin.STORE_PROMO, g1Var);
                break;
        }
    }

    public final boolean a(boolean z11, VideoClickOrigin videoClickOrigin, g1 g1Var) {
        com.fyber.inneractive.sdk.util.g gVar;
        com.fyber.inneractive.sdk.player.ui.s sVar = this.f28948d;
        if (sVar != null) {
            sVar.g();
        }
        g0 g0Var = this.f28951g;
        boolean z12 = false;
        if (g0Var != null) {
            if (z11) {
                com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
                if (fVar != null) {
                    com.fyber.inneractive.sdk.model.vast.b bVar = ((com.fyber.inneractive.sdk.player.n) fVar).f30638q;
                    g0Var.a(bVar != null ? bVar.f28569b : null, g1Var, true);
                    com.fyber.inneractive.sdk.player.n nVar = (com.fyber.inneractive.sdk.player.n) this.f28945a;
                    nVar.a(nVar.f30638q, videoClickOrigin, com.fyber.inneractive.sdk.model.vast.x.EVENT_CLICK);
                }
            } else {
                int i5 = y.f28944b[videoClickOrigin.ordinal()];
                if (i5 == 1) {
                    gVar = com.fyber.inneractive.sdk.util.g.STORE_PROMO_CTA;
                } else if (i5 == 2) {
                    gVar = com.fyber.inneractive.sdk.util.g.VIDEO_CLICK;
                } else if (i5 != 3) {
                    gVar = com.fyber.inneractive.sdk.util.g.VIDEO_CTA;
                } else {
                    gVar = com.fyber.inneractive.sdk.util.g.VIDEO_APP_INFO;
                }
                com.fyber.inneractive.sdk.util.d0 d0VarA = this.f28951g.a(g1Var, gVar);
                com.fyber.inneractive.sdk.player.f fVar2 = this.f28945a;
                if (fVar2 != null) {
                    com.fyber.inneractive.sdk.player.n nVar2 = (com.fyber.inneractive.sdk.player.n) fVar2;
                    nVar2.a(nVar2.f30638q, videoClickOrigin, com.fyber.inneractive.sdk.model.vast.x.EVENT_CLICK);
                    com.fyber.inneractive.sdk.measurement.f fVar3 = this.f28945a.f30583e;
                    if (fVar3 != null && fVar3.f28513c != null) {
                        IAlog.a("%s click", "OMVideo");
                        try {
                            vn.b bVar2 = fVar3.f28513c;
                            vn.a aVar = vn.a.CLICK;
                            bVar2.getClass();
                            un.k kVar = bVar2.f92861a;
                            x7.f.l(kVar);
                            JSONObject jSONObject = new JSONObject();
                            ao.b.b(jSONObject, "interactionType", aVar);
                            kVar.f91402e.b("adUserInteraction", jSONObject);
                        } catch (Throwable th2) {
                            fVar3.a(th2);
                        }
                    }
                }
                if (d0VarA.f31180a != com.fyber.inneractive.sdk.util.g0.FAILED) {
                    z12 = true;
                }
            }
        }
        if (videoClickOrigin == VideoClickOrigin.VIDEO) {
            a(b1.VIDEO.a());
        }
        return z12;
    }

    public final boolean a(com.fyber.inneractive.sdk.flow.storepromo.observer.a aVar) {
        com.fyber.inneractive.sdk.flow.storepromo.b bVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && (bVar = ((com.fyber.inneractive.sdk.player.n) fVar).f30644w) != null) {
            bVar.getClass();
            synchronized (com.fyber.inneractive.sdk.flow.storepromo.b.f28280k) {
                bVar.f28288h.add(aVar);
            }
            return true;
        }
        IAlog.f("Unable to add store promo observer, promo manager is unavailable", new Object[0]);
        return false;
    }
}
