package defpackage;

import com.medium.android.graphql.fragment.PostFeaturingStatusDataImpl;
import com.medium.android.graphql.type.Post;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cba {
    public final e00 a;
    public final r6c b;
    public final uua c;

    public cba(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
        r6c r6cVarX = k40.x(0, 7, null);
        this.b = r6cVarX;
        this.c = bo.z(r6cVarX);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:0|2|(2:4|(1:6)(1:8))(0)|7|9|(1:54)|(1:(1:(3:13|48|49)(2:14|15))(2:16|17))(3:21|22|(2:24|46))|25|53|26|(1:(1:(3:30|42|(3:44|(3:47|48|49)|46)(1:55))(2:33|34))(2:35|36))(1:37)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0078, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0095, code lost:
    
        r0 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:55:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r13, java.lang.String r14, defpackage.p92 r15) {
        /*
            r12 = this;
            boolean r0 = r15 instanceof defpackage.waa
            if (r0 == 0) goto L14
            r0 = r15
            waa r0 = (defpackage.waa) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r15 = r0
            goto L1a
        L14:
            waa r0 = new waa
            r0.<init>(r12, r15)
            goto L12
        L1a:
            java.lang.Object r0 = r15.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r15.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L43
            if (r2 == r4) goto L36
            if (r2 != r3) goto L30
            java.lang.Object r12 = r15.c
            defpackage.br7.v(r0)
            goto Lbe
        L30:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r5
        L36:
            java.lang.Object r13 = r15.c
            uz r13 = (defpackage.uz) r13
            java.lang.String r13 = r15.b
            defpackage.br7.v(r0)     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            goto L67
        L40:
            r0 = move-exception
            r14 = r0
            goto L9b
        L43:
            defpackage.br7.v(r0)
            com.medium.android.graphql.SetPostPublicationFeaturedMutation r0 = new com.medium.android.graphql.SetPostPublicationFeaturedMutation
            com.medium.android.graphql.type.SetPostPublicationFeaturedInput r2 = new com.medium.android.graphql.type.SetPostPublicationFeaturedInput
            r2.<init>(r4, r13, r14)
            r0.<init>(r2)
            e00 r14 = r12.a
            r14.getClass()
            uz r2 = new uz
            r2.<init>(r14, r0)
            r15.b = r13     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            r15.c = r5     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            r15.f = r4     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            java.lang.Object r0 = r2.b(r15)     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            if (r0 != r1) goto L67
            goto Lbc
        L67:
            j00 r0 = (defpackage.j00) r0     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            du8 r14 = r0.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r2 = r0.e     // Catch: java.lang.Throwable -> L78
            java.util.List r6 = r0.d     // Catch: java.lang.Throwable -> L78
            if (r2 != 0) goto L94
            if (r6 != 0) goto L83
            if (r14 == 0) goto L7b
            com.medium.android.graphql.SetPostPublicationFeaturedMutation$Data r14 = (com.medium.android.graphql.SetPostPublicationFeaturedMutation.Data) r14     // Catch: java.lang.Throwable -> L78
            goto La1
        L78:
            r0 = move-exception
            r14 = r0
            goto L95
        L7b:
            com.medium.android.data.common.RitoException r14 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r0 = "data is null"
            r14.<init>(r0)     // Catch: java.lang.Throwable -> L78
            throw r14     // Catch: java.lang.Throwable -> L78
        L83:
            com.medium.android.data.common.RitoException r14 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            a00 r10 = defpackage.a00.b     // Catch: java.lang.Throwable -> L78
            r11 = 31
            r7 = 0
            r8 = 0
            r9 = 0
            java.lang.String r0 = defpackage.bu1.F0(r6, r7, r8, r9, r10, r11)     // Catch: java.lang.Throwable -> L78
            r14.<init>(r0)     // Catch: java.lang.Throwable -> L78
            throw r14     // Catch: java.lang.Throwable -> L78
        L94:
            throw r2     // Catch: java.lang.Throwable -> L78
        L95:
            ajb r0 = new ajb     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            r0.<init>(r14)     // Catch: java.lang.Exception -> L40 java.util.concurrent.CancellationException -> Lc0
            goto La0
        L9b:
            ajb r0 = new ajb
            r0.<init>(r14)
        La0:
            r14 = r0
        La1:
            boolean r0 = r14 instanceof defpackage.ajb
            if (r0 != 0) goto Lbf
            r0 = r14
            com.medium.android.graphql.SetPostPublicationFeaturedMutation$Data r0 = (com.medium.android.graphql.SetPostPublicationFeaturedMutation.Data) r0
            mr9 r0 = new mr9
            r2 = 18
            r0.<init>(r2)
            r15.b = r5
            r15.c = r14
            r15.f = r3
            java.lang.Object r12 = r12.f(r13, r0, r15)
            if (r12 != r1) goto Lbd
        Lbc:
            return r1
        Lbd:
            r12 = r14
        Lbe:
            r14 = r12
        Lbf:
            return r14
        Lc0:
            r0 = move-exception
            r12 = r0
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cba.a(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.xaa
            if (r0 == 0) goto L13
            r0 = r9
            xaa r0 = (defpackage.xaa) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            xaa r0 = new xaa
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
            com.medium.android.graphql.FeaturePostInPublicationQuery r9 = new com.medium.android.graphql.FeaturePostInPublicationQuery
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
            com.medium.android.graphql.FeaturePostInPublicationQuery$Data r6 = (com.medium.android.graphql.FeaturePostInPublicationQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.FeaturePostInPublicationQuery$Post r6 = r6.getPost()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cba.b(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r11, com.medium.android.graphql.type.Sort r12, int r13, java.lang.String r14, defpackage.yd4 r15, defpackage.p92 r16) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cba.c(java.lang.String, com.medium.android.graphql.type.Sort, int, java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.zaa
            if (r0 == 0) goto L13
            r0 = r9
            zaa r0 = (defpackage.zaa) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            zaa r0 = new zaa
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
            com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery r9 = new com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery
            com.medium.android.graphql.type.PublicationFeaturingTokenBalanceInput r2 = new com.medium.android.graphql.type.PublicationFeaturingTokenBalanceInput
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
            com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery$Data r6 = (com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery.Data) r6     // Catch: java.lang.Throwable -> L83
            com.medium.android.graphql.PublicationFeaturingTokenBalanceQuery$PublicationFeaturingTokenBalance r6 = r6.getPublicationFeaturingTokenBalance()     // Catch: java.lang.Throwable -> L83
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cba.d(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:0|2|(2:4|(1:6)(1:7))(0)|8|(1:57)|(1:(1:(1:(3:13|52|53)(2:14|15))(4:16|48|(3:51|52|53)|50))(2:17|18))(3:22|23|(2:25|50))|26|56|27|(1:(1:(3:31|42|(3:44|(3:47|48|(0))|50)(1:59))(2:34|35))(2:36|37))(1:38)|(2:(0)|(1:58))) */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x008e, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00aa, code lost:
    
        r5 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r19, java.lang.String r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 237
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cba.e(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public final Object f(String str, x45 x45Var, p92 p92Var) {
        m00 m00VarM = gr7.m(this.a);
        PostFeaturingStatusDataImpl postFeaturingStatusDataImpl = new PostFeaturingStatusDataImpl();
        Post.INSTANCE.getClass();
        i31 i31Var = new i31(Post.type.u, k80.Q0(new String[]{str}));
        yl2 yl2Var = yl2.e;
        f31 f31Var = f31.b;
        g15 g15VarC0 = gsa.c0(m00VarM, postFeaturingStatusDataImpl, i31Var, yl2Var, f31Var);
        if (g15VarC0 != null) {
            Object objF = ((zw2) m00VarM).f(postFeaturingStatusDataImpl, i31Var, (g15) x45Var.invoke(g15VarC0), yl2Var, f31Var, true, p92Var);
            if (objF == tb2.COROUTINE_SUSPENDED) {
                return objF;
            }
        }
        return c1e.a;
    }
}
