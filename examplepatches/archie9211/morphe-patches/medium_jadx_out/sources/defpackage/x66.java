package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x66 extends b76 {
    public a76 p;
    public boolean q;

    @Override // defpackage.b76
    public final long I0(tk7 tk7Var, long j) {
        int iL = this.p == a76.Min ? tk7Var.L(f72.h(j)) : tk7Var.a(f72.h(j));
        if (iL < 0) {
            iL = 0;
        }
        if (iL < 0) {
            d26.a("height must be >= 0");
        }
        return h72.h(0, Integer.MAX_VALUE, iL, iL);
    }

    @Override // defpackage.b76
    public final boolean J0() {
        return this.q;
    }

    @Override // defpackage.b76, defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return this.p == a76.Min ? tk7Var.L(i) : tk7Var.a(i);
    }

    @Override // defpackage.b76, defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return this.p == a76.Min ? tk7Var.L(i) : tk7Var.a(i);
    }
}
