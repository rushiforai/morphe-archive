package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ub5 {
    public static final long f;
    public static final /* synthetic */ int g = 0;
    public final ba5 a;
    public final og3 b;
    public final i79 c;
    public final cr0 d;
    public final dm4 e;

    static {
        int i = in3.d;
        f = hlg.U(10000L, mn3.MILLISECONDS);
    }

    public ub5(ba5 ba5Var, og3 og3Var, i79 i79Var, cr0 cr0Var, dm4 dm4Var) {
        cr0Var.getClass();
        dm4Var.getClass();
        this.a = ba5Var;
        this.b = og3Var;
        this.c = i79Var;
        this.d = cr0Var;
        this.e = dm4Var;
    }

    public static /* synthetic */ Object d(ub5 ub5Var, yd4 yd4Var, p92 p92Var, int i) {
        if ((i & 1) != 0) {
            yd4Var = yd4.NetworkFirst;
        }
        return ub5Var.c(yd4Var, false, p92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.nb5
            if (r0 == 0) goto L13
            r0 = r6
            nb5 r0 = (defpackage.nb5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nb5 r0 = new nb5
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r6)
            goto L46
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r6)
            ob5 r6 = new ob5
            r2 = 0
            r6.<init>(r5, r3, r2)
            r0.d = r4
            long r2 = defpackage.ub5.f
            long r2 = defpackage.gsa.p0(r2)
            java.lang.Object r6 = defpackage.wo7.A(r2, r6, r0)
            if (r6 != r1) goto L46
            return r1
        L46:
            q2a r6 = (defpackage.q2a) r6
            if (r6 != 0) goto L53
            o2a r5 = new o2a
            r6 = 2
            java.lang.String r0 = "Timed out waiting for product details"
            r5.<init>(r6, r0)
            return r5
        L53:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ub5.a(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.yd4 r5, boolean r6, defpackage.p92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.pb5
            if (r0 == 0) goto L13
            r0 = r7
            pb5 r0 = (defpackage.pb5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            pb5 r0 = new pb5
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r4 = r7.a
            goto L40
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            r0.d = r3
            i79 r4 = r4.c
            java.io.Serializable r4 = r4.b(r5, r6, r0)
            if (r4 != r1) goto L40
            return r1
        L40:
            boolean r5 = r4 instanceof defpackage.ajb
            if (r5 != 0) goto L4a
            com.medium.android.graphql.type.MembershipFrequency r4 = (com.medium.android.graphql.type.MembershipFrequency) r4
            com.medium.android.core.models.BillingPeriod r4 = defpackage.qw7.a(r4)
        L4a:
            com.medium.android.core.models.BillingPeriod r5 = com.medium.android.core.models.BillingPeriod.ONE_YEAR
            boolean r6 = r4 instanceof defpackage.ajb
            if (r6 == 0) goto L51
            return r5
        L51:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ub5.b(yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0057, code lost:
    
        if (r11 == r1) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0063, code lost:
    
        if (r11 == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.yd4 r9, boolean r10, defpackage.p92 r11) {
        /*
            r8 = this;
            boolean r0 = r11 instanceof defpackage.qb5
            if (r0 == 0) goto L13
            r0 = r11
            qb5 r0 = (defpackage.qb5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qb5 r0 = new qb5
            r0.<init>(r8, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 2
            r5 = 1
            r6 = 0
            if (r2 == 0) goto L36
            if (r2 == r5) goto L32
            if (r2 != r4) goto L2c
            defpackage.br7.v(r11)
            goto L66
        L2c:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r6
        L32:
            defpackage.br7.v(r11)
            goto L5a
        L36:
            defpackage.br7.v(r11)
            uld r11 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r3]
            java.lang.String r7 = "Get resolved membership plans config"
            defpackage.km4.I(r11, r6, r7, r2, r7)
            dm4 r11 = r8.e
            nl4 r2 = defpackage.nl4.ENABLE_MOBILE_FETCH_BACKEND_DRIVEN_DISCOUNTS
            boolean r11 = r11.b(r2)
            if (r11 == 0) goto L5d
            r0.d = r5
            oz r11 = new oz
            r11.<init>(r8, r9, r10, r6)
            java.lang.Object r11 = defpackage.o7f.s(r11, r0)
            if (r11 != r1) goto L5a
            goto L65
        L5a:
            lcb r11 = (defpackage.lcb) r11
            goto L68
        L5d:
            r0.d = r4
            java.lang.Object r11 = r8.e(r9, r10, r0)
            if (r11 != r1) goto L66
        L65:
            return r1
        L66:
            lcb r11 = (defpackage.lcb) r11
        L68:
            boolean r8 = r11 instanceof defpackage.jcb
            if (r8 == 0) goto L76
            uld r8 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r3]
            java.lang.String r10 = "Get resolved membership plans config successful"
            defpackage.km4.I(r8, r6, r10, r9, r10)
            return r11
        L76:
            boolean r8 = r11 instanceof defpackage.hcb
            if (r8 == 0) goto L8d
            r8 = r11
            hcb r8 = (defpackage.hcb) r8
            java.lang.String r8 = r8.a
            java.lang.String r9 = "Get resolved membership plans config bad request: "
            java.lang.String r8 = defpackage.ka1.r(r9, r8)
            uld r9 = defpackage.wld.a
            java.lang.Object[] r10 = new java.lang.Object[r3]
            r9.e(r6, r8, r10)
            return r11
        L8d:
            boolean r8 = r11 instanceof defpackage.kcb
            if (r8 == 0) goto La4
            r8 = r11
            kcb r8 = (defpackage.kcb) r8
            java.lang.String r8 = r8.a
            java.lang.String r9 = "Get resolved membership plans config unauthorized: "
            java.lang.String r8 = defpackage.ka1.r(r9, r8)
            uld r9 = defpackage.wld.a
            java.lang.Object[] r10 = new java.lang.Object[r3]
            r9.e(r6, r8, r10)
            return r11
        La4:
            boolean r8 = r11 instanceof defpackage.icb
            if (r8 == 0) goto Lb7
            r8 = r11
            icb r8 = (defpackage.icb) r8
            java.lang.Throwable r8 = r8.a
            uld r9 = defpackage.wld.a
            java.lang.Object[] r10 = new java.lang.Object[r3]
            java.lang.String r0 = "Get resolved membership plans config failed"
            r9.e(r8, r0, r10)
            return r11
        Lb7:
            defpackage.ygf.a()
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ub5.c(yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.yd4 r23, boolean r24, defpackage.p92 r25) {
        /*
            Method dump skipped, instruction units count: 487
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ub5.e(yd4, boolean, p92):java.lang.Object");
    }
}
