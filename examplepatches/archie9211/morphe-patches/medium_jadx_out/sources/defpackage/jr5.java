package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jr5 {
    public int a;
    public float b;
    public final Object c;

    public jr5(ojd ojdVar) {
        this.c = ojdVar;
        this.a = -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public float a(int r6, boolean r7, boolean r8, boolean r9) {
        /*
            r5 = this;
            java.lang.Object r0 = r5.c
            ojd r0 = (defpackage.ojd) r0
            r1 = 1
            r2 = 0
            if (r7 == 0) goto L1d
            android.text.Layout r3 = r0.f
            int r3 = defpackage.w2g.u(r3, r6, r7)
            android.text.Layout r4 = r0.f
            int r4 = r4.getLineStart(r3)
            int r3 = r0.f(r3)
            if (r6 == r4) goto L1f
            if (r6 != r3) goto L1d
            goto L1f
        L1d:
            r3 = r2
            goto L20
        L1f:
            r3 = r1
        L20:
            int r4 = r6 * 4
            if (r9 == 0) goto L28
            if (r3 == 0) goto L2d
            r1 = r2
            goto L2d
        L28:
            if (r3 == 0) goto L2c
            r1 = 2
            goto L2d
        L2c:
            r1 = 3
        L2d:
            int r4 = r4 + r1
            int r1 = r5.a
            if (r1 != r4) goto L35
            float r5 = r5.b
            return r5
        L35:
            if (r9 == 0) goto L3c
            float r6 = r0.h(r6, r7)
            goto L40
        L3c:
            float r6 = r0.i(r6, r7)
        L40:
            if (r8 == 0) goto L46
            r5.a = r4
            r5.b = r6
        L46:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jr5.a(int, boolean, boolean, boolean):float");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(float r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.f3b
            if (r0 == 0) goto L13
            r0 = r6
            f3b r0 = (defpackage.f3b) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            f3b r0 = new f3b
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)
            goto L43
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            java.lang.Object r6 = r4.c
            jk r6 = (defpackage.jk) r6
            java.lang.Float r2 = new java.lang.Float
            r2.<init>(r5)
            r0.d = r3
            java.lang.Object r6 = r6.invoke(r2, r0)
            if (r6 != r1) goto L43
            return r1
        L43:
            java.lang.Number r6 = (java.lang.Number) r6
            float r5 = r6.floatValue()
            float r6 = r4.b
            float r6 = r6 + r5
            r4.b = r6
            c1e r4 = defpackage.c1e.a
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jr5.b(float, p92):java.lang.Object");
    }

    public jr5(int i, jk jkVar) {
        this.a = i;
        this.c = jkVar;
    }
}
