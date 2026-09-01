package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x52 implements np6 {
    public final i52 a;
    public final x45 b;
    public final Object c;

    public x52(i52 i52Var, x45 x45Var) {
        this.a = i52Var;
        this.b = x45Var;
        this.c = i52Var.b;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof x52)) {
            return false;
        }
        x52 x52Var = (x52) obj;
        return g76.L(this.a.b, x52Var.a.b) && this.b == x52Var.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.b.hashCode() * 31);
    }

    @Override // defpackage.np6
    public final Object s() {
        return this.c;
    }
}
