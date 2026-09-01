package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n88 implements q88 {
    public final u88 a;
    public final t88 b;

    public n88(u88 u88Var, t88 t88Var) {
        this.a = u88Var;
        this.b = t88Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n88)) {
            return false;
        }
        n88 n88Var = (n88) obj;
        return this.a.equals(n88Var.a) && this.b.equals(n88Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ContentItems(writers=" + this.a + ", publications=" + this.b + ")";
    }
}
