package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gtd extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ mtd e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gtd(mtd mtdVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = mtdVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        mtd mtdVar = this.e;
        switch (i) {
            case 0:
                gtd gtdVar = new gtd(mtdVar, n92Var, 0);
                gtdVar.d = obj;
                return gtdVar;
            default:
                gtd gtdVar2 = new gtd(mtdVar, n92Var, 1);
                gtdVar2.d = obj;
                return gtdVar2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((gtd) create((w49) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((gtd) create((jrd) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0052, code lost:
    
        if (r8 == r0) goto L20;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            r7 = this;
            int r0 = r7.b
            mtd r1 = r7.e
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            r3 = 1
            r4 = 0
            switch(r0) {
                case 0: goto L5d;
                default: goto Lb;
            }
        Lb:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r7.c
            r6 = 2
            if (r5 == 0) goto L26
            if (r5 == r3) goto L1e
            if (r5 != r6) goto L1a
            defpackage.br7.v(r8)     // Catch: android.database.SQLException -> L5a
            goto L56
        L1a:
            defpackage.ygf.f(r2)
            goto L5c
        L1e:
            java.lang.Object r2 = r7.d
            jrd r2 = (defpackage.jrd) r2
            defpackage.br7.v(r8)
            goto L39
        L26:
            defpackage.br7.v(r8)
            java.lang.Object r8 = r7.d
            r2 = r8
            jrd r2 = (defpackage.jrd) r2
            r7.d = r2
            r7.c = r3
            java.lang.Boolean r8 = r2.b(r7)
            if (r8 != r0) goto L39
            goto L54
        L39:
            java.lang.Boolean r8 = (java.lang.Boolean) r8
            boolean r8 = r8.booleanValue()
            if (r8 == 0) goto L42
            goto L5a
        L42:
            ird r8 = defpackage.ird.IMMEDIATE     // Catch: android.database.SQLException -> L5a
            gtd r3 = new gtd     // Catch: android.database.SQLException -> L5a
            r5 = 0
            r3.<init>(r1, r4, r5)     // Catch: android.database.SQLException -> L5a
            r7.d = r4     // Catch: android.database.SQLException -> L5a
            r7.c = r6     // Catch: android.database.SQLException -> L5a
            java.lang.Object r8 = r2.a(r8, r3, r7)     // Catch: android.database.SQLException -> L5a
            if (r8 != r0) goto L56
        L54:
            r4 = r0
            goto L5c
        L56:
            r4 = r8
            java.util.Set r4 = (java.util.Set) r4     // Catch: android.database.SQLException -> L5a
            goto L5c
        L5a:
            ny3 r4 = defpackage.ny3.a
        L5c:
            return r4
        L5d:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r7.c
            if (r5 == 0) goto L6e
            if (r5 != r3) goto L69
            defpackage.br7.v(r8)
            goto L7e
        L69:
            defpackage.ygf.f(r2)
            r8 = r4
            goto L7e
        L6e:
            defpackage.br7.v(r8)
            java.lang.Object r8 = r7.d
            w49 r8 = (defpackage.w49) r8
            r7.c = r3
            java.lang.Object r8 = r1.c(r8, r7)
            if (r8 != r0) goto L7e
            r8 = r0
        L7e:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gtd.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
