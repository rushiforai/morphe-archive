package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hwb extends b2 {
    public static final zw t = new zw(0.0f);
    public static final zw u = new zw(1.0f);
    public final k49 c;
    public final k49 d;
    public Object e;
    public dsd f;
    public long g;
    public final i5b h;
    public gjc i;
    public final g49 j;
    public x51 k;
    public final a98 l;
    public final a88 m;
    public long n;
    public final x68 o;
    public awb p;
    public final zvb q;
    public float r;
    public final zvb s;

    /* JADX WARN: Type inference failed for: r3v6, types: [zvb] */
    /* JADX WARN: Type inference failed for: r3v7, types: [zvb] */
    public hwb(ba8 ba8Var) {
        super(6);
        this.c = qo7.u(ba8Var);
        this.d = qo7.u(ba8Var);
        this.e = ba8Var;
        this.h = new i5b(17, this);
        this.j = new g49(0.0f);
        this.l = new a98();
        this.m = new a88();
        this.n = Long.MIN_VALUE;
        this.o = new x68();
        final int i = 0;
        this.q = new x45(this) { // from class: zvb
            public final /* synthetic */ hwb b;

            {
                this.b = this;
            }

            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                int i2 = i;
                c1e c1eVar = c1e.a;
                hwb hwbVar = this.b;
                long jLongValue = ((Long) obj).longValue();
                switch (i2) {
                    case 0:
                        hwbVar.n = jLongValue;
                        break;
                    default:
                        long j = jLongValue - hwbVar.n;
                        hwbVar.n = jLongValue;
                        long jX0 = nk7.x0(j / ((double) hwbVar.r));
                        x68 x68Var = hwbVar.o;
                        if (x68Var.i()) {
                            Object[] objArr = x68Var.a;
                            int i3 = x68Var.b;
                            int i4 = 0;
                            for (int i5 = 0; i5 < i3; i5++) {
                                awb awbVar = (awb) objArr[i5];
                                hwb.z0(awbVar, jX0);
                                awbVar.c = true;
                            }
                            dsd dsdVar = hwbVar.f;
                            if (dsdVar != null) {
                                dsdVar.o();
                            }
                            int i6 = x68Var.b;
                            Object[] objArr2 = x68Var.a;
                            n46 n46VarW = iq7.W(0, i6);
                            int i7 = n46VarW.a;
                            int i8 = n46VarW.b;
                            if (i7 <= i8) {
                                while (true) {
                                    objArr2[i7 - i4] = objArr2[i7];
                                    if (((awb) objArr2[i7]).c) {
                                        i4++;
                                    }
                                    if (i7 != i8) {
                                        i7++;
                                    }
                                }
                            }
                            k80.o0(i6 - i4, i6, null, objArr2);
                            x68Var.b -= i4;
                        }
                        awb awbVar2 = hwbVar.p;
                        if (awbVar2 != null) {
                            awbVar2.g = hwbVar.g;
                            hwb.z0(awbVar2, jX0);
                            hwbVar.D0(awbVar2.d);
                            if (awbVar2.d == 1.0f) {
                                hwbVar.p = null;
                            }
                            hwbVar.C0();
                        }
                        break;
                }
                return c1eVar;
            }
        };
        final int i2 = 1;
        this.s = new x45(this) { // from class: zvb
            public final /* synthetic */ hwb b;

            {
                this.b = this;
            }

            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                int i22 = i2;
                c1e c1eVar = c1e.a;
                hwb hwbVar = this.b;
                long jLongValue = ((Long) obj).longValue();
                switch (i22) {
                    case 0:
                        hwbVar.n = jLongValue;
                        break;
                    default:
                        long j = jLongValue - hwbVar.n;
                        hwbVar.n = jLongValue;
                        long jX0 = nk7.x0(j / ((double) hwbVar.r));
                        x68 x68Var = hwbVar.o;
                        if (x68Var.i()) {
                            Object[] objArr = x68Var.a;
                            int i3 = x68Var.b;
                            int i4 = 0;
                            for (int i5 = 0; i5 < i3; i5++) {
                                awb awbVar = (awb) objArr[i5];
                                hwb.z0(awbVar, jX0);
                                awbVar.c = true;
                            }
                            dsd dsdVar = hwbVar.f;
                            if (dsdVar != null) {
                                dsdVar.o();
                            }
                            int i6 = x68Var.b;
                            Object[] objArr2 = x68Var.a;
                            n46 n46VarW = iq7.W(0, i6);
                            int i7 = n46VarW.a;
                            int i8 = n46VarW.b;
                            if (i7 <= i8) {
                                while (true) {
                                    objArr2[i7 - i4] = objArr2[i7];
                                    if (((awb) objArr2[i7]).c) {
                                        i4++;
                                    }
                                    if (i7 != i8) {
                                        i7++;
                                    }
                                }
                            }
                            k80.o0(i6 - i4, i6, null, objArr2);
                            x68Var.b -= i4;
                        }
                        awb awbVar2 = hwbVar.p;
                        if (awbVar2 != null) {
                            awbVar2.g = hwbVar.g;
                            hwb.z0(awbVar2, jX0);
                            hwbVar.D0(awbVar2.d);
                            if (awbVar2.d == 1.0f) {
                                hwbVar.p = null;
                            }
                            hwbVar.C0();
                        }
                        break;
                }
                return c1eVar;
            }
        };
    }

    public static void z0(awb awbVar, long j) {
        long j2 = awbVar.a + j;
        awbVar.a = j2;
        long j3 = awbVar.h;
        if (j2 >= j3) {
            awbVar.d = 1.0f;
            return;
        }
        mre mreVar = awbVar.b;
        zw zwVar = awbVar.e;
        if (mreVar == null) {
            float f = j2 / j3;
            awbVar.d = (f * 1.0f) + ((1.0f - f) * zwVar.a(0));
            return;
        }
        zw zwVar2 = awbVar.f;
        if (zwVar2 == null) {
            zwVar2 = t;
        }
        awbVar.d = iq7.u(((zw) mreVar.r(j2, zwVar, u, zwVar2)).a(0), 0.0f, 1.0f);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object A0(defpackage.p92 r12) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.cwb
            if (r0 == 0) goto L13
            r0 = r12
            cwb r0 = (defpackage.cwb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            cwb r0 = new cwb
            r0.<init>(r11, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            x68 r3 = r11.o
            r4 = 2
            r5 = 1
            r6 = -9223372036854775808
            c1e r8 = defpackage.c1e.a
            if (r2 == 0) goto L38
            if (r2 == r5) goto L34
            if (r2 != r4) goto L2d
            goto L34
        L2d:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L34:
            defpackage.br7.v(r12)
            goto L72
        L38:
            defpackage.br7.v(r12)
            boolean r12 = r3.h()
            if (r12 == 0) goto L46
            awb r12 = r11.p
            if (r12 != 0) goto L46
            return r8
        L46:
            ib2 r12 = r0.getContext()
            float r12 = defpackage.tr7.s(r12)
            r2 = 0
            int r12 = (r12 > r2 ? 1 : (r12 == r2 ? 0 : -1))
            if (r12 != 0) goto L59
            r11.x0()
            r11.n = r6
            return r8
        L59:
            long r9 = r11.n
            int r12 = (r9 > r6 ? 1 : (r9 == r6 ? 0 : -1))
            if (r12 != 0) goto L72
            r0.d = r5
            ib2 r12 = r0.getContext()
            ft r12 = defpackage.gr7.o(r12)
            zvb r2 = r11.q
            java.lang.Object r12 = r12.a(r2, r0)
            if (r12 != r1) goto L72
            goto L88
        L72:
            boolean r12 = r3.i()
            if (r12 != 0) goto L80
            awb r12 = r11.p
            if (r12 == 0) goto L7d
            goto L80
        L7d:
            r11.n = r6
            return r8
        L80:
            r0.d = r4
            java.lang.Object r12 = r11.w0(r0)
            if (r12 != r1) goto L72
        L88:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hwb.A0(p92):java.lang.Object");
    }

    public final Object B0(float f, Object obj, p4d p4dVar) {
        if (0.0f > f || f > 1.0f) {
            zx9.a("Expecting fraction between 0 and 1. Got " + f);
        }
        dsd dsdVar = this.f;
        if (dsdVar != null) {
            Object objA = a88.a(this.m, new ewb(obj, this.c.getValue(), this, dsdVar, f, null), p4dVar);
            if (objA == tb2.COROUTINE_SUSPENDED) {
                return objA;
            }
        }
        return c1e.a;
    }

    public final void C0() {
        dsd dsdVar = this.f;
        if (dsdVar == null) {
            return;
        }
        dsdVar.l(nk7.x0(((double) this.j.g()) * ((Number) dsdVar.l.getValue()).longValue()));
    }

    public final void D0(float f) {
        this.j.h(f);
    }

    public final void E0(gjc gjcVar) {
        o19 o19Var;
        if (g76.L(this.i, gjcVar)) {
            return;
        }
        gjc gjcVar2 = this.i;
        if (gjcVar2 != null) {
            gjcVar2.b(this);
        }
        gjc gjcVar3 = this.i;
        if (gjcVar3 != null && (o19Var = gjcVar3.h) != null) {
            o19Var.b();
        }
        this.i = gjcVar;
        if (gjcVar != null) {
            gjcVar.e();
        }
        gjc gjcVar4 = this.i;
        if (gjcVar4 != null) {
            gjcVar4.d(this, k40.m, this.h);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object F0(defpackage.p92 r9) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.fwb
            if (r0 == 0) goto L13
            r0 = r9
            fwb r0 = (defpackage.fwb) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            fwb r0 = new fwb
            r0.<init>(r8, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            a98 r4 = r8.l
            r5 = 2
            r6 = 1
            if (r2 == 0) goto L3c
            if (r2 == r6) goto L35
            if (r2 != r5) goto L2f
            java.lang.Object r0 = r0.b
            defpackage.br7.v(r9)
            goto L6f
        L2f:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r3
        L35:
            java.lang.Object r2 = r0.b
            defpackage.br7.v(r9)
            r9 = r2
            goto L50
        L3c:
            defpackage.br7.v(r9)
            k49 r9 = r8.c
            java.lang.Object r9 = r9.getValue()
            r0.b = r9
            r0.e = r6
            java.lang.Object r2 = r4.m(r0, r3)
            if (r2 != r1) goto L50
            goto L6b
        L50:
            r0.b = r9
            r0.e = r5
            x51 r2 = new x51
            n92 r0 = defpackage.pwd.Q(r0)
            r2.<init>(r6, r0)
            r2.s()
            r8.k = r2
            r4.f(r3)
            java.lang.Object r0 = r2.q()
            if (r0 != r1) goto L6c
        L6b:
            return r1
        L6c:
            r7 = r0
            r0 = r9
            r9 = r7
        L6f:
            boolean r9 = defpackage.g76.L(r9, r0)
            if (r9 == 0) goto L78
            c1e r8 = defpackage.c1e.a
            return r8
        L78:
            r0 = -9223372036854775808
            r8.n = r0
            java.util.concurrent.CancellationException r8 = new java.util.concurrent.CancellationException
            java.lang.String r9 = "targetState while waiting for composition"
            r8.<init>(r9)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hwb.F0(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object G0(defpackage.p92 r9) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.gwb
            if (r0 == 0) goto L13
            r0 = r9
            gwb r0 = (defpackage.gwb) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            gwb r0 = new gwb
            r0.<init>(r8, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 2
            a98 r5 = r8.l
            r6 = 1
            if (r2 == 0) goto L3c
            if (r2 == r6) goto L35
            if (r2 != r4) goto L2f
            java.lang.Object r0 = r0.b
            defpackage.br7.v(r9)
            goto L7b
        L2f:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r3
        L35:
            java.lang.Object r2 = r0.b
            defpackage.br7.v(r9)
            r9 = r2
            goto L50
        L3c:
            defpackage.br7.v(r9)
            k49 r9 = r8.c
            java.lang.Object r9 = r9.getValue()
            r0.b = r9
            r0.e = r6
            java.lang.Object r2 = r5.m(r0, r3)
            if (r2 != r1) goto L50
            goto L77
        L50:
            java.lang.Object r2 = r8.e
            boolean r2 = defpackage.g76.L(r9, r2)
            if (r2 == 0) goto L5c
            r5.f(r3)
            goto L81
        L5c:
            r0.b = r9
            r0.e = r4
            x51 r2 = new x51
            n92 r0 = defpackage.pwd.Q(r0)
            r2.<init>(r6, r0)
            r2.s()
            r8.k = r2
            r5.f(r3)
            java.lang.Object r0 = r2.q()
            if (r0 != r1) goto L78
        L77:
            return r1
        L78:
            r7 = r0
            r0 = r9
            r9 = r7
        L7b:
            boolean r1 = defpackage.g76.L(r9, r0)
            if (r1 == 0) goto L84
        L81:
            c1e r8 = defpackage.c1e.a
            return r8
        L84:
            r1 = -9223372036854775808
            r8.n = r1
            java.util.concurrent.CancellationException r8 = new java.util.concurrent.CancellationException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = "snapTo() was canceled because state was changed to "
            r1.<init>(r2)
            r1.append(r9)
            java.lang.String r9 = " instead of "
            r1.append(r9)
            r1.append(r0)
            java.lang.String r9 = r1.toString()
            r8.<init>(r9)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hwb.G0(p92):java.lang.Object");
    }

    @Override // defpackage.b2
    public final Object o0() {
        return this.d.getValue();
    }

    @Override // defpackage.b2
    public final Object q0() {
        return this.c.getValue();
    }

    @Override // defpackage.b2
    public final void t0(Object obj) {
        this.d.setValue(obj);
    }

    @Override // defpackage.b2
    public final void u0(dsd dsdVar) {
        dsd dsdVar2 = this.f;
        if (dsdVar2 != null && dsdVar != dsdVar2) {
            zx9.b("An instance of SeekableTransitionState has been used in different Transitions. Previous instance: " + this.f + ", new instance: " + dsdVar);
        }
        this.f = dsdVar;
    }

    @Override // defpackage.b2
    public final void v0() {
        this.f = null;
        gjc gjcVar = this.i;
        if (gjcVar != null) {
            gjcVar.b(this);
        }
    }

    public final Object w0(p92 p92Var) {
        float fS = tr7.s(p92Var.getContext());
        c1e c1eVar = c1e.a;
        if (fS <= 0.0f) {
            x0();
            return c1eVar;
        }
        this.r = fS;
        Object objA = gr7.o(p92Var.getContext()).a(this.s, p92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1eVar;
    }

    public final void x0() {
        dsd dsdVar = this.f;
        if (dsdVar != null) {
            dsdVar.c();
        }
        this.o.d();
        if (this.p != null) {
            this.p = null;
            D0(1.0f);
            C0();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void y0() {
        /*
            r10 = this;
            dsd r0 = r10.f
            if (r0 != 0) goto L5
            return
        L5:
            awb r1 = r10.p
            r2 = 0
            if (r1 != 0) goto L5e
            long r3 = r10.g
            r5 = 0
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 <= 0) goto L5d
            g49 r1 = r10.j
            float r3 = r1.g()
            r4 = 1065353216(0x3f800000, float:1.0)
            int r3 = (r3 > r4 ? 1 : (r3 == r4 ? 0 : -1))
            if (r3 != 0) goto L1f
            goto L5d
        L1f:
            k49 r3 = r10.d
            java.lang.Object r3 = r3.getValue()
            k49 r4 = r10.c
            java.lang.Object r4 = r4.getValue()
            boolean r3 = defpackage.g76.L(r3, r4)
            if (r3 == 0) goto L32
            goto L5d
        L32:
            awb r3 = new awb
            r3.<init>()
            float r4 = r1.g()
            r3.d = r4
            long r4 = r10.g
            r3.g = r4
            double r4 = (double) r4
            float r6 = r1.g()
            double r6 = (double) r6
            r8 = 4607182418800017408(0x3ff0000000000000, double:1.0)
            double r8 = r8 - r6
            double r8 = r8 * r4
            long r4 = defpackage.nk7.x0(r8)
            r3.h = r4
            r4 = 0
            float r1 = r1.g()
            zw r5 = r3.e
            r5.e(r4, r1)
            r1 = r3
            goto L5e
        L5d:
            r1 = r2
        L5e:
            if (r1 == 0) goto L6c
            long r3 = r10.g
            r1.g = r3
            x68 r3 = r10.o
            r3.a(r1)
            r0.m(r1)
        L6c:
            r10.p = r2
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hwb.y0():void");
    }
}
