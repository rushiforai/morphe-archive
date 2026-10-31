package o0;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f78707a;

    public a0(float f11) {
        this.f78707a = f11;
        if (Float.compare(f11, 0) > 0) {
            return;
        }
        j0.b.a("invalid minSize");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a0) {
            return y3.f.a(this.f78707a, ((a0) obj).f78707a);
        }
        return false;
    }

    public final int hashCode() {
        return Float.hashCode(this.f78707a);
    }
}
