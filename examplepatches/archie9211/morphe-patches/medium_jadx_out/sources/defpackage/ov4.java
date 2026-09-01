package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ov4 implements sv4 {
    public final az5 a;
    public final boolean b;
    public final boolean c;

    public ov4(az5 az5Var, boolean z, boolean z2) {
        az5Var.getClass();
        this.a = az5Var;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ov4)) {
            return false;
        }
        ov4 ov4Var = (ov4) obj;
        return g76.L(this.a, ov4Var.a) && this.b == ov4Var.b && this.c == ov4Var.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Catalogs(uiModels=");
        sb.append(this.a);
        sb.append(", isRefreshing=");
        sb.append(this.b);
        sb.append(", isLoadingMore=");
        return lv8.t(sb, this.c, ")");
    }
}
