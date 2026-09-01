package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wz implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ do4 b;
    public final /* synthetic */ yd4 c;

    public /* synthetic */ wz(do4 do4Var, yd4 yd4Var, int i) {
        this.a = i;
        this.b = do4Var;
        this.c = yd4Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object b(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.an9
            if (r0 == 0) goto L14
            r0 = r12
            an9 r0 = (defpackage.an9) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            an9 r0 = new an9
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto Lc0
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L67
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L67
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L67
            if (r2 != 0) goto L85
            if (r5 != 0) goto L74
            if (r0 == 0) goto L6c
            com.medium.android.graphql.PostPreviewDataQuery$Data r0 = (com.medium.android.graphql.PostPreviewDataQuery.Data) r0     // Catch: java.lang.Throwable -> L67
            com.medium.android.graphql.PostPreviewDataQuery$Post r13 = r0.getPost()     // Catch: java.lang.Throwable -> L67
            if (r13 == 0) goto L6a
            com.medium.android.graphql.fragment.PostPreviewData r13 = r13.getPostPreviewData()     // Catch: java.lang.Throwable -> L67
            if (r13 == 0) goto L6a
            java.lang.Long r13 = r13.getPinnedByCreatorAt()     // Catch: java.lang.Throwable -> L67
            r0 = 0
            if (r13 == 0) goto L62
            long r5 = r13.longValue()     // Catch: java.lang.Throwable -> L67
            r7 = 0
            int r13 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r13 <= 0) goto L62
            r0 = r3
        L62:
            java.lang.Boolean r13 = java.lang.Boolean.valueOf(r0)     // Catch: java.lang.Throwable -> L67
            goto L8c
        L67:
            r0 = move-exception
            r13 = r0
            goto L86
        L6a:
            r13 = r4
            goto L8c
        L6c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L67
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L67
            throw r13     // Catch: java.lang.Throwable -> L67
        L74:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L67
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L67
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L67
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L67
            throw r13     // Catch: java.lang.Throwable -> L67
        L85:
            throw r2     // Catch: java.lang.Throwable -> L67
        L86:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L8c:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto La5
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto Lb3
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L9f
            goto Lb3
        L9f:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto Lb3
        La5:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto Lae
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto Lae
            goto Lb3
        Lae:
            bjb r4 = new bjb
            r4.<init>(r13)
        Lb3:
            if (r4 == 0) goto Lc0
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto Lc0
            return r1
        Lc0:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.b(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object c(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.bn9
            if (r0 == 0) goto L14
            r0 = r12
            bn9 r0 = (defpackage.bn9) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            bn9 r0 = new bn9
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto La8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L4f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L4f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L4f
            if (r2 != 0) goto L6d
            if (r5 != 0) goto L5c
            if (r0 == 0) goto L54
            com.medium.android.graphql.PostRepostStateQuery$Data r0 = (com.medium.android.graphql.PostRepostStateQuery.Data) r0     // Catch: java.lang.Throwable -> L4f
            com.medium.android.graphql.PostRepostStateQuery$Post r13 = r0.getPost()     // Catch: java.lang.Throwable -> L4f
            if (r13 == 0) goto L52
            com.medium.android.graphql.fragment.PostRepostStateData r13 = r13.getPostRepostStateData()     // Catch: java.lang.Throwable -> L4f
            goto L74
        L4f:
            r0 = move-exception
            r13 = r0
            goto L6e
        L52:
            r13 = r4
            goto L74
        L54:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L5c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L4f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L4f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L6d:
            throw r2     // Catch: java.lang.Throwable -> L4f
        L6e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L74:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L8d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto L9b
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L87
            goto L9b
        L87:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto L9b
        L8d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L96
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L96
            goto L9b
        L96:
            bjb r4 = new bjb
            r4.<init>(r13)
        L9b:
            if (r4 == 0) goto La8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto La8
            return r1
        La8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.c(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object d(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.cn9
            if (r0 == 0) goto L14
            r0 = r12
            cn9 r0 = (defpackage.cn9) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            cn9 r0 = new cn9
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto La8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L4f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L4f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L4f
            if (r2 != 0) goto L6d
            if (r5 != 0) goto L5c
            if (r0 == 0) goto L54
            com.medium.android.graphql.IsPostViewedQuery$Data r0 = (com.medium.android.graphql.IsPostViewedQuery.Data) r0     // Catch: java.lang.Throwable -> L4f
            com.medium.android.graphql.IsPostViewedQuery$Post r13 = r0.getPost()     // Catch: java.lang.Throwable -> L4f
            if (r13 == 0) goto L52
            com.medium.android.graphql.fragment.PostViewStateData r13 = r13.getPostViewStateData()     // Catch: java.lang.Throwable -> L4f
            goto L74
        L4f:
            r0 = move-exception
            r13 = r0
            goto L6e
        L52:
            r13 = r4
            goto L74
        L54:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L5c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L4f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L4f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L6d:
            throw r2     // Catch: java.lang.Throwable -> L4f
        L6e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L74:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L8d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto L9b
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L87
            goto L9b
        L87:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto L9b
        L8d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L96
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L96
            goto L9b
        L96:
            bjb r4 = new bjb
            r4.<init>(r13)
        L9b:
            if (r4 == 0) goto La8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto La8
            return r1
        La8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.d(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object e(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.fn9
            if (r0 == 0) goto L14
            r0 = r12
            fn9 r0 = (defpackage.fn9) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            fn9 r0 = new fn9
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto La0
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L49
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L49
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L49
            if (r2 != 0) goto L65
            if (r5 != 0) goto L54
            if (r0 == 0) goto L4c
            com.medium.android.graphql.PostUpVotersGlobalDataQuery$Data r0 = (com.medium.android.graphql.PostUpVotersGlobalDataQuery.Data) r0     // Catch: java.lang.Throwable -> L49
            com.medium.android.graphql.PostUpVotersGlobalDataQuery$Post r13 = r0.getPost()     // Catch: java.lang.Throwable -> L49
            goto L6c
        L49:
            r0 = move-exception
            r13 = r0
            goto L66
        L4c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L49
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L49
            throw r13     // Catch: java.lang.Throwable -> L49
        L54:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L49
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L49
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L49
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L49
            throw r13     // Catch: java.lang.Throwable -> L49
        L65:
            throw r2     // Catch: java.lang.Throwable -> L49
        L66:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L6c:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L85
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto L93
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L7f
            goto L93
        L7f:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto L93
        L85:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L8e
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L8e
            goto L93
        L8e:
            bjb r4 = new bjb
            r4.<init>(r13)
        L93:
            if (r4 == 0) goto La0
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto La0
            return r1
        La0:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.e(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object f(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.bba
            if (r0 == 0) goto L14
            r0 = r12
            bba r0 = (defpackage.bba) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            bba r0 = new bba
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto La8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L4f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L4f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L4f
            if (r2 != 0) goto L6d
            if (r5 != 0) goto L5c
            if (r0 == 0) goto L54
            com.medium.android.graphql.PostFeaturingStatusQuery$Data r0 = (com.medium.android.graphql.PostFeaturingStatusQuery.Data) r0     // Catch: java.lang.Throwable -> L4f
            com.medium.android.graphql.PostFeaturingStatusQuery$Post r13 = r0.getPost()     // Catch: java.lang.Throwable -> L4f
            if (r13 == 0) goto L52
            com.medium.android.graphql.fragment.PostFeaturingStatusData r13 = r13.getPostFeaturingStatusData()     // Catch: java.lang.Throwable -> L4f
            goto L74
        L4f:
            r0 = move-exception
            r13 = r0
            goto L6e
        L52:
            r13 = r4
            goto L74
        L54:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L5c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L4f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L4f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L6d:
            throw r2     // Catch: java.lang.Throwable -> L4f
        L6e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L74:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L8d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto L9b
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L87
            goto L9b
        L87:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto L9b
        L8d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L96
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L96
            goto L9b
        L96:
            bjb r4 = new bjb
            r4.<init>(r13)
        L9b:
            if (r4 == 0) goto La8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto La8
            return r1
        La8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.f(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object i(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.ila
            if (r0 == 0) goto L14
            r0 = r12
            ila r0 = (defpackage.ila) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            ila r0 = new ila
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto Lb8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L5f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L5f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L5f
            if (r2 != 0) goto L7d
            if (r5 != 0) goto L6c
            if (r0 == 0) goto L64
            com.medium.android.graphql.CollectionIsFollowingQuery$Data r0 = (com.medium.android.graphql.CollectionIsFollowingQuery.Data) r0     // Catch: java.lang.Throwable -> L5f
            com.medium.android.graphql.CollectionIsFollowingQuery$Collection r13 = r0.getCollection()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            com.medium.android.graphql.fragment.CollectionFollowData r13 = r13.getCollectionFollowData()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            com.medium.android.graphql.fragment.CollectionFollowData$ViewerEdge r13 = r13.getViewerEdge()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            boolean r13 = r13.isFollowing()     // Catch: java.lang.Throwable -> L5f
            java.lang.Boolean r13 = java.lang.Boolean.valueOf(r13)     // Catch: java.lang.Throwable -> L5f
            goto L84
        L5f:
            r0 = move-exception
            r13 = r0
            goto L7e
        L62:
            r13 = r4
            goto L84
        L64:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5f
            throw r13     // Catch: java.lang.Throwable -> L5f
        L6c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L5f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L5f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5f
            throw r13     // Catch: java.lang.Throwable -> L5f
        L7d:
            throw r2     // Catch: java.lang.Throwable -> L5f
        L7e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L84:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L9d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto Lab
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L97
            goto Lab
        L97:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto Lab
        L9d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto La6
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto La6
            goto Lab
        La6:
            bjb r4 = new bjb
            r4.<init>(r13)
        Lab:
            if (r4 == 0) goto Lb8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto Lb8
            return r1
        Lb8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.i(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object j(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.jla
            if (r0 == 0) goto L14
            r0 = r12
            jla r0 = (defpackage.jla) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            jla r0 = new jla
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto Lae
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L55
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L55
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L55
            if (r2 != 0) goto L73
            if (r5 != 0) goto L62
            if (r0 == 0) goto L5a
            com.medium.android.graphql.CollectionIsMutedQuery$Data r0 = (com.medium.android.graphql.CollectionIsMutedQuery.Data) r0     // Catch: java.lang.Throwable -> L55
            com.medium.android.graphql.CollectionIsMutedQuery$Collection r13 = r0.getCollection()     // Catch: java.lang.Throwable -> L55
            if (r13 == 0) goto L58
            com.medium.android.graphql.fragment.CollectionMuteData r13 = r13.getCollectionMuteData()     // Catch: java.lang.Throwable -> L55
            if (r13 == 0) goto L58
            com.medium.android.graphql.fragment.CollectionMuteData$ViewerEdge r13 = r13.getViewerEdge()     // Catch: java.lang.Throwable -> L55
            goto L7a
        L55:
            r0 = move-exception
            r13 = r0
            goto L74
        L58:
            r13 = r4
            goto L7a
        L5a:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L55
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L55
            throw r13     // Catch: java.lang.Throwable -> L55
        L62:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L55
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L55
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L55
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L55
            throw r13     // Catch: java.lang.Throwable -> L55
        L73:
            throw r2     // Catch: java.lang.Throwable -> L55
        L74:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L7a:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L93
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto La1
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L8d
            goto La1
        L8d:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto La1
        L93:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L9c
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L9c
            goto La1
        L9c:
            bjb r4 = new bjb
            r4.<init>(r13)
        La1:
            if (r4 == 0) goto Lae
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto Lae
            return r1
        Lae:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.j(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object l(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.xad
            if (r0 == 0) goto L14
            r0 = r12
            xad r0 = (defpackage.xad) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            xad r0 = new xad
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto La8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L4f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L4f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L4f
            if (r2 != 0) goto L6d
            if (r5 != 0) goto L5c
            if (r0 == 0) goto L54
            com.medium.android.graphql.TagSlugQuery$Data r0 = (com.medium.android.graphql.TagSlugQuery.Data) r0     // Catch: java.lang.Throwable -> L4f
            com.medium.android.graphql.TagSlugQuery$TagFromSlug r13 = r0.getTagFromSlug()     // Catch: java.lang.Throwable -> L4f
            if (r13 == 0) goto L52
            com.medium.android.graphql.fragment.TagData r13 = r13.getTagData()     // Catch: java.lang.Throwable -> L4f
            goto L74
        L4f:
            r0 = move-exception
            r13 = r0
            goto L6e
        L52:
            r13 = r4
            goto L74
        L54:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L5c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L4f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L4f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L6d:
            throw r2     // Catch: java.lang.Throwable -> L4f
        L6e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L74:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L8d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto L9b
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L87
            goto L9b
        L87:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto L9b
        L8d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L96
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L96
            goto L9b
        L96:
            bjb r4 = new bjb
            r4.<init>(r13)
        L9b:
            if (r4 == 0) goto La8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto La8
            return r1
        La8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.l(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object m(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.xke
            if (r0 == 0) goto L14
            r0 = r12
            xke r0 = (defpackage.xke) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            xke r0 = new xke
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto La8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L4f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L4f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L4f
            if (r2 != 0) goto L6d
            if (r5 != 0) goto L5c
            if (r0 == 0) goto L54
            com.medium.android.graphql.UserIsBlockedQuery$Data r0 = (com.medium.android.graphql.UserIsBlockedQuery.Data) r0     // Catch: java.lang.Throwable -> L4f
            com.medium.android.graphql.UserIsBlockedQuery$User r13 = r0.getUser()     // Catch: java.lang.Throwable -> L4f
            if (r13 == 0) goto L52
            com.medium.android.graphql.fragment.UserBlockData r13 = r13.getUserBlockData()     // Catch: java.lang.Throwable -> L4f
            goto L74
        L4f:
            r0 = move-exception
            r13 = r0
            goto L6e
        L52:
            r13 = r4
            goto L74
        L54:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L5c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L4f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L4f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L4f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L4f
            throw r13     // Catch: java.lang.Throwable -> L4f
        L6d:
            throw r2     // Catch: java.lang.Throwable -> L4f
        L6e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L74:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L8d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto L9b
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L87
            goto L9b
        L87:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto L9b
        L8d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto L96
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto L96
            goto L9b
        L96:
            bjb r4 = new bjb
            r4.<init>(r13)
        L9b:
            if (r4 == 0) goto La8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto La8
            return r1
        La8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.m(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object n(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.yke
            if (r0 == 0) goto L14
            r0 = r12
            yke r0 = (defpackage.yke) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            yke r0 = new yke
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto Lb8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L5f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L5f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L5f
            if (r2 != 0) goto L7d
            if (r5 != 0) goto L6c
            if (r0 == 0) goto L64
            com.medium.android.graphql.UserIsFollowingQuery$Data r0 = (com.medium.android.graphql.UserIsFollowingQuery.Data) r0     // Catch: java.lang.Throwable -> L5f
            com.medium.android.graphql.UserIsFollowingQuery$User r13 = r0.getUser()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            com.medium.android.graphql.fragment.UserFollowData r13 = r13.getUserFollowData()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            com.medium.android.graphql.fragment.UserFollowData$ViewerEdge r13 = r13.getViewerEdge()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            boolean r13 = r13.isFollowing()     // Catch: java.lang.Throwable -> L5f
            java.lang.Boolean r13 = java.lang.Boolean.valueOf(r13)     // Catch: java.lang.Throwable -> L5f
            goto L84
        L5f:
            r0 = move-exception
            r13 = r0
            goto L7e
        L62:
            r13 = r4
            goto L84
        L64:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5f
            throw r13     // Catch: java.lang.Throwable -> L5f
        L6c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L5f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L5f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5f
            throw r13     // Catch: java.lang.Throwable -> L5f
        L7d:
            throw r2     // Catch: java.lang.Throwable -> L5f
        L7e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L84:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L9d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto Lab
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L97
            goto Lab
        L97:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto Lab
        L9d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto La6
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto La6
            goto Lab
        La6:
            bjb r4 = new bjb
            r4.<init>(r13)
        Lab:
            if (r4 == 0) goto Lb8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto Lb8
            return r1
        Lb8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.n(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object o(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.zke
            if (r0 == 0) goto L14
            r0 = r12
            zke r0 = (defpackage.zke) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            zke r0 = new zke
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto Lb8
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L5f
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L5f
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L5f
            if (r2 != 0) goto L7d
            if (r5 != 0) goto L6c
            if (r0 == 0) goto L64
            com.medium.android.graphql.UserIsMutedQuery$Data r0 = (com.medium.android.graphql.UserIsMutedQuery.Data) r0     // Catch: java.lang.Throwable -> L5f
            com.medium.android.graphql.UserIsMutedQuery$User r13 = r0.getUser()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            com.medium.android.graphql.fragment.UserMuteData r13 = r13.getUserMuteData()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            com.medium.android.graphql.fragment.UserMuteData$ViewerEdge r13 = r13.getViewerEdge()     // Catch: java.lang.Throwable -> L5f
            if (r13 == 0) goto L62
            boolean r13 = r13.isMuting()     // Catch: java.lang.Throwable -> L5f
            java.lang.Boolean r13 = java.lang.Boolean.valueOf(r13)     // Catch: java.lang.Throwable -> L5f
            goto L84
        L5f:
            r0 = move-exception
            r13 = r0
            goto L7e
        L62:
            r13 = r4
            goto L84
        L64:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5f
            java.lang.String r0 = "data is null"
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5f
            throw r13     // Catch: java.lang.Throwable -> L5f
        L6c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5f
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L5f
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L5f
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5f
            throw r13     // Catch: java.lang.Throwable -> L5f
        L7d:
            throw r2     // Catch: java.lang.Throwable -> L5f
        L7e:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L84:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L9d
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto Lab
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L97
            goto Lab
        L97:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto Lab
        L9d:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto La6
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto La6
            goto Lab
        La6:
            bjb r4 = new bjb
            r4.<init>(r13)
        Lab:
            if (r4 == 0) goto Lb8
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto Lb8
            return r1
        Lb8:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.o(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:131:0x01ac  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0249  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x02f2  */
    /* JADX WARN: Removed duplicated region for block: B:277:0x039b  */
    /* JADX WARN: Removed duplicated region for block: B:326:0x043e  */
    /* JADX WARN: Removed duplicated region for block: B:370:0x04d3  */
    /* JADX WARN: Removed duplicated region for block: B:417:0x0575  */
    /* JADX WARN: Removed duplicated region for block: B:466:0x0620  */
    /* JADX WARN: Removed duplicated region for block: B:513:0x06c1  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x002a  */
    @Override // defpackage.do4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r19, defpackage.n92 r20) {
        /*
            Method dump skipped, instruction units count: 1904
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.a(java.lang.Object, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object k(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.k2c
            if (r0 == 0) goto L14
            r0 = r12
            k2c r0 = (defpackage.k2c) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.c = r1
        L12:
            r12 = r0
            goto L1a
        L14:
            k2c r0 = new k2c
            r0.<init>(r11, r12)
            goto L12
        L1a:
            java.lang.Object r0 = r12.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r12.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r0)
            goto Lb5
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r0)
            j00 r13 = (defpackage.j00) r13
            du8 r0 = r13.c     // Catch: java.lang.Throwable -> L5b
            com.apollographql.apollo.exception.ApolloException r2 = r13.e     // Catch: java.lang.Throwable -> L5b
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L5b
            if (r2 != 0) goto L7a
            if (r5 != 0) goto L69
            if (r0 == 0) goto L60
            com.medium.android.graphql.UserPreferencesQuery$Data r0 = (com.medium.android.graphql.UserPreferencesQuery.Data) r0     // Catch: java.lang.Throwable -> L5b
            com.medium.android.graphql.UserPreferencesQuery$Viewer r13 = r0.getViewer()     // Catch: java.lang.Throwable -> L5b
            if (r13 == 0) goto L5e
            com.medium.android.graphql.UserPreferencesQuery$ViewerEdge r13 = r13.getViewerEdge()     // Catch: java.lang.Throwable -> L5b
            if (r13 == 0) goto L5e
            java.util.List r13 = r13.getPreferences()     // Catch: java.lang.Throwable -> L5b
            if (r13 == 0) goto L5e
            gee r13 = defpackage.hee.c(r13)     // Catch: java.lang.Throwable -> L5b
            goto L81
        L5b:
            r0 = move-exception
            r13 = r0
            goto L7b
        L5e:
            r13 = r4
            goto L81
        L60:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5b
            r0 = 0
            java.lang.String r0 = com.google.android.gms.analytics.wYI.ivbZv.qTlDjoMKievNOXH     // Catch: java.lang.Throwable -> L5b
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5b
            throw r13     // Catch: java.lang.Throwable -> L5b
        L69:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L5b
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L5b
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r0 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L5b
            r13.<init>(r0)     // Catch: java.lang.Throwable -> L5b
            throw r13     // Catch: java.lang.Throwable -> L5b
        L7a:
            throw r2     // Catch: java.lang.Throwable -> L5b
        L7b:
            ajb r0 = new ajb
            r0.<init>(r13)
            r13 = r0
        L81:
            java.lang.Throwable r0 = defpackage.bjb.b(r13)
            boolean r2 = r0 instanceof com.apollographql.apollo.exception.CacheMissException
            yd4 r5 = r11.c
            if (r2 == 0) goto L9a
            yd4 r0 = defpackage.yd4.CacheFirst
            if (r5 == r0) goto La8
            yd4 r0 = defpackage.yd4.CacheAndNetwork
            if (r5 != r0) goto L94
            goto La8
        L94:
            bjb r4 = new bjb
            r4.<init>(r13)
            goto La8
        L9a:
            boolean r0 = r0 instanceof com.apollographql.apollo.exception.ApolloNetworkException
            if (r0 == 0) goto La3
            yd4 r0 = defpackage.yd4.NetworkFirst
            if (r5 != r0) goto La3
            goto La8
        La3:
            bjb r4 = new bjb
            r4.<init>(r13)
        La8:
            if (r4 == 0) goto Lb5
            r12.c = r3
            do4 r11 = r11.b
            java.lang.Object r11 = r11.a(r4, r12)
            if (r11 != r1) goto Lb5
            return r1
        Lb5:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz.k(n92, java.lang.Object):java.lang.Object");
    }
}
