package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v88 {
    public final boolean a;
    public final s88 b;
    public final q88 c;
    public final String d;

    public v88(boolean z, s88 s88Var, q88 q88Var, String str) {
        s88Var.getClass();
        str.getClass();
        this.a = z;
        this.b = s88Var;
        this.c = q88Var;
        this.d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v88)) {
            return false;
        }
        v88 v88Var = (v88) obj;
        return this.a == v88Var.a && this.b == v88Var.b && this.c.equals(v88Var.c) && g76.L(this.d, v88Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + ((this.a ? 1231 : 1237) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ViewState(isRefreshing=" + this.a + ", selectedFilter=" + this.b + ", content=" + this.c + ", source=" + this.d + ")";
    }
}
