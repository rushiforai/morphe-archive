package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jt8 implements kt8 {
    public final List a;
    public final boolean b;

    public jt8(List list, boolean z) {
        list.getClass();
        this.a = list;
        this.b = z;
    }

    public static jt8 a(jt8 jt8Var, ArrayList arrayList, int i) {
        List list = arrayList;
        if ((i & 1) != 0) {
            list = jt8Var.a;
        }
        boolean z = (i & 2) != 0 ? jt8Var.b : true;
        jt8Var.getClass();
        list.getClass();
        return new jt8(list, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jt8)) {
            return false;
        }
        jt8 jt8Var = (jt8) obj;
        return g76.L(this.a, jt8Var.a) && this.b == jt8Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Success(categories=" + this.a + ", isRefreshing=" + this.b + ")";
    }
}
