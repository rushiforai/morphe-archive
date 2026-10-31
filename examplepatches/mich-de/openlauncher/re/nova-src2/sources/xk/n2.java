package xk;

/* loaded from: classes.dex */
public final class n2 extends o2 implements vk.m {

    /* renamed from: c, reason: collision with root package name */
    public static final n2 f95978c = new n2(h0.f95923d, h0.f95922c);

    /* renamed from: a, reason: collision with root package name */
    public final j0 f95979a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f95980b;

    public n2(j0 j0Var, j0 j0Var2) {
        this.f95979a = j0Var;
        j0Var2.getClass();
        this.f95980b = j0Var2;
        if (j0Var.compareTo(j0Var2) > 0 || j0Var == h0.f95922c || j0Var2 == h0.f95923d) {
            StringBuilder sb2 = new StringBuilder("Invalid range: ");
            StringBuilder sb3 = new StringBuilder(16);
            j0Var.b(sb3);
            sb3.append("..");
            j0Var2.c(sb3);
            sb2.append(sb3.toString());
            throw new IllegalArgumentException(sb2.toString());
        }
    }

    public static n2 a() {
        return new n2(new i0(0), new i0(0));
    }

    @Override // vk.m
    public final boolean apply(Object obj) {
        Comparable comparable = (Comparable) obj;
        comparable.getClass();
        return this.f95979a.d(comparable) && !this.f95980b.d(comparable);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof n2) {
            n2 n2Var = (n2) obj;
            if (this.f95979a.equals(n2Var.f95979a) && this.f95980b.equals(n2Var.f95980b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f95980b.hashCode() + (this.f95979a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(16);
        this.f95979a.b(sb2);
        sb2.append("..");
        this.f95980b.c(sb2);
        return sb2.toString();
    }
}
