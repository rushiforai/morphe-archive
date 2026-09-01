package defpackage;

import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class uic {
    public static final dsb a = new dsb(16);
    public static final vwa b = new vwa(4);
    public static final Object c = new Object();
    public static sic d;
    public static long e;
    public static final e4 f;
    public static final xp g;
    public static List h;
    public static List i;
    public static final sd5 j;
    public static final x90 k;

    /* JADX WARN: Type inference failed for: r2v2, types: [java.io.Serializable, long[]] */
    /* JADX WARN: Type inference failed for: r2v3, types: [int[], java.io.Serializable] */
    static {
        sic sicVar = sic.e;
        d = sicVar;
        e = 2L;
        e4 e4Var = new e4();
        e4Var.a = new long[16];
        e4Var.b = new int[16];
        int[] iArr = new int[16];
        char c2 = 0;
        int i2 = 0;
        while (i2 < 16) {
            int i3 = i2 + 1;
            iArr[i2] = i3;
            i2 = i3;
        }
        e4Var.e = iArr;
        f = e4Var;
        xp xpVar = new xp(c2, 12);
        xpVar.c = new int[16];
        xpVar.d = new f1f[16];
        g = xpVar;
        ey3 ey3Var = ey3.a;
        h = ey3Var;
        i = ey3Var;
        long j2 = e;
        e = 1 + j2;
        sd5 sd5Var = new sd5(j2, sicVar, null, new cq4(22));
        d = d.q(sd5Var.b);
        j = sd5Var;
        k = new x90(0);
    }

    public static final sic a(sic sicVar, long j2, long j3) {
        while (g76.R(j2, j3) < 0) {
            sicVar = sicVar.q(j2);
            j2++;
        }
        return sicVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x008e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object b(defpackage.x45 r15) {
        /*
            sd5 r0 = defpackage.uic.j
            java.lang.Object r1 = defpackage.uic.c
            monitor-enter(r1)
            g78 r2 = r0.h     // Catch: java.lang.Throwable -> L10
            if (r2 == 0) goto L13
            x90 r3 = defpackage.uic.k     // Catch: java.lang.Throwable -> L10
            r4 = 1
            r3.addAndGet(r4)     // Catch: java.lang.Throwable -> L10
            goto L13
        L10:
            r15 = move-exception
            goto L97
        L13:
            java.lang.Object r15 = v(r0, r15)     // Catch: java.lang.Throwable -> L10
            monitor-exit(r1)
            r1 = 0
            if (r2 == 0) goto L44
            r3 = -1
            java.util.List r4 = defpackage.uic.h     // Catch: java.lang.Throwable -> L36
            jqb r5 = new jqb     // Catch: java.lang.Throwable -> L36
            r5.<init>(r2)     // Catch: java.lang.Throwable -> L36
            int r6 = r4.size()     // Catch: java.lang.Throwable -> L36
            r7 = r1
        L28:
            if (r7 >= r6) goto L38
            java.lang.Object r8 = r4.get(r7)     // Catch: java.lang.Throwable -> L36
            b55 r8 = (defpackage.b55) r8     // Catch: java.lang.Throwable -> L36
            r8.invoke(r5, r0)     // Catch: java.lang.Throwable -> L36
            int r7 = r7 + 1
            goto L28
        L36:
            r15 = move-exception
            goto L3e
        L38:
            x90 r0 = defpackage.uic.k
            r0.addAndGet(r3)
            goto L44
        L3e:
            x90 r0 = defpackage.uic.k
            r0.addAndGet(r3)
            throw r15
        L44:
            java.lang.Object r0 = defpackage.uic.c
            monitor-enter(r0)
            d()     // Catch: java.lang.Throwable -> L86
            if (r2 == 0) goto L93
            java.lang.Object[] r3 = r2.b     // Catch: java.lang.Throwable -> L86
            long[] r2 = r2.a     // Catch: java.lang.Throwable -> L86
            int r4 = r2.length     // Catch: java.lang.Throwable -> L86
            int r4 = r4 + (-2)
            if (r4 < 0) goto L93
            r5 = r1
        L56:
            r6 = r2[r5]     // Catch: java.lang.Throwable -> L86
            long r8 = ~r6     // Catch: java.lang.Throwable -> L86
            r10 = 7
            long r8 = r8 << r10
            long r8 = r8 & r6
            r10 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r8 = r8 & r10
            int r8 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r8 == 0) goto L8e
            int r8 = r5 - r4
            int r8 = ~r8     // Catch: java.lang.Throwable -> L86
            int r8 = r8 >>> 31
            r9 = 8
            int r8 = 8 - r8
            r10 = r1
        L70:
            if (r10 >= r8) goto L8c
            r11 = 255(0xff, double:1.26E-321)
            long r11 = r11 & r6
            r13 = 128(0x80, double:6.3E-322)
            int r11 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r11 >= 0) goto L88
            int r11 = r5 << 3
            int r11 = r11 + r10
            r11 = r3[r11]     // Catch: java.lang.Throwable -> L86
            dqc r11 = (defpackage.dqc) r11     // Catch: java.lang.Throwable -> L86
            q(r11)     // Catch: java.lang.Throwable -> L86
            goto L88
        L86:
            r15 = move-exception
            goto L95
        L88:
            long r6 = r6 >> r9
            int r10 = r10 + 1
            goto L70
        L8c:
            if (r8 != r9) goto L93
        L8e:
            if (r5 == r4) goto L93
            int r5 = r5 + 1
            goto L56
        L93:
            monitor-exit(r0)
            return r15
        L95:
            monitor-exit(r0)
            throw r15
        L97:
            monitor-exit(r1)
            throw r15
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uic.b(x45):java.lang.Object");
    }

    public static final void c() {
        b(a);
    }

    public static final void d() {
        xp xpVar = g;
        int i2 = xpVar.b;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (i3 >= i2) {
                break;
            }
            f1f f1fVar = ((f1f[]) xpVar.d)[i3];
            Object obj = f1fVar != null ? f1fVar.get() : null;
            if (obj != null && p((dqc) obj)) {
                if (i4 != i3) {
                    ((f1f[]) xpVar.d)[i4] = f1fVar;
                    int[] iArr = (int[]) xpVar.c;
                    iArr[i4] = iArr[i3];
                }
                i4++;
            }
            i3++;
        }
        for (int i5 = i4; i5 < i2; i5++) {
            ((f1f[]) xpVar.d)[i5] = null;
            ((int[]) xpVar.c)[i5] = 0;
        }
        if (i4 != i2) {
            xpVar.b = i4;
        }
    }

    public static final oic e(oic oicVar, x45 x45Var, boolean z) {
        boolean z2 = oicVar instanceof k78;
        if (z2 || oicVar == null) {
            return new jsd(z2 ? (k78) oicVar : null, x45Var, null, false, z);
        }
        return new ksd(oicVar, x45Var, false, z);
    }

    public static final fqc f(fqc fqcVar) {
        fqc fqcVarS;
        oic oicVarH = h();
        fqc fqcVarS2 = s(fqcVar, oicVarH.g(), oicVarH.d());
        if (fqcVarS2 != null) {
            return fqcVarS2;
        }
        synchronized (c) {
            oic oicVarH2 = h();
            fqcVarS = s(fqcVar, oicVarH2.g(), oicVarH2.d());
        }
        if (fqcVarS != null) {
            return fqcVarS;
        }
        r();
        throw null;
    }

    public static final fqc g(fqc fqcVar, oic oicVar) {
        fqc fqcVarS;
        fqc fqcVarS2 = s(fqcVar, oicVar.g(), oicVar.d());
        if (fqcVarS2 != null) {
            return fqcVarS2;
        }
        synchronized (c) {
            fqcVarS = s(fqcVar, oicVar.g(), oicVar.d());
        }
        if (fqcVarS != null) {
            return fqcVarS;
        }
        r();
        throw null;
    }

    public static final oic h() {
        oic oicVar = (oic) b.m();
        return oicVar == null ? j : oicVar;
    }

    public static final x45 i(x45 x45Var, x45 x45Var2, boolean z) {
        if (!z) {
            x45Var2 = null;
        }
        return (x45Var == null || x45Var2 == null || x45Var == x45Var2) ? x45Var == null ? x45Var2 : x45Var : new tic(x45Var, x45Var2, 0);
    }

    public static final x45 j(x45 x45Var, x45 x45Var2) {
        return (x45Var == null || x45Var2 == null || x45Var == x45Var2) ? x45Var == null ? x45Var2 : x45Var : new tic(x45Var, x45Var2, 1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0044, code lost:
    
        r3 = r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.fqc k(defpackage.fqc r10, defpackage.dqc r11) {
        /*
            fqc r0 = r11.d()
            long r1 = defpackage.uic.e
            e4 r3 = defpackage.uic.f
            int r4 = r3.c
            if (r4 <= 0) goto L14
            java.io.Serializable r1 = r3.a
            long[] r1 = (long[]) r1
            r2 = 0
            r2 = r1[r2]
            r1 = r2
        L14:
            r3 = 1
            long r1 = r1 - r3
            r3 = 0
            r4 = r3
        L19:
            if (r0 == 0) goto L4b
            long r5 = r0.a
            r7 = 0
            int r9 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r9 != 0) goto L24
            goto L44
        L24:
            int r7 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r7 == 0) goto L48
            int r7 = defpackage.g76.R(r5, r1)
            if (r7 > 0) goto L48
            sic r7 = defpackage.sic.e
            boolean r5 = r7.m(r5)
            if (r5 != 0) goto L48
            if (r4 != 0) goto L3a
            r4 = r0
            goto L48
        L3a:
            long r1 = r0.a
            long r5 = r4.a
            int r1 = defpackage.g76.R(r1, r5)
            if (r1 >= 0) goto L46
        L44:
            r3 = r0
            goto L4b
        L46:
            r3 = r4
            goto L4b
        L48:
            fqc r0 = r0.b
            goto L19
        L4b:
            r0 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            if (r3 == 0) goto L55
            r3.a = r0
            return r3
        L55:
            fqc r10 = r10.b(r0)
            fqc r0 = r11.d()
            r10.b = r0
            r11.m(r10)
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uic.k(fqc, dqc):fqc");
    }

    public static final fqc l(fqc fqcVar, j83 j83Var, oic oicVar) {
        fqc fqcVarK;
        synchronized (c) {
            fqcVarK = k(fqcVar, j83Var);
            fqcVarK.a(fqcVar);
            fqcVarK.a = oicVar.g();
        }
        return fqcVarK;
    }

    public static final void m(oic oicVar, dqc dqcVar) {
        oicVar.t(oicVar.h() + 1);
        x45 x45VarI = oicVar.i();
        if (x45VarI != null) {
            x45VarI.invoke(dqcVar);
        }
    }

    public static final HashMap n(long j2, k78 k78Var, sic sicVar) {
        long[] jArr;
        sic sicVar2;
        long[] jArr2;
        sic sicVar3;
        int i2;
        int i3;
        fqc fqcVarS;
        g78 g78VarX = k78Var.x();
        if (g78VarX != null) {
            long jG = k78Var.g();
            sic sicVarP = k78Var.d().q(jG).p(k78Var.j);
            Object[] objArr = g78VarX.b;
            long[] jArr3 = g78VarX.a;
            int length = jArr3.length - 2;
            if (length >= 0) {
                int i4 = 0;
                HashMap map = null;
                while (true) {
                    long j3 = jArr3[i4];
                    if ((((~j3) << 7) & j3 & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i5 = 8;
                        int i6 = 8 - ((~(i4 - length)) >>> 31);
                        int i7 = 0;
                        while (i7 < i6) {
                            if ((j3 & 255) < 128) {
                                dqc dqcVar = (dqc) objArr[(i4 << 3) + i7];
                                fqc fqcVarD = dqcVar.d();
                                jArr2 = jArr3;
                                i2 = i5;
                                i3 = i7;
                                fqc fqcVarS2 = s(fqcVarD, j2, sicVar);
                                if (fqcVarS2 == null || (fqcVarS = s(fqcVarD, jG, sicVarP)) == null || fqcVarS2.equals(fqcVarS)) {
                                    sicVar3 = sicVarP;
                                } else {
                                    sicVar3 = sicVarP;
                                    fqc fqcVarS3 = s(fqcVarD, jG, k78Var.d());
                                    if (fqcVarS3 == null) {
                                        r();
                                        throw null;
                                    }
                                    fqc fqcVarF = dqcVar.f(fqcVarS, fqcVarS2, fqcVarS3);
                                    if (fqcVarF == null) {
                                        return null;
                                    }
                                    if (map == null) {
                                        map = new HashMap();
                                    }
                                    map.put(fqcVarS2, fqcVarF);
                                    map = map;
                                }
                            } else {
                                jArr2 = jArr3;
                                sicVar3 = sicVarP;
                                i2 = i5;
                                i3 = i7;
                            }
                            j3 >>= i2;
                            i7 = i3 + 1;
                            i5 = i2;
                            jArr3 = jArr2;
                            sicVarP = sicVar3;
                        }
                        jArr = jArr3;
                        sicVar2 = sicVarP;
                        if (i6 != i5) {
                            return map;
                        }
                    } else {
                        jArr = jArr3;
                        sicVar2 = sicVarP;
                    }
                    if (i4 == length) {
                        return map;
                    }
                    i4++;
                    jArr3 = jArr;
                    sicVarP = sicVar2;
                }
            }
        }
        return null;
    }

    public static final fqc o(fqc fqcVar, eqc eqcVar, oic oicVar, fqc fqcVar2) {
        fqc fqcVarK;
        if (oicVar.f()) {
            oicVar.n(eqcVar);
        }
        long jG = oicVar.g();
        if (fqcVar2.a == jG) {
            return fqcVar2;
        }
        synchronized (c) {
            fqcVarK = k(fqcVar, eqcVar);
        }
        fqcVarK.a = jG;
        if (fqcVar2.a != 1) {
            oicVar.n(eqcVar);
        }
        return fqcVarK;
    }

    public static final boolean p(dqc dqcVar) {
        fqc fqcVar;
        long j2 = e;
        e4 e4Var = f;
        if (e4Var.c > 0) {
            j2 = ((long[]) e4Var.a)[0];
        }
        fqc fqcVar2 = null;
        fqc fqcVarD = null;
        int i2 = 0;
        for (fqc fqcVarD2 = dqcVar.d(); fqcVarD2 != null; fqcVarD2 = fqcVarD2.b) {
            long j3 = fqcVarD2.a;
            if (j3 != 0) {
                if (g76.R(j3, j2) >= 0) {
                    i2++;
                } else if (fqcVar2 == null) {
                    i2++;
                    fqcVar2 = fqcVarD2;
                } else {
                    if (g76.R(fqcVarD2.a, fqcVar2.a) < 0) {
                        fqcVar = fqcVar2;
                        fqcVar2 = fqcVarD2;
                    } else {
                        fqcVar = fqcVarD2;
                    }
                    if (fqcVarD == null) {
                        fqcVarD = dqcVar.d();
                        fqc fqcVar3 = fqcVarD;
                        while (true) {
                            if (fqcVarD == null) {
                                fqcVarD = fqcVar3;
                                break;
                            }
                            if (g76.R(fqcVarD.a, j2) >= 0) {
                                break;
                            }
                            if (g76.R(fqcVar3.a, fqcVarD.a) < 0) {
                                fqcVar3 = fqcVarD;
                            }
                            fqcVarD = fqcVarD.b;
                        }
                    }
                    fqcVar2.a = 0L;
                    fqcVar2.a(fqcVarD);
                    fqcVar2 = fqcVar;
                }
            }
        }
        return i2 > 1;
    }

    public static final void q(dqc dqcVar) {
        if (p(dqcVar)) {
            xp xpVar = g;
            int i2 = xpVar.b;
            int iIdentityHashCode = System.identityHashCode(dqcVar);
            int i3 = -1;
            if (i2 > 0) {
                int i4 = xpVar.b - 1;
                int i5 = 0;
                while (true) {
                    if (i5 > i4) {
                        i3 = -(i5 + 1);
                        break;
                    }
                    int i6 = (i5 + i4) >>> 1;
                    int i7 = ((int[]) xpVar.c)[i6];
                    if (i7 < iIdentityHashCode) {
                        i5 = i6 + 1;
                    } else if (i7 > iIdentityHashCode) {
                        i4 = i6 - 1;
                    } else {
                        f1f f1fVar = ((f1f[]) xpVar.d)[i6];
                        if (dqcVar == (f1fVar != null ? f1fVar.get() : null)) {
                            i3 = i6;
                        } else {
                            for (int i8 = i6 - 1; -1 < i8 && ((int[]) xpVar.c)[i8] == iIdentityHashCode; i8--) {
                                f1f f1fVar2 = ((f1f[]) xpVar.d)[i8];
                                if ((f1fVar2 != null ? f1fVar2.get() : null) == dqcVar) {
                                    i3 = i8;
                                    break;
                                }
                            }
                            i6++;
                            int i9 = xpVar.b;
                            while (true) {
                                if (i6 >= i9) {
                                    i3 = -(xpVar.b + 1);
                                    break;
                                } else {
                                    if (((int[]) xpVar.c)[i6] != iIdentityHashCode) {
                                        i3 = -(i6 + 1);
                                        break;
                                    }
                                    f1f f1fVar3 = ((f1f[]) xpVar.d)[i6];
                                    if ((f1fVar3 != null ? f1fVar3.get() : null) == dqcVar) {
                                        break;
                                    } else {
                                        i6++;
                                    }
                                }
                            }
                            i3 = i6;
                        }
                    }
                }
                if (i3 >= 0) {
                    return;
                }
            }
            int i10 = -(i3 + 1);
            f1f[] f1fVarArr = (f1f[]) xpVar.d;
            int length = f1fVarArr.length;
            if (i2 == length) {
                int i11 = length * 2;
                f1f[] f1fVarArr2 = new f1f[i11];
                int[] iArr = new int[i11];
                int i12 = i10 + 1;
                System.arraycopy(f1fVarArr, i10, f1fVarArr2, i12, i2 - i10);
                System.arraycopy((f1f[]) xpVar.d, 0, f1fVarArr2, 0, i10);
                k80.h0(i12, i10, (int[]) xpVar.c, iArr, i2);
                k80.k0(0, i10, (int[]) xpVar.c, iArr, 6);
                xpVar.d = f1fVarArr2;
                xpVar.c = iArr;
            } else {
                int i13 = i10 + 1;
                System.arraycopy(f1fVarArr, i10, f1fVarArr, i13, i2 - i10);
                int[] iArr2 = (int[]) xpVar.c;
                k80.h0(i13, i10, iArr2, iArr2, i2);
            }
            ((f1f[]) xpVar.d)[i10] = new f1f(dqcVar);
            ((int[]) xpVar.c)[i10] = iIdentityHashCode;
            xpVar.b++;
        }
    }

    public static final void r() {
        throw new IllegalStateException("Reading a state that was created after the snapshot was taken or in a snapshot that has not yet been applied");
    }

    public static final fqc s(fqc fqcVar, long j2, sic sicVar) {
        fqc fqcVar2 = null;
        while (fqcVar != null) {
            long j3 = fqcVar.a;
            if (j3 != 0 && g76.R(j3, j2) <= 0 && !sicVar.m(j3) && (fqcVar2 == null || g76.R(fqcVar2.a, fqcVar.a) < 0)) {
                fqcVar2 = fqcVar;
            }
            fqcVar = fqcVar.b;
        }
        if (fqcVar2 != null) {
            return fqcVar2;
        }
        return null;
    }

    public static final fqc t(fqc fqcVar, dqc dqcVar) {
        fqc fqcVarS;
        oic oicVarH = h();
        x45 x45VarE = oicVarH.e();
        if (x45VarE != null) {
            x45VarE.invoke(dqcVar);
        }
        fqc fqcVarS2 = s(fqcVar, oicVarH.g(), oicVarH.d());
        if (fqcVarS2 != null) {
            return fqcVarS2;
        }
        synchronized (c) {
            oic oicVarH2 = h();
            fqc fqcVarD = dqcVar.d();
            fqcVarD.getClass();
            fqcVarS = s(fqcVarD, oicVarH2.g(), oicVarH2.d());
            if (fqcVarS == null) {
                r();
                throw null;
            }
        }
        return fqcVarS;
    }

    public static final void u(int i2) {
        e4 e4Var = f;
        int i3 = ((int[]) e4Var.e)[i2];
        e4Var.h(i3, e4Var.c - 1);
        e4Var.c--;
        long[] jArr = (long[]) e4Var.a;
        long j2 = jArr[i3];
        int i4 = i3;
        while (i4 > 0) {
            int i5 = ((i4 + 1) >> 1) - 1;
            if (g76.R(jArr[i5], j2) <= 0) {
                break;
            }
            e4Var.h(i5, i4);
            i4 = i5;
        }
        long[] jArr2 = (long[]) e4Var.a;
        int i6 = e4Var.c >> 1;
        while (i3 < i6) {
            int i7 = (i3 + 1) << 1;
            int i8 = i7 - 1;
            if (i7 < e4Var.c && g76.R(jArr2[i7], jArr2[i8]) < 0) {
                if (g76.R(jArr2[i7], jArr2[i3]) >= 0) {
                    break;
                }
                e4Var.h(i7, i3);
                i3 = i7;
            } else {
                if (g76.R(jArr2[i8], jArr2[i3]) >= 0) {
                    break;
                }
                e4Var.h(i8, i3);
                i3 = i8;
            }
        }
        ((int[]) e4Var.e)[i2] = e4Var.d;
        e4Var.d = i2;
    }

    public static final Object v(sd5 sd5Var, x45 x45Var) {
        long j2 = sd5Var.b;
        Object objInvoke = x45Var.invoke(d.f(j2));
        long j3 = e;
        e = 1 + j3;
        sic sicVarF = d.f(j2);
        d = sicVarF;
        sd5Var.b = j3;
        sd5Var.a = sicVarF;
        sd5Var.g = 0;
        sd5Var.h = null;
        sd5Var.o();
        d = d.q(j3);
        return objInvoke;
    }

    public static final void w(oic oicVar) {
        long j2;
        if (d.m(oicVar.g())) {
            return;
        }
        StringBuilder sb = new StringBuilder("Snapshot is not open: snapshotId=");
        sb.append(oicVar.g());
        sb.append(", disposed=");
        sb.append(oicVar.c);
        sb.append(", applied=");
        k78 k78Var = oicVar instanceof k78 ? (k78) oicVar : null;
        sb.append(k78Var != null ? Boolean.valueOf(k78Var.m) : "read-only");
        sb.append(", lowestPin=");
        synchronized (c) {
            e4 e4Var = f;
            j2 = e4Var.c > 0 ? ((long[]) e4Var.a)[0] : -1L;
        }
        sb.append(j2);
        throw new IllegalStateException(sb.toString().toString());
    }

    public static final fqc x(fqc fqcVar, dqc dqcVar, oic oicVar) {
        fqc fqcVarS;
        if (oicVar.f()) {
            oicVar.n(dqcVar);
        }
        long jG = oicVar.g();
        fqc fqcVarS2 = s(fqcVar, jG, oicVar.d());
        if (fqcVarS2 == null) {
            r();
            throw null;
        }
        if (fqcVarS2.a == oicVar.g()) {
            return fqcVarS2;
        }
        synchronized (c) {
            fqcVarS = s(dqcVar.d(), jG, oicVar.d());
            if (fqcVarS == null) {
                r();
                throw null;
            }
            if (fqcVarS.a != jG) {
                fqc fqcVarK = k(fqcVarS, dqcVar);
                fqcVarK.a(fqcVarS);
                fqcVarK.a = oicVar.g();
                fqcVarS = fqcVarK;
            }
        }
        if (fqcVarS2.a != 1) {
            oicVar.n(dqcVar);
        }
        return fqcVarS;
    }
}
