package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gn1 {
    public final mn1 a;
    public final an1 b;

    public gn1(mn1 mn1Var, an1 an1Var) {
        mn1Var.getClass();
        this.a = mn1Var;
        this.b = an1Var;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof gn1) {
            return g76.L(this.a, ((gn1) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
