package sd;

/* loaded from: classes.dex */
public final class q extends e0 {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f87208a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f87209b;

    public q(v vVar, d0 d0Var) {
        this.f87208a = vVar;
        this.f87209b = d0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof e0) {
            e0 e0Var = (e0) obj;
            h0 h0Var = this.f87208a;
            if (h0Var != null ? h0Var.equals(((q) e0Var).f87208a) : ((q) e0Var).f87208a == null) {
                d0 d0Var = this.f87209b;
                if (d0Var != null ? d0Var.equals(((q) e0Var).f87209b) : ((q) e0Var).f87209b == null) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        h0 h0Var = this.f87208a;
        int iHashCode = ((h0Var == null ? 0 : h0Var.hashCode()) ^ 1000003) * 1000003;
        d0 d0Var = this.f87209b;
        return (d0Var != null ? d0Var.hashCode() : 0) ^ iHashCode;
    }

    public final String toString() {
        return "ComplianceData{privacyContext=" + this.f87208a + ", productIdOrigin=" + this.f87209b + "}";
    }
}
