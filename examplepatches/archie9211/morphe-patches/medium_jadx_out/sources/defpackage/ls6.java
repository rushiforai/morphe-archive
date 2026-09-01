package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ls6 {
    public final n98 a;
    public final q0b b;

    public ls6(n98 n98Var, q0b q0bVar) {
        n98Var.getClass();
        this.a = n98Var;
        this.b = q0bVar;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ls6) {
            return g76.L(this.a, ((ls6) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
