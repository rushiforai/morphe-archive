package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class q9 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ q9(int i, do4 do4Var, Object obj) {
        this.a = i;
        this.c = do4Var;
        this.b = obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x005f, code lost:
    
        if (r8.a(r7, r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object b(defpackage.n92 r7, java.lang.Object r8) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.gp4
            if (r0 == 0) goto L13
            r0 = r7
            gp4 r0 = (defpackage.gp4) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            gp4 r0 = new gp4
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L39
            if (r2 == r4) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            goto L62
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L31:
            int r6 = r0.e
            do4 r8 = r0.d
            defpackage.br7.v(r7)
            goto L55
        L39:
            defpackage.br7.v(r7)
            java.lang.Object r7 = r6.c
            do4 r7 = (defpackage.do4) r7
            java.lang.Object r6 = r6.b
            qc1 r6 = (defpackage.qc1) r6
            r0.d = r7
            r2 = 0
            r0.e = r2
            r0.c = r4
            java.lang.Object r6 = r6.invoke(r8, r0)
            if (r6 != r1) goto L52
            goto L61
        L52:
            r8 = r7
            r7 = r6
            r6 = r2
        L55:
            r0.d = r5
            r0.e = r6
            r0.c = r3
            java.lang.Object r6 = r8.a(r7, r0)
            if (r6 != r1) goto L62
        L61:
            return r1
        L62:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.b(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object c(defpackage.n92 r5, java.lang.Object r6) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.kp4
            if (r0 == 0) goto L13
            r0 = r5
            kp4 r0 = (defpackage.kp4) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            kp4 r0 = new kp4
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            java.lang.Object r6 = r0.e
            defpackage.br7.v(r5)
            goto L42
        L29:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L30:
            defpackage.br7.v(r5)
            java.lang.Object r5 = r4.b
            b55 r5 = (defpackage.b55) r5
            r0.e = r6
            r0.c = r3
            java.lang.Object r5 = r5.invoke(r6, r0)
            if (r5 != r1) goto L42
            return r1
        L42:
            java.lang.Boolean r5 = (java.lang.Boolean) r5
            boolean r5 = r5.booleanValue()
            if (r5 != 0) goto L4d
            c1e r4 = defpackage.c1e.a
            return r4
        L4d:
            java.lang.Object r5 = r4.c
            rya r5 = (defpackage.rya) r5
            r5.a = r6
            kotlinx.coroutines.flow.internal.AbortFlowException r5 = new kotlinx.coroutines.flow.internal.AbortFlowException
            r5.<init>(r4)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.c(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object d(defpackage.n92 r7, java.lang.Object r8) {
        /*
            r6 = this;
            java.lang.Object r0 = r6.b
            sx4 r0 = (defpackage.sx4) r0
            boolean r1 = r7 instanceof defpackage.rx4
            if (r1 == 0) goto L17
            r1 = r7
            rx4 r1 = (defpackage.rx4) r1
            int r2 = r1.c
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.c = r2
            goto L1c
        L17:
            rx4 r1 = new rx4
            r1.<init>(r6, r7)
        L1c:
            java.lang.Object r7 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.c
            r4 = 0
            r5 = 1
            if (r3 == 0) goto L32
            if (r3 != r5) goto L2c
            defpackage.br7.v(r7)
            goto L8b
        L2c:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r4
        L32:
            defpackage.br7.v(r7)
            java.lang.Object r6 = r6.c
            do4 r6 = (defpackage.do4) r6
            qz8 r8 = (defpackage.qz8) r8
            boolean r7 = r8 instanceof defpackage.pz8
            if (r7 == 0) goto L42
            ox4 r7 = defpackage.ox4.a
            goto L82
        L42:
            boolean r7 = r8 instanceof defpackage.nz8
            if (r7 == 0) goto L54
            nx4 r7 = new nx4
            nz8 r8 = (defpackage.nz8) r8
            java.lang.Throwable r8 = r8.a
            b24 r8 = defpackage.m4.I(r8)
            r7.<init>(r8)
            goto L82
        L54:
            boolean r7 = r8 instanceof defpackage.oz8
            if (r7 == 0) goto L8e
            oz8 r8 = (defpackage.oz8) r8
            java.util.List r7 = r8.a
            boolean r3 = r7.isEmpty()
            if (r3 != 0) goto L6d
            lx4 r0 = new lx4
            boolean r3 = r8.d
            boolean r8 = r8.c
            r0.<init>(r7, r3, r8)
            r7 = r0
            goto L82
        L6d:
            mx4 r7 = new mx4
            md5 r8 = r0.g
            java.lang.Object r8 = r8.b
            zk2 r8 = (defpackage.zk2) r8
            java.lang.String r8 = r8.m()
            java.lang.String r0 = r0.b
            boolean r8 = r8.equals(r0)
            r7.<init>(r8)
        L82:
            r1.c = r5
            java.lang.Object r6 = r6.a(r7, r1)
            if (r6 != r2) goto L8b
            return r2
        L8b:
            c1e r6 = defpackage.c1e.a
            return r6
        L8e:
            defpackage.ygf.a()
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.d(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object e(defpackage.n92 r17, java.lang.Object r18) {
        /*
            r16 = this;
            r0 = r16
            r1 = r17
            java.lang.Object r2 = r0.b
            sy4 r2 = (defpackage.sy4) r2
            java.lang.String r3 = r2.b
            boolean r4 = r1 instanceof defpackage.qy4
            if (r4 == 0) goto L1d
            r4 = r1
            qy4 r4 = (defpackage.qy4) r4
            int r5 = r4.c
            r6 = -2147483648(0xffffffff80000000, float:-0.0)
            r7 = r5 & r6
            if (r7 == 0) goto L1d
            int r5 = r5 - r6
            r4.c = r5
            goto L22
        L1d:
            qy4 r4 = new qy4
            r4.<init>(r0, r1)
        L22:
            java.lang.Object r1 = r4.b
            tb2 r5 = defpackage.tb2.COROUTINE_SUSPENDED
            int r6 = r4.c
            r7 = 0
            r8 = 1
            if (r6 == 0) goto L39
            if (r6 != r8) goto L33
            defpackage.br7.v(r1)
            goto La9
        L33:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r7
        L39:
            defpackage.br7.v(r1)
            java.lang.Object r0 = r0.c
            do4 r0 = (defpackage.do4) r0
            r1 = r18
            qz8 r1 = (defpackage.qz8) r1
            boolean r6 = r1 instanceof defpackage.pz8
            if (r6 == 0) goto L4b
            my4 r1 = defpackage.my4.a
            goto La0
        L4b:
            boolean r6 = r1 instanceof defpackage.nz8
            if (r6 == 0) goto L5e
            ly4 r2 = new ly4
            nz8 r1 = (defpackage.nz8) r1
            java.lang.Throwable r1 = r1.a
            b24 r1 = defpackage.m4.I(r1)
            r2.<init>(r1)
            r1 = r2
            goto La0
        L5e:
            boolean r6 = r1 instanceof defpackage.oz8
            if (r6 == 0) goto Lac
            oz8 r1 = (defpackage.oz8) r1
            java.util.List r6 = r1.a
            boolean r6 = r6.isEmpty()
            md5 r7 = r2.h
            if (r6 != 0) goto L8f
            java.lang.Object r6 = r7.b
            zk2 r6 = (defpackage.zk2) r6
            java.lang.String r6 = r6.m()
            boolean r13 = r6.equals(r3)
            jy4 r9 = new jy4
            java.util.List r10 = r1.a
            boolean r11 = r1.d
            boolean r12 = r1.c
            boolean r14 = r2.l
            gen.model.SourceParameter r1 = r2.k
            java.lang.String r15 = defpackage.gp7.u(r1)
            r9.<init>(r10, r11, r12, r13, r14, r15)
            r1 = r9
            goto La0
        L8f:
            ky4 r1 = new ky4
            java.lang.Object r2 = r7.b
            zk2 r2 = (defpackage.zk2) r2
            java.lang.String r2 = r2.m()
            boolean r2 = r2.equals(r3)
            r1.<init>(r2)
        La0:
            r4.c = r8
            java.lang.Object r0 = r0.a(r1, r4)
            if (r0 != r5) goto La9
            return r5
        La9:
            c1e r0 = defpackage.c1e.a
            return r0
        Lac:
            defpackage.ygf.a()
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.e(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0094, code lost:
    
        if (r13.a(r12, r0) == r1) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object f(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.qi5
            if (r0 == 0) goto L13
            r0 = r12
            qi5 r0 = (defpackage.qi5) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            qi5 r0 = new qi5
            r0.<init>(r11, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 2
            r4 = 1
            r5 = 0
            r6 = 0
            if (r2 == 0) goto L41
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2d
            defpackage.br7.v(r12)
            goto L97
        L2d:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r6
        L33:
            long r7 = r0.g
            int r11 = r0.e
            do4 r13 = r0.d
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r12 = r12.a
            goto L68
        L41:
            defpackage.br7.v(r12)
            java.lang.Object r12 = r11.c
            do4 r12 = (defpackage.do4) r12
            java.lang.Number r13 = (java.lang.Number) r13
            long r7 = r13.longValue()
            java.lang.Object r11 = r11.b
            hx4 r11 = (defpackage.hx4) r11
            java.lang.Object r11 = r11.b
            qcf r11 = (defpackage.qcf) r11
            r0.d = r12
            r0.e = r5
            r0.g = r7
            r0.c = r4
            java.io.Serializable r11 = r11.d(r0)
            if (r11 != r1) goto L65
            goto L96
        L65:
            r13 = r12
            r12 = r11
            r11 = r5
        L68:
            java.lang.Throwable r2 = defpackage.bjb.b(r12)
            if (r2 != 0) goto L7f
            java.lang.Number r12 = (java.lang.Number) r12
            long r9 = r12.longValue()
            int r12 = (r9 > r7 ? 1 : (r9 == r7 ? 0 : -1))
            if (r12 <= 0) goto L79
            goto L7a
        L79:
            r4 = r5
        L7a:
            java.lang.Boolean r12 = java.lang.Boolean.valueOf(r4)
            goto L8a
        L7f:
            uld r12 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r5]
            java.lang.String r5 = "Failed to fetch followed last published at from last followed"
            r12.e(r2, r5, r4)
            java.lang.Boolean r12 = java.lang.Boolean.FALSE
        L8a:
            r0.d = r6
            r0.e = r11
            r0.c = r3
            java.lang.Object r11 = r13.a(r12, r0)
            if (r11 != r1) goto L97
        L96:
            return r1
        L97:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.f(n92, java.lang.Object):java.lang.Object");
    }

    private final Object i(n92 n92Var, Object obj) {
        eo5 eo5Var = (eo5) obj;
        boolean zL = g76.L(eo5Var, co5.a);
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (!zL) {
            if (!g76.L(eo5Var, do5.a)) {
                ygf.a();
                return null;
            }
            kv6 kv6Var = (kv6) this.c;
            mya myaVar = kv6.y;
            Object objF = kv6Var.f(0, 0, n92Var);
            return objF == tb2.COROUTINE_SUSPENDED ? objF : c1eVar;
        }
        ap5 ap5Var = (ap5) this.b;
        long jCurrentTimeMillis = System.currentTimeMillis();
        vr7 vr7Var = ap5Var.f;
        vr7Var.getClass();
        long jL = jCurrentTimeMillis - vr7Var.l(ek6.LAST_HOME_FETCH_TIME_FEATURED, 0L);
        int i = in3.d;
        int i2 = 2;
        if (jL > in3.d(hlg.T(2, mn3.HOURS))) {
            vx0.c0(f76.F(ap5Var), null, null, new wo5(ap5Var, n92Var2, i2), 3);
        }
        vx0.c0(f76.F(ap5Var), null, null, new wo5(ap5Var, n92Var2, 1), 3);
        return c1eVar;
    }

    private final Object j(n92 n92Var, Object obj) {
        gp5 gp5Var = (gp5) obj;
        boolean zL = g76.L(gp5Var, ep5.a);
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (zL) {
            bq5 bq5Var = (bq5) this.b;
            long jCurrentTimeMillis = System.currentTimeMillis();
            vr7 vr7Var = bq5Var.f;
            vr7Var.getClass();
            long jL = jCurrentTimeMillis - vr7Var.l(ek6.LAST_HOME_FETCH_TIME_RECOMMENDED, 0L);
            int i = in3.d;
            int i2 = 2;
            if (jL > in3.d(hlg.T(2, mn3.HOURS))) {
                vx0.c0(f76.F(bq5Var), null, null, new yp5(bq5Var, n92Var2, i2), 3);
                return c1eVar;
            }
        } else {
            if (!g76.L(gp5Var, fp5.a)) {
                ygf.a();
                return null;
            }
            kv6 kv6Var = (kv6) this.c;
            mya myaVar = kv6.y;
            Object objF = kv6Var.f(0, 0, n92Var);
            if (objF == tb2.COROUTINE_SUSPENDED) {
                return objF;
            }
        }
        return c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object k(defpackage.n92 r5, java.lang.Object r6) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.wq5
            if (r0 == 0) goto L13
            r0 = r5
            wq5 r0 = (defpackage.wq5) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            wq5 r0 = new wq5
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r5)
            goto L4c
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r5)
            java.lang.Object r5 = r4.c
            do4 r5 = (defpackage.do4) r5
            java.lang.Boolean r6 = (java.lang.Boolean) r6
            r6.getClass()
            java.lang.Object r4 = r4.b
            r92 r4 = (defpackage.r92) r4
            f09 r2 = new f09
            r2.<init>(r4, r6)
            r0.c = r3
            java.lang.Object r4 = r5.a(r2, r0)
            if (r4 != r1) goto L4c
            return r1
        L4c:
            c1e r4 = defpackage.c1e.a
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.k(n92, java.lang.Object):java.lang.Object");
    }

    private final Object l(n92 n92Var, Object obj) {
        c56 c56Var = (c56) obj;
        p07 p07Var = (p07) this.c;
        x68 x68Var = (x68) this.b;
        if ((c56Var instanceof sr5) || (c56Var instanceof gr4) || (c56Var instanceof h0a)) {
            x68Var.a(c56Var);
        } else if (c56Var instanceof tr5) {
            x68Var.j(((tr5) c56Var).a);
        } else if (c56Var instanceof hr4) {
            x68Var.j(((hr4) c56Var).a);
        } else if (c56Var instanceof i0a) {
            x68Var.j(((i0a) c56Var).a);
        } else if (c56Var instanceof g0a) {
            x68Var.j(((g0a) c56Var).a);
        }
        Object[] objArr = x68Var.a;
        int i = x68Var.b;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            c56 c56Var2 = (c56) objArr[i3];
            if (c56Var2 instanceof sr5) {
                p07Var.getClass();
                i2 |= 2;
            } else if (c56Var2 instanceof gr4) {
                p07Var.getClass();
                i2 |= 1;
            } else if (c56Var2 instanceof h0a) {
                p07Var.getClass();
                i2 |= 4;
            }
        }
        p07Var.b.h(i2);
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x00ba  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object m(defpackage.n92 r11, java.lang.Object r12) {
        /*
            Method dump skipped, instruction units count: 218
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.m(n92, java.lang.Object):java.lang.Object");
    }

    private final Object n(n92 n92Var, Object obj) {
        if (((fe7) obj) == null) {
            ygf.a();
            return null;
        }
        me7 me7Var = (me7) this.b;
        Object objA = ((do4) this.c).a(new ke7(me7Var.d, me7Var.f, !r5.a), n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object o(defpackage.n92 r11, java.lang.Object r12) {
        /*
            r10 = this;
            java.lang.Object r0 = r10.b
            ai7 r0 = (defpackage.ai7) r0
            java.util.LinkedHashMap r1 = r0.b
            boolean r2 = r11 instanceof defpackage.zh7
            if (r2 == 0) goto L19
            r2 = r11
            zh7 r2 = (defpackage.zh7) r2
            int r3 = r2.c
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L19
            int r3 = r3 - r4
            r2.c = r3
            goto L1e
        L19:
            zh7 r2 = new zh7
            r2.<init>(r10, r11)
        L1e:
            java.lang.Object r11 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.c
            r5 = 1
            if (r4 == 0) goto L34
            if (r4 != r5) goto L2d
            defpackage.br7.v(r11)
            goto L8c
        L2d:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L34:
            defpackage.br7.v(r11)
            java.lang.Object r10 = r10.c
            do4 r10 = (defpackage.do4) r10
            c56 r12 = (defpackage.c56) r12
            boolean r11 = r12 instanceof defpackage.h0a
            if (r11 == 0) goto L56
            r11 = r12
            h0a r11 = (defpackage.h0a) r11
            h0a r4 = new h0a
            long r6 = r11.a
            long r8 = r0.a
            long r6 = defpackage.ip8.d(r6, r8)
            r4.<init>(r6)
            r1.put(r12, r4)
            r12 = r4
            goto L83
        L56:
            boolean r11 = r12 instanceof defpackage.g0a
            if (r11 == 0) goto L6d
            g0a r12 = (defpackage.g0a) r12
            h0a r11 = r12.a
            java.lang.Object r11 = r1.remove(r11)
            h0a r11 = (defpackage.h0a) r11
            if (r11 != 0) goto L67
            goto L83
        L67:
            g0a r12 = new g0a
            r12.<init>(r11)
            goto L83
        L6d:
            boolean r11 = r12 instanceof defpackage.i0a
            if (r11 == 0) goto L83
            i0a r12 = (defpackage.i0a) r12
            h0a r11 = r12.a
            java.lang.Object r11 = r1.remove(r11)
            h0a r11 = (defpackage.h0a) r11
            if (r11 != 0) goto L7e
            goto L83
        L7e:
            i0a r12 = new i0a
            r12.<init>(r11)
        L83:
            r2.c = r5
            java.lang.Object r10 = r10.a(r12, r2)
            if (r10 != r3) goto L8c
            return r3
        L8c:
            c1e r10 = defpackage.c1e.a
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.o(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object p(defpackage.n92 r6, java.lang.Object r7) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.xv7
            if (r0 == 0) goto L13
            r0 = r6
            xv7 r0 = (defpackage.xv7) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            xv7 r0 = new xv7
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r6)
            goto L60
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L2e:
            defpackage.br7.v(r6)
            java.lang.Object r6 = r5.c
            do4 r6 = (defpackage.do4) r6
            rj2 r7 = (defpackage.rj2) r7
            if (r7 == 0) goto L3c
            java.lang.Long r2 = r7.j
            goto L3d
        L3c:
            r2 = r4
        L3d:
            if (r7 == 0) goto L41
            java.lang.String r4 = r7.a
        L41:
            java.lang.Object r5 = r5.b
            yv7 r5 = (defpackage.yv7) r5
            java.lang.String r5 = r5.c
            boolean r5 = defpackage.g76.L(r4, r5)
            if (r5 == 0) goto L50
            sv7 r5 = defpackage.sv7.a
            goto L57
        L50:
            if (r2 == 0) goto L55
            uv7 r5 = defpackage.uv7.a
            goto L57
        L55:
            vv7 r5 = defpackage.vv7.a
        L57:
            r0.c = r3
            java.lang.Object r5 = r6.a(r5, r0)
            if (r5 != r1) goto L60
            return r1
        L60:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.p(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object q(defpackage.n92 r11, java.lang.Object r12) {
        /*
            r10 = this;
            boolean r0 = r11 instanceof defpackage.b58
            if (r0 == 0) goto L13
            r0 = r11
            b58 r0 = (defpackage.b58) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            b58 r0 = new b58
            r0.<init>(r10, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r11)
            goto L7f
        L28:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r3
        L2e:
            defpackage.br7.v(r11)
            java.lang.Object r11 = r10.c
            do4 r11 = (defpackage.do4) r11
            java.util.Set r12 = (java.util.Set) r12
            p1c r2 = new p1c
            r2.<init>()
            java.lang.Object r10 = r10.b
            java.lang.String[] r10 = (java.lang.String[]) r10
            int r5 = r10.length
            r6 = 0
        L42:
            if (r6 >= r5) goto L66
            r7 = r10[r6]
            r8 = r12
            java.lang.Iterable r8 = (java.lang.Iterable) r8
            java.util.Iterator r8 = r8.iterator()
        L4d:
            boolean r9 = r8.hasNext()
            if (r9 == 0) goto L63
            java.lang.Object r9 = r8.next()
            java.lang.String r9 = (java.lang.String) r9
            boolean r9 = defpackage.tuc.G(r7, r9, r4)
            if (r9 == 0) goto L4d
            r2.add(r7)
            goto L4d
        L63:
            int r6 = r6 + 1
            goto L42
        L66:
            p1c r10 = defpackage.qo7.k(r2)
            dh7 r12 = r10.a
            boolean r12 = r12.isEmpty()
            if (r12 == 0) goto L73
            goto L74
        L73:
            r3 = r10
        L74:
            if (r3 == 0) goto L7f
            r0.c = r4
            java.lang.Object r10 = r11.a(r3, r0)
            if (r10 != r1) goto L7f
            return r1
        L7f:
            c1e r10 = defpackage.c1e.a
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.q(n92, java.lang.Object):java.lang.Object");
    }

    private final Object r(n92 n92Var, Object obj) {
        ((l78) this.b).setValue(Boolean.TRUE);
        ((g49) this.c).h(((sl0) obj).c);
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:139:0x05b3  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x05d0  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0617  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0758  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x07e3  */
    /* JADX WARN: Removed duplicated region for block: B:273:0x0899  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x099a  */
    /* JADX WARN: Removed duplicated region for block: B:371:0x0a9b  */
    /* JADX WARN: Removed duplicated region for block: B:453:0x0cce  */
    /* JADX WARN: Removed duplicated region for block: B:454:0x0cd8  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:497:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00ff  */
    @Override // defpackage.do4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r71, defpackage.n92 r72) {
        /*
            Method dump skipped, instruction units count: 3372
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q9.a(java.lang.Object, n92):java.lang.Object");
    }

    public /* synthetic */ q9(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
