package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jef extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ref d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jef(int i, n92 n92Var, ref refVar, String str) {
        super(2, n92Var);
        this.b = i;
        this.d = refVar;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        ref refVar = this.d;
        switch (i) {
            case 0:
                return new jef(0, n92Var, refVar, str);
            default:
                return new jef(1, n92Var, refVar, str);
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
        return ((jef) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004c, code lost:
    
        if (r10.F(r6, r9) == r0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x008f, code lost:
    
        if (r10.F(r6, r9) == r0) goto L37;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) {
        /*
            r9 = this;
            int r0 = r9.b
            r1 = 0
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            r3 = 1
            r4 = 2
            ref r5 = r9.d
            java.lang.String r6 = r9.e
            c1e r7 = defpackage.c1e.a
            switch(r0) {
                case 0: goto L52;
                default: goto L10;
            }
        L10:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r8 = r9.c
            if (r8 == 0) goto L2a
            if (r8 == r3) goto L26
            if (r8 != r4) goto L22
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r9 = r10.a
            goto L50
        L22:
            defpackage.ygf.f(r2)
            goto L51
        L26:
            defpackage.br7.v(r10)
            goto L44
        L2a:
            defpackage.br7.v(r10)
            dv4 r10 = r5.d
            kef r1 = new kef
            r2 = 0
            r1.<init>(r6, r2)
            r9.c = r3
            n0c r10 = r10.b
            java.lang.Object r10 = r10.l0(r1, r9)
            if (r10 != r0) goto L40
            goto L41
        L40:
            r10 = r7
        L41:
            if (r10 != r0) goto L44
            goto L4e
        L44:
            my6 r10 = r5.k
            r9.c = r4
            java.lang.Object r9 = r10.F(r6, r9)
            if (r9 != r0) goto L50
        L4e:
            r1 = r0
            goto L51
        L50:
            r1 = r7
        L51:
            return r1
        L52:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r8 = r9.c
            if (r8 == 0) goto L6c
            if (r8 == r3) goto L68
            if (r8 != r4) goto L64
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r9 = r10.a
            goto L93
        L64:
            defpackage.ygf.f(r2)
            goto L94
        L68:
            defpackage.br7.v(r10)
            goto L87
        L6c:
            defpackage.br7.v(r10)
            dv4 r10 = r5.d
            nmc r1 = new nmc
            r2 = 29
            r1.<init>(r6, r2)
            r9.c = r3
            n0c r10 = r10.b
            java.lang.Object r10 = r10.l0(r1, r9)
            if (r10 != r0) goto L83
            goto L84
        L83:
            r10 = r7
        L84:
            if (r10 != r0) goto L87
            goto L91
        L87:
            my6 r10 = r5.k
            r9.c = r4
            java.lang.Object r9 = r10.F(r6, r9)
            if (r9 != r0) goto L93
        L91:
            r1 = r0
            goto L94
        L93:
            r1 = r7
        L94:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jef.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
