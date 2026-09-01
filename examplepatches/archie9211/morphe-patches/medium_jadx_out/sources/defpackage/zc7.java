package defpackage;

import android.animation.Animator;
import android.graphics.PointF;
import android.view.Choreographer;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zc7 extends vn0 implements Choreographer.FrameCallback {
    public float d;
    public boolean e;
    public long f;
    public float g;
    public float h;
    public int i;
    public float j;
    public float k;
    public bc7 l;
    public boolean m;

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public final void cancel() {
        Iterator it2 = this.b.iterator();
        while (it2.hasNext()) {
            ((Animator.AnimatorListener) it2.next()).onAnimationCancel(this);
        }
        a(h());
        i(true);
    }

    public final float d() {
        bc7 bc7Var = this.l;
        if (bc7Var == null) {
            return 0.0f;
        }
        float f = this.h;
        float f2 = bc7Var.l;
        return (f - f2) / (bc7Var.m - f2);
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j) {
        if (this.m) {
            i(false);
            Choreographer.getInstance().postFrameCallback(this);
        }
        bc7 bc7Var = this.l;
        if (bc7Var == null || !this.m) {
            return;
        }
        t90 t90Var = xn6.a;
        float fAbs = (this.f != 0 ? j - r2 : 0L) / ((1.0E9f / bc7Var.n) / Math.abs(this.d));
        float f = this.g;
        if (h()) {
            fAbs = -fAbs;
        }
        float f2 = f + fAbs;
        float fG = g();
        float fE = e();
        PointF pointF = a18.a;
        boolean z = f2 >= fG && f2 <= fE;
        float fB = a18.b(f2, g(), e());
        this.g = fB;
        this.h = fB;
        this.f = j;
        if (z) {
            c();
        } else if (getRepeatCount() == -1 || this.i < getRepeatCount()) {
            if (getRepeatMode() == 2) {
                this.e = !this.e;
                this.d = -this.d;
            } else {
                float fE2 = h() ? e() : g();
                this.g = fE2;
                this.h = fE2;
            }
            this.f = j;
            c();
            Iterator it2 = this.b.iterator();
            while (it2.hasNext()) {
                ((Animator.AnimatorListener) it2.next()).onAnimationRepeat(this);
            }
            this.i++;
        } else {
            float fG2 = this.d < 0.0f ? g() : e();
            this.g = fG2;
            this.h = fG2;
            i(true);
            c();
            a(h());
        }
        if (this.l != null) {
            float f3 = this.h;
            float f4 = this.j;
            if (f3 < f4 || f3 > this.k) {
                throw new IllegalStateException(String.format("Frame must be [%f,%f]. It is %f", Float.valueOf(f4), Float.valueOf(this.k), Float.valueOf(this.h)));
            }
        }
        t90 t90Var2 = xn6.a;
    }

    public final float e() {
        bc7 bc7Var = this.l;
        if (bc7Var == null) {
            return 0.0f;
        }
        float f = this.k;
        return f == 2.1474836E9f ? bc7Var.m : f;
    }

    public final float g() {
        bc7 bc7Var = this.l;
        if (bc7Var == null) {
            return 0.0f;
        }
        float f = this.j;
        return f == -2.1474836E9f ? bc7Var.l : f;
    }

    @Override // android.animation.ValueAnimator
    public final float getAnimatedFraction() {
        float fG;
        float fE;
        float fG2;
        if (this.l == null) {
            return 0.0f;
        }
        if (h()) {
            fG = e() - this.h;
            fE = e();
            fG2 = g();
        } else {
            fG = this.h - g();
            fE = e();
            fG2 = g();
        }
        return fG / (fE - fG2);
    }

    @Override // android.animation.ValueAnimator
    public final Object getAnimatedValue() {
        return Float.valueOf(d());
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public final long getDuration() {
        bc7 bc7Var = this.l;
        if (bc7Var == null) {
            return 0L;
        }
        return (long) bc7Var.b();
    }

    public final boolean h() {
        return this.d < 0.0f;
    }

    public final void i(boolean z) {
        Choreographer.getInstance().removeFrameCallback(this);
        if (z) {
            this.m = false;
        }
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public final boolean isRunning() {
        return this.m;
    }

    public final void j(float f) {
        if (this.g == f) {
            return;
        }
        float fB = a18.b(f, g(), e());
        this.g = fB;
        this.h = fB;
        this.f = 0L;
        c();
    }

    public final void k(float f, float f2) {
        if (f > f2) {
            lg8.l("minFrame (", f, ") must be <= maxFrame (", f2, ")");
            return;
        }
        bc7 bc7Var = this.l;
        float f3 = bc7Var == null ? -3.4028235E38f : bc7Var.l;
        float f4 = bc7Var == null ? Float.MAX_VALUE : bc7Var.m;
        float fB = a18.b(f, f3, f4);
        float fB2 = a18.b(f2, f3, f4);
        if (fB == this.j && fB2 == this.k) {
            return;
        }
        this.j = fB;
        this.k = fB2;
        j((int) a18.b(this.h, fB, fB2));
    }

    @Override // android.animation.ValueAnimator
    public final void setRepeatMode(int i) {
        super.setRepeatMode(i);
        if (i == 2 || !this.e) {
            return;
        }
        this.e = false;
        this.d = -this.d;
    }
}
