package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tod implements zk7 {
    public final mn4 a;
    public final j70 b;
    public final yq0 c;
    public final int d;
    public final float e;

    public tod(mn4 mn4Var, j70 j70Var, yq0 yq0Var, int i, float f) {
        this.a = mn4Var;
        this.b = j70Var;
        this.c = yq0Var;
        this.d = i;
        this.e = f;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        int size = list.size();
        int iN = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iN += ((tk7) list.get(i2)).n(i);
        }
        return iN;
    }

    @Override // defpackage.zk7
    public final al7 b(final bl7 bl7Var, List list, final long j) {
        int iH;
        final tod todVar = this;
        int size = list.size();
        final int i = 0;
        int i2 = 0;
        while (i2 < size) {
            tk7 tk7Var = (tk7) list.get(i2);
            if (g76.L(kng.F(tk7Var), "navigationIcon")) {
                final t99 t99VarS = tk7Var.s(f72.a(j, 0, 0, 0, 0, 14));
                int size2 = list.size();
                int i3 = 0;
                while (i3 < size2) {
                    tk7 tk7Var2 = (tk7) list.get(i3);
                    if (g76.L(kng.F(tk7Var2), "actionIcons")) {
                        final t99 t99VarS2 = tk7Var2.s(f72.a(j, 0, 0, 0, 0, 14));
                        if (f72.h(j) == Integer.MAX_VALUE) {
                            iH = f72.h(j);
                        } else {
                            iH = (f72.h(j) - t99VarS.a) - t99VarS2.a;
                            if (iH < 0) {
                                iH = 0;
                            }
                        }
                        int i4 = iH;
                        int size3 = list.size();
                        int i5 = 0;
                        while (i5 < size3) {
                            tk7 tk7Var3 = (tk7) list.get(i5);
                            if (g76.L(kng.F(tk7Var3), "title")) {
                                final t99 t99VarS3 = tk7Var3.s(f72.a(j, 0, i4, 0, 0, 12));
                                fr5 fr5Var = be.b;
                                int iM = t99VarS3.M(fr5Var) != Integer.MIN_VALUE ? t99VarS3.M(fr5Var) : 0;
                                float fInvoke = todVar.a.invoke();
                                int iW0 = Float.isNaN(fInvoke) ? 0 : nk7.w0(fInvoke);
                                final int iMax = Math.max(bl7Var.i0(todVar.e), t99VarS3.b);
                                if (f72.g(j) == Integer.MAX_VALUE) {
                                    i = iMax;
                                } else {
                                    int i6 = iW0 + iMax;
                                    if (i6 >= 0) {
                                        i = i6;
                                    }
                                }
                                final int i7 = iM;
                                return bl7Var.q0(f72.h(j), i, fy3.a, new x45() { // from class: sod
                                    /* JADX WARN: Removed duplicated region for block: B:11:0x0059  */
                                    /* JADX WARN: Removed duplicated region for block: B:12:0x0060  */
                                    @Override // defpackage.x45
                                    /*
                                        Code decompiled incorrectly, please refer to instructions dump.
                                        To view partially-correct add '--show-bad-code' argument
                                    */
                                    public final java.lang.Object invoke(java.lang.Object r14) {
                                        /*
                                            r13 = this;
                                            s99 r14 = (defpackage.s99) r14
                                            t99 r0 = r1
                                            int r1 = r0.b
                                            int r2 = r2
                                            int r1 = r2 - r1
                                            int r1 = r1 / 2
                                            r3 = 0
                                            defpackage.s99.j(r14, r0, r3, r1)
                                            float r1 = defpackage.a10.g
                                            bl7 r4 = r7
                                            int r1 = r4.i0(r1)
                                            int r0 = r0.a
                                            int r0 = java.lang.Math.max(r1, r0)
                                            t99 r1 = r4
                                            int r4 = r1.a
                                            tod r5 = r8
                                            yq0 r6 = r5.c
                                            t99 r7 = r3
                                            int r8 = r7.a
                                            long r9 = r5
                                            int r11 = defpackage.f72.h(r9)
                                            ip6 r12 = defpackage.ip6.Ltr
                                            int r6 = r6.a(r8, r11, r12)
                                            if (r6 >= r0) goto L3b
                                            int r0 = r0 - r6
                                        L39:
                                            int r6 = r6 + r0
                                            goto L4f
                                        L3b:
                                            int r0 = r7.a
                                            int r0 = r0 + r6
                                            int r8 = defpackage.f72.h(r9)
                                            int r8 = r8 - r4
                                            if (r0 <= r8) goto L4f
                                            int r0 = defpackage.f72.h(r9)
                                            int r0 = r0 - r4
                                            int r4 = r7.a
                                            int r4 = r4 + r6
                                            int r0 = r0 - r4
                                            goto L39
                                        L4f:
                                            j70 r0 = r5.b
                                            zi5 r4 = defpackage.qb8.e
                                            boolean r4 = r0.equals(r4)
                                            if (r4 == 0) goto L60
                                            int r13 = r7.b
                                            int r13 = r2 - r13
                                            int r3 = r13 / 2
                                            goto L86
                                        L60:
                                            no3 r4 = defpackage.qb8.d
                                            boolean r0 = r0.equals(r4)
                                            if (r0 == 0) goto L86
                                            int r0 = r5.d
                                            int r4 = r7.b
                                            if (r0 != 0) goto L71
                                            int r3 = r2 - r4
                                            goto L86
                                        L71:
                                            int r5 = r9
                                            int r5 = r4 - r5
                                            int r0 = r0 - r5
                                            int r5 = r0 + r4
                                            int r13 = r10
                                            if (r5 <= r13) goto L7e
                                            int r5 = r5 - r13
                                            int r0 = r0 - r5
                                        L7e:
                                            int r13 = r2 - r4
                                            int r0 = java.lang.Math.max(r3, r0)
                                            int r3 = r13 - r0
                                        L86:
                                            defpackage.s99.j(r14, r7, r6, r3)
                                            int r13 = defpackage.f72.h(r9)
                                            int r0 = r1.a
                                            int r13 = r13 - r0
                                            int r0 = r1.b
                                            int r2 = r2 - r0
                                            int r2 = r2 / 2
                                            defpackage.s99.j(r14, r1, r13, r2)
                                            c1e r13 = defpackage.c1e.a
                                            return r13
                                        */
                                        throw new UnsupportedOperationException("Method not decompiled: defpackage.sod.invoke(java.lang.Object):java.lang.Object");
                                    }
                                });
                            }
                            i5++;
                            todVar = this;
                        }
                        z27.c("Collection contains no element matching the predicate.");
                        z72.b();
                        return null;
                    }
                    i3++;
                    todVar = this;
                }
                z27.c("Collection contains no element matching the predicate.");
                z72.b();
                return null;
            }
            i2++;
            todVar = this;
        }
        z27.c("Collection contains no element matching the predicate.");
        z72.b();
        return null;
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        int size = list.size();
        int iK = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iK += ((tk7) list.get(i2)).k(i);
        }
        return iK;
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
        Integer numValueOf;
        int iI0 = y66Var.i0(this.e);
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((tk7) list.get(0)).a(i));
            int i2 = 1;
            int size = list.size() - 1;
            if (1 <= size) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((tk7) list.get(i2)).a(i));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i2 == size) {
                        break;
                    }
                    i2++;
                }
            }
        }
        return Math.max(iI0, numValueOf != null ? numValueOf.intValue() : 0);
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
        Integer numValueOf;
        int iI0 = y66Var.i0(this.e);
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((tk7) list.get(0)).L(i));
            int i2 = 1;
            int size = list.size() - 1;
            if (1 <= size) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((tk7) list.get(i2)).L(i));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i2 == size) {
                        break;
                    }
                    i2++;
                }
            }
        }
        return Math.max(iI0, numValueOf != null ? numValueOf.intValue() : 0);
    }
}
