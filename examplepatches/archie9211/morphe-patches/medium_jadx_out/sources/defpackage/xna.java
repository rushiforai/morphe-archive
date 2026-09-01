package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xna implements yna {
    public final az5 a;
    public final boolean b;
    public final boolean c;

    public xna(az5 az5Var, boolean z, boolean z2) {
        az5Var.getClass();
        this.a = az5Var;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xna)) {
            return false;
        }
        xna xnaVar = (xna) obj;
        return g76.L(this.a, xnaVar.a) && this.b == xnaVar.b && this.c == xnaVar.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Writers(writers=");
        sb.append(this.a);
        sb.append(", isLoadingMore=");
        sb.append(this.b);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.c, ")");
    }
}
