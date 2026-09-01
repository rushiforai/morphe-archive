package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a90 {
    public final gx5 a;
    public final rx5 b;
    public final z80 c;

    public a90(gx5 gx5Var, rx5 rx5Var, z80 z80Var) {
        this.a = gx5Var;
        this.b = rx5Var;
        this.c = z80Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a90)) {
            return false;
        }
        a90 a90Var = (a90) obj;
        if (!g76.L(this.a, a90Var.a)) {
            return false;
        }
        z80 z80Var = a90Var.c;
        z80 z80Var2 = this.c;
        return g76.L(z80Var2, z80Var) && z80Var2.a(this.b, a90Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        z80 z80Var = this.c;
        return z80Var.b(this.b) + ((z80Var.hashCode() + iHashCode) * 31);
    }

    public final String toString() {
        return "Input(imageLoader=" + this.a + ", request=" + this.b + ", modelEqualityDelegate=" + this.c + ")";
    }
}
