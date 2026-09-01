package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o80 extends q28 implements sp6 {
    public float o;
    public boolean p;

    public final long I0(long j, boolean z) {
        int iRound;
        int iG = f72.g(j);
        if (iG == Integer.MAX_VALUE || (iRound = Math.round(iG * this.o)) <= 0) {
            return 0L;
        }
        if (!z || op8.e0(iRound, iG, j)) {
            return (((long) iRound) << 32) | (((long) iG) & 4294967295L);
        }
        return 0L;
    }

    public final long J0(long j, boolean z) {
        int iRound;
        int iH = f72.h(j);
        if (iH == Integer.MAX_VALUE || (iRound = Math.round(iH / this.o)) <= 0) {
            return 0L;
        }
        if (!z || op8.e0(iH, iRound, j)) {
            return (((long) iH) << 32) | (((long) iRound) & 4294967295L);
        }
        return 0L;
    }

    public final long K0(long j, boolean z) {
        int i = f72.i(j);
        int iRound = Math.round(i * this.o);
        if (iRound <= 0) {
            return 0L;
        }
        if (!z || op8.e0(iRound, i, j)) {
            return (((long) iRound) << 32) | (((long) i) & 4294967295L);
        }
        return 0L;
    }

    public final long L0(long j, boolean z) {
        int iJ = f72.j(j);
        int iRound = Math.round(iJ / this.o);
        if (iRound <= 0) {
            return 0L;
        }
        if (!z || op8.e0(iJ, iRound, j)) {
            return (((long) iJ) << 32) | (((long) iRound) & 4294967295L);
        }
        return 0L;
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return i != Integer.MAX_VALUE ? Math.round(i * this.o) : tk7Var.n(i);
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00bf  */
    @Override // defpackage.sp6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.al7 c(defpackage.bl7 r8, defpackage.tk7 r9, long r10) {
        /*
            Method dump skipped, instruction units count: 250
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o80.c(bl7, tk7, long):al7");
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return i != Integer.MAX_VALUE ? Math.round(i / this.o) : tk7Var.a(i);
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return i != Integer.MAX_VALUE ? Math.round(i / this.o) : tk7Var.L(i);
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return i != Integer.MAX_VALUE ? Math.round(i * this.o) : tk7Var.k(i);
    }
}
