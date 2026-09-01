package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e76 extends b76 {
    public a76 p;
    public boolean q;

    @Override // defpackage.b76
    public final long I0(tk7 tk7Var, long j) {
        int iK = this.p == a76.Min ? tk7Var.k(f72.g(j)) : tk7Var.n(f72.g(j));
        if (iK < 0) {
            iK = 0;
        }
        if (iK < 0) {
            d26.a("width must be >= 0");
        }
        return h72.h(iK, iK, 0, Integer.MAX_VALUE);
    }

    @Override // defpackage.b76
    public final boolean J0() {
        return this.q;
    }

    @Override // defpackage.b76, defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return this.p == a76.Min ? tk7Var.k(i) : tk7Var.n(i);
    }

    @Override // defpackage.b76, defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return this.p == a76.Min ? tk7Var.k(i) : tk7Var.n(i);
    }
}
