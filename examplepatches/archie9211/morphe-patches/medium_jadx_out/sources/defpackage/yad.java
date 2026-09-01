package defpackage;

import com.medium.android.graphql.TagSlugQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yad {
    public final e00 a;
    public final zk2 b;

    public yad(e00 e00Var, zk2 zk2Var) {
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
    public final java.lang.Object a(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.kad
            if (r0 == 0) goto L13
            r0 = r14
            kad r0 = (defpackage.kad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kad r0 = new kad
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
            com.medium.android.graphql.FollowedTagsQuery r14 = new com.medium.android.graphql.FollowedTagsQuery
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
            com.medium.android.graphql.FollowedTagsQuery$Data r11 = (com.medium.android.graphql.FollowedTagsQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.FollowedTagsQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.FollowedTagsQuery$FollowedTags r4 = r11.getFollowedTags()     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.a(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable b(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.lad
            if (r0 == 0) goto L13
            r0 = r9
            lad r0 = (defpackage.lad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            lad r0 = new lad
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> Lb3 java.util.concurrent.CancellationException -> Lbb
            goto L5a
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.MatchingTopicsQuery r9 = new com.medium.android.graphql.MatchingTopicsQuery
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
            r0.d = r3     // Catch: java.lang.Exception -> Lb3 java.util.concurrent.CancellationException -> Lbb
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> Lb3 java.util.concurrent.CancellationException -> Lbb
            if (r9 != r1) goto L5a
            return r1
        L5a:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> Lb3 java.util.concurrent.CancellationException -> Lbb
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> Lab
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> Lab
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> Lab
            if (r7 != 0) goto Laa
            if (r0 != 0) goto L99
            if (r6 == 0) goto L91
            com.medium.android.graphql.MatchingTopicsQuery$Data r6 = (com.medium.android.graphql.MatchingTopicsQuery.Data) r6     // Catch: java.lang.Throwable -> Lab
            java.util.List r6 = r6.getTagsTypeahead()     // Catch: java.lang.Throwable -> Lab
            java.util.ArrayList r7 = new java.util.ArrayList     // Catch: java.lang.Throwable -> Lab
            r8 = 10
            int r8 = defpackage.cu1.k0(r6, r8)     // Catch: java.lang.Throwable -> Lab
            r7.<init>(r8)     // Catch: java.lang.Throwable -> Lab
            java.util.Iterator r6 = r6.iterator()     // Catch: java.lang.Throwable -> Lab
        L7d:
            boolean r8 = r6.hasNext()     // Catch: java.lang.Throwable -> Lab
            if (r8 == 0) goto Lba
            java.lang.Object r8 = r6.next()     // Catch: java.lang.Throwable -> Lab
            com.medium.android.graphql.MatchingTopicsQuery$TagsTypeahead r8 = (com.medium.android.graphql.MatchingTopicsQuery.TagsTypeahead) r8     // Catch: java.lang.Throwable -> Lab
            com.medium.android.graphql.fragment.TagData r8 = r8.getTagData()     // Catch: java.lang.Throwable -> Lab
            r7.add(r8)     // Catch: java.lang.Throwable -> Lab
            goto L7d
        L91:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lab
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> Lab
            throw r6     // Catch: java.lang.Throwable -> Lab
        L99:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lab
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> Lab
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> Lab
            r6.<init>(r7)     // Catch: java.lang.Throwable -> Lab
            throw r6     // Catch: java.lang.Throwable -> Lab
        Laa:
            throw r7     // Catch: java.lang.Throwable -> Lab
        Lab:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> Lb3 java.util.concurrent.CancellationException -> Lbb
            r7.<init>(r6)     // Catch: java.lang.Exception -> Lb3 java.util.concurrent.CancellationException -> Lbb
            goto Lba
        Lb3:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        Lba:
            return r7
        Lbb:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.b(java.lang.String, yd4, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:64:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.mad
            if (r0 == 0) goto L13
            r0 = r14
            mad r0 = (defpackage.mad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mad r0 = new mad
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L28 java.util.concurrent.CancellationException -> Lc3
            goto L57
        L28:
            r0 = move-exception
            r11 = r0
            goto L89
        L2b:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L31:
            defpackage.br7.v(r14)
            com.medium.android.graphql.RelatedTagsQuery r14 = new com.medium.android.graphql.RelatedTagsQuery
            yv8 r2 = new yv8
            r2.<init>(r12)
            r14.<init>(r2)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L28 java.util.concurrent.CancellationException -> Lc3
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L28 java.util.concurrent.CancellationException -> Lc3
            if (r14 != r1) goto L57
            return r1
        L57:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L28 java.util.concurrent.CancellationException -> Lc3
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L6e
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L6e
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L6e
            if (r12 != 0) goto L82
            if (r5 != 0) goto L71
            if (r11 == 0) goto L66
            goto L8f
        L66:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L6e
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L6e
            throw r11     // Catch: java.lang.Throwable -> L6e
        L6e:
            r0 = move-exception
            r11 = r0
            goto L83
        L71:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L6e
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L6e
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L6e
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L6e
            throw r11     // Catch: java.lang.Throwable -> L6e
        L82:
            throw r12     // Catch: java.lang.Throwable -> L6e
        L83:
            ajb r12 = new ajb     // Catch: java.lang.Exception -> L28 java.util.concurrent.CancellationException -> Lc3
            r12.<init>(r11)     // Catch: java.lang.Exception -> L28 java.util.concurrent.CancellationException -> Lc3
            goto L8e
        L89:
            ajb r12 = new ajb
            r12.<init>(r11)
        L8e:
            r11 = r12
        L8f:
            boolean r12 = r11 instanceof defpackage.ajb
            if (r12 != 0) goto Lc2
            com.medium.android.graphql.RelatedTagsQuery$Data r11 = (com.medium.android.graphql.RelatedTagsQuery.Data) r11
            java.util.List r11 = r11.getRelatedTags()
            if (r11 != 0) goto L9e
            ey3 r11 = defpackage.ey3.a
        L9e:
            java.util.ArrayList r12 = new java.util.ArrayList
            r12.<init>()
            java.util.Iterator r11 = r11.iterator()
        La7:
            boolean r13 = r11.hasNext()
            if (r13 == 0) goto Lc1
            java.lang.Object r13 = r11.next()
            com.medium.android.graphql.RelatedTagsQuery$RelatedTag r13 = (com.medium.android.graphql.RelatedTagsQuery.RelatedTag) r13
            if (r13 == 0) goto Lba
            com.medium.android.graphql.fragment.TagData r13 = r13.getTagData()
            goto Lbb
        Lba:
            r13 = r4
        Lbb:
            if (r13 == 0) goto La7
            r12.add(r13)
            goto La7
        Lc1:
            r11 = r12
        Lc2:
            return r11
        Lc3:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.c(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.yd4 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.nad
            if (r0 == 0) goto L13
            r0 = r8
            nad r0 = (defpackage.nad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nad r0 = new nad
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
            com.medium.android.graphql.GetRootTagsQuery r8 = new com.medium.android.graphql.GetRootTagsQuery
            r8.<init>()
            e00 r6 = r6.a
            r6.getClass()
            uz r2 = new uz
            r2.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r2, r7)
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.d(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(com.medium.android.graphql.type.RecommendedTagsInput r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.oad
            if (r0 == 0) goto L13
            r0 = r9
            oad r0 = (defpackage.oad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            oad r0 = new oad
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> L94
            goto L5a
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.TagSuggestionQuery r9 = new com.medium.android.graphql.TagSuggestionQuery
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
            r0.d = r3     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> L94
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> L94
            if (r9 != r1) goto L5a
            return r1
        L5a:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> L94
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L83
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L83
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L83
            if (r7 != 0) goto L82
            if (r0 != 0) goto L71
            if (r6 == 0) goto L69
            goto L93
        L69:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L83
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L83
            throw r6     // Catch: java.lang.Throwable -> L83
        L71:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L83
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L83
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L83
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L83
            throw r6     // Catch: java.lang.Throwable -> L83
        L82:
            throw r7     // Catch: java.lang.Throwable -> L83
        L83:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> L94
            r7.<init>(r6)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> L94
            goto L92
        L8b:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L92:
            r6 = r7
        L93:
            return r6
        L94:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.e(com.medium.android.graphql.type.RecommendedTagsInput, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.rad
            if (r0 == 0) goto L13
            r0 = r9
            rad r0 = (defpackage.rad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            rad r0 = new rad
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            goto L54
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.TagParentsQuery r9 = new com.medium.android.graphql.TagParentsQuery
            yv8 r2 = new yv8
            r2.<init>(r7)
            r9.<init>(r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            if (r9 != r1) goto L54
            return r1
        L54:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L83
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L83
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L83
            if (r7 != 0) goto L82
            if (r0 != 0) goto L71
            if (r6 == 0) goto L69
            com.medium.android.graphql.TagParentsQuery$Data r6 = (com.medium.android.graphql.TagParentsQuery.Data) r6     // Catch: java.lang.Throwable -> L83
            com.medium.android.graphql.TagParentsQuery$TagFromSlug r6 = r6.getTagFromSlug()     // Catch: java.lang.Throwable -> L83
            goto L93
        L69:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L83
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L83
            throw r6     // Catch: java.lang.Throwable -> L83
        L71:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L83
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L83
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L83
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L83
            throw r6     // Catch: java.lang.Throwable -> L83
        L82:
            throw r7     // Catch: java.lang.Throwable -> L83
        L83:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            r7.<init>(r6)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            goto L92
        L8b:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L92:
            r6 = r7
        L93:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lab
            if (r6 == 0) goto L9b
            goto Lab
        L9b:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La3
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La3
            throw r6     // Catch: java.lang.Throwable -> La3
        La3:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lab:
            return r6
        Lac:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.h(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(java.lang.String r14, com.medium.android.graphql.type.TagPostsTimeRange r15, com.medium.android.graphql.type.TagPostsSortOrder r16, int r17, java.lang.String r18, defpackage.yd4 r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 212
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.i(java.lang.String, com.medium.android.graphql.type.TagPostsTimeRange, com.medium.android.graphql.type.TagPostsSortOrder, int, java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(defpackage.p92 r18, defpackage.yd4 r19, com.medium.android.graphql.type.PagingOptions r20, java.lang.String r21) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            boolean r2 = r1 instanceof defpackage.tad
            if (r2 == 0) goto L17
            r2 = r1
            tad r2 = (defpackage.tad) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            tad r2 = new tad
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 1
            if (r4 == 0) goto L32
            if (r4 != r5) goto L2b
            defpackage.br7.v(r1)     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            goto L6f
        L2b:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L32:
            defpackage.br7.v(r1)
            if (r20 != 0) goto L49
            com.medium.android.graphql.type.PagingOptions r6 = new com.medium.android.graphql.type.PagingOptions
            r15 = 255(0xff, float:3.57E-43)
            r16 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            r11 = 0
            r12 = 0
            r13 = 0
            r14 = 0
            r6.<init>(r7, r8, r9, r10, r11, r12, r13, r14, r15, r16)
            goto L4b
        L49:
            r6 = r20
        L4b:
            com.medium.android.graphql.PersonalisedTagFeedQuery r1 = new com.medium.android.graphql.PersonalisedTagFeedQuery
            xv8 r4 = defpackage.xv8.a
            r7 = r21
            r1.<init>(r7, r4, r6)
            e00 r0 = r0.a
            r0.getClass()
            uz r4 = new uz
            r4.<init>(r0, r1)
            r0 = r19
            java.lang.Object r0 = defpackage.gr7.i(r4, r0)
            uz r0 = (defpackage.uz) r0
            r2.d = r5     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            java.lang.Object r1 = r0.b(r2)     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            if (r1 != r3) goto L6f
            return r3
        L6f:
            j00 r1 = (defpackage.j00) r1     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            du8 r0 = r1.c     // Catch: java.lang.Throwable -> L9e
            com.apollographql.apollo.exception.ApolloException r2 = r1.e     // Catch: java.lang.Throwable -> L9e
            java.util.List r3 = r1.d     // Catch: java.lang.Throwable -> L9e
            if (r2 != 0) goto L9d
            if (r3 != 0) goto L8c
            if (r0 == 0) goto L84
            com.medium.android.graphql.PersonalisedTagFeedQuery$Data r0 = (com.medium.android.graphql.PersonalisedTagFeedQuery.Data) r0     // Catch: java.lang.Throwable -> L9e
            com.medium.android.graphql.PersonalisedTagFeedQuery$PersonalisedTagFeed r0 = r0.getPersonalisedTagFeed()     // Catch: java.lang.Throwable -> L9e
            goto Lac
        L84:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            java.lang.String r1 = "data is null"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L9e
            throw r0     // Catch: java.lang.Throwable -> L9e
        L8c:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            a00 r7 = defpackage.a00.b     // Catch: java.lang.Throwable -> L9e
            r8 = 31
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r1 = defpackage.bu1.F0(r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L9e
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L9e
            throw r0     // Catch: java.lang.Throwable -> L9e
        L9d:
            throw r2     // Catch: java.lang.Throwable -> L9e
        L9e:
            r0 = move-exception
            ajb r1 = new ajb     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            r1.<init>(r0)     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            goto Lab
        La5:
            r0 = move-exception
            ajb r1 = new ajb
            r1.<init>(r0)
        Lab:
            r0 = r1
        Lac:
            boolean r1 = r0 instanceof defpackage.ajb
            if (r1 != 0) goto Lc3
            if (r0 == 0) goto Lb4
            goto Lc3
        Lb4:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lbc
            java.lang.String r1 = "invalid response data"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lbc
            throw r0     // Catch: java.lang.Throwable -> Lbc
        Lbc:
            r0 = move-exception
            ajb r1 = new ajb
            r1.<init>(r0)
            r0 = r1
        Lc3:
            return r0
        Lc4:
            r0 = move-exception
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.j(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(defpackage.yd4 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.uad
            if (r0 == 0) goto L13
            r0 = r8
            uad r0 = (defpackage.uad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            uad r0 = new uad
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.OnboardingTopicCategoriesQuery r8 = new com.medium.android.graphql.OnboardingTopicCategoriesQuery
            r8.<init>()
            e00 r6 = r6.a
            r6.getClass()
            uz r2 = new uz
            r2.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r2, r7)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r8 != r1) goto L4f
            return r1
        L4f:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.OnboardingTopicCategoriesQuery$Data r6 = (com.medium.android.graphql.OnboardingTopicCategoriesQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            java.util.List r6 = r6.getOnboardingTopicCategories()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.k(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(java.lang.String r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 281
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.l(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(java.lang.String r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 281
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.m(java.lang.String, p92):java.lang.Object");
    }

    public final zz n(String str, boolean z) {
        str.getClass();
        TagSlugQuery tagSlugQuery = new TagSlugQuery(new yv8(str));
        e00 e00Var = this.a;
        e00Var.getClass();
        uz uzVar = new uz(e00Var, tagSlugQuery);
        uzVar.b.i = Boolean.valueOf(z);
        yd4 yd4Var = yd4.CacheFirst;
        return new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 17), 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.pad
            if (r0 == 0) goto L13
            r0 = r14
            pad r0 = (defpackage.pad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            pad r0 = new pad
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            goto L54
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.TagCuratedCatalogQuery r14 = new com.medium.android.graphql.TagCuratedCatalogQuery
            yv8 r2 = new yv8
            r2.<init>(r12)
            r14.<init>(r2)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            if (r14 != r1) goto L54
            return r1
        L54:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L9d
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L9d
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L9d
            if (r12 != 0) goto L9c
            if (r5 != 0) goto L8b
            if (r11 == 0) goto L83
            com.medium.android.graphql.TagCuratedCatalogQuery$Data r11 = (com.medium.android.graphql.TagCuratedCatalogQuery.Data) r11     // Catch: java.lang.Throwable -> L9d
            com.medium.android.graphql.TagCuratedCatalogQuery$TagFromSlug r11 = r11.getTagFromSlug()     // Catch: java.lang.Throwable -> L9d
            if (r11 == 0) goto Lac
            com.medium.android.graphql.TagCuratedCatalogQuery$CuratedLists r11 = r11.getCuratedLists()     // Catch: java.lang.Throwable -> L9d
            if (r11 == 0) goto Lac
            java.util.List r11 = r11.getEdges()     // Catch: java.lang.Throwable -> L9d
            if (r11 == 0) goto Lac
            java.lang.Object r11 = defpackage.bu1.z0(r11)     // Catch: java.lang.Throwable -> L9d
            com.medium.android.graphql.TagCuratedCatalogQuery$Edge r11 = (com.medium.android.graphql.TagCuratedCatalogQuery.Edge) r11     // Catch: java.lang.Throwable -> L9d
            if (r11 == 0) goto Lac
            com.medium.android.graphql.TagCuratedCatalogQuery$Node r4 = r11.getNode()     // Catch: java.lang.Throwable -> L9d
            goto Lac
        L83:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9d
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9d
            throw r11     // Catch: java.lang.Throwable -> L9d
        L8b:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9d
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L9d
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L9d
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9d
            throw r11     // Catch: java.lang.Throwable -> L9d
        L9c:
            throw r12     // Catch: java.lang.Throwable -> L9d
        L9d:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            r4.<init>(r11)     // Catch: java.lang.Exception -> La5 java.util.concurrent.CancellationException -> Lc4
            goto Lac
        La5:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lac:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lc3
            if (r4 == 0) goto Lb3
            goto Lc3
        Lb3:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lbc
            r12 = 0
            java.lang.String r12 = com.google.android.gms.internal.fido.Hg.kSWQKWZ.RWmobmO     // Catch: java.lang.Throwable -> Lbc
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lbc
            throw r11     // Catch: java.lang.Throwable -> Lbc
        Lbc:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lc3:
            return r4
        Lc4:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.f(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.qad
            if (r0 == 0) goto L13
            r0 = r14
            qad r0 = (defpackage.qad) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qad r0 = new qad
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2f
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb1
            goto L55
        L28:
            r11 = 0
            java.lang.String r11 = androidx.emoji2.text.flatbuffer.aI.aJzfoQ.LDjE
            defpackage.ygf.f(r11)
            return r4
        L2f:
            defpackage.br7.v(r14)
            com.medium.android.graphql.TagSlugQuery r14 = new com.medium.android.graphql.TagSlugQuery
            yv8 r2 = new yv8
            r2.<init>(r12)
            r14.<init>(r2)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb1
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb1
            if (r14 != r1) goto L55
            return r1
        L55:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb1
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L8a
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L8a
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L8a
            if (r12 != 0) goto L89
            if (r5 != 0) goto L78
            if (r11 == 0) goto L70
            com.medium.android.graphql.TagSlugQuery$Data r11 = (com.medium.android.graphql.TagSlugQuery.Data) r11     // Catch: java.lang.Throwable -> L8a
            com.medium.android.graphql.TagSlugQuery$TagFromSlug r11 = r11.getTagFromSlug()     // Catch: java.lang.Throwable -> L8a
            if (r11 == 0) goto L99
            com.medium.android.graphql.fragment.TagData r4 = r11.getTagData()     // Catch: java.lang.Throwable -> L8a
            goto L99
        L70:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8a
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8a
            throw r11     // Catch: java.lang.Throwable -> L8a
        L78:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8a
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8a
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
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb1
            r4.<init>(r11)     // Catch: java.lang.Exception -> L92 java.util.concurrent.CancellationException -> Lb1
            goto L99
        L92:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L99:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb0
            if (r4 == 0) goto La0
            goto Lb0
        La0:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La9
            r12 = 0
            java.lang.String r12 = scalapb.options.hI.AEVqIoD.fmLBC     // Catch: java.lang.Throwable -> La9
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La9
            throw r11     // Catch: java.lang.Throwable -> La9
        La9:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb0:
            return r4
        Lb1:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yad.g(java.lang.String, yd4, p92):java.lang.Object");
    }
}
