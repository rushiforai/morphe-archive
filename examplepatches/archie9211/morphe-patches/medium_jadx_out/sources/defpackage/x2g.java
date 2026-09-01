package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x2g {
    public final xgf a;
    public long c;
    public boolean e;
    public vx1 f;
    public final uz5 g;
    public zi5 b = zi5.i;
    public final a98 d = new a98();

    public x2g(uz5 uz5Var, xgf xgfVar) {
        this.g = uz5Var;
        this.a = xgfVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r11) throws java.lang.Throwable {
        /*
            r10 = this;
            boolean r0 = r11 instanceof defpackage.f2g
            if (r0 == 0) goto L13
            r0 = r11
            f2g r0 = (defpackage.f2g) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            f2g r0 = new f2g
            r0.<init>(r10, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r11)
            return r11
        L27:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2e:
            defpackage.br7.v(r11)
            long r7 = r10.c
            zhf r11 = new zhf
            r11.<init>(r7)
            xgf r10 = r10.a
            phf r5 = r10.a
            java.lang.Long r2 = java.lang.Long.valueOf(r7)
            java.lang.Object[] r4 = new java.lang.Object[r3]
            r6 = 0
            r4[r6] = r2
            jif r2 = r5.a
            java.lang.String r6 = "warmUpIntegrityToken(%s)"
            r2.b(r6, r4)
            wfd r6 = new wfd
            r6.<init>()
            lhf r4 = new lhf
            r9 = r6
            r4.<init>(r5, r6, r7, r9)
            mgf r2 = r5.e
            r2.getClass()
            mif r5 = new mif
            r5.<init>(r2, r6, r6, r4)
            android.os.Handler r2 = r2.a()
            r2.post(r5)
            mya r2 = new mya
            r4 = 28
            r2.<init>(r10, r4, r11)
            jrg r10 = r6.a
            r10.getClass()
            p7f r11 = defpackage.yfd.a
            jrg r4 = new jrg
            r4.<init>()
            l6g r5 = new l6g
            r5.<init>(r11, r2, r4)
            o72 r11 = r10.b
            r11.h(r5)
            r10.r()
            vx1 r10 = defpackage.vo7.Z(r4)
            r0.d = r3
            java.lang.Object r10 = r10.i(r0)
            if (r10 != r1) goto L95
            return r1
        L95:
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x2g.a(p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x00a5, code lost:
    
        if (r1 == r3) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r19, defpackage.p92 r20) throws java.lang.Throwable {
        /*
            r18 = this;
            r0 = r18
            r1 = r20
            boolean r2 = r1 instanceof defpackage.l2g
            if (r2 == 0) goto L17
            r2 = r1
            l2g r2 = (defpackage.l2g) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            l2g r2 = new l2g
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 2
            r6 = 1
            r7 = 0
            if (r4 == 0) goto L3c
            if (r4 == r6) goto L36
            if (r4 != r5) goto L30
            defpackage.br7.v(r1)
            goto La8
        L30:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r7
        L36:
            java.lang.String r0 = r2.e
            defpackage.br7.v(r1)
            goto L57
        L3c:
            defpackage.br7.v(r1)
            vx1 r0 = r0.f
            if (r0 == 0) goto L46
        L43:
            r1 = r19
            goto L48
        L46:
            r0 = r7
            goto L43
        L48:
            r2.e = r1
            r2.d = r6
            java.lang.Object r0 = r0.i(r2)
            if (r0 == r3) goto Lb3
            r17 = r1
            r1 = r0
            r0 = r17
        L57:
            shf r1 = (defpackage.shf) r1
            tgf r4 = defpackage.tgf.j
            if (r4 == 0) goto Lad
            gif r11 = new gif
            r11.<init>(r0, r4)
            thf r0 = r1.a
            long r12 = r1.b
            long r14 = r1.c
            phf r9 = r0.a
            java.lang.Long r0 = java.lang.Long.valueOf(r14)
            java.lang.Object[] r1 = new java.lang.Object[r6]
            r4 = 0
            r1[r4] = r0
            jif r0 = r9.a
            java.lang.String r4 = "requestExpressIntegrityToken(%s)"
            r0.b(r4, r1)
            wfd r10 = new wfd
            r10.<init>()
            mhf r8 = new mhf
            r16 = r10
            r8.<init>(r9, r10, r11, r12, r14, r16)
            mgf r0 = r9.e
            r0.getClass()
            mif r1 = new mif
            r1.<init>(r0, r10, r10, r8)
            android.os.Handler r0 = r0.a()
            r0.post(r1)
            jrg r0 = r10.a
            vx1 r0 = defpackage.vo7.Z(r0)
            r2.e = r7
            r2.d = r5
            java.lang.Object r1 = r0.i(r2)
            if (r1 != r3) goto La8
            goto Lb3
        La8:
            rhf r1 = (defpackage.rhf) r1
            java.lang.String r0 = r1.a
            return r0
        Lad:
            java.lang.String r0 = "Null verdictOptOut"
            defpackage.z72.c(r0)
            return r7
        Lb3:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x2g.b(java.lang.String, p92):java.lang.Object");
    }
}
