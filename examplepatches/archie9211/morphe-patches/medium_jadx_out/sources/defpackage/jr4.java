package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jr4 {
    public final or4 a;
    public final mn b;
    public final g78 c;
    public final g78 d;
    public boolean e;

    public jr4(or4 or4Var, mn mnVar) {
        this.a = or4Var;
        this.b = mnVar;
        g78 g78Var = iqb.a;
        this.c = new g78();
        this.d = new g78();
    }

    public final void a() {
        if (this.e) {
            return;
        }
        gi4 gi4Var = new gi4(0, this, jr4.class, "invalidateNodes", "invalidateNodes()V", 0, 7);
        x68 x68Var = this.b.O0;
        if (x68Var.g(gi4Var) < 0) {
            x68Var.a(gi4Var);
        }
        this.e = true;
    }
}
