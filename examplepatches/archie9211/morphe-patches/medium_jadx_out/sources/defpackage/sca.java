package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sca implements wca {
    public final az5 a;
    public final boolean b;
    public final boolean c;

    public sca(az5 az5Var, boolean z, boolean z2) {
        az5Var.getClass();
        this.a = az5Var;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sca)) {
            return false;
        }
        sca scaVar = (sca) obj;
        return g76.L(this.a, scaVar.a) && this.b == scaVar.b && this.c == scaVar.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Editors(editors=");
        sb.append(this.a);
        sb.append(", isLoadingMore=");
        sb.append(this.b);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.c, ")");
    }
}
