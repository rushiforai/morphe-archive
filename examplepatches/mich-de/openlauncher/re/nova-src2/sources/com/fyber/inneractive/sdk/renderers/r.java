package com.fyber.inneractive.sdk.renderers;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdViewUnitController;
import com.fyber.inneractive.sdk.external.InneractiveAdViewVideoContentController;
import com.fyber.inneractive.sdk.external.InneractiveContentController;
import com.fyber.inneractive.sdk.external.InneractiveNativeVideoContentController;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.external.VideoContentListener;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.l0;
import com.fyber.inneractive.sdk.util.m0;
import com.fyber.inneractive.sdk.util.n0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;

/* loaded from: classes3.dex */
public class r extends e implements com.fyber.inneractive.sdk.interfaces.d, InneractiveNativeVideoContentController.Renderer, m0 {

    /* renamed from: l, reason: collision with root package name */
    public FrameLayout f31012l;

    /* renamed from: m, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.ui.m f31013m;
    public VideoContentListener n;

    /* renamed from: p, reason: collision with root package name */
    public ViewGroup f31014p;

    /* renamed from: q, reason: collision with root package name */
    public f0 f31015q;

    /* renamed from: t, reason: collision with root package name */
    public p f31018t;
    public final o o = new o(this);

    /* renamed from: r, reason: collision with root package name */
    public float f31016r = 0.0f;

    /* renamed from: s, reason: collision with root package name */
    public final Rect f31017s = new Rect();

    /* renamed from: u, reason: collision with root package name */
    public boolean f31019u = false;

    /* renamed from: v, reason: collision with root package name */
    public final q f31020v = new q(this);

    public void I() {
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        if (xVar != null) {
            t0 t0Var = (t0) xVar;
            if (t0Var.f28390j) {
                return;
            }
            t0Var.f28390j = true;
            E();
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void a(int i5) {
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final boolean b(View view) {
        return view != null && view.equals(this.f31014p);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final int d() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public void destroy() {
        this.n = null;
        s();
        super.destroy();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void l() {
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.player.controller.s) bVar).b(false);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final int n() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void p() {
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveNativeVideoContentController.Renderer
    public final void pauseVideo() {
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.player.controller.s) bVar).z();
        }
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveNativeVideoContentController.Renderer
    public final void playVideo() {
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.player.controller.s) bVar).c(0);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void q() throws JSONException {
        com.fyber.inneractive.sdk.player.controller.q qVar;
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            com.fyber.inneractive.sdk.player.controller.s sVar = (com.fyber.inneractive.sdk.player.controller.s) bVar;
            IAlog.a("%sfullscreenExited called", IAlog.a(sVar));
            sVar.E = false;
            sVar.h(sVar.D);
            com.fyber.inneractive.sdk.player.f fVar = sVar.f28945a;
            if (fVar == null || (qVar = fVar.f30579a) == null) {
                return;
            }
            sVar.a(qVar.f28926e);
            sVar.a(sVar.f28945a.f30579a.b());
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void s() {
        ViewGroup viewGroup;
        p pVar = this.f31018t;
        if (pVar != null && (viewGroup = this.f31014p) != null) {
            viewGroup.removeCallbacks(pVar);
            this.f31018t = null;
        }
        l0.f31201a.a(this.f31014p);
        IAlog.a("%sunbind called. root is %s", IAlog.a(this), this.f31014p);
        if (this.f30983k != null) {
            IAlog.a("%sdestroying video ui controller", IAlog.a(this));
            com.fyber.inneractive.sdk.player.controller.s sVar = (com.fyber.inneractive.sdk.player.controller.s) this.f30983k;
            sVar.getClass();
            sVar.f28951g = null;
            ((com.fyber.inneractive.sdk.player.controller.s) this.f30983k).destroy();
            this.f30983k = null;
        }
        if (this.f31013m != null) {
            ViewGroup viewGroup2 = this.f31014p;
            if (viewGroup2 != null) {
                viewGroup2.setLayoutTransition(null);
                this.f31014p.removeView(this.f31012l);
            }
            this.f31013m.destroy();
            this.f31013m = null;
        }
        this.f31012l = null;
        this.f31015q = null;
        this.f31014p = null;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final Context w() {
        return c((View) this.f31014p);
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public View x() {
        return this.f31012l;
    }

    public boolean a(com.fyber.inneractive.sdk.flow.x xVar) {
        return xVar instanceof t0;
    }

    public void a(ViewGroup viewGroup) {
        com.fyber.inneractive.sdk.flow.x xVar;
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        if (inneractiveAdSpot == null) {
            IAlog.f("%sYou must set the spot to render before calling renderAd", IAlog.a(this));
            return;
        }
        this.f31014p = viewGroup;
        InneractiveUnitController selectedUnitController = inneractiveAdSpot.getSelectedUnitController();
        if (!a(selectedUnitController)) {
            IAlog.f("%sWrong type of unit controller found. Expecting InneractiveAdViewUnitController", IAlog.a(this));
        } else {
            this.n = a(selectedUnitController.getSelectedContentController());
        }
        this.f31019u = false;
        this.f31012l = new FrameLayout(viewGroup.getContext());
        com.fyber.inneractive.sdk.flow.x xVar2 = this.f28031b;
        com.fyber.inneractive.sdk.player.t tVar = xVar2 != null ? ((t0) xVar2).f28389i : null;
        Context context = viewGroup.getContext();
        f0 f0VarA = a(tVar);
        this.f31015q = f0VarA;
        if (f0VarA == null || (xVar = this.f28031b) == null) {
            return;
        }
        this.f31013m = f0VarA.a(context, ((t0) xVar).f28439c);
        this.f30983k = (com.fyber.inneractive.sdk.player.controller.s) this.f31015q.a(this.f28030a, (t0) this.f28031b);
        ViewGroup viewGroup2 = this.f31014p;
        if (viewGroup2 != null) {
            viewGroup2.addView(this.f31012l, new ViewGroup.LayoutParams(-1, -2));
            this.f31014p.setLayoutTransition(null);
        }
        this.f31012l.addView((View) this.f31013m, new FrameLayout.LayoutParams(-2, -2, 17));
        com.fyber.inneractive.sdk.player.controller.s sVar = (com.fyber.inneractive.sdk.player.controller.s) this.f30983k;
        q qVar = this.f31020v;
        sVar.getClass();
        sVar.f28951g = qVar;
        com.fyber.inneractive.sdk.player.controller.s sVar2 = (com.fyber.inneractive.sdk.player.controller.s) this.f30983k;
        this.f31015q.b();
        sVar2.b(false);
        this.f31015q.a(this.o);
        ViewGroup viewGroup3 = this.f31014p;
        if (viewGroup3 != null) {
            n0 n0Var = l0.f31201a;
            n0Var.getClass();
            n0Var.a(viewGroup3.getContext(), viewGroup3, this);
        }
    }

    public boolean a(InneractiveUnitController inneractiveUnitController) {
        return inneractiveUnitController instanceof InneractiveAdViewUnitController;
    }

    public VideoContentListener a(InneractiveContentController inneractiveContentController) {
        if (inneractiveContentController instanceof InneractiveAdViewVideoContentController) {
            return (VideoContentListener) ((InneractiveAdViewVideoContentController) inneractiveContentController).getEventsListener();
        }
        IAlog.f("%sContent controller expected to be InneractiveFullscreenVideoContentController and is %s", IAlog.a(this), inneractiveContentController != null ? inneractiveContentController.getClass().getSimpleName() : AbstractJsonLexerKt.NULL);
        return null;
    }

    @Override // com.fyber.inneractive.sdk.util.m0
    public final void a(float f11, Rect rect) {
        ViewGroup viewGroup;
        ViewGroup viewGroup2;
        if (this.f31016r == f11 && this.f31017s.equals(rect)) {
            return;
        }
        this.f31016r = f11;
        this.f31017s.set(rect);
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.player.controller.s) bVar).D = false;
            ((com.fyber.inneractive.sdk.player.ui.e) this.f31013m).f();
            ((com.fyber.inneractive.sdk.player.controller.s) this.f30983k).a(f11);
        }
        if (f11 > 0.0f) {
            p pVar = this.f31018t;
            if (pVar != null && (viewGroup2 = this.f31014p) != null) {
                viewGroup2.removeCallbacks(pVar);
                this.f31018t = null;
            }
            p pVar2 = new p(this);
            this.f31018t = pVar2;
            ViewGroup viewGroup3 = this.f31014p;
            if (viewGroup3 != null) {
                viewGroup3.postDelayed(pVar2, 100L);
                return;
            }
            return;
        }
        p pVar3 = this.f31018t;
        if (pVar3 == null || (viewGroup = this.f31014p) == null) {
            return;
        }
        viewGroup.removeCallbacks(pVar3);
        this.f31018t = null;
    }

    public f0 a(com.fyber.inneractive.sdk.player.t tVar) {
        if (tVar == null || tVar.f30657f == null) {
            return null;
        }
        return new a(tVar);
    }
}
