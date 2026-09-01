package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x2e extends q28 implements sp6 {
    public float o;
    public float p;

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        int iN = tk7Var.n(i);
        int iD = !Float.isNaN(this.o) ? ho2.d(fb7Var, this.o) : 0;
        return iN < iD ? iD : iN;
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        int iJ;
        int i;
        if (Float.isNaN(this.o) || f72.j(j) != 0) {
            iJ = f72.j(j);
        } else {
            int iI0 = bl7Var.i0(this.o);
            iJ = f72.h(j);
            if (iI0 < 0) {
                iI0 = 0;
            }
            if (iI0 <= iJ) {
                iJ = iI0;
            }
        }
        int iH = f72.h(j);
        if (Float.isNaN(this.p) || f72.i(j) != 0) {
            i = f72.i(j);
        } else {
            int iI02 = bl7Var.i0(this.p);
            i = f72.g(j);
            int i2 = iI02 >= 0 ? iI02 : 0;
            if (i2 <= i) {
                i = i2;
            }
        }
        t99 t99VarS = tk7Var.s(h72.a(iJ, iH, i, f72.g(j)));
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 17));
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        int iA = tk7Var.a(i);
        int iD = !Float.isNaN(this.p) ? ho2.d(fb7Var, this.p) : 0;
        return iA < iD ? iD : iA;
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        int iL = tk7Var.L(i);
        int iD = !Float.isNaN(this.p) ? ho2.d(fb7Var, this.p) : 0;
        return iL < iD ? iD : iL;
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        int iK = tk7Var.k(i);
        int iD = !Float.isNaN(this.o) ? ho2.d(fb7Var, this.o) : 0;
        return iK < iD ? iD : iK;
    }
}
