package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r14 implements xx5 {
    public final ew5 a;
    public final rx5 b;
    public final Throwable c;

    public r14(ew5 ew5Var, rx5 rx5Var, Throwable th) {
        this.a = ew5Var;
        this.b = rx5Var;
        this.c = th;
    }

    @Override // defpackage.xx5
    public final ew5 a() {
        return this.a;
    }

    @Override // defpackage.xx5
    public final rx5 b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r14)) {
            return false;
        }
        r14 r14Var = (r14) obj;
        return g76.L(this.a, r14Var.a) && g76.L(this.b, r14Var.b) && this.c.equals(r14Var.c);
    }

    public final int hashCode() {
        ew5 ew5Var = this.a;
        int iHashCode = ew5Var == null ? 0 : ew5Var.hashCode();
        return this.c.hashCode() + ((this.b.hashCode() + (iHashCode * 31)) * 31);
    }

    public final String toString() {
        return "ErrorResult(image=" + this.a + ", request=" + this.b + ", throwable=" + this.c + ')';
    }
}
