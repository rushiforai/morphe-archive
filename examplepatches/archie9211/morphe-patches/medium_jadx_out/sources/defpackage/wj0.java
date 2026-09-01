package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wj0 extends td8 {
    public final sd8 a;
    public final rd8 b;

    public wj0(sd8 sd8Var, rd8 rd8Var) {
        this.a = sd8Var;
        this.b = rd8Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof td8) {
            td8 td8Var = (td8) obj;
            sd8 sd8Var = this.a;
            if (sd8Var != null ? sd8Var.equals(((wj0) td8Var).a) : ((wj0) td8Var).a == null) {
                rd8 rd8Var = this.b;
                if (rd8Var != null ? rd8Var.equals(((wj0) td8Var).b) : ((wj0) td8Var).b == null) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        sd8 sd8Var = this.a;
        int iHashCode = ((sd8Var == null ? 0 : sd8Var.hashCode()) ^ 1000003) * 1000003;
        rd8 rd8Var = this.b;
        return iHashCode ^ (rd8Var != null ? rd8Var.hashCode() : 0);
    }

    public final String toString() {
        return "NetworkConnectionInfo{networkType=" + this.a + ", mobileSubtype=" + this.b + "}";
    }
}
