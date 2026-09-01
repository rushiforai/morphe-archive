package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cq8 extends lc8 {
    public final dq8 d;
    public boolean e;

    public cq8(dq8 dq8Var, eq8 eq8Var) {
        boolean z = dq8Var.b;
        this.a = eq8Var;
        this.b = z;
        this.d = dq8Var;
        this.e = true;
    }

    @Override // defpackage.lc8
    public final void a() {
        this.d.a();
    }

    @Override // defpackage.lc8
    public final void b() {
        this.d.b();
    }

    @Override // defpackage.lc8
    public final void c(ic8 ic8Var) {
        this.d.c(new sl0(ic8Var));
    }

    @Override // defpackage.lc8
    public final void d(ic8 ic8Var) {
        ic8Var.getClass();
        this.d.d(new sl0(ic8Var));
    }

    public final void g(boolean z) {
        this.e = z;
        f(z && this.d.b);
    }
}
