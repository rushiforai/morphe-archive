package com.fyber.inneractive.sdk.renderers;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.external.MediaView;
import com.fyber.inneractive.sdk.flow.w0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.l0;
import com.fyber.inneractive.sdk.util.m0;
import com.fyber.inneractive.sdk.util.n0;

/* loaded from: classes3.dex */
public final class c0 extends e implements y, m0 {

    /* renamed from: l, reason: collision with root package name */
    public ViewGroup f30969l;
    public com.fyber.inneractive.sdk.flow.nativead.trackers.a n;
    public ImageView o;

    /* renamed from: m, reason: collision with root package name */
    public boolean f30970m = false;

    /* renamed from: p, reason: collision with root package name */
    public final a0 f30971p = new a0(this);

    static {
        IAlog.a(c0.class);
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final boolean C() {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.util.m0
    public final void a(float f11, Rect rect) {
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.ui.controller.a) bVar).a(f11);
        }
    }

    @Override // com.fyber.inneractive.sdk.renderers.y
    public final void b(ViewGroup viewGroup) {
        if (this.f28030a == null) {
            IAlog.f("%sYou must set the spot to render before calling renderAd", IAlog.a(this));
            return;
        }
        this.f30969l = viewGroup;
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
        ImageView imageView = new ImageView(this.f30969l.getContext());
        this.o = imageView;
        imageView.setImageURI(((w0) this.f28031b).f28427m);
        this.o.getViewTreeObserver().addOnWindowFocusChangeListener(this);
        this.f30969l.addView(this.o, layoutParams);
        com.fyber.inneractive.sdk.ui.controller.a aVar = new com.fyber.inneractive.sdk.ui.controller.a();
        this.f30983k = aVar;
        aVar.f31155a = this.f30971p;
        n0 n0Var = l0.f31201a;
        ViewGroup viewGroup2 = this.f30969l;
        n0Var.getClass();
        n0Var.a(viewGroup2.getContext(), viewGroup2, this);
        c(this.f30969l);
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void destroy() {
        com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = this.n;
        if (aVar != null) {
            aVar.a();
            this.n = null;
        }
        ImageView imageView = this.o;
        if (imageView != null) {
            imageView.getViewTreeObserver().removeOnWindowFocusChangeListener(this);
            this.o = null;
        }
        l0.f31201a.a(this.f30969l);
        com.fyber.inneractive.sdk.util.v.a(this.f30969l);
        this.f30969l = null;
        com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
        if (bVar != null) {
            ((com.fyber.inneractive.sdk.ui.controller.a) bVar).f31155a = null;
        }
        super.destroy();
    }

    @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
    public final void onWindowFocusChanged(boolean z11) {
        l0.f31201a.b(com.fyber.inneractive.sdk.util.o.a(x()).getApplicationContext());
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final View x() {
        MediaView mediaView;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        return (xVar == null || (mediaView = ((w0) xVar).n) == null) ? this.f30969l : mediaView;
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.k
    public final void a(String str, boolean z11, com.fyber.inneractive.sdk.util.g gVar, com.fyber.inneractive.sdk.click.o oVar) {
        if (!this.f30970m) {
            com.fyber.inneractive.sdk.util.r.f31216b.post(new b0(this));
            com.fyber.inneractive.sdk.ui.controller.b bVar = this.f30983k;
            if (bVar instanceof com.fyber.inneractive.sdk.ui.controller.a) {
                ((com.fyber.inneractive.sdk.ui.controller.a) bVar).f31156b.set(true);
            }
        }
        com.fyber.inneractive.sdk.util.r.f31216b.post(new com.fyber.inneractive.sdk.flow.y(this, com.fyber.inneractive.sdk.util.o.a(x()), str, new g1(), gVar, z11, oVar));
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.trackers.c
    public final void b() {
        com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = this.n;
        if (aVar != null) {
            aVar.a();
        }
    }
}
