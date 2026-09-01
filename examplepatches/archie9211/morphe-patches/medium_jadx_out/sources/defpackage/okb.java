package defpackage;

import android.R;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.animation.AnimationUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class okb extends View {
    public static final int[] f = {R.attr.state_pressed, R.attr.state_enabled};
    public static final int[] g = new int[0];
    public q1e a;
    public Boolean b;
    public Long c;
    public b2a d;
    public l8 e;

    private final void setRippleState(boolean z) {
        long jCurrentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
        Runnable runnable = this.d;
        if (runnable != null) {
            removeCallbacks(runnable);
            runnable.run();
        }
        Long l = this.c;
        long jLongValue = jCurrentAnimationTimeMillis - (l != null ? l.longValue() : 0L);
        if (z || jLongValue >= 5) {
            int[] iArr = z ? f : g;
            q1e q1eVar = this.a;
            if (q1eVar != null) {
                q1eVar.setState(iArr);
            }
        } else {
            b2a b2aVar = new b2a(1, this);
            this.d = b2aVar;
            postDelayed(b2aVar, 50L);
        }
        this.c = Long.valueOf(jCurrentAnimationTimeMillis);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void setRippleState$lambda$1(okb okbVar) {
        q1e q1eVar = okbVar.a;
        if (q1eVar != null) {
            q1eVar.setState(g);
        }
        okbVar.d = null;
    }

    public final void b(h0a h0aVar, boolean z, long j, int i, long j2, float f2, l8 l8Var) {
        long j3 = h0aVar.a;
        if (this.a == null || !Boolean.valueOf(z).equals(this.b)) {
            q1e q1eVar = new q1e(z);
            setBackground(q1eVar);
            this.a = q1eVar;
            this.b = Boolean.valueOf(z);
        }
        q1e q1eVar2 = this.a;
        q1eVar2.getClass();
        this.e = l8Var;
        e(j, i, j2, f2);
        if (z) {
            q1eVar2.setHotspot(Float.intBitsToFloat((int) (j3 >> 32)), Float.intBitsToFloat((int) (4294967295L & j3)));
        } else {
            q1eVar2.setHotspot(q1eVar2.getBounds().centerX(), q1eVar2.getBounds().centerY());
        }
        setRippleState(true);
    }

    public final void c() {
        this.e = null;
        b2a b2aVar = this.d;
        if (b2aVar != null) {
            removeCallbacks(b2aVar);
            b2a b2aVar2 = this.d;
            b2aVar2.getClass();
            b2aVar2.run();
        } else {
            q1e q1eVar = this.a;
            if (q1eVar != null) {
                q1eVar.setState(g);
            }
        }
        q1e q1eVar2 = this.a;
        if (q1eVar2 == null) {
            return;
        }
        q1eVar2.setVisible(false, false);
        unscheduleDrawable(q1eVar2);
    }

    public final void d() {
        setRippleState(false);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        if (isAttachedToWindow()) {
            super.draw(canvas);
        } else {
            c();
        }
    }

    public final void e(long j, int i, long j2, float f2) {
        q1e q1eVar = this.a;
        if (q1eVar == null) {
            return;
        }
        if (q1eVar.getRadius() != i) {
            q1eVar.setRadius(i);
        }
        if (Build.VERSION.SDK_INT < 28) {
            f2 *= 2.0f;
        }
        if (f2 > 1.0f) {
            f2 = 1.0f;
        }
        long jB = uu1.b(f2, j2);
        uu1 uu1Var = q1eVar.b;
        if (!(uu1Var == null ? false : ezd.a(uu1Var.a, jB))) {
            q1eVar.b = new uu1(jB);
            q1eVar.setColor(ColorStateList.valueOf(op8.n0(jB)));
        }
        Rect rect = new Rect(0, 0, nk7.w0(dfc.d(j)), nk7.w0(dfc.b(j)));
        setLeft(rect.left);
        setTop(rect.top);
        setRight(rect.right);
        setBottom(rect.bottom);
        q1eVar.setBounds(rect);
    }

    @Override // android.view.View, android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        l8 l8Var = this.e;
        if (l8Var != null) {
            l8Var.invoke();
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View
    public final void refreshDrawableState() {
    }

    @Override // android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
    }
}
