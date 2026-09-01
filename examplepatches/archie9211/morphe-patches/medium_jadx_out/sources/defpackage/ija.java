package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ija implements mja {
    public final String a;
    public final az5 b;
    public final boolean c;

    public ija(String str, az5 az5Var, boolean z) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = az5Var;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ija)) {
            return false;
        }
        ija ijaVar = (ija) obj;
        return g76.L(this.a, ijaVar.a) && g76.L(this.b, ijaVar.b) && this.c == ijaVar.c;
    }

    public final int hashCode() {
        return ka1.b(this.b, this.a.hashCode() * 31, 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(publicationName=");
        sb.append(this.a);
        sb.append(", sections=");
        sb.append(this.b);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.c, ")");
    }
}
