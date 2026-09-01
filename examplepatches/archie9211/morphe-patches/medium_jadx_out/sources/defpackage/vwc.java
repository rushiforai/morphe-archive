package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vwc implements do4 {
    public final do4 a;
    public final b55 b;

    public vwc(do4 do4Var, b55 b55Var) {
        this.a = do4Var;
        this.b = b55Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        return this.a.a(obj, n92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r10) throws java.lang.Throwable {
        /*
            r9 = this;
            boolean r0 = r10 instanceof defpackage.uwc
            if (r0 == 0) goto L13
            r0 = r10
            uwc r0 = (defpackage.uwc) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            uwc r0 = new uwc
            r0.<init>(r9, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            c1e r4 = defpackage.c1e.a
            do4 r5 = r9.a
            r6 = 2
            r7 = 1
            if (r2 == 0) goto L3d
            if (r2 == r7) goto L35
            if (r2 != r6) goto L2f
            defpackage.br7.v(r10)
            return r4
        L2f:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r3
        L35:
            hnb r9 = r0.b
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L3b
            goto L57
        L3b:
            r10 = move-exception
            goto L70
        L3d:
            defpackage.br7.v(r10)
            hnb r10 = new hnb
            ib2 r2 = r0.getContext()
            r10.<init>(r5, r2)
            b55 r9 = r9.b     // Catch: java.lang.Throwable -> L6c
            r0.b = r10     // Catch: java.lang.Throwable -> L6c
            r0.e = r7     // Catch: java.lang.Throwable -> L6c
            java.lang.Object r9 = r9.invoke(r10, r0)     // Catch: java.lang.Throwable -> L6c
            if (r9 != r1) goto L56
            goto L6a
        L56:
            r9 = r10
        L57:
            r9.releaseIntercepted()
            boolean r9 = r5 instanceof defpackage.vwc
            if (r9 == 0) goto L6b
            vwc r5 = (defpackage.vwc) r5
            r0.b = r3
            r0.e = r6
            java.lang.Object r9 = r5.b(r0)
            if (r9 != r1) goto L6b
        L6a:
            return r1
        L6b:
            return r4
        L6c:
            r9 = move-exception
            r8 = r10
            r10 = r9
            r9 = r8
        L70:
            r9.releaseIntercepted()
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vwc.b(p92):java.lang.Object");
    }
}
