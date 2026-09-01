package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yhe extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ cie d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yhe(cie cieVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = cieVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        cie cieVar = this.d;
        switch (i) {
            case 0:
                return new yhe(cieVar, n92Var, 0);
            default:
                return new yhe(cieVar, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((yhe) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x004d, code lost:
    
        if (r8 == r0) goto L22;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) {
        /*
            r8 = this;
            int r0 = r8.b
            r1 = 0
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            r3 = 1
            cie r4 = r8.d
            c1e r5 = defpackage.c1e.a
            switch(r0) {
                case 0: goto L53;
                default: goto Ld;
            }
        Ld:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r6 = r8.c
            r7 = 2
            if (r6 == 0) goto L24
            if (r6 == r3) goto L20
            if (r6 != r7) goto L1c
            defpackage.br7.v(r9)
            goto L51
        L1c:
            defpackage.ygf.f(r2)
            goto L52
        L20:
            defpackage.br7.v(r9)
            goto L38
        L24:
            defpackage.br7.v(r9)
            xc5 r9 = r4.f
            r8.c = r3
            n0c r9 = r9.d
            java.lang.Object r9 = r9.c0(r8)
            if (r9 != r0) goto L34
            goto L35
        L34:
            r9 = r5
        L35:
            if (r9 != r0) goto L38
            goto L4f
        L38:
            gge r9 = r4.g
            r8.c = r7
            r6c r9 = r9.b
            tfe r1 = new tfe
            yd4 r2 = defpackage.yd4.NetworkOnly
            r1.<init>(r2)
            java.lang.Object r8 = r9.a(r1, r8)
            if (r8 != r0) goto L4c
            goto L4d
        L4c:
            r8 = r5
        L4d:
            if (r8 != r0) goto L51
        L4f:
            r1 = r0
            goto L52
        L51:
            r1 = r5
        L52:
            return r1
        L53:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r6 = r8.c
            if (r6 == 0) goto L64
            if (r6 != r3) goto L60
            defpackage.br7.v(r9)
        L5e:
            r1 = r5
            goto L78
        L60:
            defpackage.ygf.f(r2)
            goto L78
        L64:
            defpackage.br7.v(r9)
            xc5 r9 = r4.f
            r8.c = r3
            n0c r9 = r9.d
            java.lang.Object r8 = r9.D(r8)
            if (r8 != r0) goto L74
            goto L75
        L74:
            r8 = r5
        L75:
            if (r8 != r0) goto L5e
            r1 = r0
        L78:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yhe.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
