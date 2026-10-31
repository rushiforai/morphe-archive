package com.android.launcher3.pageindicators;

import aa.l;
import ae.m;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import com.teslacoilsw.launcher.NovaLauncher;
import ia.a;
import ia.d;
import kl.q0;
import mx.j0;
import o9.g3;
import o9.k;
import o9.n;
import o9.n1;
import o9.r0;
import ya.l0;

/* loaded from: classes.dex */
public class WorkspacePageIndicator extends View implements r0, a {
    public static final int n = ViewConfiguration.getScrollBarFadeDuration();
    public static final int o = ViewConfiguration.getScrollDefaultDelay();

    /* renamed from: p, reason: collision with root package name */
    public static final l f21210p = new l(2, Integer.class, "paint_alpha");

    /* renamed from: q, reason: collision with root package name */
    public static final l f21211q = new l(3, Float.class, "num_pages");

    /* renamed from: r, reason: collision with root package name */
    public static final l f21212r = new l(4, Integer.class, "total_scroll");

    /* renamed from: a, reason: collision with root package name */
    public final ValueAnimator[] f21213a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f21214b;

    /* renamed from: c, reason: collision with root package name */
    public final NovaLauncher f21215c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f21216d;

    /* renamed from: e, reason: collision with root package name */
    public final int f21217e;

    /* renamed from: f, reason: collision with root package name */
    public int f21218f;

    /* renamed from: g, reason: collision with root package name */
    public float f21219g;

    /* renamed from: h, reason: collision with root package name */
    public int f21220h;

    /* renamed from: i, reason: collision with root package name */
    public int f21221i;

    /* renamed from: j, reason: collision with root package name */
    public final Paint f21222j;

    /* renamed from: k, reason: collision with root package name */
    public final int f21223k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f21224l;

    /* renamed from: m, reason: collision with root package name */
    public final m f21225m;

    public WorkspacePageIndicator(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // ia.a
    public void a(int i5) {
    }

    @Override // ia.a
    public void c(int i5) {
        float f11 = i5;
        if (Float.compare(f11, this.f21219g) != 0) {
            i(ObjectAnimator.ofFloat(this, f21211q, f11), 1);
            return;
        }
        ValueAnimator[] valueAnimatorArr = this.f21213a;
        ValueAnimator valueAnimator = valueAnimatorArr[1];
        if (valueAnimator != null) {
            valueAnimator.cancel();
            valueAnimatorArr[1] = null;
        }
    }

    public final void d(int i5) {
        if (i5 == this.f21218f) {
            return;
        }
        this.f21218f = i5;
        i(ObjectAnimator.ofInt(this, f21210p, i5), 0);
    }

    public void e(int i5) {
        this.f21222j.setAlpha(i5);
    }

    public void f(n nVar) {
    }

    public void g(int i5, int i11) {
        if (getAlpha() == 0.0f) {
            return;
        }
        if (!this.f21224l) {
            d(this.f21217e);
        }
        this.f21220h = i5;
        int i12 = this.f21221i;
        if (i12 == 0) {
            this.f21221i = i11;
        } else if (i12 != i11) {
            i(ObjectAnimator.ofInt(this, f21212r, i11), 2);
        } else {
            invalidate();
        }
        if (!this.f21216d || this.f21224l) {
            return;
        }
        Handler handler = this.f21214b;
        handler.removeCallbacksAndMessages(null);
        handler.postDelayed(this.f21225m, o);
    }

    @Override // o9.r0
    public final void h(Rect rect) {
        j0 j0Var = this.f21215c.f79934x;
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) getLayoutParams();
        if (j0Var.o()) {
            Rect rect2 = j0Var.f77162q0;
            int i5 = rect2.left;
            int i11 = j0Var.K;
            layoutParams.leftMargin = i5 + i11;
            layoutParams.rightMargin = rect2.right + i11;
            layoutParams.bottomMargin = rect2.bottom;
        } else {
            layoutParams.rightMargin = 0;
            layoutParams.leftMargin = 0;
            layoutParams.gravity = 81;
            layoutParams.bottomMargin = j0Var.Y + rect.bottom;
        }
        setLayoutParams(layoutParams);
    }

    public final void i(ObjectAnimator objectAnimator, int i5) {
        ValueAnimator[] valueAnimatorArr = this.f21213a;
        ValueAnimator valueAnimator = valueAnimatorArr[i5];
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        valueAnimatorArr[i5] = objectAnimator;
        objectAnimator.addListener(new d(this, i5));
        valueAnimatorArr[i5].setDuration(n);
        valueAnimatorArr[i5].start();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        int i5 = this.f21221i;
        if (i5 == 0 || this.f21219g == 0.0f || this.f21224l) {
            return;
        }
        float fB = g3.b(this.f21220h / i5, 0.0f, 1.0f);
        int i11 = (int) (fB * (r1 - r2));
        int width = ((int) (getWidth() / this.f21219g)) + i11;
        float f11 = i11;
        int height = getHeight();
        float f12 = this.f21223k;
        canvas.drawRoundRect(f11, height - r1, width, getHeight(), f12, f12, this.f21222j);
    }

    public WorkspacePageIndicator(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        this.f21213a = new ValueAnimator[3];
        this.f21214b = new Handler(Looper.getMainLooper());
        this.f21216d = true;
        this.f21217e = 0;
        this.f21224l = false;
        this.f21225m = new m(this, 9);
        Resources resources = context.getResources();
        Paint paint = new Paint();
        this.f21222j = paint;
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        this.f21215c = novaLauncher;
        this.f21223k = resources.getDimensionPixelSize(2131166581);
        this.f21217e = l0.d(novaLauncher, 2130969385) ? 165 : 178;
        paint.setColor(novaLauncher.C().f90098a.f90180c);
        paint.setAlpha(0);
    }
}
