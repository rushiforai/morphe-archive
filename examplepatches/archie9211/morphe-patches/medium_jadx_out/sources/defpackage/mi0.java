package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mi0 extends dd2 {
    public final List a;
    public final zc2 b;
    public final rc2 c;
    public final pi0 d;
    public final List e;

    public mi0(List list, oi0 oi0Var, rc2 rc2Var, pi0 pi0Var, List list2) {
        this.a = list;
        this.b = oi0Var;
        this.c = rc2Var;
        this.d = pi0Var;
        this.e = list2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof dd2)) {
            return false;
        }
        dd2 dd2Var = (dd2) obj;
        List list = this.a;
        if (list == null) {
            if (((mi0) dd2Var).a != null) {
                return false;
            }
        } else if (!list.equals(((mi0) dd2Var).a)) {
            return false;
        }
        zc2 zc2Var = this.b;
        if (zc2Var == null) {
            if (((mi0) dd2Var).b != null) {
                return false;
            }
        } else if (!zc2Var.equals(((mi0) dd2Var).b)) {
            return false;
        }
        rc2 rc2Var = this.c;
        if (rc2Var == null) {
            if (((mi0) dd2Var).c != null) {
                return false;
            }
        } else if (!rc2Var.equals(((mi0) dd2Var).c)) {
            return false;
        }
        mi0 mi0Var = (mi0) dd2Var;
        return this.d.equals(mi0Var.d) && this.e.equals(mi0Var.e);
    }

    public final int hashCode() {
        List list = this.a;
        int iHashCode = ((list == null ? 0 : list.hashCode()) ^ 1000003) * 1000003;
        zc2 zc2Var = this.b;
        int iHashCode2 = (iHashCode ^ (zc2Var == null ? 0 : zc2Var.hashCode())) * 1000003;
        rc2 rc2Var = this.c;
        return this.e.hashCode() ^ (((((rc2Var != null ? rc2Var.hashCode() : 0) ^ iHashCode2) * 1000003) ^ this.d.hashCode()) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Execution{threads=");
        sb.append(this.a);
        sb.append(", exception=");
        sb.append(this.b);
        sb.append(", appExitInfo=");
        sb.append(this.c);
        sb.append(", signal=");
        sb.append(this.d);
        sb.append(", binaries=");
        return b09.B(sb, this.e, "}");
    }
}
