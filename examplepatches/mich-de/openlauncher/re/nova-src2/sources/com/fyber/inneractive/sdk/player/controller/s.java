package com.fyber.inneractive.sdk.player.controller;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.activities.InneractiveFullscreenAdActivity;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.TapAction;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdViewEventsListener;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.player.enums.VideoClickOrigin;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import org.json.JSONException;

/* loaded from: classes3.dex */
public class s extends z {
    public float A;
    public float B;
    public boolean C;
    public boolean D;
    public boolean E;

    /* renamed from: z, reason: collision with root package name */
    public r f28936z;

    public s(com.fyber.inneractive.sdk.player.f fVar, com.fyber.inneractive.sdk.player.ui.s sVar, w0 w0Var, com.fyber.inneractive.sdk.config.global.r rVar, boolean z11, String str) {
        super(fVar, sVar, w0Var, rVar, z11, str);
        this.B = 0.0f;
        this.C = false;
        this.D = false;
        this.E = false;
        this.A = ((w0) this.f28946b).f27949g.f27968b.intValue() / 100.0f;
        A();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public boolean B() {
        return false;
    }

    public void G() throws JSONException {
        IAlog.a("%s handle buffering timeout: Skipping to end card", IAlog.a(this));
        if (C()) {
            f(false);
        } else {
            d(false);
        }
    }

    public final void H() {
        Context context;
        if (this.f28951g == null || this.E) {
            return;
        }
        J();
        super.g();
        com.fyber.inneractive.sdk.renderers.q qVar = (com.fyber.inneractive.sdk.renderers.q) ((a0) this.f28951g);
        com.fyber.inneractive.sdk.renderers.r rVar = qVar.f31011a;
        InneractiveUnitController.EventsListener eventsListener = rVar.f28032c;
        if (eventsListener != null) {
            ((InneractiveAdViewEventsListener) eventsListener).onAdExpanded(rVar.f28030a);
        }
        com.fyber.inneractive.sdk.renderers.r rVar2 = qVar.f31011a;
        ViewGroup viewGroup = rVar2.f31014p;
        if (viewGroup != null && rVar2.f28030a != null && (context = viewGroup.getContext()) != null) {
            InneractiveAdSpot inneractiveAdSpot = qVar.f31011a.f28030a;
            Intent intent = new Intent(context, (Class<?>) InneractiveFullscreenAdActivity.class);
            intent.putExtra("spotId", inneractiveAdSpot.getLocalUniqueId());
            if (!(context instanceof Activity)) {
                intent.setFlags(268435456);
            }
            try {
                IAlog.a("%sIAInterstitialUtil: Opening interstitial for spot id: %s", IAlog.a(context), inneractiveAdSpot.getLocalUniqueId());
                context.startActivity(intent);
            } catch (ActivityNotFoundException unused) {
                IAlog.c("%sIAInterstitialUtil: InneractiveFullscreenAdActivity.class not found. Did you declare InneractiveFullscreenAdActivity in your manifest?", IAlog.a(context));
            }
        }
        IAlog.a("%sopening fullscreen", IAlog.a(this));
        this.E = true;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null) {
            com.fyber.inneractive.sdk.player.n nVar = (com.fyber.inneractive.sdk.player.n) fVar;
            nVar.a(nVar.f30638q, VideoClickOrigin.InvalidOrigin, com.fyber.inneractive.sdk.model.vast.x.EVENT_FULLSCREEN, com.fyber.inneractive.sdk.model.vast.x.EVENT_EXPAND);
        }
    }

    public void I() {
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar;
        com.fyber.inneractive.sdk.player.ui.s sVar;
        if (this.B < this.A || (fVar = this.f28945a) == null || (qVar = fVar.f30579a) == null || qVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Completed || (sVar = this.f28948d) == null || sVar.c() || this.f28945a.f30579a.f28931j == null) {
            return;
        }
        if (((w0) this.f28946b).f27948f.f27954a.booleanValue() || this.C) {
            c(IAConfigManager.Q.f27752j.f27874a);
        }
    }

    public final void J() {
        if (this.f28936z != null) {
            IAlog.a("%sCancelling play runnable", IAlog.a(this));
            this.f28948d.removeCallbacks(this.f28936z);
            this.f28936z = null;
        }
    }

    public void K() {
        if (((w0) this.f28946b).f27948f.f27962i != TapAction.FULLSCREEN) {
            this.f28948d.n();
        }
        D();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z, com.fyber.inneractive.sdk.player.ui.n
    public final void a(boolean z11) throws JSONException {
        if (z11) {
            a(this.B);
        }
        super.a(z11);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z, com.fyber.inneractive.sdk.player.controller.b
    public boolean b() {
        return !(this instanceof c0);
    }

    public final void c(int i5) {
        q qVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || (qVar = fVar.f30579a) == null || qVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Playing || this.f28936z != null) {
            return;
        }
        IAlog.a("%splayVideo %s", IAlog.a(this), this.f28948d);
        if (i5 == 0) {
            g(false);
            return;
        }
        r rVar = new r(this);
        this.f28936z = rVar;
        this.f28948d.postDelayed(rVar, i5);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z, com.fyber.inneractive.sdk.ui.controller.b
    public final void destroy() {
        J();
        this.f28951g = null;
        super.destroy();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void f() {
        super.f();
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && fVar.f30579a != null) {
            IAlog.a("%sconnectToTextureView playing state = %s", IAlog.a(this), this.f28945a.f30579a.f28926e);
            if (this.f28945a.f30579a.h()) {
                this.f28948d.e(!this.f28945a.f30585g);
                A();
            }
        }
        a(this.B);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void g() {
        J();
        super.g();
    }

    public final void h(boolean z11) {
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar;
        this.D = z11;
        if (!z11 || (fVar = this.f28945a) == null || (qVar = fVar.f30579a) == null || qVar.f28931j != null || !this.f28948d.f30684e || qVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Completed) {
            return;
        }
        f();
        a(this.B);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final int i() {
        return IAConfigManager.Q.f27761u.f27936b.a("VideoAdBufferingTimeout", 5, 1) * 1000;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final int o() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void r() throws JSONException {
        IAlog.a("%s onBufferingTimeout reached", IAlog.a(this));
        if (this.f28948d.f30684e) {
            this.f28960r = true;
            G();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void t() {
        H();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void u() {
        super.u();
        J();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void v() {
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || fVar.f30579a == null) {
            return;
        }
        f();
        g(false);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void w() {
        I();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void x() {
        super.x();
        K();
        this.C = true;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void z() {
        J();
        super.z();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z, com.fyber.inneractive.sdk.player.controller.b
    public final void b(boolean z11) {
        q qVar;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar != null && (qVar = fVar.f30579a) != null && qVar.f28926e != com.fyber.inneractive.sdk.player.enums.b.Completed) {
            K();
        }
        super.b(z11);
    }

    @Override // com.fyber.inneractive.sdk.ui.controller.b
    public void a(float f11) {
        q qVar;
        this.B = f11;
        if (IAlog.f31163a >= 3) {
            IAlog.c("%sonVisibilityChanged called with: %s vfpl = %s vfpa = %s", IAlog.a(this), Float.valueOf(f11), Float.valueOf(this.A), Float.valueOf(1.0f - this.A));
        }
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || (qVar = fVar.f30579a) == null) {
            return;
        }
        if (qVar.f28926e != com.fyber.inneractive.sdk.player.enums.b.Playing) {
            I();
            return;
        }
        if (f11 <= this.A) {
            IAlog.e("%sonVisibilityChanged pausing player", IAlog.a(this));
            if (this.f28945a.f30579a.f28931j != null) {
                this.C = false;
                J();
                super.z();
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public final void g(boolean z11) {
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || fVar.f30579a == null) {
            return;
        }
        A();
        super.g(false);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.z
    public void b(g1 g1Var) {
        q qVar;
        TapAction tapAction = ((w0) this.f28946b).f27948f.f27962i;
        com.fyber.inneractive.sdk.player.f fVar = this.f28945a;
        if (fVar == null || fVar.f30579a == null || this.B >= this.A) {
            if (tapAction == TapAction.CTR) {
                a(false, VideoClickOrigin.CTA, g1Var);
                return;
            }
            if (tapAction == TapAction.FULLSCREEN) {
                H();
                return;
            }
            if (tapAction != TapAction.DO_NOTHING) {
                IAlog.a("%sonVideoClicked called, but we recieved an unknown tap action %s", IAlog.a(this), tapAction);
                return;
            }
            if (fVar == null || (qVar = fVar.f30579a) == null) {
                return;
            }
            com.fyber.inneractive.sdk.player.enums.b bVar = qVar.f28926e;
            if (bVar != com.fyber.inneractive.sdk.player.enums.b.Completed && bVar != com.fyber.inneractive.sdk.player.enums.b.Prepared) {
                qVar.j();
            } else {
                qVar.a(1, true);
            }
        }
    }
}
