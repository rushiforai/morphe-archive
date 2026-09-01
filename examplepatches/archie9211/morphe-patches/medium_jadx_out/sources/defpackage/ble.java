package defpackage;

import com.medium.android.graphql.fragment.UserFollowData;
import com.medium.android.graphql.fragment.UserFollowDataImpl;
import com.medium.android.graphql.type.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ble {
    public final e00 a;
    public final zk2 b;

    public ble(e00 e00Var, zk2 zk2Var) {
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
    public final java.lang.Object A(java.lang.String r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.A(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object B(java.lang.String r18, boolean r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 271
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.B(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object C(java.lang.String r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.C(java.lang.String, p92):java.lang.Object");
    }

    public final Object D(String str, ns4 ns4Var) {
        m00 m00VarM = gr7.m(this.a);
        UserFollowDataImpl userFollowDataImpl = new UserFollowDataImpl();
        User.INSTANCE.getClass();
        i31 i31Var = new i31(User.type.u, k80.Q0(new String[]{str}));
        yl2 yl2Var = yl2.e;
        f31 f31Var = f31.b;
        g15 g15VarC0 = gsa.c0(m00VarM, userFollowDataImpl, i31Var, yl2Var, f31Var);
        if (g15VarC0 != null) {
            UserFollowData userFollowData = (UserFollowData) g15VarC0;
            Object objF = ((zw2) m00VarM).f(userFollowDataImpl, i31Var, UserFollowData.copy$default(userFollowData, null, null, null, null, UserFollowData.ViewerEdge.copy$default(userFollowData.getViewerEdge(), null, null, true, 3, null), 15, null), yl2Var, f31Var, true, ns4Var);
            if (objF == tb2.COROUTINE_SUSPENDED) {
                return objF;
            }
        }
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.a(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r9, defpackage.p92 r10) {
        /*
            Method dump skipped, instruction units count: 242
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.b(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.wje
            if (r0 == 0) goto L13
            r0 = r12
            wje r0 = (defpackage.wje) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            wje r0 = new wje
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
            com.medium.android.graphql.GetCurrentUserPublicPostsQuery r12 = new com.medium.android.graphql.GetCurrentUserPublicPostsQuery
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
            com.medium.android.graphql.GetCurrentUserPublicPostsQuery$Data r11 = (com.medium.android.graphql.GetCurrentUserPublicPostsQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.GetCurrentUserPublicPostsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.GetCurrentUserPublicPostsQuery$HomepagePostsConnection r4 = r11.getHomepagePostsConnection()     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.c(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.xje
            if (r0 == 0) goto L13
            r0 = r12
            xje r0 = (defpackage.xje) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            xje r0 = new xje
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
            com.medium.android.graphql.FollowersQuery r12 = new com.medium.android.graphql.FollowersQuery
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
            com.medium.android.graphql.FollowersQuery$Data r11 = (com.medium.android.graphql.FollowersQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.FollowersQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.FollowersQuery$FollowersUserConnection r4 = r11.getFollowersUserConnection()     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.d(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.yje
            if (r0 == 0) goto L13
            r0 = r14
            yje r0 = (defpackage.yje) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            yje r0 = new yje
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
            com.medium.android.graphql.FollowingPublicationsQuery r14 = new com.medium.android.graphql.FollowingPublicationsQuery
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
            com.medium.android.graphql.FollowingPublicationsQuery$Data r11 = (com.medium.android.graphql.FollowingPublicationsQuery.Data) r11     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.FollowingPublicationsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L84
            if (r11 == 0) goto L93
            com.medium.android.graphql.FollowingPublicationsQuery$FollowingCollectionConnection r4 = r11.getFollowingCollectionConnection()     // Catch: java.lang.Throwable -> L84
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.e(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.zje
            if (r0 == 0) goto L13
            r0 = r12
            zje r0 = (defpackage.zje) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            zje r0 = new zje
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
            com.medium.android.graphql.FollowingUsersQuery r12 = new com.medium.android.graphql.FollowingUsersQuery
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
            com.medium.android.graphql.FollowingUsersQuery$Data r11 = (com.medium.android.graphql.FollowingUsersQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.FollowingUsersQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.FollowingUsersQuery$FollowingUserConnection r4 = r11.getFollowingUserConnection()     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.f(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(int r7, java.lang.String r8, boolean r9, defpackage.yd4 r10, defpackage.p92 r11) {
        /*
            r6 = this;
            boolean r0 = r11 instanceof defpackage.ake
            if (r0 == 0) goto L13
            r0 = r11
            ake r0 = (defpackage.ake) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ake r0 = new ake
            r0.<init>(r6, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L84 java.util.concurrent.CancellationException -> L8d
            goto L53
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r11)
            com.medium.android.graphql.GetMatchedContactsQuery r11 = new com.medium.android.graphql.GetMatchedContactsQuery
            if (r8 != 0) goto L37
            java.lang.String r8 = ""
        L37:
            r11.<init>(r7, r8, r9)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r11)
            java.lang.Object r6 = defpackage.gr7.i(r7, r10)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L84 java.util.concurrent.CancellationException -> L8d
            java.lang.Object r11 = r6.b(r0)     // Catch: java.lang.Exception -> L84 java.util.concurrent.CancellationException -> L8d
            if (r11 != r1) goto L53
            return r1
        L53:
            j00 r11 = (defpackage.j00) r11     // Catch: java.lang.Exception -> L84 java.util.concurrent.CancellationException -> L8d
            du8 r6 = r11.c     // Catch: java.lang.Throwable -> L7c
            com.apollographql.apollo.exception.ApolloException r7 = r11.e     // Catch: java.lang.Throwable -> L7c
            java.util.List r0 = r11.d     // Catch: java.lang.Throwable -> L7c
            if (r7 != 0) goto L7b
            if (r0 != 0) goto L6a
            if (r6 == 0) goto L62
            goto L8c
        L62:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7c
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7c
            throw r6     // Catch: java.lang.Throwable -> L7c
        L6a:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7c
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7c
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L7c
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7c
            throw r6     // Catch: java.lang.Throwable -> L7c
        L7b:
            throw r7     // Catch: java.lang.Throwable -> L7c
        L7c:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L84 java.util.concurrent.CancellationException -> L8d
            r7.<init>(r6)     // Catch: java.lang.Exception -> L84 java.util.concurrent.CancellationException -> L8d
            goto L8b
        L84:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8b:
            r6 = r7
        L8c:
            return r6
        L8d:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.g(int, java.lang.String, boolean, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.bke
            if (r0 == 0) goto L13
            r0 = r12
            bke r0 = (defpackage.bke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            bke r0 = new bke
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
            com.medium.android.graphql.UserPostHighlightsQuery r12 = new com.medium.android.graphql.UserPostHighlightsQuery
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
            com.medium.android.graphql.UserPostHighlightsQuery$Data r11 = (com.medium.android.graphql.UserPostHighlightsQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.UserPostHighlightsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.UserPostHighlightsQuery$HighlightsStreamConnection r4 = r11.getHighlightsStreamConnection()     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.h(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.cke
            if (r0 == 0) goto L13
            r0 = r14
            cke r0 = (defpackage.cke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            cke r0 = new cke
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> La4 java.util.concurrent.CancellationException -> Lc2
            goto L67
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.GetResponsesQuery r14 = new com.medium.android.graphql.GetResponsesQuery
            zk2 r2 = r11.b
            java.lang.String r2 = r2.m()
            com.medium.android.graphql.type.PostType r5 = com.medium.android.graphql.type.PostType.POST_TYPE_RESPONSE
            yv8 r6 = new yv8
            r6.<init>(r5)
            if (r12 != 0) goto L45
            xv8 r12 = defpackage.xv8.a
            goto L4b
        L45:
            yv8 r5 = new yv8
            r5.<init>(r12)
            r12 = r5
        L4b:
            r14.<init>(r2, r6, r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> La4 java.util.concurrent.CancellationException -> Lc2
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> La4 java.util.concurrent.CancellationException -> Lc2
            if (r14 != r1) goto L67
            return r1
        L67:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> La4 java.util.concurrent.CancellationException -> Lc2
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L9c
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L9c
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L9c
            if (r12 != 0) goto L9b
            if (r5 != 0) goto L8a
            if (r11 == 0) goto L82
            com.medium.android.graphql.GetResponsesQuery$Data r11 = (com.medium.android.graphql.GetResponsesQuery.Data) r11     // Catch: java.lang.Throwable -> L9c
            com.medium.android.graphql.GetResponsesQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L9c
            if (r11 == 0) goto Lab
            com.medium.android.graphql.GetResponsesQuery$LatestPostsConnection r4 = r11.getLatestPostsConnection()     // Catch: java.lang.Throwable -> L9c
            goto Lab
        L82:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9c
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9c
            throw r11     // Catch: java.lang.Throwable -> L9c
        L8a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9c
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L9c
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L9c
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9c
            throw r11     // Catch: java.lang.Throwable -> L9c
        L9b:
            throw r12     // Catch: java.lang.Throwable -> L9c
        L9c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> La4 java.util.concurrent.CancellationException -> Lc2
            r4.<init>(r11)     // Catch: java.lang.Exception -> La4 java.util.concurrent.CancellationException -> Lc2
            goto Lab
        La4:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lab:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lc1
            if (r4 == 0) goto Lb2
            goto Lc1
        Lb2:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lba
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lba
            throw r11     // Catch: java.lang.Throwable -> Lba
        Lba:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lc1:
            return r4
        Lc2:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.i(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(int r12, defpackage.p92 r13, defpackage.yd4 r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.dke
            if (r0 == 0) goto L13
            r0 = r13
            dke r0 = (defpackage.dke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            dke r0 = new dke
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
            goto L59
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.UserSubmissionsQuery r13 = new com.medium.android.graphql.UserSubmissionsQuery
            zk2 r2 = r11.b
            java.lang.String r2 = r2.m()
            if (r15 != 0) goto L3d
            java.lang.String r15 = ""
        L3d:
            r13.<init>(r2, r12, r15)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            java.lang.Object r11 = defpackage.gr7.i(r12, r14)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            if (r13 != r1) goto L59
            return r1
        L59:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L94
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L94
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L94
            if (r12 != 0) goto L93
            if (r5 != 0) goto L82
            if (r11 == 0) goto L7a
            com.medium.android.graphql.UserSubmissionsQuery$Data r11 = (com.medium.android.graphql.UserSubmissionsQuery.Data) r11     // Catch: java.lang.Throwable -> L94
            com.medium.android.graphql.UserSubmissionsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L94
            if (r11 == 0) goto La3
            com.medium.android.graphql.UserSubmissionsQuery$ViewerEdge r11 = r11.getViewerEdge()     // Catch: java.lang.Throwable -> L94
            if (r11 == 0) goto La3
            com.medium.android.graphql.UserSubmissionsQuery$SubmissionsConnection r4 = r11.getSubmissionsConnection()     // Catch: java.lang.Throwable -> L94
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.j(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(java.lang.String r7, int r8, java.lang.String r9, java.util.List r10, defpackage.yd4 r11, boolean r12, defpackage.p92 r13) {
        /*
            r6 = this;
            boolean r0 = r13 instanceof defpackage.eke
            if (r0 == 0) goto L13
            r0 = r13
            eke r0 = (defpackage.eke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            eke r0 = new eke
            r0.<init>(r6, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> La5
            goto L6b
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.UserActivitiesQuery r13 = new com.medium.android.graphql.UserActivitiesQuery
            if (r9 != 0) goto L37
            java.lang.String r9 = ""
        L37:
            if (r10 != 0) goto L3c
            xv8 r10 = defpackage.xv8.a
            goto L42
        L3c:
            yv8 r2 = new yv8
            r2.<init>(r10)
            r10 = r2
        L42:
            com.medium.android.graphql.type.UserActivitiesConnectionInput r2 = new com.medium.android.graphql.type.UserActivitiesConnectionInput
            r2.<init>(r10, r9, r8, r7)
            r13.<init>(r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r13)
            java.lang.Object r6 = defpackage.gr7.i(r7, r11)
            uz r6 = (defpackage.uz) r6
            java.lang.Boolean r7 = java.lang.Boolean.valueOf(r12)
            h00 r8 = r6.b
            r8.i = r7
            r0.d = r3     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> La5
            java.lang.Object r13 = r6.b(r0)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> La5
            if (r13 != r1) goto L6b
            return r1
        L6b:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> La5
            du8 r6 = r13.c     // Catch: java.lang.Throwable -> L94
            com.apollographql.apollo.exception.ApolloException r7 = r13.e     // Catch: java.lang.Throwable -> L94
            java.util.List r0 = r13.d     // Catch: java.lang.Throwable -> L94
            if (r7 != 0) goto L93
            if (r0 != 0) goto L82
            if (r6 == 0) goto L7a
            goto La4
        L7a:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L94
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L94
            throw r6     // Catch: java.lang.Throwable -> L94
        L82:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L94
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L94
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L94
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L94
            throw r6     // Catch: java.lang.Throwable -> L94
        L93:
            throw r7     // Catch: java.lang.Throwable -> L94
        L94:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> La5
            r7.<init>(r6)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> La5
            goto La3
        L9c:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        La3:
            r6 = r7
        La4:
            return r6
        La5:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.k(java.lang.String, int, java.lang.String, java.util.List, yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.fke
            if (r0 == 0) goto L13
            r0 = r9
            fke r0 = (defpackage.fke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            fke r0 = new fke
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
            com.medium.android.graphql.UserBooksByIdQuery r9 = new com.medium.android.graphql.UserBooksByIdQuery
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
            com.medium.android.graphql.UserBooksByIdQuery$Data r6 = (com.medium.android.graphql.UserBooksByIdQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.UserBooksByIdQuery$UserResult r6 = r6.getUserResult()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.l(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.gke
            if (r0 == 0) goto L13
            r0 = r9
            gke r0 = (defpackage.gke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gke r0 = new gke
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.GetUserBylineDataQuery r9 = new com.medium.android.graphql.GetUserBylineDataQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L78
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.m(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object n(defpackage.p92 r11, defpackage.yd4 r12, com.medium.android.graphql.type.CatalogPagingOptionsInput r13, java.lang.String r14) {
        /*
            r10 = this;
            boolean r0 = r11 instanceof defpackage.hke
            if (r0 == 0) goto L13
            r0 = r11
            hke r0 = (defpackage.hke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            hke r0 = new hke
            r0.<init>(r10, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            goto L54
        L27:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2e:
            defpackage.br7.v(r11)
            com.medium.android.graphql.UserCatalogsQuery r4 = new com.medium.android.graphql.UserCatalogsQuery
            r8 = 4
            r9 = 0
            r7 = 0
            r6 = r13
            r5 = r14
            r4.<init>(r5, r6, r7, r8, r9)
            e00 r10 = r10.a
            r10.getClass()
            uz r11 = new uz
            r11.<init>(r10, r4)
            java.lang.Object r10 = defpackage.gr7.i(r11, r12)
            uz r10 = (defpackage.uz) r10
            r0.d = r3     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            java.lang.Object r11 = r10.b(r0)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            if (r11 != r1) goto L54
            return r1
        L54:
            j00 r11 = (defpackage.j00) r11     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            du8 r10 = r11.c     // Catch: java.lang.Throwable -> L83
            com.apollographql.apollo.exception.ApolloException r12 = r11.e     // Catch: java.lang.Throwable -> L83
            java.util.List r0 = r11.d     // Catch: java.lang.Throwable -> L83
            if (r12 != 0) goto L82
            if (r0 != 0) goto L71
            if (r10 == 0) goto L69
            com.medium.android.graphql.UserCatalogsQuery$Data r10 = (com.medium.android.graphql.UserCatalogsQuery.Data) r10     // Catch: java.lang.Throwable -> L83
            com.medium.android.graphql.UserCatalogsQuery$UserResult r10 = r10.getUserResult()     // Catch: java.lang.Throwable -> L83
            goto L93
        L69:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L83
            java.lang.String r11 = "data is null"
            r10.<init>(r11)     // Catch: java.lang.Throwable -> L83
            throw r10     // Catch: java.lang.Throwable -> L83
        L71:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L83
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L83
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r11 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L83
            r10.<init>(r11)     // Catch: java.lang.Throwable -> L83
            throw r10     // Catch: java.lang.Throwable -> L83
        L82:
            throw r12     // Catch: java.lang.Throwable -> L83
        L83:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            r11.<init>(r10)     // Catch: java.lang.Exception -> L8b java.util.concurrent.CancellationException -> Lac
            goto L92
        L8b:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb
            r11.<init>(r10)
        L92:
            r10 = r11
        L93:
            boolean r11 = r10 instanceof defpackage.ajb
            if (r11 != 0) goto Lab
            if (r10 == 0) goto L9b
            goto Lab
        L9b:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La3
            java.lang.String r11 = "invalid response data"
            r10.<init>(r11)     // Catch: java.lang.Throwable -> La3
            throw r10     // Catch: java.lang.Throwable -> La3
        La3:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb
            r11.<init>(r10)
            r10 = r11
        Lab:
            return r10
        Lac:
            r0 = move-exception
            r10 = r0
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.n(p92, yd4, com.medium.android.graphql.type.CatalogPagingOptionsInput, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object o(defpackage.p92 r12, defpackage.yd4 r13, com.medium.android.graphql.type.PagingOptions r14, java.lang.String r15) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.ike
            if (r0 == 0) goto L13
            r0 = r12
            ike r0 = (defpackage.ike) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ike r0 = new ike
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
            com.medium.android.graphql.CreatorHomepagePostsQuery r12 = new com.medium.android.graphql.CreatorHomepagePostsQuery
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
            com.medium.android.graphql.CreatorHomepagePostsQuery$Data r11 = (com.medium.android.graphql.CreatorHomepagePostsQuery.Data) r11     // Catch: java.lang.Throwable -> L8f
            com.medium.android.graphql.CreatorHomepagePostsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8f
            if (r11 == 0) goto L9e
            com.medium.android.graphql.CreatorHomepagePostsQuery$HomepagePostsConnection r4 = r11.getHomepagePostsConnection()     // Catch: java.lang.Throwable -> L8f
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.o(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object p(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.jke
            if (r0 == 0) goto L13
            r0 = r9
            jke r0 = (defpackage.jke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            jke r0 = new jke
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
            com.medium.android.graphql.UserAboutQuery r9 = new com.medium.android.graphql.UserAboutQuery
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
            com.medium.android.graphql.UserAboutQuery$Data r6 = (com.medium.android.graphql.UserAboutQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.UserAboutQuery$UserResult r6 = r6.getUserResult()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.p(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object q(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.kke
            if (r0 == 0) goto L13
            r0 = r14
            kke r0 = (defpackage.kke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kke r0 = new kke
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
            com.medium.android.graphql.UserProfileByIdQuery r14 = new com.medium.android.graphql.UserProfileByIdQuery
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
            com.medium.android.graphql.UserProfileByIdQuery$Data r11 = (com.medium.android.graphql.UserProfileByIdQuery.Data) r11     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.UserProfileByIdQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L84
            if (r11 == 0) goto L93
            com.medium.android.graphql.fragment.UserProfileData r4 = r11.getUserProfileData()     // Catch: java.lang.Throwable -> L84
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.q(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object r(java.lang.String r12, defpackage.yd4 r13, boolean r14, defpackage.p92 r15) {
        /*
            r11 = this;
            boolean r0 = r15 instanceof defpackage.lke
            if (r0 == 0) goto L13
            r0 = r15
            lke r0 = (defpackage.lke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            lke r0 = new lke
            r0.<init>(r11, r15)
        L18:
            java.lang.Object r15 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r15)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            goto L57
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r15)
            com.medium.android.graphql.UserProfileHeaderByIdQuery r15 = new com.medium.android.graphql.UserProfileHeaderByIdQuery
            r15.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r15)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            java.lang.Boolean r12 = java.lang.Boolean.valueOf(r14)
            h00 r13 = r11.b
            r13.i = r12
            r0.d = r3     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            java.lang.Object r15 = r11.b(r0)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            if (r15 != r1) goto L57
            return r1
        L57:
            j00 r15 = (defpackage.j00) r15     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            du8 r11 = r15.c     // Catch: java.lang.Throwable -> L8c
            com.apollographql.apollo.exception.ApolloException r12 = r15.e     // Catch: java.lang.Throwable -> L8c
            java.util.List r5 = r15.d     // Catch: java.lang.Throwable -> L8c
            if (r12 != 0) goto L8b
            if (r5 != 0) goto L7a
            if (r11 == 0) goto L72
            com.medium.android.graphql.UserProfileHeaderByIdQuery$Data r11 = (com.medium.android.graphql.UserProfileHeaderByIdQuery.Data) r11     // Catch: java.lang.Throwable -> L8c
            com.medium.android.graphql.UserProfileHeaderByIdQuery$UserResult r11 = r11.getUserResult()     // Catch: java.lang.Throwable -> L8c
            if (r11 == 0) goto L9b
            com.medium.android.graphql.fragment.UserProfileHeaderResult r4 = r11.getUserProfileHeaderResult()     // Catch: java.lang.Throwable -> L8c
            goto L9b
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8c
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8c
            throw r11     // Catch: java.lang.Throwable -> L8c
        L7a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8c
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8c
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8c
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8c
            throw r11     // Catch: java.lang.Throwable -> L8c
        L8b:
            throw r12     // Catch: java.lang.Throwable -> L8c
        L8c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            r4.<init>(r11)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            goto L9b
        L94:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L9b:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb1
            if (r4 == 0) goto La2
            goto Lb1
        La2:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Laa
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Laa
            throw r11     // Catch: java.lang.Throwable -> Laa
        Laa:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb1:
            return r4
        Lb2:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.r(java.lang.String, yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object s(java.lang.String r12, defpackage.yd4 r13, boolean r14, defpackage.p92 r15) {
        /*
            r11 = this;
            boolean r0 = r15 instanceof defpackage.mke
            if (r0 == 0) goto L13
            r0 = r15
            mke r0 = (defpackage.mke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mke r0 = new mke
            r0.<init>(r11, r15)
        L18:
            java.lang.Object r15 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r15)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            goto L57
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r15)
            com.medium.android.graphql.UserProfileHeaderByUsernameQuery r15 = new com.medium.android.graphql.UserProfileHeaderByUsernameQuery
            r15.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r15)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            java.lang.Boolean r12 = java.lang.Boolean.valueOf(r14)
            h00 r13 = r11.b
            r13.i = r12
            r0.d = r3     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            java.lang.Object r15 = r11.b(r0)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            if (r15 != r1) goto L57
            return r1
        L57:
            j00 r15 = (defpackage.j00) r15     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            du8 r11 = r15.c     // Catch: java.lang.Throwable -> L8c
            com.apollographql.apollo.exception.ApolloException r12 = r15.e     // Catch: java.lang.Throwable -> L8c
            java.util.List r5 = r15.d     // Catch: java.lang.Throwable -> L8c
            if (r12 != 0) goto L8b
            if (r5 != 0) goto L7a
            if (r11 == 0) goto L72
            com.medium.android.graphql.UserProfileHeaderByUsernameQuery$Data r11 = (com.medium.android.graphql.UserProfileHeaderByUsernameQuery.Data) r11     // Catch: java.lang.Throwable -> L8c
            com.medium.android.graphql.UserProfileHeaderByUsernameQuery$UserResult r11 = r11.getUserResult()     // Catch: java.lang.Throwable -> L8c
            if (r11 == 0) goto L9b
            com.medium.android.graphql.fragment.UserProfileHeaderResult r4 = r11.getUserProfileHeaderResult()     // Catch: java.lang.Throwable -> L8c
            goto L9b
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8c
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8c
            throw r11     // Catch: java.lang.Throwable -> L8c
        L7a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8c
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8c
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8c
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8c
            throw r11     // Catch: java.lang.Throwable -> L8c
        L8b:
            throw r12     // Catch: java.lang.Throwable -> L8c
        L8c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            r4.<init>(r11)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            goto L9b
        L94:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L9b:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb1
            if (r4 == 0) goto La2
            goto Lb1
        La2:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Laa
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Laa
            throw r11     // Catch: java.lang.Throwable -> Laa
        Laa:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb1:
            return r4
        Lb2:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.s(java.lang.String, yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object t(java.lang.String r7, int r8, java.lang.String r9, defpackage.yd4 r10, boolean r11, defpackage.p92 r12) {
        /*
            r6 = this;
            boolean r0 = r12 instanceof defpackage.nke
            if (r0 == 0) goto L13
            r0 = r12
            nke r0 = (defpackage.nke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nke r0 = new nke
            r0.<init>(r6, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L9a
            goto L60
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r12)
            com.medium.android.graphql.UserRepostsQuery r12 = new com.medium.android.graphql.UserRepostsQuery
            if (r9 != 0) goto L37
            java.lang.String r9 = ""
        L37:
            com.medium.android.graphql.type.UserRepostsConnectionInput r2 = new com.medium.android.graphql.type.UserRepostsConnectionInput
            r2.<init>(r9, r8, r7)
            r12.<init>(r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r12)
            java.lang.Object r6 = defpackage.gr7.i(r7, r10)
            uz r6 = (defpackage.uz) r6
            java.lang.Boolean r7 = java.lang.Boolean.valueOf(r11)
            h00 r8 = r6.b
            r8.i = r7
            r0.d = r3     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L9a
            java.lang.Object r12 = r6.b(r0)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L9a
            if (r12 != r1) goto L60
            return r1
        L60:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L9a
            du8 r6 = r12.c     // Catch: java.lang.Throwable -> L89
            com.apollographql.apollo.exception.ApolloException r7 = r12.e     // Catch: java.lang.Throwable -> L89
            java.util.List r0 = r12.d     // Catch: java.lang.Throwable -> L89
            if (r7 != 0) goto L88
            if (r0 != 0) goto L77
            if (r6 == 0) goto L6f
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L9a
            r7.<init>(r6)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L9a
            goto L98
        L91:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L98:
            r6 = r7
        L99:
            return r6
        L9a:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.t(java.lang.String, int, java.lang.String, yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object u(com.medium.android.graphql.type.PostType r12, com.medium.android.graphql.type.PagingOptions r13, defpackage.yd4 r14, defpackage.p92 r15) {
        /*
            r11 = this;
            boolean r0 = r15 instanceof defpackage.oke
            if (r0 == 0) goto L13
            r0 = r15
            oke r0 = (defpackage.oke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            oke r0 = new oke
            r0.<init>(r11, r15)
        L18:
            java.lang.Object r15 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r15)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            goto L64
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r15)
            com.medium.android.graphql.YouPostsQuery r15 = new com.medium.android.graphql.YouPostsQuery
            zk2 r2 = r11.b
            java.lang.String r2 = r2.m()
            yv8 r5 = new yv8
            r5.<init>(r12)
            if (r13 != 0) goto L43
            xv8 r12 = defpackage.xv8.a
            goto L48
        L43:
            yv8 r12 = new yv8
            r12.<init>(r13)
        L48:
            r15.<init>(r2, r5, r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r15)
            java.lang.Object r11 = defpackage.gr7.i(r12, r14)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            java.lang.Object r15 = r11.b(r0)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            if (r15 != r1) goto L64
            return r1
        L64:
            j00 r15 = (defpackage.j00) r15     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            du8 r11 = r15.c     // Catch: java.lang.Throwable -> L99
            com.apollographql.apollo.exception.ApolloException r12 = r15.e     // Catch: java.lang.Throwable -> L99
            java.util.List r5 = r15.d     // Catch: java.lang.Throwable -> L99
            if (r12 != 0) goto L98
            if (r5 != 0) goto L87
            if (r11 == 0) goto L7f
            com.medium.android.graphql.YouPostsQuery$Data r11 = (com.medium.android.graphql.YouPostsQuery.Data) r11     // Catch: java.lang.Throwable -> L99
            com.medium.android.graphql.YouPostsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L99
            if (r11 == 0) goto La8
            com.medium.android.graphql.YouPostsQuery$LatestPostsConnection r4 = r11.getLatestPostsConnection()     // Catch: java.lang.Throwable -> L99
            goto La8
        L7f:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L99
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L99
            throw r11     // Catch: java.lang.Throwable -> L99
        L87:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L99
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L99
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L99
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L99
            throw r11     // Catch: java.lang.Throwable -> L99
        L98:
            throw r12     // Catch: java.lang.Throwable -> L99
        L99:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            r4.<init>(r11)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            goto La8
        La1:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La8:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lbe
            if (r4 == 0) goto Laf
            goto Lbe
        Laf:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb7
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb7
            throw r11     // Catch: java.lang.Throwable -> Lb7
        Lb7:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lbe:
            return r4
        Lbf:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.u(com.medium.android.graphql.type.PostType, com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object v(java.lang.String r18, boolean r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 271
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.v(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object w(defpackage.yd4 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.qke
            if (r0 == 0) goto L13
            r0 = r8
            qke r0 = (defpackage.qke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qke r0 = new qke
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.AllowedUserPronounsQuery r8 = new com.medium.android.graphql.AllowedUserPronounsQuery
            r8.<init>()
            e00 r6 = r6.a
            r6.getClass()
            uz r2 = new uz
            r2.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r2, r7)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            if (r8 != r1) goto L4f
            return r1
        L4f:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.AllowedUserPronounsQuery$Data r6 = (com.medium.android.graphql.AllowedUserPronounsQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            java.util.List r6 = r6.getAllowedUserPronouns()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.w(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable x(java.lang.String r12, defpackage.yd4 r13, boolean r14, defpackage.p92 r15) {
        /*
            r11 = this;
            boolean r0 = r15 instanceof defpackage.rke
            if (r0 == 0) goto L13
            r0 = r15
            rke r0 = (defpackage.rke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            rke r0 = new rke
            r0.<init>(r11, r15)
        L18:
            java.lang.Object r15 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r15)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            goto L57
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r15)
            com.medium.android.graphql.UserIdByUsernameQuery r15 = new com.medium.android.graphql.UserIdByUsernameQuery
            r15.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r15)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            java.lang.Boolean r12 = java.lang.Boolean.valueOf(r14)
            h00 r13 = r11.b
            r13.i = r12
            r0.d = r3     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            java.lang.Object r15 = r11.b(r0)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            if (r15 != r1) goto L57
            return r1
        L57:
            j00 r15 = (defpackage.j00) r15     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            du8 r11 = r15.c     // Catch: java.lang.Throwable -> L8c
            com.apollographql.apollo.exception.ApolloException r12 = r15.e     // Catch: java.lang.Throwable -> L8c
            java.util.List r5 = r15.d     // Catch: java.lang.Throwable -> L8c
            if (r12 != 0) goto L8b
            if (r5 != 0) goto L7a
            if (r11 == 0) goto L72
            com.medium.android.graphql.UserIdByUsernameQuery$Data r11 = (com.medium.android.graphql.UserIdByUsernameQuery.Data) r11     // Catch: java.lang.Throwable -> L8c
            com.medium.android.graphql.UserIdByUsernameQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L8c
            if (r11 == 0) goto L9b
            java.lang.String r4 = r11.getId()     // Catch: java.lang.Throwable -> L8c
            goto L9b
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8c
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8c
            throw r11     // Catch: java.lang.Throwable -> L8c
        L7a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8c
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8c
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L8c
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L8c
            throw r11     // Catch: java.lang.Throwable -> L8c
        L8b:
            throw r12     // Catch: java.lang.Throwable -> L8c
        L8c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            r4.<init>(r11)     // Catch: java.lang.Exception -> L94 java.util.concurrent.CancellationException -> Lb2
            goto L9b
        L94:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L9b:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb1
            if (r4 == 0) goto La2
            goto Lb1
        La2:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Laa
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Laa
            throw r11     // Catch: java.lang.Throwable -> Laa
        Laa:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb1:
            return r4
        Lb2:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.x(java.lang.String, yd4, boolean, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object y(java.lang.String r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.y(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object z(java.lang.String r7, java.lang.String r8, boolean r9, defpackage.p92 r10) {
        /*
            r6 = this;
            boolean r0 = r10 instanceof defpackage.tke
            if (r0 == 0) goto L13
            r0 = r10
            tke r0 = (defpackage.tke) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            tke r0 = new tke
            r0.<init>(r6, r10)
        L18:
            java.lang.Object r10 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r10)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r10)
            com.medium.android.graphql.ReportUserMutation r10 = new com.medium.android.graphql.ReportUserMutation
            zk2 r2 = r6.b
            java.lang.String r2 = r2.m()
            r10.<init>(r7, r2, r8, r9)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r10)
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r10 = r7.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r10 != r1) goto L4f
            return r1
        L4f:
            j00 r10 = (defpackage.j00) r10     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r10.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r10.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r10.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.ReportUserMutation$Data r6 = (com.medium.android.graphql.ReportUserMutation.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.ReportUserMutation$ReportAndMaybeBlockUser r6 = r6.getReportAndMaybeBlockUser()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ble.z(java.lang.String, java.lang.String, boolean, p92):java.lang.Object");
    }
}
