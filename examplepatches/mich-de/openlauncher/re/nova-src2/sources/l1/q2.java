package l1;

/* loaded from: classes2.dex */
public final class q2 {

    /* renamed from: a, reason: collision with root package name */
    public final float f73822a;

    /* renamed from: b, reason: collision with root package name */
    public final float f73823b;

    /* renamed from: c, reason: collision with root package name */
    public final float f73824c;

    /* renamed from: d, reason: collision with root package name */
    public final float f73825d;

    public q2(float f11, float f12, float f13, float f14) {
        this.f73822a = f11;
        this.f73823b = f12;
        this.f73824c = f13;
        this.f73825d = f14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof q2)) {
            return false;
        }
        q2 q2Var = (q2) obj;
        if (y3.f.a(this.f73822a, q2Var.f73822a) && y3.f.a(this.f73823b, q2Var.f73823b) && y3.f.a(this.f73824c, q2Var.f73824c)) {
            return y3.f.a(this.f73825d, q2Var.f73825d);
        }
        return false;
    }

    public final int hashCode() {
        return Float.hashCode(this.f73825d) + a80.m.d(this.f73824c, a80.m.d(this.f73823b, Float.hashCode(this.f73822a) * 31, 31), 31);
    }
}
