package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c90 implements f90 {
    public final c09 a;
    public final r14 b;

    public c90(c09 c09Var, r14 r14Var) {
        this.a = c09Var;
        this.b = r14Var;
    }

    @Override // defpackage.f90
    public final c09 a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c90)) {
            return false;
        }
        c90 c90Var = (c90) obj;
        return g76.L(this.a, c90Var.a) && this.b.equals(c90Var.b);
    }

    public final int hashCode() {
        c09 c09Var = this.a;
        return this.b.hashCode() + ((c09Var == null ? 0 : c09Var.hashCode()) * 31);
    }

    public final String toString() {
        return "Error(painter=" + this.a + ", result=" + this.b + ")";
    }
}
