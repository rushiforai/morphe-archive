package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e90 implements f90 {
    public final c09 a;
    public final w0d b;

    public e90(c09 c09Var, w0d w0dVar) {
        this.a = c09Var;
        this.b = w0dVar;
    }

    @Override // defpackage.f90
    public final c09 a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e90)) {
            return false;
        }
        e90 e90Var = (e90) obj;
        return this.a.equals(e90Var.a) && this.b.equals(e90Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Success(painter=" + this.a + ", result=" + this.b + ")";
    }
}
