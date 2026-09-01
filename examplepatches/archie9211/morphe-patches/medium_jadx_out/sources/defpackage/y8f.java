package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y8f extends q28 implements sp6 {
    public ef3 o;
    public b55 p;

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(final bl7 bl7Var, tk7 tk7Var, long j) {
        final t99 t99VarS = tk7Var.s(h72.a(this.o != ef3.Vertical ? 0 : f72.j(j), f72.h(j), this.o == ef3.Horizontal ? f72.i(j) : 0, f72.g(j)));
        final int iV = iq7.v(t99VarS.a, f72.j(j), f72.h(j));
        final int iV2 = iq7.v(t99VarS.b, f72.i(j), f72.g(j));
        return bl7Var.q0(iV, iV2, fy3.a, new x45() { // from class: x8f
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                b55 b55Var = this.a.p;
                t99 t99Var = t99VarS;
                s99.i((s99) obj, t99Var, ((k46) b55Var.invoke(new s46((((long) (iV - t99Var.a)) << 32) | (((long) (iV2 - t99Var.b)) & 4294967295L)), bl7Var.getLayoutDirection())).a);
                return c1e.a;
            }
        });
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.f(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.h(this, fb7Var, tk7Var, i);
    }
}
