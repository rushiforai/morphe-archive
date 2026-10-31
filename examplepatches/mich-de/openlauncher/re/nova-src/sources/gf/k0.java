package gf;

/* loaded from: classes3.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f57535a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f57536b;

    public k0(int i5, boolean z11) {
        this.f57535a = i5;
        this.f57536b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || k0.class != obj.getClass()) {
            return false;
        }
        k0 k0Var = (k0) obj;
        return this.f57535a == k0Var.f57535a && this.f57536b == k0Var.f57536b;
    }

    public final int hashCode() {
        return (this.f57535a * 31) + (this.f57536b ? 1 : 0);
    }
}
