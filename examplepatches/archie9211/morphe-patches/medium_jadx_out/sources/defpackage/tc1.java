package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tc1 implements do4 {
    public final /* synthetic */ rya a;
    public final /* synthetic */ rya b;
    public final /* synthetic */ rya c;
    public final /* synthetic */ do4 d;
    public final /* synthetic */ nya e;

    public tc1(rya ryaVar, rya ryaVar2, rya ryaVar3, do4 do4Var, nya nyaVar) {
        this.a = ryaVar;
        this.b = ryaVar2;
        this.c = ryaVar3;
        this.d = do4Var;
        this.e = nyaVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x00a7, code lost:
    
        if (r3.a(r13, r0) == r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.do4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r14, defpackage.n92 r15) {
        /*
            r13 = this;
            boolean r0 = r15 instanceof defpackage.sc1
            if (r0 == 0) goto L13
            r0 = r15
            sc1 r0 = (defpackage.sc1) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            sc1 r0 = new sc1
            r0.<init>(r13, r15)
        L18:
            java.lang.Object r15 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            do4 r3 = r13.d
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L3a
            if (r2 == r5) goto L34
            if (r2 != r4) goto L2d
            defpackage.br7.v(r15)
            goto Laa
        L2d:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            r13 = 0
            return r13
        L34:
            java.lang.Object r13 = r0.b
            defpackage.br7.v(r15)
            goto L84
        L3a:
            defpackage.br7.v(r15)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r14 = r14.a
            boolean r15 = r14 instanceof defpackage.ajb
            if (r15 != 0) goto L85
            r15 = r14
            mz8 r15 = (defpackage.mz8) r15
            yz8 r15 = r15.a
            java.util.List r2 = r15.a
            rya r6 = r13.a
            r6.a = r2
            java.lang.Object r2 = r15.b
            com.medium.android.graphql.fragment.CatalogPagingResultData r2 = (com.medium.android.graphql.fragment.CatalogPagingResultData) r2
            com.medium.android.graphql.fragment.CatalogPagingResultData$NextPageCursor r2 = r2.getNextPageCursor()
            rya r7 = r13.b
            r7.a = r2
            rt2 r15 = r15.c
            rya r2 = r13.c
            r2.a = r15
            xe1 r7 = new xe1
            java.lang.Object r15 = r6.a
            r8 = r15
            java.util.List r8 = (java.util.List) r8
            nya r13 = r13.e
            boolean r10 = r13.a
            r11 = 0
            r12 = 0
            r9 = 0
            r7.<init>(r8, r9, r10, r11, r12)
            bjb r13 = new bjb
            r13.<init>(r7)
            r0.b = r14
            r0.e = r5
            java.lang.Object r13 = r3.a(r13, r0)
            if (r13 != r1) goto L83
            goto La9
        L83:
            r13 = r14
        L84:
            r14 = r13
        L85:
            java.lang.Throwable r13 = defpackage.bjb.b(r14)
            if (r13 == 0) goto Laa
            uld r15 = defpackage.wld.a
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]
            java.lang.String r5 = "Fetch catalog items failed"
            r15.e(r13, r5, r2)
            ajb r15 = new ajb
            r15.<init>(r13)
            bjb r13 = new bjb
            r13.<init>(r15)
            r0.b = r14
            r0.e = r4
            java.lang.Object r13 = r3.a(r13, r0)
            if (r13 != r1) goto Laa
        La9:
            return r1
        Laa:
            c1e r13 = defpackage.c1e.a
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tc1.a(java.lang.Object, n92):java.lang.Object");
    }
}
