package defpackage;

import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mq5 {
    public final e00 a;
    public final AtomicBoolean b;

    public mq5(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
        this.b = new AtomicBoolean(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(int r7, defpackage.p92 r8, defpackage.yd4 r9, java.lang.String r10) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.jq5
            if (r0 == 0) goto L13
            r0 = r8
            jq5 r0 = (defpackage.jq5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            jq5 r0 = new jq5
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            goto L53
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.HomeFeaturedQuery r8 = new com.medium.android.graphql.HomeFeaturedQuery
            if (r10 != 0) goto L37
            java.lang.String r10 = ""
        L37:
            r8.<init>(r7, r10)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            if (r8 != r1) goto L53
            return r1
        L53:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.HomeFeaturedQuery$Data r6 = (com.medium.android.graphql.HomeFeaturedQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            goto L8e
        L64:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7e
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L7e
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L7d:
            throw r7     // Catch: java.lang.Throwable -> L7e
        L7e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            return r6
        L8f:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mq5.a(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(com.medium.android.graphql.type.PagingOptions r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.kq5
            if (r0 == 0) goto L13
            r0 = r9
            kq5 r0 = (defpackage.kq5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kq5 r0 = new kq5
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            goto L5a
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.HomeFollowingQuery r9 = new com.medium.android.graphql.HomeFollowingQuery
            if (r7 != 0) goto L38
            xv8 r7 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r7)
            r7 = r2
        L3e:
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            if (r9 != r1) goto L5a
            return r1
        L5a:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L89
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L89
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L89
            if (r7 != 0) goto L88
            if (r0 != 0) goto L77
            if (r6 == 0) goto L6f
            com.medium.android.graphql.HomeFollowingQuery$Data r6 = (com.medium.android.graphql.HomeFollowingQuery.Data) r6     // Catch: java.lang.Throwable -> L89
            com.medium.android.graphql.HomeFollowingQuery$FollowingFeed r6 = r6.getFollowingFeed()     // Catch: java.lang.Throwable -> L89
            goto L99
        L6f:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L89
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L89
            throw r6     // Catch: java.lang.Throwable -> L89
        L77:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L89
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L89
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L89
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L89
            throw r6     // Catch: java.lang.Throwable -> L89
        L88:
            throw r7     // Catch: java.lang.Throwable -> L89
        L89:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            r7.<init>(r6)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            goto L98
        L91:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L98:
            r6 = r7
        L99:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lb1
            if (r6 == 0) goto La1
            goto Lb1
        La1:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La9
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La9
            throw r6     // Catch: java.lang.Throwable -> La9
        La9:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lb1:
            return r6
        Lb2:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mq5.b(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(boolean r7, com.medium.android.graphql.type.PagingOptions r8, defpackage.yd4 r9, defpackage.p92 r10) {
        /*
            r6 = this;
            boolean r0 = r10 instanceof defpackage.lq5
            if (r0 == 0) goto L13
            r0 = r10
            lq5 r0 = (defpackage.lq5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            lq5 r0 = new lq5
            r0.<init>(r6, r10)
        L18:
            java.lang.Object r10 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r10)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lbb
            goto L63
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r10)
            com.medium.android.graphql.HomeRecommendedQuery r10 = new com.medium.android.graphql.HomeRecommendedQuery
            if (r8 != 0) goto L38
            xv8 r8 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r8)
            r8 = r2
        L3e:
            java.lang.Boolean r7 = java.lang.Boolean.valueOf(r7)
            yv8 r2 = new yv8
            r2.<init>(r7)
            r10.<init>(r8, r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r10)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lbb
            java.lang.Object r10 = r6.b(r0)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lbb
            if (r10 != r1) goto L63
            return r1
        L63:
            j00 r10 = (defpackage.j00) r10     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lbb
            du8 r6 = r10.c     // Catch: java.lang.Throwable -> L92
            com.apollographql.apollo.exception.ApolloException r7 = r10.e     // Catch: java.lang.Throwable -> L92
            java.util.List r0 = r10.d     // Catch: java.lang.Throwable -> L92
            if (r7 != 0) goto L91
            if (r0 != 0) goto L80
            if (r6 == 0) goto L78
            com.medium.android.graphql.HomeRecommendedQuery$Data r6 = (com.medium.android.graphql.HomeRecommendedQuery.Data) r6     // Catch: java.lang.Throwable -> L92
            com.medium.android.graphql.HomeRecommendedQuery$WebRecommendedFeed r6 = r6.getWebRecommendedFeed()     // Catch: java.lang.Throwable -> L92
            goto La2
        L78:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L92
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L92
            throw r6     // Catch: java.lang.Throwable -> L92
        L80:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L92
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L92
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L92
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L92
            throw r6     // Catch: java.lang.Throwable -> L92
        L91:
            throw r7     // Catch: java.lang.Throwable -> L92
        L92:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lbb
            r7.<init>(r6)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lbb
            goto La1
        L9a:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        La1:
            r6 = r7
        La2:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lba
            if (r6 == 0) goto Laa
            goto Lba
        Laa:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> Lb2
            throw r6     // Catch: java.lang.Throwable -> Lb2
        Lb2:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lba:
            return r6
        Lbb:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mq5.c(boolean, com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }
}
