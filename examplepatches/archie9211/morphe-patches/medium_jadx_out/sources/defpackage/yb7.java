package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yb7 extends q28 implements sp6 {
    public int o;
    public int p;

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        long jA;
        tk7Var.getClass();
        long jD = h72.d(j, nk7.x(this.o, this.p));
        if (f72.g(j) == Integer.MAX_VALUE && f72.h(j) != Integer.MAX_VALUE) {
            int i = (int) (jD >> 32);
            int i2 = (this.p * i) / this.o;
            jA = h72.a(i, i, i2, i2);
        } else if (f72.h(j) != Integer.MAX_VALUE || f72.g(j) == Integer.MAX_VALUE) {
            int i3 = (int) (jD >> 32);
            int i4 = (int) (jD & 4294967295L);
            jA = h72.a(i3, i3, i4, i4);
        } else {
            int i5 = (int) (jD & 4294967295L);
            int i6 = (this.o * i5) / this.p;
            jA = h72.a(i6, i6, i5, i5);
        }
        t99 t99VarS = tk7Var.s(jA);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new xm(t99VarS, 5));
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
