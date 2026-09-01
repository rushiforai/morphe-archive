package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class th0 extends ey1 {
    public final mj0 a;
    public final dy1 b;

    public th0(mj0 mj0Var, dy1 dy1Var) {
        this.a = mj0Var;
        this.b = dy1Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ey1)) {
            return false;
        }
        ey1 ey1Var = (ey1) obj;
        if (!this.a.equals(((th0) ey1Var).a)) {
            return false;
        }
        dy1 dy1Var = this.b;
        return dy1Var == null ? ((th0) ey1Var).b == null : dy1Var.equals(((th0) ey1Var).b);
    }

    public final int hashCode() {
        int iHashCode = (this.a.hashCode() ^ 1000003) * 1000003;
        dy1 dy1Var = this.b;
        return (dy1Var == null ? 0 : dy1Var.hashCode()) ^ iHashCode;
    }

    public final String toString() {
        return "ComplianceData{privacyContext=" + this.a + ", productIdOrigin=" + this.b + "}";
    }
}
