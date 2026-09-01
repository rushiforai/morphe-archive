package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d59 implements b42 {
    public final bnb a;
    public final String b;
    public final b55 c;
    public final w5d d = new w5d(new yj8(8, this));

    public d59(bnb bnbVar, String str, b55 b55Var) {
        this.a = bnbVar;
        this.b = str;
        this.c = b55Var;
    }

    @Override // defpackage.b42
    public final Object G(boolean z, b55 b55Var, p92 p92Var) {
        c59 c59Var = (c59) p92Var.getContext().o0(c59.b);
        n92 n92Var = null;
        b59 b59Var = c59Var != null ? c59Var.a : null;
        if (b59Var != null) {
            return b55Var.invoke(b59Var, p92Var);
        }
        b59 b59Var2 = new b59(this.c, (anb) this.d.getValue());
        return vx0.m0(new c59(b59Var2), new kd7(b55Var, b59Var2, n92Var, 15), p92Var);
    }

    @Override // java.lang.AutoCloseable
    public final void close() throws Exception {
        w5d w5dVar = this.d;
        if (w5dVar.a()) {
            ((anb) w5dVar.getValue()).close();
        }
    }
}
