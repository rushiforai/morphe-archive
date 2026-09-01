package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f83 extends e36 implements sp6 {
    public y3f q;
    public ywb r;
    public y3f s;

    @Override // defpackage.e36
    public final void J0() {
        this.s = new f44(this.q, this.o);
        super.J0();
        gx1.M(this);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        ywb ywbVar = this.r;
        y3f y3fVar = this.s;
        ywbVar.getClass();
        int iC = y3fVar.c(bl7Var);
        fy3 fy3Var = fy3.a;
        if (iC == 0) {
            return bl7Var.q0(0, 0, fy3Var, new iz2(6));
        }
        t99 t99VarS = tk7Var.s(f72.a(j, 0, 0, iC, iC, 3));
        return bl7Var.q0(t99VarS.a, iC, fy3Var, new y0(t99VarS, 4));
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

    @Override // defpackage.e36
    public final y3f I0(y3f y3fVar) {
        return y3fVar;
    }
}
