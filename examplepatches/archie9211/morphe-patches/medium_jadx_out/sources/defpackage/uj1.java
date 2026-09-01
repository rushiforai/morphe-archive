package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uj1 {
    public final xd a;
    public final x45 b;
    public final tj4 c;

    public uj1(xd xdVar, tj4 tj4Var, x45 x45Var) {
        this.a = xdVar;
        this.b = x45Var;
        this.c = tj4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uj1)) {
            return false;
        }
        uj1 uj1Var = (uj1) obj;
        return g76.L(this.a, uj1Var.a) && g76.L(this.b, uj1Var.b) && g76.L(this.c, uj1Var.c);
    }

    public final int hashCode() {
        return ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31) + 1231;
    }

    public final String toString() {
        return "ChangeSize(alignment=" + this.a + ", size=" + this.b + ", animationSpec=" + this.c + ", clip=true)";
    }
}
