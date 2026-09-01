package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class un4 {
    public float a;
    public float b;
    public float c;
    public float d;
    public final ou e;
    public c56 f;
    public c56 g;

    public un4(float f, float f2, float f3, float f4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
        this.e = new ou(new vj3(f), d46.k, null, 12);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r5v2, types: [c1e, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.c56 r6, defpackage.p92 r7) {
        /*
            r5 = this;
            ou r0 = r5.e
            boolean r1 = r7 instanceof defpackage.sn4
            if (r1 == 0) goto L15
            r1 = r7
            sn4 r1 = (defpackage.sn4) r1
            int r2 = r1.e
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.e = r2
            goto L1a
        L15:
            sn4 r1 = new sn4
            r1.<init>(r5, r7)
        L1a:
            java.lang.Object r7 = r1.c
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.e
            r4 = 1
            if (r3 == 0) goto L34
            if (r3 != r4) goto L2d
            c56 r6 = r1.b
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L2b
            goto L6d
        L2b:
            r7 = move-exception
            goto L72
        L2d:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L34:
            defpackage.br7.v(r7)
            boolean r7 = r6 instanceof defpackage.h0a
            if (r7 == 0) goto L3e
            float r7 = r5.b
            goto L4e
        L3e:
            boolean r7 = r6 instanceof defpackage.sr5
            if (r7 == 0) goto L45
            float r7 = r5.c
            goto L4e
        L45:
            boolean r7 = r6 instanceof defpackage.gr4
            if (r7 == 0) goto L4c
            float r7 = r5.d
            goto L4e
        L4c:
            float r7 = r5.a
        L4e:
            r5.g = r6
            k49 r3 = r0.e     // Catch: java.lang.Throwable -> L2b
            java.lang.Object r3 = r3.getValue()     // Catch: java.lang.Throwable -> L2b
            vj3 r3 = (defpackage.vj3) r3     // Catch: java.lang.Throwable -> L2b
            float r3 = r3.a     // Catch: java.lang.Throwable -> L2b
            boolean r3 = defpackage.vj3.b(r3, r7)     // Catch: java.lang.Throwable -> L2b
            if (r3 != 0) goto L6d
            c56 r3 = r5.f     // Catch: java.lang.Throwable -> L2b
            r1.b = r6     // Catch: java.lang.Throwable -> L2b
            r1.e = r4     // Catch: java.lang.Throwable -> L2b
            java.lang.Object r7 = defpackage.lw3.a(r0, r7, r3, r6, r1)     // Catch: java.lang.Throwable -> L2b
            if (r7 != r2) goto L6d
            return r2
        L6d:
            r5.f = r6
            c1e r5 = defpackage.c1e.a
            return r5
        L72:
            r5.f = r6
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.un4.a(c56, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.tn4
            if (r0 == 0) goto L13
            r0 = r6
            tn4 r0 = (defpackage.tn4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            tn4 r0 = new tn4
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L27
            goto L6c
        L27:
            r6 = move-exception
            goto L71
        L29:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L30:
            defpackage.br7.v(r6)
            c56 r6 = r5.g
            boolean r2 = r6 instanceof defpackage.h0a
            if (r2 == 0) goto L3c
            float r6 = r5.b
            goto L4c
        L3c:
            boolean r2 = r6 instanceof defpackage.sr5
            if (r2 == 0) goto L43
            float r6 = r5.c
            goto L4c
        L43:
            boolean r6 = r6 instanceof defpackage.gr4
            if (r6 == 0) goto L4a
            float r6 = r5.d
            goto L4c
        L4a:
            float r6 = r5.a
        L4c:
            ou r2 = r5.e
            k49 r4 = r2.e
            java.lang.Object r4 = r4.getValue()
            vj3 r4 = (defpackage.vj3) r4
            float r4 = r4.a
            boolean r4 = defpackage.vj3.b(r4, r6)
            if (r4 != 0) goto L76
            vj3 r4 = new vj3     // Catch: java.lang.Throwable -> L27
            r4.<init>(r6)     // Catch: java.lang.Throwable -> L27
            r0.d = r3     // Catch: java.lang.Throwable -> L27
            java.lang.Object r6 = r2.f(r0, r4)     // Catch: java.lang.Throwable -> L27
            if (r6 != r1) goto L6c
            return r1
        L6c:
            c56 r6 = r5.g
            r5.f = r6
            goto L76
        L71:
            c56 r0 = r5.g
            r5.f = r0
            throw r6
        L76:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.un4.b(p92):java.lang.Object");
    }
}
