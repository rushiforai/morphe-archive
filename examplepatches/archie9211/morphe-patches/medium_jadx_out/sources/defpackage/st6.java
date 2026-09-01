package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class st6 {
    public final f78 a;
    public xp b;
    public int c;
    public final g78 d;
    public final ArrayList e;
    public final ArrayList f;
    public final ArrayList g;
    public final ArrayList h;
    public final ArrayList i;
    public pt6 j;
    public final r28 k;

    public st6() {
        long[] jArr = hqb.a;
        this.a = new f78();
        g78 g78Var = iqb.a;
        this.d = new g78();
        this.e = new ArrayList();
        this.f = new ArrayList();
        this.g = new ArrayList();
        this.h = new ArrayList();
        this.i = new ArrayList();
        this.k = new ot6(this);
    }

    public static void c(zt6 zt6Var, int i, qt6 qt6Var) {
        int i2 = 0;
        long jH = zt6Var.h(0);
        long jA = zt6Var.f() ? k46.a(0, i, 1, jH) : k46.a(i, 0, 2, jH);
        mt6[] mt6VarArr = qt6Var.a;
        int length = mt6VarArr.length;
        int i3 = 0;
        while (i2 < length) {
            mt6 mt6Var = mt6VarArr[i2];
            int i4 = i3 + 1;
            if (mt6Var != null) {
                mt6Var.l = k46.d(jA, k46.c(zt6Var.h(i3), jH));
            }
            i2++;
            i3 = i4;
        }
    }

    public static int h(int[] iArr, zt6 zt6Var) {
        int i = zt6Var.i();
        int iC = zt6Var.c() + i;
        int iMax = 0;
        while (i < iC) {
            int iB = zt6Var.b() + iArr[i];
            iArr[i] = iB;
            iMax = Math.max(iMax, iB);
            i++;
        }
        return iMax;
    }

    public final mt6 a(int i, Object obj) {
        qt6 qt6Var = (qt6) this.a.g(obj);
        if (qt6Var != null) {
            return qt6Var.a[i];
        }
        return null;
    }

    public final long b() {
        ArrayList arrayList = this.i;
        int size = arrayList.size();
        long jMax = 0;
        for (int i = 0; i < size; i++) {
            mt6 mt6Var = (mt6) arrayList.get(i);
            of5 of5Var = mt6Var.n;
            if (of5Var != null) {
                int iMax = Math.max((int) (jMax >> 32), ((int) (mt6Var.l >> 32)) + ((int) (of5Var.u >> 32)));
                jMax = (((long) Math.max((int) (jMax & 4294967295L), ((int) (mt6Var.l & 4294967295L)) + ((int) (of5Var.u & 4294967295L)))) & 4294967295L) | (((long) iMax) << 32);
            }
        }
        return jMax;
    }

    /* JADX WARN: Code restructure failed: missing block: B:202:0x049d, code lost:
    
        r14.a(r37, r61, r62, r59, r60, r14.c);
        r3 = r37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:0x04b2, code lost:
    
        if (r6 >= r48.c) goto L206;
     */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x04b4, code lost:
    
        r4.add(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:206:0x04ba, code lost:
    
        r10 = r10;
        r10.add(r3);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:175:0x03c2  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x03cf  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x04c2  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00bf  */
    /* JADX WARN: Type inference failed for: r15v14 */
    /* JADX WARN: Type inference failed for: r15v15 */
    /* JADX WARN: Type inference failed for: r15v16 */
    /* JADX WARN: Type inference failed for: r15v18 */
    /* JADX WARN: Type inference failed for: r15v19 */
    /* JADX WARN: Type inference failed for: r15v20 */
    /* JADX WARN: Type inference failed for: r15v21 */
    /* JADX WARN: Type inference failed for: r15v22 */
    /* JADX WARN: Type inference failed for: r15v23, types: [ib2, n92, wb2] */
    /* JADX WARN: Type inference failed for: r15v24 */
    /* JADX WARN: Type inference failed for: r15v29 */
    /* JADX WARN: Type inference failed for: r15v30 */
    /* JADX WARN: Type inference failed for: r16v12 */
    /* JADX WARN: Type inference failed for: r16v6 */
    /* JADX WARN: Type inference failed for: r16v7 */
    /* JADX WARN: Type inference failed for: r1v30, types: [mt6[]] */
    /* JADX WARN: Type inference failed for: r1v34, types: [mt6[]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(int r49, int r50, int r51, java.util.ArrayList r52, defpackage.xp r53, defpackage.b2 r54, boolean r55, boolean r56, int r57, boolean r58, int r59, int r60, defpackage.sb2 r61, defpackage.lf5 r62) {
        /*
            Method dump skipped, instruction units count: 1588
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.st6.d(int, int, int, java.util.ArrayList, xp, b2, boolean, boolean, int, boolean, int, int, sb2, lf5):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0055  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e() {
        /*
            r14 = this;
            f78 r14 = r14.a
            boolean r0 = r14.j()
            if (r0 == 0) goto L5d
            java.lang.Object[] r0 = r14.c
            long[] r1 = r14.a
            int r2 = r1.length
            int r2 = r2 + (-2)
            if (r2 < 0) goto L5a
            r3 = 0
            r4 = r3
        L13:
            r5 = r1[r4]
            long r7 = ~r5
            r9 = 7
            long r7 = r7 << r9
            long r7 = r7 & r5
            r9 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r7 = r7 & r9
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L55
            int r7 = r4 - r2
            int r7 = ~r7
            int r7 = r7 >>> 31
            r8 = 8
            int r7 = 8 - r7
            r9 = r3
        L2d:
            if (r9 >= r7) goto L53
            r10 = 255(0xff, double:1.26E-321)
            long r10 = r10 & r5
            r12 = 128(0x80, double:6.3E-322)
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 >= 0) goto L4f
            int r10 = r4 << 3
            int r10 = r10 + r9
            r10 = r0[r10]
            qt6 r10 = (defpackage.qt6) r10
            mt6[] r10 = r10.a
            int r11 = r10.length
            r12 = r3
        L43:
            if (r12 >= r11) goto L4f
            r13 = r10[r12]
            if (r13 == 0) goto L4c
            r13.d()
        L4c:
            int r12 = r12 + 1
            goto L43
        L4f:
            long r5 = r5 >> r8
            int r9 = r9 + 1
            goto L2d
        L53:
            if (r7 != r8) goto L5a
        L55:
            if (r4 == r2) goto L5a
            int r4 = r4 + 1
            goto L13
        L5a:
            r14.a()
        L5d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.st6.e():void");
    }

    public final void f(Object obj) {
        qt6 qt6Var = (qt6) this.a.k(obj);
        if (qt6Var != null) {
            for (mt6 mt6Var : qt6Var.a) {
                if (mt6Var != null) {
                    mt6Var.d();
                }
            }
        }
    }

    public final void g(zt6 zt6Var, boolean z) {
        Object objG = this.a.g(zt6Var.getKey());
        objG.getClass();
        mt6[] mt6VarArr = ((qt6) objG).a;
        int length = mt6VarArr.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            mt6 mt6Var = mt6VarArr[i];
            int i3 = i2 + 1;
            if (mt6Var != null) {
                long jH = zt6Var.h(i2);
                long j = mt6Var.l;
                if (!k46.b(j, 9223372034707292159L) && !k46.b(j, jH)) {
                    long jC = k46.c(jH, j);
                    tj4 tj4Var = mt6Var.e;
                    if (tj4Var != null) {
                        long jC2 = k46.c(((k46) mt6Var.q.getValue()).a, jC);
                        mt6Var.e(jC2);
                        mt6Var.h.setValue(Boolean.TRUE);
                        mt6Var.g = z;
                        vx0.c0(mt6Var.a, null, null, new m0(mt6Var, tj4Var, jC2, (n92) null), 3);
                    }
                }
                mt6Var.l = jH;
            }
            i++;
            i2 = i3;
        }
    }
}
