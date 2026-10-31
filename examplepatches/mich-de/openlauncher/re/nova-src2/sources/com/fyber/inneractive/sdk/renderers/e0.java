package com.fyber.inneractive.sdk.renderers;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveContentController;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.external.MediaView;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.fyber.inneractive.sdk.external.NativeAdUnitController;
import com.fyber.inneractive.sdk.external.NativeAdVideoContentController;
import com.fyber.inneractive.sdk.external.VideoContentListener;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.w0;
import com.fyber.inneractive.sdk.player.enums.VideoClickOrigin;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.l0;
import com.fyber.inneractive.sdk.util.n0;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public final class e0 extends r implements y {

    /* renamed from: w, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.nativead.trackers.a f30984w;

    /* renamed from: x, reason: collision with root package name */
    public WeakReference f30985x;

    static {
        IAlog.a(e0.class);
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final boolean C() {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final boolean D() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.renderers.r
    public final void I() {
        com.fyber.inneractive.sdk.flow.x xVar;
        com.fyber.inneractive.sdk.player.n nVar;
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        if (inneractiveAdSpot == null || inneractiveAdSpot.getAdContent() == null || (xVar = this.f28031b) == null || ((t0) xVar).f28390j) {
            return;
        }
        IAlog.a("%sTracking impression", IAlog.a(this));
        com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = new com.fyber.inneractive.sdk.flow.nativead.trackers.a((w0) this.f28030a.getAdContent());
        this.f30984w = aVar;
        aVar.a(this);
        f0 f0Var = this.f31015q;
        if (f0Var != null && (nVar = f0Var.f30988c) != null) {
            if (nVar.f30645x.compareAndSet(false, true)) {
                nVar.a(nVar.f30638q, VideoClickOrigin.InvalidOrigin, com.fyber.inneractive.sdk.model.vast.x.EVENT_IMPRESSION, com.fyber.inneractive.sdk.model.vast.x.EVENT_START);
            } else {
                IAlog.a("%sreportPlayStartEvents called, but start events was already reported", IAlog.a(nVar));
            }
        }
        super.I();
    }

    @Override // com.fyber.inneractive.sdk.renderers.r
    public final f0 a(com.fyber.inneractive.sdk.player.t tVar) {
        if (tVar != null) {
            return new z(tVar);
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.renderers.y
    public final void b(ViewGroup viewGroup) {
        com.fyber.inneractive.sdk.player.ui.m mVar;
        a(viewGroup);
        ImageView imageViewC = c(viewGroup);
        if (imageViewC == null || (mVar = this.f31013m) == null) {
            return;
        }
        ((com.fyber.inneractive.sdk.player.ui.e) mVar).setWatermarkView(imageViewC);
    }

    @Override // com.fyber.inneractive.sdk.renderers.r, com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void destroy() {
        com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = this.f30984w;
        if (aVar != null) {
            aVar.a();
            this.f30984w = null;
        }
        WeakReference weakReference = this.f30985x;
        com.fyber.inneractive.sdk.player.ui.u uVar = weakReference != null ? (com.fyber.inneractive.sdk.player.ui.u) weakReference.get() : null;
        if (uVar != null) {
            uVar.getViewTreeObserver().removeOnWindowFocusChangeListener(this);
        }
        l0.f31201a.a(this.f31014p);
        super.destroy();
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void initialize(InneractiveAdSpot inneractiveAdSpot) {
        super.initialize(inneractiveAdSpot);
        if (inneractiveAdSpot.getAdContent() instanceof w0) {
            this.f28031b = ((w0) inneractiveAdSpot.getAdContent()).f28431s;
        }
    }

    @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
    public final void onWindowFocusChanged(boolean z11) {
        l0.f31201a.b(c((View) this.f31014p).getApplicationContext());
        WeakReference weakReference = this.f30985x;
        com.fyber.inneractive.sdk.player.ui.u uVar = weakReference != null ? (com.fyber.inneractive.sdk.player.ui.u) weakReference.get() : null;
        if (uVar != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(new com.fyber.inneractive.sdk.player.ui.d(uVar, z11), 500L);
        }
    }

    @Override // com.fyber.inneractive.sdk.renderers.r, com.fyber.inneractive.sdk.flow.b0
    public final View x() {
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        MediaView mediaView = (inneractiveAdSpot == null || !(inneractiveAdSpot.getAdContent() instanceof w0)) ? null : ((w0) this.f28030a.getAdContent()).n;
        return mediaView != null ? mediaView : this.f31014p;
    }

    @Override // com.fyber.inneractive.sdk.renderers.r, com.fyber.inneractive.sdk.interfaces.d
    public final boolean a(com.fyber.inneractive.sdk.flow.x xVar) {
        return xVar instanceof NativeAdContent;
    }

    @Override // com.fyber.inneractive.sdk.renderers.r
    public final boolean a(InneractiveUnitController inneractiveUnitController) {
        return inneractiveUnitController instanceof NativeAdUnitController;
    }

    @Override // com.fyber.inneractive.sdk.renderers.r
    public final VideoContentListener a(InneractiveContentController inneractiveContentController) {
        if (!(inneractiveContentController instanceof NativeAdVideoContentController)) {
            IAlog.f("%s: Content controller expected to be NativeAdVideoContentController but it: %s", IAlog.a(this), inneractiveContentController);
            return null;
        }
        return (VideoContentListener) ((NativeAdVideoContentController) inneractiveContentController).getEventsListener();
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.trackers.c
    public final void b() {
        com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = this.f30984w;
        if (aVar != null) {
            aVar.a();
            this.f30984w = null;
        }
    }

    @Override // com.fyber.inneractive.sdk.renderers.r, com.fyber.inneractive.sdk.interfaces.d
    public final void a(ViewGroup viewGroup) {
        com.fyber.inneractive.sdk.player.ui.u uVar;
        com.fyber.inneractive.sdk.player.n nVar;
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
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        Float fValueOf = null;
        com.fyber.inneractive.sdk.player.t tVar = xVar != null ? ((t0) xVar).f28389i : null;
        Context context = viewGroup.getContext();
        f0 f0VarA = a(tVar);
        this.f31015q = f0VarA;
        if (f0VarA != null) {
            com.fyber.inneractive.sdk.player.ui.m mVarA = f0VarA.a(context, ((t0) this.f28031b).f28439c);
            this.f31013m = mVarA;
            if (mVarA instanceof com.fyber.inneractive.sdk.player.ui.u) {
                uVar = (com.fyber.inneractive.sdk.player.ui.u) mVarA;
                uVar.getViewTreeObserver().addOnWindowFocusChangeListener(this);
            } else {
                uVar = null;
            }
            this.f30985x = new WeakReference(uVar);
            this.f30983k = (com.fyber.inneractive.sdk.player.controller.s) this.f31015q.a(this.f28030a, (t0) this.f28031b);
            viewGroup.addView((View) this.f31013m, new ViewGroup.LayoutParams(-1, -1));
            com.fyber.inneractive.sdk.player.controller.s sVar = (com.fyber.inneractive.sdk.player.controller.s) this.f30983k;
            q qVar = this.f31020v;
            sVar.getClass();
            sVar.f28951g = qVar;
            com.fyber.inneractive.sdk.player.controller.s sVar2 = (com.fyber.inneractive.sdk.player.controller.s) this.f30983k;
            this.f31015q.b();
            sVar2.b(false);
            this.f31015q.a(this.o);
            InneractiveAdSpot inneractiveAdSpot2 = this.f28030a;
            if (inneractiveAdSpot2 != null && (inneractiveAdSpot2.getAdContent() instanceof w0)) {
                w0 w0Var = (w0) this.f28030a.getAdContent();
                f0 f0Var = this.f31015q;
                com.fyber.inneractive.sdk.player.controller.q qVar2 = (f0Var == null || (nVar = f0Var.f30988c) == null) ? null : nVar.f30579a;
                if (qVar2 != null && qVar2.e() > 0 && qVar2.f() > 0) {
                    fValueOf = Float.valueOf(qVar2.f() / qVar2.e());
                }
                w0Var.f28428p = fValueOf;
            }
            n0 n0Var = l0.f31201a;
            ViewGroup viewGroup2 = this.f31014p;
            n0Var.getClass();
            n0Var.a(viewGroup2.getContext(), viewGroup2, this);
            return;
        }
        IAlog.f("%s : can't render - video renderer is missing", IAlog.a(this));
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.k
    public final void a(String str, boolean z11, com.fyber.inneractive.sdk.util.g gVar, com.fyber.inneractive.sdk.click.o oVar) {
        com.fyber.inneractive.sdk.flow.x xVar;
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        if (inneractiveAdSpot != null && inneractiveAdSpot.getAdContent() != null && (xVar = this.f28031b) != null && !((t0) xVar).f28390j) {
            com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
            if (bVar instanceof com.fyber.inneractive.sdk.player.controller.c0) {
                ((com.fyber.inneractive.sdk.player.controller.c0) bVar).F.set(true);
            }
            com.fyber.inneractive.sdk.util.r.f31216b.post(new d0(this));
        }
        com.fyber.inneractive.sdk.util.r.f31216b.post(new com.fyber.inneractive.sdk.flow.y(this, c((View) this.f31014p), str, new g1(), gVar, z11, oVar));
    }
}
