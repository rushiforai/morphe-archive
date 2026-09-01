package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ml3 extends q28 implements sp6 {
    public sl o;
    public b55 p;
    public hw8 q;
    public boolean r;

    @Override // defpackage.q28
    public final void A0() {
        this.r = false;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(j);
        if (!bl7Var.W() || !this.r) {
            f09 f09Var = (f09) this.p.invoke(new s46((((long) t99VarS.b) & 4294967295L) | (((long) t99VarS.a) << 32)), new f72(j));
            sl slVar = this.o;
            hh7 hh7Var = (hh7) f09Var.a;
            Object obj = f09Var.b;
            if (!g76.L(slVar.d(), hh7Var)) {
                slVar.l.setValue(hh7Var);
                if (!slVar.i(obj)) {
                    slVar.k.setValue(obj);
                }
            }
        }
        this.r = bl7Var.W() || this.r;
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new o8(bl7Var, this, t99VarS, 13));
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
