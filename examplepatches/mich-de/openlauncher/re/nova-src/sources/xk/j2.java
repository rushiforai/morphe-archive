package xk;

/* loaded from: classes3.dex */
public final class j2 implements e2 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f95943a;

    /* renamed from: b, reason: collision with root package name */
    public int f95944b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ k2 f95945c;

    public j2(k2 k2Var, int i5) {
        this.f95945c = k2Var;
        this.f95943a = k2Var.f95952a[i5];
        this.f95944b = i5;
    }

    public final int a() {
        int i5 = this.f95944b;
        Object obj = this.f95943a;
        k2 k2Var = this.f95945c;
        if (i5 == -1 || i5 >= k2Var.f95954c || !ps.v.q(obj, k2Var.f95952a[i5])) {
            this.f95944b = k2Var.c(obj);
        }
        int i11 = this.f95944b;
        if (i11 == -1) {
            return 0;
        }
        return k2Var.f95953b[i11];
    }

    public final Object b() {
        return this.f95943a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e2) {
            j2 j2Var = (j2) ((e2) obj);
            if (a() == j2Var.a() && ps.v.q(this.f95943a, j2Var.f95943a)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.f95943a;
        return (obj == null ? 0 : obj.hashCode()) ^ a();
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.f95943a);
        int iA = a();
        if (iA == 1) {
            return strValueOf;
        }
        return strValueOf + " x " + iA;
    }
}
