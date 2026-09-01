package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nld {
    public final long a;
    public final long b;
    public final kb2 c;
    public final b55 d;
    public final a98 e;
    public final k92 f;
    public boolean g;
    public long h;

    public nld(long j, long j2, b55 b55Var, int i) {
        j2 = (i & 2) != 0 ? j : j2;
        r13 r13Var = xg3.a;
        ei5 ei5Var = ff7.a;
        r13Var.getClass();
        ei5Var.getClass();
        this.a = j;
        this.b = j2;
        this.c = ei5Var;
        this.d = b55Var;
        this.e = new a98();
        this.f = o7f.c(r13Var);
        this.h = j;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.kld
            if (r0 == 0) goto L13
            r0 = r6
            kld r0 = (defpackage.kld) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            kld r0 = new kld
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L30
            if (r2 != r3) goto L2a
            a98 r0 = r0.b
            defpackage.br7.v(r6)
            goto L41
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L30:
            defpackage.br7.v(r6)
            a98 r6 = r5.e
            r0.b = r6
            r0.e = r3
            java.lang.Object r0 = r6.m(r0, r4)
            if (r0 != r1) goto L40
            return r1
        L40:
            r0 = r6
        L41:
            long r1 = r5.b     // Catch: java.lang.Throwable -> L66
            in3 r6 = new in3     // Catch: java.lang.Throwable -> L66
            r6.<init>(r1)     // Catch: java.lang.Throwable -> L66
            long r1 = r5.h     // Catch: java.lang.Throwable -> L66
            r3 = 2
            long r1 = defpackage.in3.i(r3, r1)     // Catch: java.lang.Throwable -> L66
            in3 r3 = new in3     // Catch: java.lang.Throwable -> L66
            r3.<init>(r1)     // Catch: java.lang.Throwable -> L66
            int r1 = r6.compareTo(r3)     // Catch: java.lang.Throwable -> L66
            if (r1 > 0) goto L5b
            goto L5c
        L5b:
            r6 = r3
        L5c:
            long r1 = r6.a     // Catch: java.lang.Throwable -> L66
            r5.h = r1     // Catch: java.lang.Throwable -> L66
            r0.f(r4)
            c1e r5 = defpackage.c1e.a
            return r5
        L66:
            r5 = move-exception
            r0.f(r4)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nld.a(p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x005e, code lost:
    
        if (defpackage.vx0.m0(r6.c, r7, r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.lld
            if (r0 == 0) goto L13
            r0 = r7
            lld r0 = (defpackage.lld) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            lld r0 = new lld
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L37
            if (r2 == r4) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            goto L61
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L31:
            a98 r2 = r0.b
            defpackage.br7.v(r7)
            goto L47
        L37:
            defpackage.br7.v(r7)
            a98 r2 = r6.e
            r0.b = r2
            r0.e = r4
            java.lang.Object r7 = r2.m(r0, r5)
            if (r7 != r1) goto L47
            goto L60
        L47:
            r7 = 0
            r6.g = r7     // Catch: java.lang.Throwable -> L64
            r2.f(r5)
            xi7 r7 = new xi7
            r2 = 28
            r7.<init>(r6, r5, r2)
            r0.b = r5
            r0.e = r3
            kb2 r6 = r6.c
            java.lang.Object r6 = defpackage.vx0.m0(r6, r7, r0)
            if (r6 != r1) goto L61
        L60:
            return r1
        L61:
            c1e r6 = defpackage.c1e.a
            return r6
        L64:
            r6 = move-exception
            r2.f(r5)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nld.b(p92):java.lang.Object");
    }

    public final void c() {
        vx0.c0(this.f, null, null, new j5d(this, null, 4), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.mld
            if (r0 == 0) goto L13
            r0 = r6
            mld r0 = (defpackage.mld) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            mld r0 = new mld
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L30
            if (r2 != r3) goto L2a
            a98 r0 = r0.b
            defpackage.br7.v(r6)
            goto L41
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L30:
            defpackage.br7.v(r6)
            a98 r6 = r5.e
            r0.b = r6
            r0.e = r3
            java.lang.Object r0 = r6.m(r0, r4)
            if (r0 != r1) goto L40
            return r1
        L40:
            r0 = r6
        L41:
            long r1 = r5.a     // Catch: java.lang.Throwable -> L4b
            r5.h = r1     // Catch: java.lang.Throwable -> L4b
            r0.f(r4)
            c1e r5 = defpackage.c1e.a
            return r5
        L4b:
            r5 = move-exception
            r0.f(r4)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nld.d(p92):java.lang.Object");
    }
}
