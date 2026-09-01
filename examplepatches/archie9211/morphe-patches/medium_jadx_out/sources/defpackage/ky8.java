package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ky8 extends q28 implements sp6 {
    public hy8 o;

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        float fB = this.o.b(bl7Var.getLayoutDirection());
        float fD = this.o.d();
        float fC = this.o.c(bl7Var.getLayoutDirection());
        float fA = this.o.a();
        if (!((vj3.a(fB, 0.0f) >= 0) & (vj3.a(fD, 0.0f) >= 0) & (vj3.a(fC, 0.0f) >= 0) & (vj3.a(fA, 0.0f) >= 0))) {
            z16.a("Padding must be non-negative");
        }
        int iI0 = bl7Var.i0(fB);
        int iI02 = bl7Var.i0(fC) + iI0;
        int iI03 = bl7Var.i0(fD);
        int iI04 = bl7Var.i0(fA) + iI03;
        t99 t99VarS = tk7Var.s(h72.i(-iI02, -iI04, j));
        return bl7Var.q0(h72.g(t99VarS.a + iI02, j), h72.f(t99VarS.b + iI04, j), fy3.a, new cl0(t99VarS, iI0, iI03, 5));
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
