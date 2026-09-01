package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ec5 extends fc5 {
    public final List a;
    public final List b;
    public final List c;
    public final List d;
    public final boolean e;

    public ec5(List list, List list2, List list3, List list4, boolean z) {
        this.a = list;
        this.b = list2;
        this.c = list3;
        this.d = list4;
        this.e = z;
    }

    public static ec5 a(ec5 ec5Var, boolean z) {
        List list = ec5Var.a;
        List list2 = ec5Var.b;
        List list3 = ec5Var.c;
        List list4 = ec5Var.d;
        ec5Var.getClass();
        return new ec5(list, list2, list3, list4, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ec5)) {
            return false;
        }
        ec5 ec5Var = (ec5) obj;
        return this.a.equals(ec5Var.a) && this.b.equals(ec5Var.b) && this.c.equals(ec5Var.c) && this.d.equals(ec5Var.d) && this.e == ec5Var.e;
    }

    public final int hashCode() {
        return wgd.p(wgd.p(wgd.p(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Success(writers=");
        sb.append(this.a);
        sb.append(", publications=");
        sb.append(this.b);
        sb.append(", tags=");
        sb.append(this.c);
        sb.append(", friends=");
        sb.append(this.d);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.e, ")");
    }
}
