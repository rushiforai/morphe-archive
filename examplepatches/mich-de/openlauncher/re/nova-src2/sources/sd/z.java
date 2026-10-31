package sd;

/* loaded from: classes.dex */
public final class z extends m0 {

    /* renamed from: a, reason: collision with root package name */
    public final l0 f87234a;

    /* renamed from: b, reason: collision with root package name */
    public final k0 f87235b;

    public z(l0 l0Var, k0 k0Var) {
        this.f87234a = l0Var;
        this.f87235b = k0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof m0) {
            m0 m0Var = (m0) obj;
            l0 l0Var = this.f87234a;
            if (l0Var != null ? l0Var.equals(((z) m0Var).f87234a) : ((z) m0Var).f87234a == null) {
                k0 k0Var = this.f87235b;
                if (k0Var != null ? k0Var.equals(((z) m0Var).f87235b) : ((z) m0Var).f87235b == null) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        l0 l0Var = this.f87234a;
        int iHashCode = ((l0Var == null ? 0 : l0Var.hashCode()) ^ 1000003) * 1000003;
        k0 k0Var = this.f87235b;
        return (k0Var != null ? k0Var.hashCode() : 0) ^ iHashCode;
    }

    public final String toString() {
        return "NetworkConnectionInfo{networkType=" + this.f87234a + ", mobileSubtype=" + this.f87235b + "}";
    }
}
