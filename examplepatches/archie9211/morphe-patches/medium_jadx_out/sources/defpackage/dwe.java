package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class dwe extends jj5 {
    public int t0 = 0;
    public int u0 = 0;
    public int v0 = 0;
    public int w0 = 0;
    public boolean x0 = false;
    public int y0 = 0;
    public int z0 = 0;
    public final qo0 A0 = new qo0();
    public ro0 B0 = null;

    public abstract void X(int i, int i2, int i3, int i4);

    public final void Y(b72 b72Var, a72 a72Var, int i, a72 a72Var2, int i2) {
        ro0 ro0Var;
        c72 c72Var;
        while (true) {
            ro0Var = this.B0;
            if (ro0Var != null || (c72Var = this.V) == null) {
                break;
            } else {
                this.B0 = c72Var.v0;
            }
        }
        qo0 qo0Var = this.A0;
        qo0Var.a = a72Var;
        qo0Var.b = a72Var2;
        qo0Var.c = i;
        qo0Var.d = i2;
        ro0Var.b(b72Var, qo0Var);
        b72Var.S(qo0Var.e);
        b72Var.N(qo0Var.f);
        b72Var.F = qo0Var.h;
        b72Var.J(qo0Var.g);
    }
}
