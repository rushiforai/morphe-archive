package defpackage;

import java.util.ArrayList;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oj1 {
    public static final oj1 c = new oj1(bu1.q1(new ArrayList()), null);
    public final Set a;
    public final f49 b;

    public oj1(Set set, f49 f49Var) {
        this.a = set;
        this.b = f49Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof oj1)) {
            return false;
        }
        oj1 oj1Var = (oj1) obj;
        return oj1Var.a.equals(this.a) && g76.L(oj1Var.b, this.b);
    }

    public final int hashCode() {
        int iHashCode = (this.a.hashCode() + 1517) * 41;
        f49 f49Var = this.b;
        return iHashCode + (f49Var != null ? f49Var.hashCode() : 0);
    }
}
