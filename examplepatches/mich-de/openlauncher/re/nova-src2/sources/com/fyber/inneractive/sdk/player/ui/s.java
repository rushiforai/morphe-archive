package com.fyber.inneractive.sdk.player.ui;

import android.content.Context;
import android.view.GestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h1;
import com.fyber.inneractive.sdk.util.v;

/* loaded from: classes3.dex */
public abstract class s extends e {

    /* renamed from: j, reason: collision with root package name */
    public final int f30731j;

    /* renamed from: k, reason: collision with root package name */
    public final int f30732k;

    /* renamed from: l, reason: collision with root package name */
    public final int f30733l;

    /* renamed from: m, reason: collision with root package name */
    public ViewGroup f30734m;
    public Button n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f30735p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f30736q;

    /* renamed from: r, reason: collision with root package name */
    public ViewGroup f30737r;

    /* renamed from: s, reason: collision with root package name */
    public ViewGroup f30738s;

    /* renamed from: t, reason: collision with root package name */
    public final h1 f30739t;

    /* renamed from: u, reason: collision with root package name */
    public h1 f30740u;

    /* renamed from: v, reason: collision with root package name */
    public TextView f30741v;

    /* renamed from: w, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f30742w;

    /* renamed from: x, reason: collision with root package name */
    public final String f30743x;

    /* renamed from: y, reason: collision with root package name */
    public final h1 f30744y;

    public s(Context context, com.fyber.inneractive.sdk.config.global.r rVar, String str) {
        super(context);
        this.o = -1;
        this.f30735p = -1;
        this.f30736q = false;
        this.f30739t = new h1(0, 0);
        this.f30744y = new h1(0, 0);
        IAlog.a("%sctor called", IAlog.a(this));
        int tickFractions = getTickFractions();
        this.f30732k = tickFractions;
        this.f30731j = getMaxTickFactor();
        this.f30733l = 1000 / tickFractions;
        setBackgroundColor(getResources().getColor(R.color.ia_video_background_color));
        setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        this.f30742w = rVar;
        this.f30743x = str;
    }

    public abstract void a(int i5, int i11);

    public abstract void a(com.fyber.inneractive.sdk.flow.endcard.b bVar, b bVar2);

    public abstract void a(boolean z11);

    public void a(boolean z11, int i5, int i11) {
        this.o = i5;
        this.f30735p = i11;
        this.f30736q = z11;
    }

    public abstract void a(boolean z11, com.fyber.inneractive.sdk.ignite.m mVar);

    public abstract void a(boolean z11, String str);

    public abstract void b(boolean z11);

    public abstract void c(boolean z11);

    @Override // com.fyber.inneractive.sdk.player.ui.m
    public boolean c() {
        return this.f30737r.getVisibility() == 0 || this.f30738s.getChildCount() > 0;
    }

    public abstract void d(boolean z11);

    public void destroy() {
        i();
        setVisibility(8);
        if (this.f30686g != null) {
            this.f30686g = null;
        }
        this.f30688i = null;
        IAlog.a("%sdestroyed called", IAlog.a(this));
    }

    public abstract void e(boolean z11);

    public abstract void f(boolean z11);

    public abstract void g();

    public abstract void g(boolean z11);

    public ViewGroup getDefaultEndCardContainer() {
        return this.f30737r;
    }

    public abstract View getEndCardView();

    public int getMaxTickFactor() {
        return 1000;
    }

    public ViewGroup getTextureHost() {
        return this.f30734m;
    }

    public int getTickFractions() {
        return 5;
    }

    public abstract View[] getTrackingFriendlyView();

    public abstract View[] getTrackingFriendlyViewObstructionPurposeOther();

    public int getVideoHeight() {
        return this.f30735p;
    }

    public int getVideoWidth() {
        return this.o;
    }

    public abstract void h();

    public abstract void i();

    public abstract void j();

    public abstract void k();

    public abstract boolean l();

    public abstract void m();

    public abstract void n();

    public abstract void o();

    @Override // android.widget.RelativeLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        a(this.f30744y, size, size2);
        h1 h1Var = this.f30744y;
        int i12 = h1Var.f31191a;
        if (i12 <= 0 || h1Var.f31192b <= 0) {
            h1Var.f31191a = size;
            h1Var.f31192b = size2;
        } else {
            int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i12, 1073741824);
            i11 = View.MeasureSpec.makeMeasureSpec(this.f30744y.f31192b, 1073741824);
            i5 = iMakeMeasureSpec;
        }
        if (!this.f30739t.equals(this.f30744y)) {
            h1 h1Var2 = this.f30739t;
            h1 h1Var3 = this.f30744y;
            h1Var2.getClass();
            h1Var2.f31191a = h1Var3.f31191a;
            h1Var2.f31192b = h1Var3.f31192b;
            o();
        }
        super.onMeasure(i5, i11);
    }

    public abstract void setAppInfoButtonRound(TextView textView);

    public abstract void setMuteButtonState(boolean z11);

    public abstract void setRemainingTime(String str);

    public abstract void setSkipText(String str);

    public void a(com.fyber.inneractive.sdk.flow.endcard.d dVar, b bVar) {
        ViewGroup defaultEndCardContainer = getDefaultEndCardContainer();
        if (defaultEndCardContainer != null) {
            defaultEndCardContainer.setVisibility(0);
            n nVar = this.f30686g;
            com.fyber.inneractive.sdk.flow.endcard.f fVar = (com.fyber.inneractive.sdk.flow.endcard.f) dVar.f();
            fVar.a(bVar, nVar);
            ViewGroup viewGroup = fVar.f28066c;
            v.a(viewGroup);
            defaultEndCardContainer.addView(viewGroup);
            dVar.a(dVar.f28059e, dVar.f28057c);
        }
    }

    public final void a(View view, int i5) {
        if (view != null) {
            view.setOnTouchListener(new r(new GestureDetector(view.getContext(), new q(this, view, new int[2], i5))));
        }
    }
}
