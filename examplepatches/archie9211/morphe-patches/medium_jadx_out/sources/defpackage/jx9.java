package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jx9 implements kx9 {
    public final az5 a;
    public final boolean b;
    public final boolean c;

    public jx9(az5 az5Var, boolean z, boolean z2) {
        az5Var.getClass();
        this.a = az5Var;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jx9)) {
            return false;
        }
        jx9 jx9Var = (jx9) obj;
        return g76.L(this.a, jx9Var.a) && this.b == jx9Var.b && this.c == jx9Var.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Results(posts=");
        sb.append(this.a);
        sb.append(", isRefreshing=");
        sb.append(this.b);
        sb.append(", isLoadingMore=");
        return lv8.t(sb, this.c, ")");
    }
}
