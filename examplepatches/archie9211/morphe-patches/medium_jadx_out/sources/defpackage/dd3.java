package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dd3 {
    public final e00 a;
    public final xpc b;
    public final wua c;

    public dd3(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
        xpc xpcVarJ = vv2.j(null);
        this.b = xpcVarJ;
        this.c = bo.A(xpcVarJ);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.xc3
            if (r0 == 0) goto L13
            r0 = r14
            xc3 r0 = (defpackage.xc3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            xc3 r0 = new xc3
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            goto L4f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.DigestByIdQuery r14 = new com.medium.android.graphql.DigestByIdQuery
            r14.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            if (r14 != r1) goto L4f
            return r1
        L4f:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L84
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L84
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L84
            if (r12 != 0) goto L83
            if (r5 != 0) goto L72
            if (r11 == 0) goto L6a
            com.medium.android.graphql.DigestByIdQuery$Data r11 = (com.medium.android.graphql.DigestByIdQuery.Data) r11     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.DigestByIdQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L84
            if (r11 == 0) goto L93
            com.medium.android.graphql.DigestByIdQuery$DigestById r4 = r11.getDigestById()     // Catch: java.lang.Throwable -> L84
            goto L93
        L6a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L84
            throw r11     // Catch: java.lang.Throwable -> L84
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            yc3 r9 = defpackage.yc3.b     // Catch: java.lang.Throwable -> L84
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L84
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L84
            throw r11     // Catch: java.lang.Throwable -> L84
        L83:
            throw r12     // Catch: java.lang.Throwable -> L84
        L84:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            r4.<init>(r11)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            goto L93
        L8c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L93:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto La9
            if (r4 == 0) goto L9a
            goto La9
        L9a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La2
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La2
            throw r11     // Catch: java.lang.Throwable -> La2
        La2:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La9:
            return r4
        Laa:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dd3.a(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.yd4 r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.zc3
            if (r0 == 0) goto L13
            r0 = r13
            zc3 r0 = (defpackage.zc3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            zc3 r0 = new zc3
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lb4
            goto L53
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.DigestHistoryQuery r13 = new com.medium.android.graphql.DigestHistoryQuery
            r2 = 10
            java.lang.String r5 = ""
            r13.<init>(r2, r5)
            e00 r11 = r11.a
            r11.getClass()
            uz r2 = new uz
            r2.<init>(r11, r13)
            java.lang.Object r11 = defpackage.gr7.i(r2, r12)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lb4
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lb4
            if (r13 != r1) goto L53
            return r1
        L53:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lb4
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L8e
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L8e
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L8e
            if (r12 != 0) goto L8d
            if (r5 != 0) goto L7c
            if (r11 == 0) goto L74
            com.medium.android.graphql.DigestHistoryQuery$Data r11 = (com.medium.android.graphql.DigestHistoryQuery.Data) r11     // Catch: java.lang.Throwable -> L8e
            com.medium.android.graphql.DigestHistoryQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L8e
            if (r11 == 0) goto L9d
            com.medium.android.graphql.DigestHistoryQuery$DigestsConnection r11 = r11.getDigestsConnection()     // Catch: java.lang.Throwable -> L8e
            if (r11 == 0) goto L9d
            com.medium.android.graphql.DigestHistoryQuery$OnDigestsConnection r4 = r11.getOnDigestsConnection()     // Catch: java.lang.Throwable -> L8e
            goto L9d
        L74:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8e
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8e
            throw r11     // Catch: java.lang.Throwable -> L8e
        L7c:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8e
            ad3 r9 = defpackage.ad3.b     // Catch: java.lang.Throwable -> L8e
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8e
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8e
            throw r11     // Catch: java.lang.Throwable -> L8e
        L8d:
            throw r12     // Catch: java.lang.Throwable -> L8e
        L8e:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lb4
            r4.<init>(r11)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lb4
            goto L9d
        L96:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L9d:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb3
            if (r4 == 0) goto La4
            goto Lb3
        La4:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lac
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lac
            throw r11     // Catch: java.lang.Throwable -> Lac
        Lac:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb3:
            return r4
        Lb4:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dd3.b(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.yd4 r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.bd3
            if (r0 == 0) goto L13
            r0 = r13
            bd3 r0 = (defpackage.bd3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            bd3 r0 = new bd3
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb0
            goto L4f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.LatestDigestQuery r13 = new com.medium.android.graphql.LatestDigestQuery
            r13.<init>()
            e00 r11 = r11.a
            r11.getClass()
            uz r2 = new uz
            r2.<init>(r11, r13)
            java.lang.Object r11 = defpackage.gr7.i(r2, r12)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb0
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb0
            if (r13 != r1) goto L4f
            return r1
        L4f:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb0
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L8a
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L8a
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L8a
            if (r12 != 0) goto L89
            if (r5 != 0) goto L78
            if (r11 == 0) goto L70
            com.medium.android.graphql.LatestDigestQuery$Data r11 = (com.medium.android.graphql.LatestDigestQuery.Data) r11     // Catch: java.lang.Throwable -> L8a
            com.medium.android.graphql.LatestDigestQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L8a
            if (r11 == 0) goto L99
            com.medium.android.graphql.LatestDigestQuery$DigestsConnection r11 = r11.getDigestsConnection()     // Catch: java.lang.Throwable -> L8a
            if (r11 == 0) goto L99
            com.medium.android.graphql.LatestDigestQuery$OnDigestsConnection r4 = r11.getOnDigestsConnection()     // Catch: java.lang.Throwable -> L8a
            goto L99
        L70:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8a
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8a
            throw r11     // Catch: java.lang.Throwable -> L8a
        L78:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8a
            cd3 r9 = defpackage.cd3.b     // Catch: java.lang.Throwable -> L8a
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8a
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8a
            throw r11     // Catch: java.lang.Throwable -> L8a
        L89:
            throw r12     // Catch: java.lang.Throwable -> L8a
        L8a:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb0
            r4.<init>(r11)     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb0
            goto L99
        L92:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L99:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Laf
            if (r4 == 0) goto La0
            goto Laf
        La0:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La8
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La8
            throw r11     // Catch: java.lang.Throwable -> La8
        La8:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Laf:
            return r4
        Lb0:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dd3.c(yd4, p92):java.lang.Object");
    }
}
