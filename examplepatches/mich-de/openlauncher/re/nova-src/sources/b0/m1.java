package b0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m1 {

    /* renamed from: a, reason: collision with root package name */
    public final float f16186a;

    /* renamed from: b, reason: collision with root package name */
    public final long f16187b;

    /* renamed from: c, reason: collision with root package name */
    public final c0.c0 f16188c;

    public m1(float f11, long j11, c0.c0 c0Var) {
        this.f16186a = f11;
        this.f16187b = j11;
        this.f16188c = c0Var;
    }

    public final long a() {
        return this.f16187b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m1)) {
            return false;
        }
        m1 m1Var = (m1) obj;
        return Float.compare(this.f16186a, m1Var.f16186a) == 0 && i2.y0.a(this.f16187b, m1Var.f16187b) && Intrinsics.b(this.f16188c, m1Var.f16188c);
    }

    public final int hashCode() {
        int iHashCode = Float.hashCode(this.f16186a) * 31;
        int i5 = i2.y0.f61192c;
        return this.f16188c.hashCode() + b.c0.d(iHashCode, 31, this.f16187b);
    }

    public final String toString() {
        return "Scale(scale=" + this.f16186a + ", transformOrigin=" + ((Object) i2.y0.d(this.f16187b)) + ", animationSpec=" + this.f16188c + ')';
    }
}
