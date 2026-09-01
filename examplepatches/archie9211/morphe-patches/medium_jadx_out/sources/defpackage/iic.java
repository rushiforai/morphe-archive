package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iic implements dn4 {
    public final mic a;
    public final xv2 b;
    public final ww c;

    public iic(mic micVar, xv2 xv2Var, ww wwVar) {
        this.a = micVar;
        this.b = xv2Var;
        this.c = wwVar;
    }

    @Override // defpackage.dn4
    public final Object a(xrb xrbVar, float f, n92 n92Var) {
        return c(xrbVar, f, o7f.q, (p92) n92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.xrb r11, float r12, defpackage.x45 r13, defpackage.p92 r14) throws java.lang.Throwable {
        /*
            r10 = this;
            boolean r0 = r14 instanceof defpackage.eic
            if (r0 == 0) goto L13
            r0 = r14
            eic r0 = (defpackage.eic) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            eic r0 = new eic
            r0.<init>(r10, r14)
        L18:
            java.lang.Object r14 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            x45 r13 = r0.b
            defpackage.br7.v(r14)
            goto L4b
        L29:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L30:
            defpackage.br7.v(r14)
            ff3 r14 = defpackage.w2g.q
            av r4 = new av
            r9 = 0
            r5 = r10
            r8 = r11
            r6 = r12
            r7 = r13
            r4.<init>(r5, r6, r7, r8, r9)
            r0.b = r7
            r0.e = r3
            java.lang.Object r14 = defpackage.vx0.m0(r14, r4, r0)
            if (r14 != r1) goto L4a
            return r1
        L4a:
            r13 = r7
        L4b:
            tw r14 = (defpackage.tw) r14
            java.lang.Float r10 = new java.lang.Float
            r11 = 0
            r10.<init>(r11)
            r13.invoke(r10)
            return r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iic.b(xrb, float, x45, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.xrb r5, float r6, defpackage.x45 r7, defpackage.p92 r8) throws java.lang.Throwable {
        /*
            r4 = this;
            boolean r0 = r8 instanceof defpackage.gic
            if (r0 == 0) goto L13
            r0 = r8
            gic r0 = (defpackage.gic) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gic r0 = new gic
            r0.<init>(r4, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)
            goto L3a
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r8)
            r0.d = r3
            java.lang.Object r8 = r4.b(r5, r6, r7, r0)
            if (r8 != r1) goto L3a
            return r1
        L3a:
            tw r8 = (defpackage.tw) r8
            java.lang.Float r4 = r8.a
            float r4 = r4.floatValue()
            xw r5 = r8.b
            r6 = 0
            int r4 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r4 != 0) goto L4a
            goto L54
        L4a:
            java.lang.Object r4 = r5.c()
            java.lang.Number r4 = (java.lang.Number) r4
            float r6 = r4.floatValue()
        L54:
            java.lang.Float r4 = new java.lang.Float
            r4.<init>(r6)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iic.c(xrb, float, x45, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.xrb r6, float r7, float r8, defpackage.fic r9, defpackage.p92 r10) {
        /*
            r5 = this;
            boolean r0 = r10 instanceof defpackage.hic
            if (r0 == 0) goto L14
            r0 = r10
            hic r0 = (defpackage.hic) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r10 = r0
            goto L1a
        L14:
            hic r0 = new hic
            r0.<init>(r5, r10)
            goto L12
        L1a:
            java.lang.Object r0 = r10.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r10.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            defpackage.br7.v(r0)
            goto L82
        L29:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L30:
            defpackage.br7.v(r0)
            float r0 = java.lang.Math.abs(r7)
            r2 = 0
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            r4 = 28
            if (r0 != 0) goto L3f
            goto L47
        L3f:
            float r0 = java.lang.Math.abs(r8)
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 != 0) goto L4c
        L47:
            xw r5 = defpackage.g76.e(r7, r8, r4)
            return r5
        L4c:
            r10.d = r3
            xv2 r0 = r5.b
            float r2 = defpackage.g76.O(r0, r2, r8)
            float r2 = java.lang.Math.abs(r2)
            float r3 = java.lang.Math.abs(r7)
            int r2 = (r2 > r3 ? 1 : (r2 == r3 ? 0 : -1))
            if (r2 < 0) goto L67
            zg7 r5 = new zg7
            r5.<init>(r4, r0)
        L65:
            r0 = r7
            goto L70
        L67:
            qlb r0 = new qlb
            ww r5 = r5.c
            r0.<init>(r5)
            r5 = r0
            goto L65
        L70:
            java.lang.Float r7 = new java.lang.Float
            r7.<init>(r0)
            r0 = r8
            java.lang.Float r8 = new java.lang.Float
            r8.<init>(r0)
            java.lang.Object r0 = r5.C(r6, r7, r8, r9, r10)
            if (r0 != r1) goto L82
            return r1
        L82:
            tw r0 = (defpackage.tw) r0
            xw r5 = r0.b
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iic.d(xrb, float, float, fic, p92):java.lang.Object");
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof iic)) {
            return false;
        }
        iic iicVar = (iic) obj;
        return g76.L(iicVar.c, this.c) && g76.L(iicVar.b, this.b) && iicVar.a.equals(this.a);
    }

    public final int hashCode() {
        return this.a.hashCode() + ((this.b.hashCode() + (this.c.hashCode() * 31)) * 31);
    }
}
