package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e4g {
    public final d2f a;
    public o33 b;
    public final ujf c;
    public final uz5 d;

    public e4g(ujf ujfVar, d2f d2fVar, uz5 uz5Var) {
        this.c = ujfVar;
        this.a = d2fVar;
        this.d = uz5Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0055, code lost:
    
        if (r7 != r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r7) throws java.lang.Throwable {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.y3g
            if (r0 == 0) goto L13
            r0 = r7
            y3g r0 = (defpackage.y3g) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            y3g r0 = new y3g
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L35
            if (r2 == r5) goto L31
            if (r2 != r4) goto L2b
            defpackage.br7.v(r7)
            goto L57
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L31:
            defpackage.br7.v(r7)
            goto L44
        L35:
            defpackage.br7.v(r7)
            d2f r7 = r6.a
            r0.d = r5
            java.lang.String r2 = "ovk"
            java.lang.Object r7 = r7.k0(r2, r0)
            if (r7 == r1) goto L5e
        L44:
            java.lang.String r7 = (java.lang.String) r7
            if (r7 == 0) goto L49
            return r7
        L49:
            monitor-enter(r6)
            o33 r7 = r6.b     // Catch: java.lang.Throwable -> L5b
            monitor-exit(r6)
            if (r7 == 0) goto L5a
            r0.d = r4
            java.lang.Object r7 = r7.i(r0)
            if (r7 == r1) goto L5e
        L57:
            java.lang.String r7 = (java.lang.String) r7
            return r7
        L5a:
            return r3
        L5b:
            r7 = move-exception
            monitor-exit(r6)
            throw r7
        L5e:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e4g.a(p92):java.lang.Object");
    }
}
