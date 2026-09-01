package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hs8 {
    public final in7 a;
    public final e00 b;
    public final n32 c;

    public hs8(in7 in7Var, e00 e00Var, n32 n32Var) {
        in7Var.getClass();
        e00Var.getClass();
        n32Var.getClass();
        this.a = in7Var;
        this.b = e00Var;
        this.c = n32Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.util.ArrayList r12, defpackage.p92 r13) {
        /*
            Method dump skipped, instruction units count: 212
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hs8.a(java.util.ArrayList, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.util.ArrayList r12, defpackage.p92 r13) {
        /*
            Method dump skipped, instruction units count: 212
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hs8.b(java.util.ArrayList, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(int r7, defpackage.p92 r8, defpackage.yd4 r9, java.lang.String r10) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.as8
            if (r0 == 0) goto L13
            r0 = r8
            as8 r0 = (defpackage.as8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            as8 r0 = new as8
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> Lb0
            goto L54
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.OnboardingStarterPackQuery r8 = new com.medium.android.graphql.OnboardingStarterPackQuery
            com.medium.android.graphql.type.OnboardingStarterPackInput r2 = new com.medium.android.graphql.type.OnboardingStarterPackInput
            r2.<init>(r10)
            r8.<init>(r2, r7)
            e00 r6 = r6.b
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> Lb0
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> Lb0
            if (r8 != r1) goto L54
            return r1
        L54:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> Lb0
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L87
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L87
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L87
            if (r7 != 0) goto L86
            if (r0 != 0) goto L75
            if (r6 == 0) goto L6d
            com.medium.android.graphql.OnboardingStarterPackQuery$Data r6 = (com.medium.android.graphql.OnboardingStarterPackQuery.Data) r6     // Catch: java.lang.Throwable -> L87
            com.medium.android.graphql.OnboardingStarterPackQuery$OnboardingStarterPack r6 = r6.getOnboardingStarterPack()     // Catch: java.lang.Throwable -> L87
            com.medium.android.graphql.OnboardingStarterPackQuery$OnStarterPack r6 = r6.getOnStarterPack()     // Catch: java.lang.Throwable -> L87
            goto L97
        L6d:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L87
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L87
            throw r6     // Catch: java.lang.Throwable -> L87
        L75:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L87
            bs8 r4 = defpackage.bs8.b     // Catch: java.lang.Throwable -> L87
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L87
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L87
            throw r6     // Catch: java.lang.Throwable -> L87
        L86:
            throw r7     // Catch: java.lang.Throwable -> L87
        L87:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> Lb0
            r7.<init>(r6)     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> Lb0
            goto L96
        L8f:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L96:
            r6 = r7
        L97:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Laf
            if (r6 == 0) goto L9f
            goto Laf
        L9f:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La7
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La7
            throw r6     // Catch: java.lang.Throwable -> La7
        La7:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Laf:
            return r6
        Lb0:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hs8.c(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.yd4 r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.cs8
            if (r0 == 0) goto L13
            r0 = r13
            cs8 r0 = (defpackage.cs8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            cs8 r0 = new cs8
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> Lae
            goto L4f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.OnboardingStarterPacksQuery r13 = new com.medium.android.graphql.OnboardingStarterPacksQuery
            r13.<init>()
            e00 r11 = r11.b
            r11.getClass()
            uz r2 = new uz
            r2.<init>(r11, r13)
            java.lang.Object r11 = defpackage.gr7.i(r2, r12)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> Lae
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> Lae
            if (r13 != r1) goto L4f
            return r1
        L4f:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> Lae
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L88
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L88
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L88
            if (r12 != 0) goto L87
            if (r5 != 0) goto L76
            if (r11 == 0) goto L6e
            com.medium.android.graphql.OnboardingStarterPacksQuery$Data r11 = (com.medium.android.graphql.OnboardingStarterPacksQuery.Data) r11     // Catch: java.lang.Throwable -> L88
            com.medium.android.graphql.OnboardingStarterPacksQuery$OnboardingStarterPacks r11 = r11.getOnboardingStarterPacks()     // Catch: java.lang.Throwable -> L88
            com.medium.android.graphql.OnboardingStarterPacksQuery$OnOnboardingStarterPacks r11 = r11.getOnOnboardingStarterPacks()     // Catch: java.lang.Throwable -> L88
            if (r11 == 0) goto L97
            java.util.List r4 = r11.getStarterPacks()     // Catch: java.lang.Throwable -> L88
            goto L97
        L6e:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L88
            throw r11     // Catch: java.lang.Throwable -> L88
        L76:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            ds8 r9 = defpackage.ds8.b     // Catch: java.lang.Throwable -> L88
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L88
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L88
            throw r11     // Catch: java.lang.Throwable -> L88
        L87:
            throw r12     // Catch: java.lang.Throwable -> L88
        L88:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> Lae
            r4.<init>(r11)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> Lae
            goto L97
        L90:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L97:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lad
            if (r4 == 0) goto L9e
            goto Lad
        L9e:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La6
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La6
            throw r11     // Catch: java.lang.Throwable -> La6
        La6:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lad:
            return r4
        Lae:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hs8.d(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable e(int r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.es8
            if (r0 == 0) goto L13
            r0 = r9
            es8 r0 = (defpackage.es8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            es8 r0 = new es8
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> Lac java.util.concurrent.CancellationException -> Lb4
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.FeaturedUsersOnboardingQuery r9 = new com.medium.android.graphql.FeaturedUsersOnboardingQuery
            r9.<init>(r7)
            e00 r6 = r6.b
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> Lac java.util.concurrent.CancellationException -> Lb4
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> Lac java.util.concurrent.CancellationException -> Lb4
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> Lac java.util.concurrent.CancellationException -> Lb4
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> La4
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> La4
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> La4
            if (r7 != 0) goto La3
            if (r0 != 0) goto L92
            if (r6 == 0) goto L8a
            com.medium.android.graphql.FeaturedUsersOnboardingQuery$Data r6 = (com.medium.android.graphql.FeaturedUsersOnboardingQuery.Data) r6     // Catch: java.lang.Throwable -> La4
            com.medium.android.graphql.FeaturedUsersOnboardingQuery$OnboardingFeaturedUsers r6 = r6.getOnboardingFeaturedUsers()     // Catch: java.lang.Throwable -> La4
            java.util.List r6 = r6.getEdges()     // Catch: java.lang.Throwable -> La4
            java.util.ArrayList r7 = new java.util.ArrayList     // Catch: java.lang.Throwable -> La4
            r8 = 10
            int r8 = defpackage.cu1.k0(r6, r8)     // Catch: java.lang.Throwable -> La4
            r7.<init>(r8)     // Catch: java.lang.Throwable -> La4
            java.util.Iterator r6 = r6.iterator()     // Catch: java.lang.Throwable -> La4
        L76:
            boolean r8 = r6.hasNext()     // Catch: java.lang.Throwable -> La4
            if (r8 == 0) goto Lb3
            java.lang.Object r8 = r6.next()     // Catch: java.lang.Throwable -> La4
            com.medium.android.graphql.FeaturedUsersOnboardingQuery$Edge r8 = (com.medium.android.graphql.FeaturedUsersOnboardingQuery.Edge) r8     // Catch: java.lang.Throwable -> La4
            com.medium.android.graphql.FeaturedUsersOnboardingQuery$Node r8 = r8.getNode()     // Catch: java.lang.Throwable -> La4
            r7.add(r8)     // Catch: java.lang.Throwable -> La4
            goto L76
        L8a:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La4
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La4
            throw r6     // Catch: java.lang.Throwable -> La4
        L92:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La4
            fs8 r4 = defpackage.fs8.b     // Catch: java.lang.Throwable -> La4
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> La4
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La4
            throw r6     // Catch: java.lang.Throwable -> La4
        La3:
            throw r7     // Catch: java.lang.Throwable -> La4
        La4:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> Lac java.util.concurrent.CancellationException -> Lb4
            r7.<init>(r6)     // Catch: java.lang.Exception -> Lac java.util.concurrent.CancellationException -> Lb4
            goto Lb3
        Lac:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        Lb3:
            return r7
        Lb4:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hs8.e(int, yd4, p92):java.io.Serializable");
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0059, code lost:
    
        if (r4.c(r0) == r1) goto L24;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.gs8
            if (r0 == 0) goto L13
            r0 = r8
            gs8 r0 = (defpackage.gs8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gs8 r0 = new gs8
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            n32 r4 = r7.c
            r5 = 1
            r6 = 2
            if (r2 == 0) goto L3b
            if (r2 == r5) goto L37
            if (r2 != r6) goto L31
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L5c
            bjb r8 = (defpackage.bjb) r8     // Catch: java.lang.Throwable -> L5c
            java.lang.Object r7 = r8.a     // Catch: java.lang.Throwable -> L5c
            goto L67
        L31:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L37:
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L5c
            goto L53
        L3b:
            defpackage.br7.v(r8)
            r4.e()     // Catch: java.lang.Throwable -> L5c
            in7 r7 = r7.a     // Catch: java.lang.Throwable -> L5c
            gen.model.request.HasSeenIcelandOnboardingRequestBody r8 = new gen.model.request.HasSeenIcelandOnboardingRequestBody     // Catch: java.lang.Throwable -> L5c
            java.lang.Boolean r2 = java.lang.Boolean.TRUE     // Catch: java.lang.Throwable -> L5c
            r8.<init>(r2, r3, r6, r3)     // Catch: java.lang.Throwable -> L5c
            r0.d = r5     // Catch: java.lang.Throwable -> L5c
            java.lang.Object r7 = r7.l(r8, r0)     // Catch: java.lang.Throwable -> L5c
            if (r7 != r1) goto L53
            goto L5b
        L53:
            r0.d = r6     // Catch: java.lang.Throwable -> L5c
            java.lang.Object r7 = r4.c(r0)     // Catch: java.lang.Throwable -> L5c
            if (r7 != r1) goto L67
        L5b:
            return r1
        L5c:
            r7 = move-exception
            uld r8 = defpackage.wld.a
            r0 = 0
            java.lang.Object[] r0 = new java.lang.Object[r0]
            java.lang.String r1 = "An error occurred while marking has seen onboarding"
            r8.e(r7, r1, r0)
        L67:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hs8.f(p92):java.lang.Object");
    }
}
