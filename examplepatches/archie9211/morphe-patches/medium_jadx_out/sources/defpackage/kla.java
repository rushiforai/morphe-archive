package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kla {
    public final e00 a;

    public kla(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.qka
            if (r0 == 0) goto L13
            r0 = r12
            qka r0 = (defpackage.qka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qka r0 = new qka
            r0.<init>(r11, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            goto L5a
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r12)
            com.medium.android.graphql.PublicationFollowersQuery r12 = new com.medium.android.graphql.PublicationFollowersQuery
            if (r14 != 0) goto L38
            xv8 r14 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r14)
            r14 = r2
        L3e:
            r12.<init>(r15, r14)
            e00 r11 = r11.a
            r11.getClass()
            uz r14 = new uz
            r14.<init>(r11, r12)
            java.lang.Object r11 = defpackage.gr7.i(r14, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            java.lang.Object r12 = r11.b(r0)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            if (r12 != r1) goto L5a
            return r1
        L5a:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            du8 r11 = r12.c     // Catch: java.lang.Throwable -> L8f
            com.apollographql.apollo.exception.ApolloException r13 = r12.e     // Catch: java.lang.Throwable -> L8f
            java.util.List r5 = r12.d     // Catch: java.lang.Throwable -> L8f
            if (r13 != 0) goto L8e
            if (r5 != 0) goto L7d
            if (r11 == 0) goto L75
            com.medium.android.graphql.PublicationFollowersQuery$Data r11 = (com.medium.android.graphql.PublicationFollowersQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.PublicationFollowersQuery$Collection r11 = r11.getCollection()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.PublicationFollowersQuery$FollowersUserConnection r4 = r11.getFollowersUserConnection()     // Catch: java.lang.Throwable -> L8f
            goto L9e
        L75:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8f
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8f
            throw r11     // Catch: java.lang.Throwable -> L8f
        L7d:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8f
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8f
            throw r11     // Catch: java.lang.Throwable -> L8f
        L8e:
            throw r13     // Catch: java.lang.Throwable -> L8f
        L8f:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            r4.<init>(r11)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            goto L9e
        L97:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L9e:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb4
            if (r4 == 0) goto La5
            goto Lb4
        La5:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lad
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lad
            throw r11     // Catch: java.lang.Throwable -> Lad
        Lad:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb4:
            return r4
        Lb5:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.a(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(int r7, defpackage.p92 r8, defpackage.yd4 r9, java.lang.String r10) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.rka
            if (r0 == 0) goto L13
            r0 = r8
            rka r0 = (defpackage.rka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            rka r0 = new rka
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.PublicationByIdQuery r8 = new com.medium.android.graphql.PublicationByIdQuery
            r8.<init>(r10, r10, r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            if (r8 != r1) goto L4f
            return r1
        L4f:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L78
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L78
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L77:
            throw r7     // Catch: java.lang.Throwable -> L78
        L78:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            return r6
        L89:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.b(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r7, int r8, int r9, defpackage.yd4 r10, defpackage.p92 r11) {
        /*
            r6 = this;
            boolean r0 = r11 instanceof defpackage.ska
            if (r0 == 0) goto L13
            r0 = r11
            ska r0 = (defpackage.ska) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ska r0 = new ska
            r0.<init>(r6, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r11)
            com.medium.android.graphql.PublicationAboutQuery r11 = new com.medium.android.graphql.PublicationAboutQuery
            r11.<init>(r7, r8, r9)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r11)
            java.lang.Object r6 = defpackage.gr7.i(r7, r10)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            java.lang.Object r11 = r6.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            if (r11 != r1) goto L4f
            return r1
        L4f:
            j00 r11 = (defpackage.j00) r11     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            du8 r6 = r11.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r11.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r11.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L78
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L78
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L77:
            throw r7     // Catch: java.lang.Throwable -> L78
        L78:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            return r6
        L89:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.c(java.lang.String, int, int, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.uka
            if (r0 == 0) goto L13
            r0 = r9
            uka r0 = (defpackage.uka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            uka r0 = new uka
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.PublicationHomeQuery r9 = new com.medium.android.graphql.PublicationHomeQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.PublicationHomeQuery$Data r6 = (com.medium.android.graphql.PublicationHomeQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.PublicationHomeQuery$Publication r6 = r6.getPublication()     // Catch: java.lang.Throwable -> L7e
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La6
            if (r6 == 0) goto L96
            goto La6
        L96:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L9e
            throw r6     // Catch: java.lang.Throwable -> L9e
        L9e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La6:
            return r6
        La7:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.e(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable f(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.vka
            if (r0 == 0) goto L13
            r0 = r13
            vka r0 = (defpackage.vka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            vka r0 = new vka
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            goto L5f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.PublicationIdFromSlugQuery r13 = new com.medium.android.graphql.PublicationIdFromSlugQuery
            com.medium.android.graphql.type.PublicationRef r5 = new com.medium.android.graphql.type.PublicationRef
            yv8 r7 = new yv8
            r7.<init>(r12)
            r9 = 5
            r10 = 0
            r6 = 0
            r8 = 0
            r5.<init>(r6, r7, r8, r9, r10)
            r13.<init>(r5)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            yd4 r11 = defpackage.yd4.CacheFirst
            java.lang.Object r11 = defpackage.gr7.i(r12, r11)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            if (r13 != r1) goto L5f
            return r1
        L5f:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L94
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L94
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L94
            if (r12 != 0) goto L93
            if (r5 != 0) goto L82
            if (r11 == 0) goto L7a
            com.medium.android.graphql.PublicationIdFromSlugQuery$Data r11 = (com.medium.android.graphql.PublicationIdFromSlugQuery.Data) r11     // Catch: java.lang.Throwable -> L94
            com.medium.android.graphql.PublicationIdFromSlugQuery$PublicationByRef r11 = r11.getPublicationByRef()     // Catch: java.lang.Throwable -> L94
            if (r11 == 0) goto La3
            java.lang.String r4 = r11.getId()     // Catch: java.lang.Throwable -> L94
            goto La3
        L7a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L94
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L94
            throw r11     // Catch: java.lang.Throwable -> L94
        L82:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L94
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L94
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L94
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L94
            throw r11     // Catch: java.lang.Throwable -> L94
        L93:
            throw r12     // Catch: java.lang.Throwable -> L94
        L94:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            r4.<init>(r11)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            goto La3
        L9c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La3:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb9
            if (r4 == 0) goto Laa
            goto Lb9
        Laa:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb2
            throw r11     // Catch: java.lang.Throwable -> Lb2
        Lb2:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb9:
            return r4
        Lba:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.f(java.lang.String, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r7, java.lang.String r8, defpackage.yd4 r9, defpackage.p92 r10) {
        /*
            r6 = this;
            boolean r0 = r10 instanceof defpackage.wka
            if (r0 == 0) goto L13
            r0 = r10
            wka r0 = (defpackage.wka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            wka r0 = new wka
            r0.<init>(r6, r10)
        L18:
            java.lang.Object r10 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r10)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r10)
            com.medium.android.graphql.PublicationNewsletterQuery r10 = new com.medium.android.graphql.PublicationNewsletterQuery
            r10.<init>(r7, r8)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r10)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            java.lang.Object r10 = r6.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            if (r10 != r1) goto L4f
            return r1
        L4f:
            j00 r10 = (defpackage.j00) r10     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            du8 r6 = r10.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r10.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r10.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L78
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L78
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L77:
            throw r7     // Catch: java.lang.Throwable -> L78
        L78:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            return r6
        L89:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.g(java.lang.String, java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(int r8, defpackage.p92 r9, defpackage.yd4 r10, java.lang.String r11, java.lang.String r12) {
        /*
            r7 = this;
            boolean r2 = r9 instanceof defpackage.xka
            if (r2 == 0) goto L13
            r2 = r9
            xka r2 = (defpackage.xka) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L13
            int r3 = r3 - r4
            r2.d = r3
            goto L18
        L13:
            xka r2 = new xka
            r2.<init>(r7, r9)
        L18:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 1
            r6 = 0
            if (r4 == 0) goto L2e
            if (r4 != r5) goto L28
            defpackage.br7.v(r1)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            goto L55
        L28:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r6
        L2e:
            defpackage.br7.v(r1)
            com.medium.android.graphql.PublicationNewsletterPostsQuery r1 = new com.medium.android.graphql.PublicationNewsletterPostsQuery
            if (r12 != 0) goto L38
            java.lang.String r4 = ""
            goto L39
        L38:
            r4 = r12
        L39:
            r1.<init>(r11, r8, r4)
            e00 r0 = r7.a
            r0.getClass()
            uz r4 = new uz
            r4.<init>(r0, r1)
            java.lang.Object r0 = defpackage.gr7.i(r4, r10)
            uz r0 = (defpackage.uz) r0
            r2.d = r5     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            java.lang.Object r1 = r0.b(r2)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            if (r1 != r3) goto L55
            return r3
        L55:
            j00 r1 = (defpackage.j00) r1     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            du8 r0 = r1.c     // Catch: java.lang.Throwable -> L96
            com.apollographql.apollo.exception.ApolloException r2 = r1.e     // Catch: java.lang.Throwable -> L96
            java.util.List r1 = r1.d     // Catch: java.lang.Throwable -> L96
            if (r2 != 0) goto L95
            if (r1 != 0) goto L7e
            if (r0 == 0) goto L76
            com.medium.android.graphql.PublicationNewsletterPostsQuery$Data r0 = (com.medium.android.graphql.PublicationNewsletterPostsQuery.Data) r0     // Catch: java.lang.Throwable -> L96
            com.medium.android.graphql.PublicationNewsletterPostsQuery$Publication r0 = r0.getPublication()     // Catch: java.lang.Throwable -> L96
            if (r0 == 0) goto La3
            com.medium.android.graphql.PublicationNewsletterPostsQuery$Newsletter r0 = r0.getNewsletter()     // Catch: java.lang.Throwable -> L96
            if (r0 == 0) goto La3
            com.medium.android.graphql.PublicationNewsletterPostsQuery$PostsConnection r6 = r0.getPostsConnection()     // Catch: java.lang.Throwable -> L96
            goto La3
        L76:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L96
            java.lang.String r1 = "data is null"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L96
            throw r0     // Catch: java.lang.Throwable -> L96
        L7e:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L96
            a00 r2 = defpackage.a00.b     // Catch: java.lang.Throwable -> L96
            r3 = 31
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = r1
            r11 = r2
            r12 = r3
            r8 = r4
            r9 = r5
            r10 = r6
            java.lang.String r1 = defpackage.bu1.F0(r7, r8, r9, r10, r11, r12)     // Catch: java.lang.Throwable -> L96
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L96
            throw r0     // Catch: java.lang.Throwable -> L96
        L95:
            throw r2     // Catch: java.lang.Throwable -> L96
        L96:
            r0 = move-exception
            ajb r6 = new ajb     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            r6.<init>(r0)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            goto La3
        L9d:
            r0 = move-exception
            ajb r6 = new ajb
            r6.<init>(r0)
        La3:
            boolean r0 = r6 instanceof defpackage.ajb
            if (r0 != 0) goto Lb8
            if (r6 == 0) goto Laa
            goto Lb8
        Laa:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r1 = "invalid response data"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lb2
            throw r0     // Catch: java.lang.Throwable -> Lb2
        Lb2:
            r0 = move-exception
            ajb r6 = new ajb
            r6.<init>(r0)
        Lb8:
            return r6
        Lb9:
            r0 = move-exception
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.h(int, p92, yd4, java.lang.String, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(java.lang.String r7, int r8, java.lang.String r9, com.medium.android.graphql.type.PublicationStaffRole r10, defpackage.yd4 r11, defpackage.p92 r12) {
        /*
            r6 = this;
            boolean r0 = r12 instanceof defpackage.zka
            if (r0 == 0) goto L13
            r0 = r12
            zka r0 = (defpackage.zka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            zka r0 = new zka
            r0.<init>(r6, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L8a java.util.concurrent.CancellationException -> Lab
            goto L53
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r12)
            com.medium.android.graphql.PublicationStaffQuery r12 = new com.medium.android.graphql.PublicationStaffQuery
            if (r9 != 0) goto L37
            java.lang.String r9 = ""
        L37:
            r12.<init>(r7, r8, r9, r10)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r12)
            java.lang.Object r6 = defpackage.gr7.i(r7, r11)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L8a java.util.concurrent.CancellationException -> Lab
            java.lang.Object r12 = r6.b(r0)     // Catch: java.lang.Exception -> L8a java.util.concurrent.CancellationException -> Lab
            if (r12 != r1) goto L53
            return r1
        L53:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L8a java.util.concurrent.CancellationException -> Lab
            du8 r6 = r12.c     // Catch: java.lang.Throwable -> L82
            com.apollographql.apollo.exception.ApolloException r7 = r12.e     // Catch: java.lang.Throwable -> L82
            java.util.List r0 = r12.d     // Catch: java.lang.Throwable -> L82
            if (r7 != 0) goto L81
            if (r0 != 0) goto L70
            if (r6 == 0) goto L68
            com.medium.android.graphql.PublicationStaffQuery$Data r6 = (com.medium.android.graphql.PublicationStaffQuery.Data) r6     // Catch: java.lang.Throwable -> L82
            com.medium.android.graphql.PublicationStaffQuery$Publication r6 = r6.getPublication()     // Catch: java.lang.Throwable -> L82
            goto L92
        L68:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L82
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L82
            throw r6     // Catch: java.lang.Throwable -> L82
        L70:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L82
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L82
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L82
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L82
            throw r6     // Catch: java.lang.Throwable -> L82
        L81:
            throw r7     // Catch: java.lang.Throwable -> L82
        L82:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L8a java.util.concurrent.CancellationException -> Lab
            r7.<init>(r6)     // Catch: java.lang.Exception -> L8a java.util.concurrent.CancellationException -> Lab
            goto L91
        L8a:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L91:
            r6 = r7
        L92:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Laa
            if (r6 == 0) goto L9a
            goto Laa
        L9a:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La2
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La2
            throw r6     // Catch: java.lang.Throwable -> La2
        La2:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Laa:
            return r6
        Lab:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.j(java.lang.String, int, java.lang.String, com.medium.android.graphql.type.PublicationStaffRole, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.ala
            if (r0 == 0) goto L13
            r0 = r9
            ala r0 = (defpackage.ala) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ala r0 = new ala
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.PublicationTagsQuery r9 = new com.medium.android.graphql.PublicationTagsQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.PublicationTagsQuery$Data r6 = (com.medium.android.graphql.PublicationTagsQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.PublicationTagsQuery$Publication r6 = r6.getPublication()     // Catch: java.lang.Throwable -> L7e
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La6
            if (r6 == 0) goto L96
            goto La6
        L96:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L9e
            throw r6     // Catch: java.lang.Throwable -> L9e
        L9e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La6:
            return r6
        La7:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.k(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.bla
            if (r0 == 0) goto L13
            r0 = r14
            bla r0 = (defpackage.bla) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            bla r0 = new bla
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
            com.medium.android.graphql.PublicationPostTimelineQuery r14 = new com.medium.android.graphql.PublicationPostTimelineQuery
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
            com.medium.android.graphql.PublicationPostTimelineQuery$Data r11 = (com.medium.android.graphql.PublicationPostTimelineQuery.Data) r11     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.PublicationPostTimelineQuery$Publication r11 = r11.getPublication()     // Catch: java.lang.Throwable -> L84
            if (r11 == 0) goto L93
            com.medium.android.graphql.PublicationPostTimelineQuery$PostTimeline r4 = r11.getPostTimeline()     // Catch: java.lang.Throwable -> L84
            goto L93
        L6a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L84
            throw r11     // Catch: java.lang.Throwable -> L84
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L84
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.l(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(java.util.List r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.cla
            if (r0 == 0) goto L13
            r0 = r9
            cla r0 = (defpackage.cla) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            cla r0 = new cla
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.PublicationSectionPostsQuery r9 = new com.medium.android.graphql.PublicationSectionPostsQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.PublicationSectionPostsQuery$Data r6 = (com.medium.android.graphql.PublicationSectionPostsQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            java.util.List r6 = r6.getPostResults()     // Catch: java.lang.Throwable -> L7e
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La6
            if (r6 == 0) goto L96
            goto La6
        L96:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L9e
            throw r6     // Catch: java.lang.Throwable -> L9e
        L9e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La6:
            return r6
        La7:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.m(java.util.List, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object n(java.lang.String r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 269
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.n(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable o(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.ela
            if (r0 == 0) goto L13
            r0 = r13
            ela r0 = (defpackage.ela) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ela r0 = new ela
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L8e java.util.concurrent.CancellationException -> Lac
            goto L51
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.PublicationNameQuery r13 = new com.medium.android.graphql.PublicationNameQuery
            r13.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            yd4 r11 = defpackage.yd4.CacheFirst
            java.lang.Object r11 = defpackage.gr7.i(r12, r11)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L8e java.util.concurrent.CancellationException -> Lac
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L8e java.util.concurrent.CancellationException -> Lac
            if (r13 != r1) goto L51
            return r1
        L51:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L8e java.util.concurrent.CancellationException -> Lac
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L86
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L86
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L86
            if (r12 != 0) goto L85
            if (r5 != 0) goto L74
            if (r11 == 0) goto L6c
            com.medium.android.graphql.PublicationNameQuery$Data r11 = (com.medium.android.graphql.PublicationNameQuery.Data) r11     // Catch: java.lang.Throwable -> L86
            com.medium.android.graphql.PublicationNameQuery$Publication r11 = r11.getPublication()     // Catch: java.lang.Throwable -> L86
            if (r11 == 0) goto L95
            java.lang.String r4 = r11.getName()     // Catch: java.lang.Throwable -> L86
            goto L95
        L6c:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L86
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L86
            throw r11     // Catch: java.lang.Throwable -> L86
        L74:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L86
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L86
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L86
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L86
            throw r11     // Catch: java.lang.Throwable -> L86
        L85:
            throw r12     // Catch: java.lang.Throwable -> L86
        L86:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L8e java.util.concurrent.CancellationException -> Lac
            r4.<init>(r11)     // Catch: java.lang.Exception -> L8e java.util.concurrent.CancellationException -> Lac
            goto L95
        L8e:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L95:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lab
            if (r4 == 0) goto L9c
            goto Lab
        L9c:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La4
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La4
            throw r11     // Catch: java.lang.Throwable -> La4
        La4:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lab:
            return r4
        Lac:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.o(java.lang.String, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object p(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.fla
            if (r0 == 0) goto L13
            r0 = r13
            fla r0 = (defpackage.fla) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            fla r0 = new fla
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            goto L49
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.MutePublicationMutation r13 = new com.medium.android.graphql.MutePublicationMutation
            r13.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            java.lang.Object r13 = r12.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            if (r13 != r1) goto L49
            return r1
        L49:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L7e
            if (r12 != 0) goto L7d
            if (r5 != 0) goto L6c
            if (r11 == 0) goto L64
            com.medium.android.graphql.MutePublicationMutation$Data r11 = (com.medium.android.graphql.MutePublicationMutation.Data) r11     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.MutePublicationMutation$MuteCollection r11 = r11.getMuteCollection()     // Catch: java.lang.Throwable -> L7e
            if (r11 == 0) goto L8d
            com.medium.android.graphql.fragment.CollectionProfileData r4 = r11.getCollectionProfileData()     // Catch: java.lang.Throwable -> L7e
            goto L8d
        L64:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L7e
            throw r11     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7e
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L7e
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L7e
            throw r11     // Catch: java.lang.Throwable -> L7e
        L7d:
            throw r12     // Catch: java.lang.Throwable -> L7e
        L7e:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            r4.<init>(r11)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            goto L8d
        L86:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L8d:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto La3
            if (r4 == 0) goto L94
            goto La3
        L94:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9c
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9c
            throw r11     // Catch: java.lang.Throwable -> L9c
        L9c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La3:
            return r4
        La4:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.p(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object q(java.lang.String r18, boolean r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 271
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.q(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object r(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.hla
            if (r0 == 0) goto L13
            r0 = r13
            hla r0 = (defpackage.hla) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            hla r0 = new hla
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            goto L49
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.UnmutePublicationMutation r13 = new com.medium.android.graphql.UnmutePublicationMutation
            r13.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            java.lang.Object r13 = r12.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            if (r13 != r1) goto L49
            return r1
        L49:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L7e
            if (r12 != 0) goto L7d
            if (r5 != 0) goto L6c
            if (r11 == 0) goto L64
            com.medium.android.graphql.UnmutePublicationMutation$Data r11 = (com.medium.android.graphql.UnmutePublicationMutation.Data) r11     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.UnmutePublicationMutation$UnmuteCollection r11 = r11.getUnmuteCollection()     // Catch: java.lang.Throwable -> L7e
            if (r11 == 0) goto L8d
            com.medium.android.graphql.fragment.CollectionProfileData r4 = r11.getCollectionProfileData()     // Catch: java.lang.Throwable -> L7e
            goto L8d
        L64:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L7e
            throw r11     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7e
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L7e
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L7e
            throw r11     // Catch: java.lang.Throwable -> L7e
        L7d:
            throw r12     // Catch: java.lang.Throwable -> L7e
        L7e:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            r4.<init>(r11)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            goto L8d
        L86:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L8d:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto La3
            if (r4 == 0) goto L94
            goto La3
        L94:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9c
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9c
            throw r11     // Catch: java.lang.Throwable -> L9c
        L9c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La3:
            return r4
        La4:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.r(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r15, int r16, java.lang.String r17, com.medium.android.graphql.type.PublicationPostsOrderBy r18, com.medium.android.graphql.type.PublicationPostsFilter r19, defpackage.yd4 r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.d(java.lang.String, int, java.lang.String, com.medium.android.graphql.type.PublicationPostsOrderBy, com.medium.android.graphql.type.PublicationPostsFilter, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.yka
            if (r0 == 0) goto L13
            r0 = r14
            yka r0 = (defpackage.yka) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            yka r0 = new yka
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lab
            goto L4f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.CollectionProfileByIdQuery r14 = new com.medium.android.graphql.CollectionProfileByIdQuery
            r14.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lab
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lab
            if (r14 != r1) goto L4f
            return r1
        L4f:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lab
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L84
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L84
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L84
            if (r12 != 0) goto L83
            if (r5 != 0) goto L72
            if (r11 == 0) goto L6a
            com.medium.android.graphql.CollectionProfileByIdQuery$Data r11 = (com.medium.android.graphql.CollectionProfileByIdQuery.Data) r11     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.CollectionProfileByIdQuery$Collection r11 = r11.getCollection()     // Catch: java.lang.Throwable -> L84
            if (r11 == 0) goto L93
            com.medium.android.graphql.fragment.CollectionProfileData r4 = r11.getCollectionProfileData()     // Catch: java.lang.Throwable -> L84
            goto L93
        L6a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L84
            throw r11     // Catch: java.lang.Throwable -> L84
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L84
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
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lab
            r4.<init>(r11)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Lab
            goto L93
        L8c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L93:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Laa
            if (r4 == 0) goto L9a
            goto Laa
        L9a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La3
            r12 = 0
            java.lang.String r12 = com.medium.android.donkey.main.Wv.MaAxRJinch.UgcnNVvYVVsMGbr     // Catch: java.lang.Throwable -> La3
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La3
            throw r11     // Catch: java.lang.Throwable -> La3
        La3:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Laa:
            return r4
        Lab:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kla.i(java.lang.String, yd4, p92):java.lang.Object");
    }
}
