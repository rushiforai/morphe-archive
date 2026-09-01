package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z08 extends q28 implements u22, sp6 {
    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        boolean z = this.n && ((Boolean) bo.K(this, h56.a)).booleanValue();
        long j2 = h56.b;
        t99 t99VarS = tk7Var.s(j);
        int iMax = t99VarS.a;
        if (z) {
            iMax = Math.max(iMax, bl7Var.i0(yj3.b(j2)));
        }
        int iMax2 = t99VarS.b;
        if (z) {
            iMax2 = Math.max(iMax2, bl7Var.i0(yj3.a(j2)));
        }
        return bl7Var.q0(iMax, iMax2, fy3.a, new cl0(iMax, t99VarS, iMax2, 4));
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
