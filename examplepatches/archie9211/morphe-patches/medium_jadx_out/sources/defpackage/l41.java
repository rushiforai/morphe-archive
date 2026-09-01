package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l41 extends zj1 {
    public final b55 f;

    public l41(b55 b55Var, ib2 ib2Var, int i, nz0 nz0Var) {
        super(b55Var, ib2Var, i, nz0Var, 0);
        this.f = b55Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.zj1, defpackage.yj1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.l2a r6, defpackage.n92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.k41
            if (r0 == 0) goto L13
            r0 = r7
            k41 r0 = (defpackage.k41) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            k41 r0 = new k41
            p92 r7 = (defpackage.p92) r7
            r0.<init>(r5, r7)
        L1a:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            l2a r6 = r0.b
            defpackage.br7.v(r7)
            goto L40
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L32:
            defpackage.br7.v(r7)
            r0.b = r6
            r0.e = r4
            java.lang.Object r5 = super.e(r6, r0)
            if (r5 != r1) goto L40
            return r1
        L40:
            uz0 r5 = r6.d
            boolean r5 = r5.A()
            if (r5 == 0) goto L4b
            c1e r5 = defpackage.c1e.a
            return r5
        L4b:
            java.lang.String r5 = "'awaitClose { yourCallbackOrListener.cancel() }' should be used in the end of callbackFlow block.\nOtherwise, a callback/listener may leak in case of external cancellation.\nSee callbackFlow API documentation for the details."
            defpackage.ygf.f(r5)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l41.e(l2a, n92):java.lang.Object");
    }

    @Override // defpackage.zj1, defpackage.yj1
    public final yj1 f(ib2 ib2Var, int i, nz0 nz0Var) {
        return new l41(this.f, ib2Var, i, nz0Var);
    }
}
