package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n90 {
    public final Object a;
    public final z80 b;
    public final gx5 c;

    public n90(Object obj, z80 z80Var, gx5 gx5Var) {
        this.a = obj;
        this.b = z80Var;
        this.c = gx5Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n90)) {
            return false;
        }
        n90 n90Var = (n90) obj;
        z80 z80Var = n90Var.b;
        z80 z80Var2 = this.b;
        return g76.L(z80Var2, z80Var) && z80Var2.a(this.a, n90Var.a) && g76.L(this.c, n90Var.c);
    }

    public final int hashCode() {
        z80 z80Var = this.b;
        return this.c.hashCode() + ((z80Var.b(this.a) + (z80Var.hashCode() * 31)) * 31);
    }
}
