package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fk0 {
    public final gk0 a;
    public final ik0 b;
    public final hk0 c;

    public fk0(gk0 gk0Var, ik0 ik0Var, hk0 hk0Var) {
        this.a = gk0Var;
        this.b = ik0Var;
        this.c = hk0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof fk0)) {
            return false;
        }
        fk0 fk0Var = (fk0) obj;
        return this.a.equals(fk0Var.a) && this.b.equals(fk0Var.b) && this.c.equals(fk0Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() ^ ((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003);
    }

    public final String toString() {
        return "StaticSessionData{appData=" + this.a + ", osData=" + this.b + ", deviceData=" + this.c + "}";
    }
}
