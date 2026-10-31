package b0;

/* loaded from: classes2.dex */
public final class i1 {

    /* renamed from: a, reason: collision with root package name */
    public final float f16144a;

    /* renamed from: b, reason: collision with root package name */
    public final float f16145b;

    /* renamed from: c, reason: collision with root package name */
    public final long f16146c;

    public i1(float f11, float f12, long j11) {
        this.f16144a = f11;
        this.f16145b = f12;
        this.f16146c = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i1)) {
            return false;
        }
        i1 i1Var = (i1) obj;
        return Float.compare(this.f16144a, i1Var.f16144a) == 0 && Float.compare(this.f16145b, i1Var.f16145b) == 0 && this.f16146c == i1Var.f16146c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f16146c) + a80.m.d(this.f16145b, Float.hashCode(this.f16144a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FlingInfo(initialVelocity=");
        sb2.append(this.f16144a);
        sb2.append(", distance=");
        sb2.append(this.f16145b);
        sb2.append(", duration=");
        return a2.c.n(sb2, this.f16146c, ')');
    }
}
