package defpackage;

import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r06 {
    public final int a;
    public final Object b;

    public r06(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r06)) {
            return false;
        }
        r06 r06Var = (r06) obj;
        return this.a == r06Var.a && g76.L(this.b, r06Var.b);
    }

    public final int hashCode() {
        int i = this.a * 31;
        Object obj = this.b;
        return i + (obj == null ? 0 : obj.hashCode());
    }

    public final String toString() {
        return fiHTiFJ.nQdRKnjhIpFp + this.a + ", value=" + this.b + ')';
    }
}
