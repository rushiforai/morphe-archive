package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qcf {
    public final e00 a;
    public final zk2 b;

    public qcf(e00 e00Var, zk2 zk2Var) {
        e00Var.getClass();
        zk2Var.getClass();
        this.a = e00Var;
        this.b = zk2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(int r12, defpackage.p92 r13, defpackage.yd4 r14, java.lang.String r15) {
        /*
            Method dump skipped, instruction units count: 202
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.a(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(int r8, defpackage.p92 r9, defpackage.yd4 r10, java.lang.String r11, java.lang.String r12) {
        /*
            r7 = this;
            boolean r2 = r9 instanceof defpackage.ecf
            if (r2 == 0) goto L13
            r2 = r9
            ecf r2 = (defpackage.ecf) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L13
            int r3 = r3 - r4
            r2.d = r3
            goto L18
        L13:
            ecf r2 = new ecf
            r2.<init>(r7, r9)
        L18:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 1
            r6 = 0
            if (r4 == 0) goto L2e
            if (r4 != r5) goto L28
            defpackage.br7.v(r1)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            goto L55
        L28:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r6
        L2e:
            defpackage.br7.v(r1)
            com.medium.android.graphql.TagLatestPostsQuery r1 = new com.medium.android.graphql.TagLatestPostsQuery
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
            r2.d = r5     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            java.lang.Object r1 = r0.b(r2)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            if (r1 != r3) goto L55
            return r3
        L55:
            j00 r1 = (defpackage.j00) r1     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            du8 r0 = r1.c     // Catch: java.lang.Throwable -> L90
            com.apollographql.apollo.exception.ApolloException r2 = r1.e     // Catch: java.lang.Throwable -> L90
            java.util.List r1 = r1.d     // Catch: java.lang.Throwable -> L90
            if (r2 != 0) goto L8f
            if (r1 != 0) goto L78
            if (r0 == 0) goto L70
            com.medium.android.graphql.TagLatestPostsQuery$Data r0 = (com.medium.android.graphql.TagLatestPostsQuery.Data) r0     // Catch: java.lang.Throwable -> L90
            com.medium.android.graphql.TagLatestPostsQuery$TagFromSlug r0 = r0.getTagFromSlug()     // Catch: java.lang.Throwable -> L90
            if (r0 == 0) goto L9d
            com.medium.android.graphql.TagLatestPostsQuery$Posts r6 = r0.getPosts()     // Catch: java.lang.Throwable -> L90
            goto L9d
        L70:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L90
            java.lang.String r1 = "data is null"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L90
            throw r0     // Catch: java.lang.Throwable -> L90
        L78:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L90
            fcf r2 = defpackage.fcf.b     // Catch: java.lang.Throwable -> L90
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
            java.lang.String r1 = defpackage.bu1.F0(r7, r8, r9, r10, r11, r12)     // Catch: java.lang.Throwable -> L90
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L90
            throw r0     // Catch: java.lang.Throwable -> L90
        L8f:
            throw r2     // Catch: java.lang.Throwable -> L90
        L90:
            r0 = move-exception
            ajb r6 = new ajb     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            r6.<init>(r0)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            goto L9d
        L97:
            r0 = move-exception
            ajb r6 = new ajb
            r6.<init>(r0)
        L9d:
            boolean r0 = r6 instanceof defpackage.ajb
            if (r0 != 0) goto Lb2
            if (r6 == 0) goto La4
            goto Lb2
        La4:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lac
            java.lang.String r1 = "invalid response data"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lac
            throw r0     // Catch: java.lang.Throwable -> Lac
        Lac:
            r0 = move-exception
            ajb r6 = new ajb
            r6.<init>(r0)
        Lb2:
            return r6
        Lb3:
            r0 = move-exception
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.b(int, p92, yd4, java.lang.String, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.gcf
            if (r0 == 0) goto L13
            r0 = r14
            gcf r0 = (defpackage.gcf) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gcf r0 = new gcf
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            goto L5a
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.YourFollowedTagsQuery r14 = new com.medium.android.graphql.YourFollowedTagsQuery
            if (r12 != 0) goto L38
            xv8 r12 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r12)
            r12 = r2
        L3e:
            r14.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            if (r14 != r1) goto L5a
            return r1
        L5a:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb5
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L8f
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L8f
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L8f
            if (r12 != 0) goto L8e
            if (r5 != 0) goto L7d
            if (r11 == 0) goto L75
            com.medium.android.graphql.YourFollowedTagsQuery$Data r11 = (com.medium.android.graphql.YourFollowedTagsQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.YourFollowedTagsQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.YourFollowedTagsQuery$FollowedTags r4 = r11.getFollowedTags()     // Catch: java.lang.Throwable -> L8f
            goto L9e
        L75:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8f
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8f
            throw r11     // Catch: java.lang.Throwable -> L8f
        L7d:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8f
            hcf r9 = defpackage.hcf.b     // Catch: java.lang.Throwable -> L8f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8f
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8f
            throw r11     // Catch: java.lang.Throwable -> L8f
        L8e:
            throw r12     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.c(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable d(defpackage.p92 r11) {
        /*
            Method dump skipped, instruction units count: 215
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.d(p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(int r8, defpackage.p92 r9, defpackage.yd4 r10, java.lang.String r11, java.lang.String r12) {
        /*
            r7 = this;
            boolean r2 = r9 instanceof defpackage.kcf
            if (r2 == 0) goto L13
            r2 = r9
            kcf r2 = (defpackage.kcf) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L13
            int r3 = r3 - r4
            r2.d = r3
            goto L18
        L13:
            kcf r2 = new kcf
            r2.<init>(r7, r9)
        L18:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 1
            r6 = 0
            if (r4 == 0) goto L2e
            if (r4 != r5) goto L28
            defpackage.br7.v(r1)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            goto L55
        L28:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r6
        L2e:
            defpackage.br7.v(r1)
            com.medium.android.graphql.FollowedPublicationPostsQuery r1 = new com.medium.android.graphql.FollowedPublicationPostsQuery
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
            r2.d = r5     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            java.lang.Object r1 = r0.b(r2)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            if (r1 != r3) goto L55
            return r3
        L55:
            j00 r1 = (defpackage.j00) r1     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            du8 r0 = r1.c     // Catch: java.lang.Throwable -> L90
            com.apollographql.apollo.exception.ApolloException r2 = r1.e     // Catch: java.lang.Throwable -> L90
            java.util.List r1 = r1.d     // Catch: java.lang.Throwable -> L90
            if (r2 != 0) goto L8f
            if (r1 != 0) goto L78
            if (r0 == 0) goto L70
            com.medium.android.graphql.FollowedPublicationPostsQuery$Data r0 = (com.medium.android.graphql.FollowedPublicationPostsQuery.Data) r0     // Catch: java.lang.Throwable -> L90
            com.medium.android.graphql.FollowedPublicationPostsQuery$Publication r0 = r0.getPublication()     // Catch: java.lang.Throwable -> L90
            if (r0 == 0) goto L9d
            com.medium.android.graphql.FollowedPublicationPostsQuery$PostsConnection r6 = r0.getPostsConnection()     // Catch: java.lang.Throwable -> L90
            goto L9d
        L70:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L90
            java.lang.String r1 = "data is null"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L90
            throw r0     // Catch: java.lang.Throwable -> L90
        L78:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L90
            lcf r2 = defpackage.lcf.b     // Catch: java.lang.Throwable -> L90
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
            java.lang.String r1 = defpackage.bu1.F0(r7, r8, r9, r10, r11, r12)     // Catch: java.lang.Throwable -> L90
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L90
            throw r0     // Catch: java.lang.Throwable -> L90
        L8f:
            throw r2     // Catch: java.lang.Throwable -> L90
        L90:
            r0 = move-exception
            ajb r6 = new ajb     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            r6.<init>(r0)     // Catch: java.lang.Exception -> L97 java.util.concurrent.CancellationException -> Lb3
            goto L9d
        L97:
            r0 = move-exception
            ajb r6 = new ajb
            r6.<init>(r0)
        L9d:
            boolean r0 = r6 instanceof defpackage.ajb
            if (r0 != 0) goto Lb2
            if (r6 == 0) goto La4
            goto Lb2
        La4:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lac
            java.lang.String r1 = "invalid response data"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lac
            throw r0     // Catch: java.lang.Throwable -> Lac
        Lac:
            r0 = move-exception
            ajb r6 = new ajb
            r6.<init>(r0)
        Lb2:
            return r6
        Lb3:
            r0 = move-exception
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.e(int, p92, yd4, java.lang.String, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.mcf
            if (r0 == 0) goto L13
            r0 = r12
            mcf r0 = (defpackage.mcf) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mcf r0 = new mcf
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
            com.medium.android.graphql.FollowedWriterPostsQuery r12 = new com.medium.android.graphql.FollowedWriterPostsQuery
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
            com.medium.android.graphql.FollowedWriterPostsQuery$Data r11 = (com.medium.android.graphql.FollowedWriterPostsQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.FollowedWriterPostsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.FollowedWriterPostsQuery$LatestPostsConnection r4 = r11.getLatestPostsConnection()     // Catch: java.lang.Throwable -> L8f
            goto L9e
        L75:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8f
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8f
            throw r11     // Catch: java.lang.Throwable -> L8f
        L7d:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8f
            ncf r9 = defpackage.ncf.b     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.f(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable g(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.ocf
            if (r0 == 0) goto L13
            r0 = r13
            ocf r0 = (defpackage.ocf) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ocf r0 = new ocf
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lb8
            goto L54
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.UpdateFollowedEntityViewedAtMutation r13 = new com.medium.android.graphql.UpdateFollowedEntityViewedAtMutation
            com.medium.android.graphql.type.UpdateFollowedEntityViewedAtInput r2 = new com.medium.android.graphql.type.UpdateFollowedEntityViewedAtInput
            zk2 r5 = r11.b
            java.lang.String r5 = r5.m()
            r2.<init>(r5, r12)
            r13.<init>(r2)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            r0.d = r3     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lb8
            java.lang.Object r13 = r12.b(r0)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lb8
            if (r13 != r1) goto L54
            return r1
        L54:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lb8
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L92
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L92
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L92
            if (r12 != 0) goto L91
            if (r5 != 0) goto L80
            if (r11 == 0) goto L77
            com.medium.android.graphql.UpdateFollowedEntityViewedAtMutation$Data r11 = (com.medium.android.graphql.UpdateFollowedEntityViewedAtMutation.Data) r11     // Catch: java.lang.Throwable -> L92
            com.medium.android.graphql.UpdateFollowedEntityViewedAtMutation$UpdateFollowedEntityViewedAt r11 = r11.getUpdateFollowedEntityViewedAt()     // Catch: java.lang.Throwable -> L92
            com.medium.android.graphql.fragment.MutationSuccessData r11 = r11.getMutationSuccessData()     // Catch: java.lang.Throwable -> L92
            if (r11 == 0) goto La1
            boolean r11 = r11.getSuccess()     // Catch: java.lang.Throwable -> L92
            java.lang.Boolean r4 = java.lang.Boolean.valueOf(r11)     // Catch: java.lang.Throwable -> L92
            goto La1
        L77:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L92
            r12 = 0
            java.lang.String r12 = com.medium.android.admin.stagebranch.uG.peNPu.omxUP     // Catch: java.lang.Throwable -> L92
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L92
            throw r11     // Catch: java.lang.Throwable -> L92
        L80:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L92
            pcf r9 = defpackage.pcf.b     // Catch: java.lang.Throwable -> L92
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L92
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L92
            throw r11     // Catch: java.lang.Throwable -> L92
        L91:
            throw r12     // Catch: java.lang.Throwable -> L92
        L92:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lb8
            r4.<init>(r11)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> Lb8
            goto La1
        L9a:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La1:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb7
            if (r4 == 0) goto La8
            goto Lb7
        La8:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb0
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb0
            throw r11     // Catch: java.lang.Throwable -> Lb0
        Lb0:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb7:
            return r4
        Lb8:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qcf.g(java.lang.String, p92):java.io.Serializable");
    }
}
