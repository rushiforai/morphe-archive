package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dc4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ uc4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dc4(uc4 uc4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = uc4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        uc4 uc4Var = this.d;
        switch (i) {
            case 0:
                return new dc4(uc4Var, n92Var, 0);
            default:
                return new dc4(uc4Var, n92Var, 1);
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
        return ((dc4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0047, code lost:
    
        if (r8 == r0) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x005c, code lost:
    
        if (r8 == r0) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:?, code lost:
    
        return r0;
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
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r2 = 1
            uc4 r3 = r8.d
            r4 = 0
            switch(r0) {
                case 0: goto L62;
                default: goto Lb;
            }
        Lb:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r8.c
            c1e r6 = defpackage.c1e.a
            r7 = 2
            if (r5 == 0) goto L20
            if (r5 == r2) goto L18
            if (r5 != r7) goto L1c
        L18:
            defpackage.br7.v(r9)
            goto L60
        L1c:
            defpackage.ygf.f(r1)
            goto L61
        L20:
            defpackage.br7.v(r9)
            wua r9 = r3.k
            vpc r9 = r9.a
            java.lang.Object r9 = r9.getValue()
            ec4 r9 = (defpackage.ec4) r9
            int[] r1 = defpackage.pc4.a
            int r9 = r9.ordinal()
            r9 = r1[r9]
            if (r9 == r2) goto L4e
            if (r9 != r7) goto L4a
            bc4 r9 = r3.n
            r8.c = r7
            n0c r9 = r9.b
            java.lang.Object r8 = r9.D(r8)
            if (r8 != r0) goto L46
            goto L47
        L46:
            r8 = r6
        L47:
            if (r8 != r0) goto L60
            goto L5e
        L4a:
            defpackage.ygf.a()
            goto L61
        L4e:
            bc4 r9 = r3.l
            r8.c = r2
            n0c r9 = r9.b
            java.lang.Object r8 = r9.D(r8)
            if (r8 != r0) goto L5b
            goto L5c
        L5b:
            r8 = r6
        L5c:
            if (r8 != r0) goto L60
        L5e:
            r4 = r0
            goto L61
        L60:
            r4 = r6
        L61:
            return r4
        L62:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r8.c
            if (r5 == 0) goto L72
            if (r5 == r2) goto L6e
            defpackage.ygf.f(r1)
            goto L8f
        L6e:
            defpackage.br7.v(r9)
            goto L8c
        L72:
            defpackage.br7.v(r9)
            cba r9 = r3.e
            uua r9 = r9.c
            aq r1 = new aq
            r5 = 8
            r1.<init>(r5, r3)
            r8.c = r2
            n6c r9 = r9.a
            java.lang.Object r8 = r9.b(r1, r8)
            if (r8 != r0) goto L8c
            r4 = r0
            goto L8f
        L8c:
            defpackage.z72.b()
        L8f:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dc4.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
