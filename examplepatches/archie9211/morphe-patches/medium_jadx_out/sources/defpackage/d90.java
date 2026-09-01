package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d90 implements f90 {
    public final c09 a;

    public d90(c09 c09Var) {
        this.a = c09Var;
    }

    @Override // defpackage.f90
    public final c09 a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d90) && g76.L(this.a, ((d90) obj).a);
    }

    public final int hashCode() {
        c09 c09Var = this.a;
        if (c09Var == null) {
            return 0;
        }
        return c09Var.hashCode();
    }

    public final String toString() {
        return "Loading(painter=" + this.a + ")";
    }
}
