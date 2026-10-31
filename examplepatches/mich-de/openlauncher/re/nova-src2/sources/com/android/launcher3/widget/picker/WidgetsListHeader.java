package com.android.launcher3.widget.picker;

import aa.c0;
import aa.j0;
import ab.d0;
import ab.e0;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import ba.e;
import eb.n;
import eb.o;
import ga.f;
import ga.h;
import o9.t1;
import o9.u2;
import za.d;

/* loaded from: classes2.dex */
public final class WidgetsListHeader extends LinearLayout implements c0 {

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ int f21348k = 0;

    /* renamed from: a, reason: collision with root package name */
    public boolean f21349a;

    /* renamed from: b, reason: collision with root package name */
    public e f21350b;

    /* renamed from: c, reason: collision with root package name */
    public Drawable f21351c;

    /* renamed from: d, reason: collision with root package name */
    public final int f21352d;

    /* renamed from: e, reason: collision with root package name */
    public ImageView f21353e;

    /* renamed from: f, reason: collision with root package name */
    public TextView f21354f;

    /* renamed from: g, reason: collision with root package name */
    public TextView f21355g;

    /* renamed from: h, reason: collision with root package name */
    public CheckBox f21356h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f21357i;

    /* renamed from: j, reason: collision with root package name */
    public n f21358j;

    public WidgetsListHeader(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f21349a = false;
        this.f21357i = false;
        this.f21352d = context.obtainStyledAttributes(attributeSet, u2.Q, 0, 0).getDimensionPixelSize(0, ((d) d.p(context)).P().D);
    }

    public final void a(h hVar) {
        Drawable drawableR0 = hVar.f57320y == -1 ? hVar.r0(getContext(), false) : getContext().getDrawable(((d0) e0.G(getContext()).get(hVar.f57320y)).f705c);
        int i5 = this.f21352d;
        drawableR0.setBounds(0, 0, i5, i5);
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.f21353e.getLayoutParams();
        layoutParams.width = i5;
        layoutParams.height = i5;
        this.f21353e.setLayoutParams(layoutParams);
        this.f21353e.setImageDrawable(drawableR0);
        Drawable drawable = this.f21351c;
        if (drawable != null && (drawable instanceof j0) && this.f21349a) {
            ((j0) drawable).l(drawableR0);
        }
        this.f21351c = drawableR0;
        drawableR0.setVisible(getWindowVisibility() == 0 && isShown(), false);
    }

    public final void b() {
        e eVar = this.f21350b;
        if (eVar != null) {
            eVar.a();
            this.f21350b = null;
        }
        if (getTag() instanceof f) {
            f fVar = (f) getTag();
            if (fVar.L0()) {
                this.f21350b = t1.c(getContext()).f80135d.D(this, fVar);
            }
        }
    }

    @Override // aa.c0
    public final void n(f fVar) {
        if (getTag() == fVar) {
            this.f21350b = null;
            this.f21349a = true;
            fVar.f57304r.f21151a.prepareToDraw();
            a((h) fVar);
            this.f21349a = false;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        n nVar = this.f21358j;
        if (nVar == null) {
            return super.onCreateDrawableState(i5);
        }
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + nVar.f52510a.length);
        View.mergeDrawableStates(iArrOnCreateDrawableState, this.f21358j.f52510a);
        return iArrOnCreateDrawableState;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f21353e = (ImageView) findViewById(2131427500);
        this.f21354f = (TextView) findViewById(2131427506);
        this.f21355g = (TextView) findViewById(2131427505);
        this.f21356h = (CheckBox) findViewById(2131429049);
        findViewById(2131427499).setAccessibilityDelegate(new o(this, 0));
    }
}
