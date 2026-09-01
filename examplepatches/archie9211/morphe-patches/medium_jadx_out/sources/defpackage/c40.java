package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class c40 {
    public final e00 a;

    public c40(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable a(java.lang.String r7, java.lang.String r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.b40
            if (r0 == 0) goto L13
            r0 = r9
            b40 r0 = (defpackage.b40) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            b40 r0 = new b40
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lad
            goto L51
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.AppSupportStatusQuery r9 = new com.medium.android.graphql.AppSupportStatusQuery
            r9.<init>(r7, r8)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            yd4 r6 = defpackage.yd4.NetworkOnly
            java.lang.Object r6 = defpackage.gr7.i(r7, r6)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lad
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lad
            if (r9 != r1) goto L51
            return r1
        L51:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lad
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L84
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L84
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L84
            if (r7 != 0) goto L83
            if (r0 != 0) goto L72
            if (r6 == 0) goto L6a
            com.medium.android.graphql.AppSupportStatusQuery$Data r6 = (com.medium.android.graphql.AppSupportStatusQuery.Data) r6     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.AppSupportStatusQuery$AppConfig r6 = r6.getAppConfig()     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.type.AppConfigSupportStatus r6 = r6.getSupportStatus()     // Catch: java.lang.Throwable -> L84
            goto L94
        L6a:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L84
            throw r6     // Catch: java.lang.Throwable -> L84
        L72:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L84
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L84
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L84
            throw r6     // Catch: java.lang.Throwable -> L84
        L83:
            throw r7     // Catch: java.lang.Throwable -> L84
        L84:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lad
            r7.<init>(r6)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lad
            goto L93
        L8c:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L93:
            r6 = r7
        L94:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lac
            if (r6 == 0) goto L9c
            goto Lac
        L9c:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La4
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La4
            throw r6     // Catch: java.lang.Throwable -> La4
        La4:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lac:
            return r6
        Lad:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c40.a(java.lang.String, java.lang.String, p92):java.io.Serializable");
    }
}
