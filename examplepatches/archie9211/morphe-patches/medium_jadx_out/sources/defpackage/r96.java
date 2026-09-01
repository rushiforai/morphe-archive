package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r96 {
    public final mn1 a;
    public final mn1 b;
    public final mn1 c;

    public r96(mn1 mn1Var, mn1 mn1Var2, mn1 mn1Var3) {
        this.a = mn1Var;
        this.b = mn1Var2;
        this.c = mn1Var3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r96)) {
            return false;
        }
        r96 r96Var = (r96) obj;
        return this.a.equals(r96Var.a) && this.b.equals(r96Var.b) && this.c.equals(r96Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "PlatformMutabilityMapping(javaClass=" + this.a + ", kotlinReadOnly=" + this.b + ", kotlinMutable=" + this.c + ')';
    }
}
