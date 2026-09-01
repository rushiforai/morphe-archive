package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nm6 {
    public static final nm6 c = new nm6(null, null);
    public final pm6 a;
    public final lm6 b;

    public nm6(pm6 pm6Var, lm6 lm6Var) {
        this.a = pm6Var;
        this.b = lm6Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nm6)) {
            return false;
        }
        nm6 nm6Var = (nm6) obj;
        return this.a == nm6Var.a && g76.L(this.b, nm6Var.b);
    }

    public final int hashCode() {
        pm6 pm6Var = this.a;
        int iHashCode = (pm6Var == null ? 0 : pm6Var.hashCode()) * 31;
        lm6 lm6Var = this.b;
        return iHashCode + (lm6Var != null ? lm6Var.hashCode() : 0);
    }

    public final String toString() {
        return "KmTypeProjection(variance=" + this.a + ", type=" + this.b + ')';
    }
}
