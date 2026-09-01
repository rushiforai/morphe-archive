package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fde extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ide d;
    public final /* synthetic */ rg1 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fde(ide ideVar, rg1 rg1Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ideVar;
        this.e = rg1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        rg1 rg1Var = this.e;
        ide ideVar = this.d;
        switch (i) {
            case 0:
                return new fde(ideVar, rg1Var, n92Var, 0);
            case 1:
                return new fde(ideVar, rg1Var, n92Var, 1);
            default:
                return new fde(ideVar, rg1Var, n92Var, 2);
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
        return ((fde) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:49:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            r10 = this;
            int r0 = r10.b
            rg1 r1 = r10.e
            ide r6 = r10.d
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            r3 = 1
            c1e r7 = defpackage.c1e.a
            r4 = 0
            switch(r0) {
                case 0: goto L63;
                case 1: goto L33;
                default: goto Lf;
            }
        Lf:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r8 = r10.c
            if (r8 == 0) goto L20
            if (r8 != r3) goto L1b
            defpackage.br7.v(r11)
            goto L32
        L1b:
            defpackage.ygf.f(r2)
            r7 = r4
            goto L32
        L20:
            defpackage.br7.v(r11)
            xpc r2 = r6.w
            mce r4 = new mce
            r4.<init>(r1)
            r10.c = r3
            r2.a(r4, r10)
            if (r7 != r0) goto L32
            r7 = r0
        L32:
            return r7
        L33:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r8 = r10.c
            if (r8 == 0) goto L44
            if (r8 != r3) goto L3f
            defpackage.br7.v(r11)
            goto L62
        L3f:
            defpackage.ygf.f(r2)
            r7 = r4
            goto L62
        L44:
            defpackage.br7.v(r11)
            n0c r2 = r6.c
            boolean r4 = r6.r
            r2.getClass()
            s71 r1 = defpackage.n0c.z(r1, r4)
            r6c r2 = r6.u
            oce r4 = new oce
            r4.<init>(r1)
            r10.c = r3
            java.lang.Object r1 = r2.a(r4, r10)
            if (r1 != r0) goto L62
            r7 = r0
        L62:
            return r7
        L63:
            tb2 r8 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r10.c
            r9 = 3
            r1 = 2
            if (r0 == 0) goto L83
            if (r0 == r3) goto L7f
            if (r0 == r1) goto L7a
            if (r0 != r9) goto L75
            defpackage.br7.v(r11)
            goto Lb6
        L75:
            defpackage.ygf.f(r2)
            r7 = r4
            goto Lb6
        L7a:
            defpackage.br7.v(r11)
            r0 = r11
            goto La4
        L7f:
            defpackage.br7.v(r11)
            goto L90
        L83:
            defpackage.br7.v(r11)
            xpc r0 = r6.w
            r10.c = r3
            r0.a(r4, r10)
            if (r7 != r8) goto L90
            goto Lb5
        L90:
            n0c r0 = r6.c
            boolean r2 = r6.r
            java.lang.String r3 = r6.b
            java.lang.String r4 = r6.o
            r10.c = r1
            rg1 r1 = r10.e
            r5 = r10
            java.lang.Object r0 = r0.T(r1, r2, r3, r4, r5)
            if (r0 != r8) goto La4
            goto Lb5
        La4:
            o81 r0 = (defpackage.o81) r0
            r6c r1 = r6.u
            oce r2 = new oce
            r2.<init>(r0)
            r10.c = r9
            java.lang.Object r0 = r1.a(r2, r10)
            if (r0 != r8) goto Lb6
        Lb5:
            r7 = r8
        Lb6:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fde.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
