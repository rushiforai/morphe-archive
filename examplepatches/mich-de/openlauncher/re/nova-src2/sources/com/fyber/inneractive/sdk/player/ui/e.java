package com.fyber.inneractive.sdk.player.ui;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.x0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.h1;

/* loaded from: classes3.dex */
public abstract class e extends RelativeLayout implements m {

    /* renamed from: a, reason: collision with root package name */
    public final g1 f30680a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30681b;

    /* renamed from: c, reason: collision with root package name */
    public x0 f30682c;

    /* renamed from: d, reason: collision with root package name */
    public UnitDisplayType f30683d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f30684e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f30685f;

    /* renamed from: g, reason: collision with root package name */
    public n f30686g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30687h;

    /* renamed from: i, reason: collision with root package name */
    public View f30688i;

    public e(Context context) {
        super(context, null, 0);
        this.f30680a = new g1();
        this.f30681b = 0;
        this.f30684e = false;
        this.f30685f = false;
        this.f30687h = false;
        this.f30681b = Math.min(com.fyber.inneractive.sdk.util.o.d(), com.fyber.inneractive.sdk.util.o.c());
    }

    public abstract void a(h1 h1Var, int i5, int i11);

    @Override // com.fyber.inneractive.sdk.player.ui.m
    public boolean b() {
        return false;
    }

    public void d() {
        this.f30687h = true;
    }

    public void e() {
        this.f30687h = false;
    }

    public final void f() {
        boolean globalVisibleRect = isShown() && hasWindowFocus() && this.f30685f && !this.f30687h;
        if (globalVisibleRect) {
            globalVisibleRect = getGlobalVisibleRect(new Rect());
        }
        if (globalVisibleRect == this.f30684e || this.f30686g == null) {
            return;
        }
        IAlog.a("%supdateVisibility changing to %s", IAlog.a(this), Boolean.valueOf(globalVisibleRect));
        this.f30684e = globalVisibleRect;
        this.f30686g.a(globalVisibleRect);
    }

    public View getWatermarkView() {
        return this.f30688i;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        IAlog.a("%sGot onAttachedToWindow: mIsAttached = %s", IAlog.a(this), Boolean.valueOf(this.f30685f));
        this.f30685f = true;
        n nVar = this.f30686g;
        if (nVar != null) {
            nVar.a();
        }
        f();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        IAlog.a("%sGot onDetachedFromWindow: mIsAttached = %s", IAlog.a(this), Boolean.valueOf(this.f30685f));
        this.f30685f = false;
        n nVar = this.f30686g;
        if (nVar != null) {
            nVar.c();
        }
        f();
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        if (equals(view)) {
            IAlog.a("%sgot onVisibilityChanged with %d", IAlog.a(this), Integer.valueOf(i5));
            f();
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        IAlog.a("%sgot onWindowFocusChanged with: %s", IAlog.a(this), Boolean.valueOf(z11));
        com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(new d(this, z11), 500L);
    }

    public void setListener(n nVar) {
        this.f30686g = nVar;
    }

    public void setUnitConfig(x0 x0Var) {
        this.f30682c = x0Var;
        w0 w0Var = (w0) x0Var;
        this.f30683d = w0Var.f27947e == null ? w0Var.f27948f.f27963j : UnitDisplayType.DEFAULT;
    }

    public void setWatermarkView(View view) {
        this.f30688i = view;
    }
}
