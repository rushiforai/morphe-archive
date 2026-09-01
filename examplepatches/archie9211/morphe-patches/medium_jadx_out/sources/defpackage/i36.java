package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class i36 extends e36 implements sp6 {
    public y3f q;

    public i36(y3f y3fVar) {
        this.q = y3fVar;
    }

    @Override // defpackage.e36
    public final y3f I0(y3f y3fVar) {
        return new y0e(y3fVar, this.q);
    }

    @Override // defpackage.e36
    public final void J0() {
        super.J0();
        gx1.M(this);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        int iD = this.p.d(bl7Var, bl7Var.getLayoutDirection()) - this.o.d(bl7Var, bl7Var.getLayoutDirection());
        int iA = this.p.a(bl7Var) - this.o.a(bl7Var);
        int iB = (this.p.b(bl7Var, bl7Var.getLayoutDirection()) - this.o.b(bl7Var, bl7Var.getLayoutDirection())) + iD;
        int iC = (this.p.c(bl7Var) - this.o.c(bl7Var)) + iA;
        t99 t99VarS = tk7Var.s(h72.i(-iB, -iC, j));
        return bl7Var.q0(h72.g(t99VarS.a + iB, j), h72.f(t99VarS.b + iC, j), fy3.a, new cl0(t99VarS, iD, iA, 2));
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
