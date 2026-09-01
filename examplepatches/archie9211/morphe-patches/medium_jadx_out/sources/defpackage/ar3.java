package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ar3 implements br3 {
    public final String a;
    public final int b;
    public final List c;

    public ar3(List list, int i, String str) {
        str.getClass();
        this.a = str;
        this.b = i;
        this.c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ar3)) {
            return false;
        }
        ar3 ar3Var = (ar3) obj;
        return g76.L(this.a, ar3Var.a) && this.b == ar3Var.b && this.c.equals(ar3Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + this.b) * 31);
    }

    public final String toString() {
        return b09.B(y30.t(this.b, "Update(postId=", this.a, ", serverRev=", ", deltas="), this.c, ")");
    }
}
