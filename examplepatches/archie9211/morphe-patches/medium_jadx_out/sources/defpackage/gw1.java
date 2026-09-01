package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gw1 implements r28 {
    public final r28 b;
    public final r28 c;

    public gw1(r28 r28Var, r28 r28Var2) {
        this.b = r28Var;
        this.c = r28Var2;
    }

    @Override // defpackage.r28
    public final /* synthetic */ r28 b(r28 r28Var) {
        return ev6.i(this, r28Var);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof gw1)) {
            return false;
        }
        gw1 gw1Var = (gw1) obj;
        return g76.L(this.b, gw1Var.b) && g76.L(this.c, gw1Var.c);
    }

    @Override // defpackage.r28
    public final Object h(b55 b55Var, Object obj) {
        return this.c.h(b55Var, this.b.h(b55Var, obj));
    }

    public final int hashCode() {
        return (this.c.hashCode() * 31) + this.b.hashCode();
    }

    @Override // defpackage.r28
    public final boolean k(x45 x45Var) {
        return this.b.k(x45Var) && this.c.k(x45Var);
    }

    public final String toString() {
        return ev6.z(new StringBuilder("["), (String) h(cu.k, ""), ']');
    }
}
