package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zt2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ mu2 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zt2(mu2 mu2Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = mu2Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        mu2 mu2Var = this.d;
        switch (i) {
            case 0:
                return new zt2(mu2Var, n92Var, 0);
            case 1:
                return new zt2(mu2Var, n92Var, 1);
            default:
                return new zt2(mu2Var, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((zt2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0049, code lost:
    
        if (r10 == r1) goto L22;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) throws java.lang.Throwable {
        /*
            r9 = this;
            int r0 = r9.b
            c1e r1 = defpackage.c1e.a
            r2 = -1
            r3 = 2
            r4 = 0
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            mu2 r6 = r9.d
            r7 = 1
            switch(r0) {
                case 0: goto La0;
                case 1: goto L57;
                default: goto Lf;
            }
        Lf:
            olb r0 = r6.h
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r8 = r9.c
            if (r8 == 0) goto L29
            if (r8 == r7) goto L23
            if (r8 != r3) goto L1f
            defpackage.br7.v(r10)
            goto L4d
        L1f:
            defpackage.ygf.f(r5)
            goto L56
        L23:
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L27
            goto L42
        L27:
            r9 = move-exception
            goto L51
        L29:
            defpackage.br7.v(r10)
            rpc r10 = r0.j()
            boolean r10 = r10 instanceof defpackage.ai4
            if (r10 == 0) goto L39
            rpc r4 = r0.j()
            goto L56
        L39:
            r9.c = r7     // Catch: java.lang.Throwable -> L27
            java.lang.Object r10 = r6.f(r9)     // Catch: java.lang.Throwable -> L27
            if (r10 != r1) goto L42
            goto L4b
        L42:
            r9.c = r3
            r10 = 0
            java.lang.Object r10 = r6.g(r10, r9)
            if (r10 != r1) goto L4d
        L4b:
            r4 = r1
            goto L56
        L4d:
            r4 = r10
            rpc r4 = (defpackage.rpc) r4
            goto L56
        L51:
            cta r4 = new cta
            r4.<init>(r2, r9)
        L56:
            return r4
        L57:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r8 = r9.c
            if (r8 == 0) goto L6e
            if (r8 == r7) goto L6a
            if (r8 != r3) goto L65
            defpackage.br7.v(r10)
            goto L9f
        L65:
            defpackage.ygf.f(r5)
            r1 = r4
            goto L9f
        L6a:
            defpackage.br7.v(r10)
            goto L84
        L6e:
            defpackage.br7.v(r10)
            n0c r10 = r6.i
            r9.c = r7
            java.lang.Object r10 = r10.c
            vx1 r10 = (defpackage.vx1) r10
            java.lang.Object r10 = r10.i(r9)
            if (r10 != r0) goto L80
            goto L81
        L80:
            r10 = r1
        L81:
            if (r10 != r0) goto L84
            goto L9e
        L84:
            b56 r10 = r6.c()
            bo4 r10 = r10.e()
            bo4 r10 = defpackage.w2g.m(r10, r2)
            aq r2 = new aq
            r4 = 3
            r2.<init>(r4, r6)
            r9.c = r3
            java.lang.Object r9 = r10.b(r2, r9)
            if (r9 != r0) goto L9f
        L9e:
            r1 = r0
        L9f:
            return r1
        La0:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r9.c
            if (r2 == 0) goto Lb1
            if (r2 != r7) goto Lac
            defpackage.br7.v(r10)
            goto Lbd
        Lac:
            defpackage.ygf.f(r5)
            r1 = r4
            goto Lbd
        Lb1:
            defpackage.br7.v(r10)
            r9.c = r7
            java.lang.Object r9 = r6.e(r9)
            if (r9 != r0) goto Lbd
            r1 = r0
        Lbd:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zt2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
