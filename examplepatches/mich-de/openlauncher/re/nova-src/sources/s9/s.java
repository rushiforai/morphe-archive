package s9;

import android.animation.ValueAnimator;
import android.content.Context;
import android.util.FloatProperty;
import android.view.View;

/* loaded from: classes2.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final Context f86830a;

    /* renamed from: b, reason: collision with root package name */
    public float f86831b;

    /* renamed from: c, reason: collision with root package name */
    public float f86832c;

    /* renamed from: h, reason: collision with root package name */
    public double f86837h;

    /* renamed from: i, reason: collision with root package name */
    public double f86838i;

    /* renamed from: j, reason: collision with root package name */
    public double f86839j;

    /* renamed from: k, reason: collision with root package name */
    public double f86840k;

    /* renamed from: l, reason: collision with root package name */
    public double f86841l;

    /* renamed from: m, reason: collision with root package name */
    public double f86842m;
    public double n;
    public double o;

    /* renamed from: d, reason: collision with root package name */
    public float f86833d = 0.0f;

    /* renamed from: e, reason: collision with root package name */
    public float f86834e = 1500.0f;

    /* renamed from: f, reason: collision with root package name */
    public float f86835f = 0.5f;

    /* renamed from: g, reason: collision with root package name */
    public float f86836g = 1.0f;

    /* renamed from: p, reason: collision with root package name */
    public float f86843p = 0.0f;

    public s(Context context) {
        this.f86830a = context;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0152  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ValueAnimator a(View view, FloatProperty floatProperty) {
        double d5;
        double d11;
        View view2 = view;
        FloatProperty floatProperty2 = floatProperty;
        int iB = ya.g.b(this.f86830a);
        double dSqrt = Math.sqrt(this.f86834e);
        float f11 = this.f86835f;
        double dSqrt2 = Math.sqrt(1.0f - (f11 * f11)) * dSqrt;
        double d12 = this.f86835f * 2.0f * dSqrt;
        this.f86837h = d12;
        this.f86838i = dSqrt2;
        double d13 = this.f86831b - this.f86832c;
        this.f86839j = d13;
        double d14 = d12 * d13;
        double d15 = (this.f86833d / dSqrt2) + (d14 / (dSqrt2 * 2.0d));
        this.f86840k = d15;
        this.f86841l = (d14 / 2.0d) - (d15 * dSqrt2);
        this.f86842m = ((d12 * d15) / 2.0d) + (dSqrt2 * d13);
        double d16 = this.f86836g * 0.65f;
        this.n = d16;
        double d17 = 1000.0d;
        double d18 = iB;
        this.o = (d16 * 1000.0d) / d18;
        double dAtan2 = Math.atan2(-d13, d15);
        double d19 = this.f86838i;
        double d21 = dAtan2 / d19;
        double d22 = 3.141592653589793d / d19;
        while (true) {
            if (d21 >= 0.0d) {
                d11 = d17;
                double dPow = Math.pow(2.718281828459045d, ((-this.f86837h) * d21) / 2.0d);
                double d23 = this.f86841l;
                double d24 = this.f86842m;
                d5 = d21;
                double d25 = this.f86838i * d5;
                if (Math.abs(((Math.sin(d25) * d24) + (Math.cos(d25) * d23)) * dPow) < this.o) {
                    break;
                }
            } else {
                d5 = d21;
                d11 = d17;
            }
            d21 = d5 + d22;
            view2 = view;
            floatProperty2 = floatProperty;
            d17 = d11;
        }
        double d26 = d18 / 2000.0d;
        double dMax = Math.max(0.0d, d5 - (d22 / 2.0d));
        double d27 = d5;
        while (d27 - dMax >= d26) {
            double d28 = (dMax + d27) / 2.0d;
            double dPow2 = Math.pow(2.718281828459045d, ((-this.f86837h) * d28) / 2.0d);
            double d29 = this.f86839j;
            double d30 = this.f86840k;
            double d31 = this.f86838i * d28;
            if (Math.abs(((Math.sin(d31) * d30) + (Math.cos(d31) * d29)) * dPow2) >= this.n) {
                dMax = d28;
            } else {
                double d32 = this.f86841l;
                double d33 = this.f86842m;
                double d34 = this.f86838i * d28;
                if (Math.abs(((Math.sin(d34) * d33) + (Math.cos(d34) * d32)) * dPow2) < this.o) {
                    d27 = d28;
                }
            }
            view2 = view;
            floatProperty2 = floatProperty;
        }
        float f12 = (float) d27;
        this.f86843p = f12;
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, f12);
        valueAnimatorOfFloat.setDuration((long) (this.f86843p * d11)).setInterpolator(k.f86788a);
        valueAnimatorOfFloat.addUpdateListener(new fz.j(3, this, floatProperty2, view2));
        valueAnimatorOfFloat.addListener(new r(this, floatProperty2, view2));
        return valueAnimatorOfFloat;
    }

    public final void b(float f11) {
        if (f11 <= 0.0f || f11 >= 1.0f) {
            throw new IllegalArgumentException("Damping ratio must be between 0 and 1");
        }
        this.f86835f = f11;
    }

    public final void c(float f11) {
        this.f86832c = f11;
    }

    public final void d() {
        this.f86836g = 0.002f;
    }

    public final void e(float f11) {
        this.f86831b = f11;
    }

    public final void f(float f11) {
        this.f86833d = f11;
    }

    public final void g(float f11) {
        if (f11 <= 0.0f) {
            throw new IllegalArgumentException("Spring stiffness constant must be positive.");
        }
        this.f86834e = f11;
    }
}
