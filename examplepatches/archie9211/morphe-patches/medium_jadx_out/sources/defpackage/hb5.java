package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hb5 {
    public final cba a;

    public hb5(cba cbaVar) {
        cbaVar.getClass();
        this.a = cbaVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r13, defpackage.p92 r14) {
        /*
            r12 = this;
            boolean r0 = r14 instanceof defpackage.gb5
            if (r0 == 0) goto L13
            r0 = r14
            gb5 r0 = (defpackage.gb5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gb5 r0 = new gb5
            r0.<init>(r12, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            r5 = 0
            if (r2 == 0) goto L33
            if (r2 != r3) goto L2d
            defpackage.br7.v(r14)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r12 = r14.a
            goto L4c
        L2d:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r5
        L33:
            defpackage.br7.v(r14)
            uld r14 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r4]
            java.lang.String r6 = "Get publication featuring token balance"
            defpackage.km4.I(r14, r5, r6, r2, r6)
            r0.d = r3
            yd4 r14 = defpackage.yd4.NetworkFirst
            cba r12 = r12.a
            java.lang.Object r12 = r12.d(r13, r14, r0)
            if (r12 != r1) goto L4c
            return r1
        L4c:
            boolean r13 = r12 instanceof defpackage.ajb
            if (r13 != 0) goto L90
            com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance r12 = (com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery.PublicationFeaturingTokenBalance) r12     // Catch: java.lang.Throwable -> L73
            com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery$OnPublicationFeaturingTokenBalance r13 = r12.getOnPublicationFeaturingTokenBalance()     // Catch: java.lang.Throwable -> L73
            com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery$OnUnauthorized r12 = r12.getOnUnauthorized()     // Catch: java.lang.Throwable -> L73
            if (r13 == 0) goto L76
            jda r6 = new jda     // Catch: java.lang.Throwable -> L73
            int r7 = r13.getAvailableTokens()     // Catch: java.lang.Throwable -> L73
            int r8 = r13.getTokenCapacity()     // Catch: java.lang.Throwable -> L73
            java.lang.Long r9 = r13.getNextRefillAt()     // Catch: java.lang.Throwable -> L73
            long r10 = r13.getRefillInterval()     // Catch: java.lang.Throwable -> L73
            r6.<init>(r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L73
            r12 = r6
            goto L90
        L73:
            r0 = move-exception
            r12 = r0
            goto L8a
        L76:
            if (r12 == 0) goto L82
            java.lang.Exception r13 = new java.lang.Exception     // Catch: java.lang.Throwable -> L73
            java.lang.String r12 = r12.getMessage()     // Catch: java.lang.Throwable -> L73
            r13.<init>(r12)     // Catch: java.lang.Throwable -> L73
            throw r13     // Catch: java.lang.Throwable -> L73
        L82:
            java.lang.Exception r12 = new java.lang.Exception     // Catch: java.lang.Throwable -> L73
            java.lang.String r13 = "onPublicationFeaturingTokenBalance is null"
            r12.<init>(r13)     // Catch: java.lang.Throwable -> L73
            throw r12     // Catch: java.lang.Throwable -> L73
        L8a:
            ajb r13 = new ajb
            r13.<init>(r12)
            r12 = r13
        L90:
            boolean r13 = r12 instanceof defpackage.ajb
            if (r13 != 0) goto La1
            r13 = r12
            jda r13 = (defpackage.jda) r13
            uld r13 = defpackage.wld.a
            java.lang.Object[] r14 = new java.lang.Object[r4]
            java.lang.String r0 = "Get publication featuring token balance successful"
            defpackage.km4.I(r13, r5, r0, r14, r0)
        La1:
            java.lang.Throwable r13 = defpackage.bjb.b(r12)
            if (r13 == 0) goto Lb0
            uld r14 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            java.lang.String r1 = "Get publication featuring token balance failed"
            r14.e(r13, r1, r0)
        Lb0:
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hb5.a(java.lang.String, p92):java.lang.Object");
    }
}
