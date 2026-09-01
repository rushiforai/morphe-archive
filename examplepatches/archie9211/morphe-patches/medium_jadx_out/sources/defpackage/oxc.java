package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oxc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ qxc d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oxc(qxc qxcVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = qxcVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        qxc qxcVar = this.d;
        switch (i) {
            case 0:
                return new oxc(qxcVar, n92Var, 0);
            default:
                return new oxc(qxcVar, n92Var, 1);
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
        return ((oxc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0049, code lost:
    
        if (r8 == r0) goto L23;
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
            c1e r3 = defpackage.c1e.a
            r4 = 1
            qxc r5 = r8.d
            switch(r0) {
                case 0: goto L4d;
                default: goto Ld;
            }
        Ld:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r6 = r8.c
            r7 = 2
            if (r6 == 0) goto L25
            if (r6 == r4) goto L21
            if (r6 != r7) goto L1d
            defpackage.br7.v(r9)
        L1b:
            r1 = r3
            goto L4c
        L1d:
            defpackage.ygf.f(r2)
            goto L4c
        L21:
            defpackage.br7.v(r9)
            goto L39
        L25:
            defpackage.br7.v(r9)
            p0f r9 = r5.d
            r8.c = r4
            n0c r9 = r9.b
            java.lang.Object r9 = r9.c0(r8)
            if (r9 != r0) goto L35
            goto L36
        L35:
            r9 = r3
        L36:
            if (r9 != r0) goto L39
            goto L4b
        L39:
            m0f r9 = r5.c
            r8.c = r7
            r6c r9 = r9.b
            h0f r1 = defpackage.h0f.a
            java.lang.Object r8 = r9.a(r1, r8)
            if (r8 != r0) goto L48
            goto L49
        L48:
            r8 = r3
        L49:
            if (r8 != r0) goto L1b
        L4b:
            r1 = r0
        L4c:
            return r1
        L4d:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r6 = r8.c
            if (r6 == 0) goto L5e
            if (r6 != r4) goto L5a
            defpackage.br7.v(r9)
        L58:
            r1 = r3
            goto L72
        L5a:
            defpackage.ygf.f(r2)
            goto L72
        L5e:
            defpackage.br7.v(r9)
            p0f r9 = r5.d
            r8.c = r4
            n0c r9 = r9.b
            java.lang.Object r8 = r9.D(r8)
            if (r8 != r0) goto L6e
            goto L6f
        L6e:
            r8 = r3
        L6f:
            if (r8 != r0) goto L58
            r1 = r0
        L72:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.oxc.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
