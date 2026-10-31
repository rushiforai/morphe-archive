package hv;

/* loaded from: classes4.dex */
public final class f3 {

    /* renamed from: a, reason: collision with root package name */
    public final float f60253a;

    /* renamed from: b, reason: collision with root package name */
    public final float f60254b;

    /* renamed from: c, reason: collision with root package name */
    public final float f60255c;

    public f3(float f11, float f12, float f13) {
        this.f60253a = f11;
        this.f60254b = f12;
        this.f60255c = f13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f3)) {
            return false;
        }
        f3 f3Var = (f3) obj;
        return y3.f.a(this.f60253a, f3Var.f60253a) && y3.f.a(this.f60254b, f3Var.f60254b) && y3.f.a(this.f60255c, f3Var.f60255c);
    }

    public final int hashCode() {
        return Float.hashCode(this.f60255c) + a80.m.d(this.f60254b, Float.hashCode(this.f60253a) * 31, 31);
    }

    public final String toString() {
        String strB = y3.f.b(this.f60253a);
        String strB2 = y3.f.b(this.f60254b);
        return b.c0.q(b.c0.w("PrimaryButtonShape(cornerRadius=", strB, ", borderStrokeWidth=", strB2, ", height="), y3.f.b(this.f60255c), ")");
    }
}
