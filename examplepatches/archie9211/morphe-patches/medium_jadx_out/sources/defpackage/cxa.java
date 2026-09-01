package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cxa {
    public final mn a;
    public final xp b;
    public final jld c;
    public final x68 d;
    public boolean e;
    public boolean f;
    public boolean g;
    public wm h;
    public long i;
    public final bd9 j;
    public final e78 k;

    public cxa(mn mnVar) {
        this.a = mnVar;
        xp xpVar = new xp((char) 0, 11);
        xpVar.c = new long[192];
        xpVar.d = new long[192];
        this.b = xpVar;
        this.c = new jld();
        this.d = new x68();
        this.i = -1L;
        this.j = new bd9(7, this);
        this.k = new e78();
    }

    public static boolean c(eh8 eh8Var) {
        lx8 lx8Var = eh8Var.L;
        return (lx8Var == null || qk7.u(((rf5) lx8Var).b())) ? false : true;
    }

    public static long e(aq6 aq6Var) {
        hj0 hj0Var = aq6Var.F;
        eh8 eh8Var = (eh8) hj0Var.e;
        long jD = 0;
        for (eh8 eh8Var2 = (l26) hj0Var.d; eh8Var2 != null && eh8Var2 != eh8Var; eh8Var2 = eh8Var2.q) {
            if (c(eh8Var2)) {
                return 9223372034707292159L;
            }
            jD = k46.d(jD, eh8Var2.z);
        }
        return jD;
    }

    public static void h(aq6 aq6Var) {
        if (!aq6Var.c || c((eh8) aq6Var.F.e)) {
            return;
        }
        aq6Var.c = false;
        if (aq6Var.e) {
            aq6Var.d = e(aq6Var);
            aq6Var.e = false;
        }
        if (k46.b(aq6Var.d, 9223372034707292159L)) {
            return;
        }
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            h((aq6) objArr[i2]);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:112:0x0267  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x027d  */
    /* JADX WARN: Removed duplicated region for block: B:149:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0192  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0224  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x022c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            Method dump skipped, instruction units count: 641
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cxa.a():void");
    }

    public final long b(aq6 aq6Var) {
        long j;
        int i = aq6Var.b & 33554431;
        xp xpVar = this.b;
        long[] jArr = (long[]) xpVar.c;
        int i2 = xpVar.b;
        for (int i3 = 0; i3 < jArr.length - 2 && i3 < i2; i3 += 3) {
            if ((((int) jArr[i3 + 2]) & 33554431) == i) {
                j = jArr[i3];
                break;
            }
        }
        j = Long.MAX_VALUE;
        if (j == Long.MAX_VALUE) {
            return 9223372034707292159L;
        }
        return (((long) ((int) j)) & 4294967295L) | (((long) ((int) (j >> 32))) << 32);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0105  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(defpackage.aq6 r23) {
        /*
            Method dump skipped, instruction units count: 323
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cxa.d(aq6):void");
    }

    public final void f(aq6 aq6Var) {
        long j;
        boolean zI = aq6Var.I();
        hj0 hj0Var = aq6Var.F;
        if (zI && aq6Var.f) {
            aq6 aq6VarV = aq6Var.v();
            if (aq6VarV == null || aq6VarV.c) {
                j = aq6VarV == null ? 0L : 9223372034707292159L;
            } else {
                if (aq6VarV.e) {
                    aq6VarV.e = false;
                    aq6VarV.d = e(aq6VarV);
                }
                j = aq6VarV.d;
            }
            eh8 eh8Var = (eh8) hj0Var.e;
            if (k46.b(j, 9223372034707292159L) || c(eh8Var)) {
                d(aq6Var);
            } else if (aq6Var.c) {
                d(aq6Var);
                h(aq6Var);
            } else {
                long jD = k46.d(j, eh8Var.z);
                yk7 yk7Var = aq6Var.G.p;
                int iR = yk7Var.R();
                int iP = yk7Var.P();
                int i = aq6Var.b;
                boolean z = aq6Var.g;
                xp xpVar = this.b;
                long j2 = 4294967295L;
                if (!z) {
                    aq6Var.g = true;
                    boolean zE = hj0Var.e(1024);
                    boolean zE2 = hj0Var.e(16);
                    boolean zA = this.c.a.a(i);
                    if (aq6VarV != null) {
                        int i2 = aq6VarV.b;
                        int i3 = (int) (jD >> 32);
                        int i4 = (int) (jD & 4294967295L);
                        int i5 = i & 33554431;
                        long[] jArr = (long[]) xpVar.c;
                        int i6 = xpVar.b - 3;
                        while (true) {
                            if (i6 < 0) {
                                break;
                            }
                            if ((((int) jArr[i6 + 2]) & 33554431) == i2) {
                                long j3 = jArr[i6];
                                int i7 = ((int) (j3 >> 32)) + i3;
                                int i8 = ((int) j3) + i4;
                                xpVar.w(i5, i7, i8, i7 + iR, i8 + iP, i2, zE, zE2, zA, i6);
                                break;
                            }
                            i6 -= 3;
                        }
                    } else {
                        int i9 = (int) (jD >> 32);
                        int i10 = (int) (jD & 4294967295L);
                        xp.x(xpVar, i, i9, i10, i9 + iR, i10 + iP, 0, zE, zE2, zA, 544);
                    }
                } else if (aq6VarV != null) {
                    int i11 = aq6VarV.b;
                    int i12 = (int) (jD >> 32);
                    int i13 = (int) (jD & 4294967295L);
                    int i14 = i & 33554431;
                    long[] jArr2 = (long[]) xpVar.c;
                    int i15 = xpVar.b;
                    int i16 = 0;
                    while (true) {
                        if (i16 >= jArr2.length - 2 || i16 >= i15) {
                            break;
                        }
                        long j4 = j2;
                        if ((((int) jArr2[i16 + 2]) & 33554431) == i11) {
                            long j5 = jArr2[i16];
                            int i17 = ((int) (j5 >> 32)) + i12;
                            int i18 = ((int) j5) + i13;
                            int i19 = i17 + iR;
                            int i20 = i18 + iP;
                            i16 += 3;
                            while (i16 < jArr2.length - 2 && i16 < i15) {
                                int i21 = i16 + 2;
                                int i22 = i11;
                                int i23 = i12;
                                long j6 = jArr2[i21];
                                int i24 = i13;
                                if ((((int) j6) & 33554431) == i14) {
                                    long j7 = jArr2[i16];
                                    long[] jArr3 = jArr2;
                                    int i25 = i17 - ((int) (j7 >> 32));
                                    int i26 = i18 - ((int) j7);
                                    jArr3[i16] = (((long) i18) & j4) | (((long) i17) << 32);
                                    jArr3[i16 + 1] = (((long) i19) << 32) | (((long) i20) & j4);
                                    jArr3[i21] = j6 | (((j6 >> 63) & 1) << 60);
                                    if (i25 != 0 || i26 != 0) {
                                        int i27 = axa.b;
                                        xpVar.E(i25, i26, (j6 & (-1125899873288193L)) | (((long) ((i16 + 3) & 33554431)) << 25));
                                    }
                                } else {
                                    i16 += 3;
                                    i11 = i22;
                                    i12 = i23;
                                    i13 = i24;
                                }
                            }
                        }
                        i16 += 3;
                        jArr2 = jArr2;
                        j2 = j4;
                        i11 = i11;
                        i12 = i12;
                        i13 = i13;
                    }
                } else {
                    int i28 = (int) (jD >> 32);
                    int i29 = (int) (jD & 4294967295L);
                    int i30 = iR + i28;
                    int i31 = i29 + iP;
                    int i32 = i & 33554431;
                    long[] jArr4 = (long[]) xpVar.c;
                    int i33 = xpVar.b;
                    int i34 = 0;
                    while (true) {
                        if (i34 >= jArr4.length - 2 || i34 >= i33) {
                            break;
                        }
                        int i35 = i34 + 2;
                        long j8 = jArr4[i35];
                        if ((((int) j8) & 33554431) == i32) {
                            long j9 = jArr4[i34];
                            int i36 = i34;
                            jArr4[i36] = (((long) i28) << 32) | (((long) i29) & 4294967295L);
                            jArr4[i36 + 1] = (((long) i30) << 32) | (((long) i31) & 4294967295L);
                            jArr4[i35] = (((j8 >> 63) & 1) << 60) | j8;
                            int i37 = i28 - ((int) (j9 >> 32));
                            int i38 = i29 - ((int) j9);
                            if ((i37 != 0) | (i38 != 0)) {
                                int i39 = axa.b;
                                xpVar.E(i37, i38, (j8 & (-1125899873288193L)) | (((long) ((i36 + 3) & 33554431)) << 25));
                            }
                        } else {
                            i34 += 3;
                        }
                    }
                }
            }
            aq6Var.f = false;
            this.e = true;
            i();
        }
    }

    public final void g(aq6 aq6Var) {
        if (aq6Var.g) {
            int i = aq6Var.b & 33554431;
            xp xpVar = this.b;
            long[] jArr = (long[]) xpVar.c;
            int i2 = xpVar.b;
            int i3 = 0;
            while (true) {
                if (i3 >= jArr.length - 2 || i3 >= i2) {
                    break;
                }
                int i4 = i3 + 2;
                if ((((int) jArr[i4]) & 33554431) == i) {
                    jArr[i3] = -1;
                    jArr[i3 + 1] = -1;
                    jArr[i4] = axa.a;
                    break;
                }
                i3 += 3;
            }
            aq6Var.g = false;
            aq6Var.f = true;
            this.e = true;
            this.g = true;
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final void i() {
        wm wmVar = this.h;
        boolean z = wmVar != null;
        long j = this.c.c;
        if (j >= 0 || !z) {
            if (this.i == j && z) {
                return;
            }
            mn mnVar = this.a;
            if (wmVar != null) {
                if (!y30.C(wmVar)) {
                    wmVar = null;
                }
                if (wmVar != null) {
                    mnVar.removeCallbacks(wmVar);
                }
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            long jMax = Math.max(j, 16 + jCurrentTimeMillis);
            this.i = jMax;
            wm wmVar2 = new wm(0, this.j);
            mnVar.postDelayed(wmVar2, jMax - jCurrentTimeMillis);
            this.h = wmVar2;
        }
    }
}
