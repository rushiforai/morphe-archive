package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kfc extends q28 implements sp6 {
    public float o;
    public float p;
    public float q;
    public float r;
    public boolean s;

    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long I0(defpackage.bl7 r7) {
        /*
            r6 = this;
            float r0 = r6.q
            boolean r0 = java.lang.Float.isNaN(r0)
            r1 = 2147483647(0x7fffffff, float:NaN)
            r2 = 0
            if (r0 != 0) goto L16
            float r0 = r6.q
            int r0 = r7.i0(r0)
            if (r0 >= 0) goto L17
            r0 = r2
            goto L17
        L16:
            r0 = r1
        L17:
            float r3 = r6.r
            boolean r3 = java.lang.Float.isNaN(r3)
            if (r3 != 0) goto L29
            float r3 = r6.r
            int r3 = r7.i0(r3)
            if (r3 >= 0) goto L2a
            r3 = r2
            goto L2a
        L29:
            r3 = r1
        L2a:
            float r4 = r6.o
            boolean r4 = java.lang.Float.isNaN(r4)
            if (r4 != 0) goto L41
            float r4 = r6.o
            int r4 = r7.i0(r4)
            if (r4 >= 0) goto L3b
            r4 = r2
        L3b:
            if (r4 <= r0) goto L3e
            r4 = r0
        L3e:
            if (r4 == r1) goto L41
            goto L42
        L41:
            r4 = r2
        L42:
            float r5 = r6.p
            boolean r5 = java.lang.Float.isNaN(r5)
            if (r5 != 0) goto L59
            float r6 = r6.p
            int r6 = r7.i0(r6)
            if (r6 >= 0) goto L53
            r6 = r2
        L53:
            if (r6 <= r3) goto L56
            r6 = r3
        L56:
            if (r6 == r1) goto L59
            r2 = r6
        L59:
            long r6 = defpackage.h72.a(r4, r0, r2, r3)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kfc.I0(bl7):long");
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        long jI0 = I0(fb7Var);
        if (f72.f(jI0)) {
            return f72.h(jI0);
        }
        if (!this.s) {
            i = h72.f(i, jI0);
        }
        return h72.g(tk7Var.n(i), jI0);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        int iJ;
        int iH;
        int i;
        int iG;
        long jA;
        long jI0 = I0(bl7Var);
        if (this.s) {
            jA = h72.e(j, jI0);
        } else {
            if (Float.isNaN(this.o)) {
                iJ = f72.j(j);
                int iH2 = f72.h(jI0);
                if (iJ > iH2) {
                    iJ = iH2;
                }
            } else {
                iJ = f72.j(jI0);
            }
            if (Float.isNaN(this.q)) {
                iH = f72.h(j);
                int iJ2 = f72.j(jI0);
                if (iH < iJ2) {
                    iH = iJ2;
                }
            } else {
                iH = f72.h(jI0);
            }
            if (Float.isNaN(this.p)) {
                i = f72.i(j);
                int iG2 = f72.g(jI0);
                if (i > iG2) {
                    i = iG2;
                }
            } else {
                i = f72.i(jI0);
            }
            if (Float.isNaN(this.r)) {
                iG = f72.g(j);
                int i2 = f72.i(jI0);
                if (iG < i2) {
                    iG = i2;
                }
            } else {
                iG = f72.g(jI0);
            }
            jA = h72.a(iJ, iH, i, iG);
        }
        t99 t99VarS = tk7Var.s(jA);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 11));
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        long jI0 = I0(fb7Var);
        if (f72.e(jI0)) {
            return f72.g(jI0);
        }
        if (!this.s) {
            i = h72.g(i, jI0);
        }
        return h72.f(tk7Var.a(i), jI0);
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        long jI0 = I0(fb7Var);
        if (f72.e(jI0)) {
            return f72.g(jI0);
        }
        if (!this.s) {
            i = h72.g(i, jI0);
        }
        return h72.f(tk7Var.L(i), jI0);
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        long jI0 = I0(fb7Var);
        if (f72.f(jI0)) {
            return f72.h(jI0);
        }
        if (!this.s) {
            i = h72.f(i, jI0);
        }
        return h72.g(tk7Var.k(i), jI0);
    }
}
