package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f92 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;

    public f92(long j, long j2, long j3, long j4, long j5) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof f92)) {
            return false;
        }
        f92 f92Var = (f92) obj;
        long j = f92Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, f92Var.b) && ezd.a(this.c, f92Var.c) && ezd.a(this.d, f92Var.d) && ezd.a(this.e, f92Var.e);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.e) + lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ContextMenuColors(backgroundColor=");
        ev6.F(this.a, ", textColor=", sb);
        ev6.F(this.b, ", iconColor=", sb);
        ev6.F(this.c, ", disabledTextColor=", sb);
        ev6.F(this.d, ", disabledIconColor=", sb);
        sb.append((Object) uu1.h(this.e));
        sb.append(')');
        return sb.toString();
    }
}
