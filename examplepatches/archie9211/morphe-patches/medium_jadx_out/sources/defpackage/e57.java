package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e57 extends f57 implements cy6 {
    public final iy6 e;
    public final /* synthetic */ g57 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e57(g57 g57Var, iy6 iy6Var, kn8 kn8Var) {
        super(g57Var, kn8Var);
        this.f = g57Var;
        this.e = iy6Var;
    }

    @Override // defpackage.f57
    public final void b() {
        this.e.getLifecycle().b(this);
    }

    @Override // defpackage.f57
    public final boolean c(iy6 iy6Var) {
        return this.e == iy6Var;
    }

    @Override // defpackage.f57
    public final boolean d() {
        return ((ky6) this.e.getLifecycle()).d.isAtLeast(vx6.STARTED);
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        iy6 iy6Var2 = this.e;
        vx6 vx6Var = ((ky6) iy6Var2.getLifecycle()).d;
        if (vx6Var == vx6.DESTROYED) {
            this.f.i(this.a);
            return;
        }
        vx6 vx6Var2 = null;
        while (vx6Var2 != vx6Var) {
            a(d());
            vx6Var2 = vx6Var;
            vx6Var = ((ky6) iy6Var2.getLifecycle()).d;
        }
    }
}
