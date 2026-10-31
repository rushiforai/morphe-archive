package k1;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.animation.AnimationUtils;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes.dex */
public final class i extends View {

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f70833f = {16842919, 16842910};

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f70834g = new int[0];

    /* renamed from: a, reason: collision with root package name */
    public p f70835a;

    /* renamed from: b, reason: collision with root package name */
    public Boolean f70836b;

    /* renamed from: c, reason: collision with root package name */
    public Long f70837c;

    /* renamed from: d, reason: collision with root package name */
    public g.p f70838d;

    /* renamed from: e, reason: collision with root package name */
    public Function0 f70839e;

    public final void a(i0.k kVar, boolean z11, long j11, int i5, long j12, float f11, Function0 function0) {
        if (this.f70835a == null || !Boolean.valueOf(z11).equals(this.f70836b)) {
            p pVar = new p(z11);
            setBackground(pVar);
            this.f70835a = pVar;
            this.f70836b = Boolean.valueOf(z11);
        }
        p pVar2 = this.f70835a;
        Intrinsics.d(pVar2);
        this.f70839e = function0;
        c(j11, i5, j12, f11);
        if (z11) {
            pVar2.setHotspot(h2.b.d(kVar.f61089a), h2.b.e(kVar.f61089a));
        } else {
            pVar2.setHotspot(pVar2.getBounds().centerX(), pVar2.getBounds().centerY());
        }
        d(true);
    }

    public final void b() {
        this.f70839e = null;
        g.p pVar = this.f70838d;
        if (pVar != null) {
            removeCallbacks(pVar);
            g.p pVar2 = this.f70838d;
            Intrinsics.d(pVar2);
            pVar2.run();
        } else {
            p pVar3 = this.f70835a;
            if (pVar3 != null) {
                pVar3.setState(f70834g);
            }
        }
        p pVar4 = this.f70835a;
        if (pVar4 == null) {
            return;
        }
        pVar4.setVisible(false, false);
        unscheduleDrawable(pVar4);
    }

    public final void c(long j11, int i5, long j12, float f11) {
        p pVar = this.f70835a;
        if (pVar == null) {
            return;
        }
        pVar.b(i5);
        pVar.a(f11, j12);
        Rect rect = new Rect(0, 0, MathKt.b(h2.e.d(j11)), MathKt.b(h2.e.b(j11)));
        setLeft(rect.left);
        setTop(rect.top);
        setRight(rect.right);
        setBottom(rect.bottom);
        pVar.setBounds(rect);
    }

    public final void d(boolean z11) {
        long jCurrentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
        Runnable runnable = this.f70838d;
        if (runnable != null) {
            removeCallbacks(runnable);
            runnable.run();
        }
        Long l9 = this.f70837c;
        long jLongValue = jCurrentAnimationTimeMillis - (l9 != null ? l9.longValue() : 0L);
        if (z11 || jLongValue >= 5) {
            int[] iArr = z11 ? f70833f : f70834g;
            p pVar = this.f70835a;
            if (pVar != null) {
                pVar.setState(iArr);
            }
        } else {
            g.p pVar2 = new g.p(this, 10);
            this.f70838d = pVar2;
            postDelayed(pVar2, 50L);
        }
        this.f70837c = Long.valueOf(jCurrentAnimationTimeMillis);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        if (isAttachedToWindow()) {
            super.draw(canvas);
        } else {
            b();
        }
    }

    @Override // android.view.View, android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        Function0 function0 = this.f70839e;
        if (function0 != null) {
            function0.invoke();
        }
    }

    @Override // android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View
    public final void refreshDrawableState() {
    }
}
