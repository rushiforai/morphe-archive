package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y52 extends ht2 implements l49 {
    public final i52 r;
    public final x45 s;

    public y52(i52 i52Var, x45 x45Var) {
        this.r = i52Var;
        this.s = x45Var;
    }

    @Override // defpackage.r28
    public final /* synthetic */ r28 b(r28 r28Var) {
        return ev6.i(this, r28Var);
    }

    public final boolean equals(Object obj) {
        y52 y52Var = obj instanceof y52 ? (y52) obj : null;
        return this.s == (y52Var != null ? y52Var.s : null);
    }

    @Override // defpackage.r28
    public final Object h(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    public final int hashCode() {
        return this.s.hashCode();
    }

    @Override // defpackage.l49
    public final Object i() {
        return new x52(this.r, this.s);
    }

    @Override // defpackage.r28
    public final boolean k(x45 x45Var) {
        return ((Boolean) x45Var.invoke(this)).booleanValue();
    }
}
