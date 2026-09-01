package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class a4g extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ e4g e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a4g(e4g e4gVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = e4gVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        e4g e4gVar = this.e;
        switch (i) {
            case 0:
                a4g a4gVar = new a4g(e4gVar, n92Var, 0);
                a4gVar.d = obj;
                return a4gVar;
            default:
                a4g a4gVar2 = new a4g(e4gVar, n92Var, 1);
                a4gVar2.d = obj;
                return a4gVar2;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((a4g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((a4g) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:43:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) throws java.lang.Exception {
        /*
            r13 = this;
            int r0 = r13.b
            r1 = 1
            r2 = 0
            switch(r0) {
                case 0: goto L5d;
                default: goto L7;
            }
        L7:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r13.c
            if (r3 == 0) goto L11
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L46
            goto L42
        L11:
            defpackage.br7.v(r14)
            java.lang.Object r14 = r13.d
            xbg r14 = (defpackage.xbg) r14
            uob r3 = defpackage.uob.j     // Catch: java.lang.Exception -> L46
            hgb r4 = new hgb     // Catch: java.lang.Exception -> L46
            e4g r6 = r13.e     // Catch: java.lang.Exception -> L46
            java.lang.Class<e4g> r7 = defpackage.e4g.class
            java.lang.String r8 = "isRetriable"
            r9 = 0
            java.lang.String r9 = com.datadog.android.core.yjCm.PqkdNGCEoxOKZk.RhiHCIWAx     // Catch: java.lang.Exception -> L46
            r10 = 0
            r11 = 24
            r5 = 1
            r4.<init>(r5, r6, r7, r8, r9, r10, r11)     // Catch: java.lang.Exception -> L46
            il r11 = new il     // Catch: java.lang.Exception -> L46
            r5 = 7
            r11.<init>(r14, r6, r2, r5)     // Catch: java.lang.Exception -> L46
            r13.c = r1     // Catch: java.lang.Exception -> L46
            r7 = 10000(0x2710, double:4.9407E-320)
            r9 = 4611686018427387904(0x4000000000000000, double:2.0)
            r5 = 100
            r12 = r13
            java.lang.Object r14 = r3.u(r4, r5, r7, r9, r11, r12)     // Catch: java.lang.Exception -> L46
            if (r14 != r0) goto L42
            goto L45
        L42:
            r0 = r14
            java.lang.String r0 = (java.lang.String) r0     // Catch: java.lang.Exception -> L46
        L45:
            return r0
        L46:
            r0 = move-exception
            r13 = r0
            boolean r14 = r13 instanceof com.google.android.recaptcha.internal.zzfx
            if (r14 == 0) goto L4d
            throw r13
        L4d:
            com.google.android.recaptcha.internal.zzfx r14 = new com.google.android.recaptcha.internal.zzfx
            d87 r0 = defpackage.d87.T0
            d87 r1 = defpackage.d87.E0
            java.lang.String r13 = r13.getMessage()
            r2 = 8
            r14.<init>(r0, r1, r13, r2)
            throw r14
        L5d:
            r12 = r13
            tb2 r13 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r12.c
            e4g r3 = r12.e
            r4 = 2
            if (r0 == 0) goto L7f
            if (r0 == r1) goto L77
            if (r0 == r4) goto L6f
            defpackage.br7.v(r14)
            goto Lb8
        L6f:
            java.lang.Object r0 = r12.d
            fdg r0 = (defpackage.fdg) r0
            defpackage.br7.v(r14)
            goto La8
        L77:
            java.lang.Object r0 = r12.d
            fdg r0 = (defpackage.fdg) r0
            defpackage.br7.v(r14)
            goto L95
        L7f:
            defpackage.br7.v(r14)
            java.lang.Object r14 = r12.d
            fdg r14 = (defpackage.fdg) r14
            d2f r0 = r3.a
            r12.d = r14
            r12.c = r1
            java.lang.String r1 = "ovk"
            java.lang.Object r0 = r0.v0(r1, r12)
            if (r0 == r13) goto Lba
            r0 = r14
        L95:
            r12.d = r0
            r12.c = r4
            iie r14 = new iie
            r1 = 11
            r14.<init>(r3, r2, r1)
            ycg r1 = new ycg
            r1.<init>(r14)
            if (r1 == r13) goto Lba
            r14 = r1
        La8:
            ycg r14 = (defpackage.ycg) r14
            r12.d = r2
            r1 = 3
            r12.c = r1
            b55 r14 = r14.a
            java.lang.Object r14 = r14.invoke(r0, r12)
            if (r14 != r13) goto Lb8
            goto Lba
        Lb8:
            c1e r13 = defpackage.c1e.a
        Lba:
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a4g.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
