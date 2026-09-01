package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sh0 extends xo1 {
    public final wo1 a;
    public final ph0 b;

    public sh0(wo1 wo1Var, ph0 ph0Var) {
        this.a = wo1Var;
        this.b = ph0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof xo1)) {
            return false;
        }
        xo1 xo1Var = (xo1) obj;
        wo1 wo1Var = this.a;
        if (wo1Var == null) {
            if (((sh0) xo1Var).a != null) {
                return false;
            }
        } else if (!wo1Var.equals(((sh0) xo1Var).a)) {
            return false;
        }
        return this.b.equals(((sh0) xo1Var).b);
    }

    public final int hashCode() {
        wo1 wo1Var = this.a;
        return this.b.hashCode() ^ (((wo1Var == null ? 0 : wo1Var.hashCode()) ^ 1000003) * 1000003);
    }

    public final String toString() {
        return "ClientInfo{clientType=" + this.a + ", androidClientInfo=" + this.b + "}";
    }
}
