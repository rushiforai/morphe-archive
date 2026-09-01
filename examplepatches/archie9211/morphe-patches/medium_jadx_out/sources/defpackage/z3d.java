package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z3d {
    public final in7 a;
    public final e00 b;

    public z3d(in7 in7Var, e00 e00Var) {
        in7Var.getClass();
        e00Var.getClass();
        this.a = in7Var;
        this.b = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.n3d
            if (r0 == 0) goto L13
            r0 = r8
            n3d r0 = (defpackage.n3d) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            n3d r0 = new n3d
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            goto L49
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.RememberMeAccountHintQuery r8 = new com.medium.android.graphql.RememberMeAccountHintQuery
            r8.<init>(r7)
            e00 r6 = r6.b
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            java.lang.Object r8 = r7.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            if (r8 != r1) goto L49
            return r1
        L49:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            com.medium.android.graphql.RememberMeAccountHintQuery$Data r6 = (com.medium.android.graphql.RememberMeAccountHintQuery.Data) r6     // Catch: java.lang.Throwable -> L78
            com.medium.android.graphql.RememberMeAccountHintQuery$RememberMeAccountHint r6 = r6.getRememberMeAccountHint()     // Catch: java.lang.Throwable -> L78
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            o3d r4 = defpackage.o3d.b     // Catch: java.lang.Throwable -> L78
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La0
            if (r6 == 0) goto L90
            goto La0
        L90:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L98
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L98
            throw r6     // Catch: java.lang.Throwable -> L98
        L98:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La0:
            return r6
        La1:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.a(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r19, java.lang.String r20, java.lang.String r21, java.lang.String r22, com.medium.android.core.susi.SusiOperation r23, boolean r24, defpackage.p92 r25) {
        /*
            Method dump skipped, instruction units count: 238
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.b(java.lang.String, java.lang.String, java.lang.String, java.lang.String, com.medium.android.core.susi.SusiOperation, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r7, java.lang.String r8, java.lang.String r9, defpackage.p92 r10) {
        /*
            r6 = this;
            boolean r0 = r10 instanceof defpackage.r3d
            if (r0 == 0) goto L13
            r0 = r10
            r3d r0 = (defpackage.r3d) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            r3d r0 = new r3d
            r0.<init>(r6, r10)
        L18:
            java.lang.Object r10 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r10)     // Catch: java.lang.Exception -> L93 java.util.concurrent.CancellationException -> Lb4
            goto L5c
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r10)
            com.medium.android.graphql.SendAccountAuthEmailByUserIdMutation r10 = new com.medium.android.graphql.SendAccountAuthEmailByUserIdMutation
            xv8 r2 = defpackage.xv8.a
            if (r8 != 0) goto L39
            r4 = r2
            goto L3e
        L39:
            yv8 r4 = new yv8
            r4.<init>(r8)
        L3e:
            if (r9 != 0) goto L41
            goto L46
        L41:
            yv8 r2 = new yv8
            r2.<init>(r9)
        L46:
            r10.<init>(r7, r4, r2)
            e00 r6 = r6.b
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r10)
            r0.d = r3     // Catch: java.lang.Exception -> L93 java.util.concurrent.CancellationException -> Lb4
            java.lang.Object r10 = r7.b(r0)     // Catch: java.lang.Exception -> L93 java.util.concurrent.CancellationException -> Lb4
            if (r10 != r1) goto L5c
            return r1
        L5c:
            j00 r10 = (defpackage.j00) r10     // Catch: java.lang.Exception -> L93 java.util.concurrent.CancellationException -> Lb4
            du8 r6 = r10.c     // Catch: java.lang.Throwable -> L8b
            com.apollographql.apollo.exception.ApolloException r7 = r10.e     // Catch: java.lang.Throwable -> L8b
            java.util.List r0 = r10.d     // Catch: java.lang.Throwable -> L8b
            if (r7 != 0) goto L8a
            if (r0 != 0) goto L79
            if (r6 == 0) goto L71
            com.medium.android.graphql.SendAccountAuthEmailByUserIdMutation$Data r6 = (com.medium.android.graphql.SendAccountAuthEmailByUserIdMutation.Data) r6     // Catch: java.lang.Throwable -> L8b
            com.medium.android.graphql.SendAccountAuthEmailByUserIdMutation$SendAcctAuthEmailByUserId r6 = r6.getSendAcctAuthEmailByUserId()     // Catch: java.lang.Throwable -> L8b
            goto L9b
        L71:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8b
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L8b
            throw r6     // Catch: java.lang.Throwable -> L8b
        L79:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8b
            s3d r4 = defpackage.s3d.b     // Catch: java.lang.Throwable -> L8b
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L8b
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L8b
            throw r6     // Catch: java.lang.Throwable -> L8b
        L8a:
            throw r7     // Catch: java.lang.Throwable -> L8b
        L8b:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L93 java.util.concurrent.CancellationException -> Lb4
            r7.<init>(r6)     // Catch: java.lang.Exception -> L93 java.util.concurrent.CancellationException -> Lb4
            goto L9a
        L93:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L9a:
            r6 = r7
        L9b:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lb3
            if (r6 == 0) goto La3
            goto Lb3
        La3:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lab
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> Lab
            throw r6     // Catch: java.lang.Throwable -> Lab
        Lab:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lb3:
            return r6
        Lb4:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.c(java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r19, java.lang.String r20, java.lang.String r21, java.lang.String r22, com.medium.android.core.susi.SusiOperation r23, boolean r24, defpackage.p92 r25) {
        /*
            Method dump skipped, instruction units count: 238
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.d(java.lang.String, java.lang.String, java.lang.String, java.lang.String, com.medium.android.core.susi.SusiOperation, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable e(defpackage.q62 r32, java.lang.String r33, com.medium.android.core.susi.SusiOperation r34, boolean r35, defpackage.p92 r36) {
        /*
            r31 = this;
            r0 = r31
            r1 = r32
            r2 = r36
            boolean r3 = r2 instanceof defpackage.v3d
            if (r3 == 0) goto L19
            r3 = r2
            v3d r3 = (defpackage.v3d) r3
            int r4 = r3.d
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r6 = r4 & r5
            if (r6 == 0) goto L19
            int r4 = r4 - r5
            r3.d = r4
            goto L1e
        L19:
            v3d r3 = new v3d
            r3.<init>(r0, r2)
        L1e:
            java.lang.Object r2 = r3.b
            tb2 r4 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r3.d
            r6 = 1
            r7 = 0
            if (r5 == 0) goto L34
            if (r5 != r6) goto L2e
            defpackage.br7.v(r2)     // Catch: java.lang.Throwable -> L96
            goto L8d
        L2e:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r7
        L34:
            defpackage.br7.v(r2)
            in7 r0 = r0.a     // Catch: java.lang.Throwable -> L96
            java.lang.Object r2 = r1.b     // Catch: java.lang.Throwable -> L96
            r10 = r2
            java.lang.String r10 = (java.lang.String) r10     // Catch: java.lang.Throwable -> L96
            java.lang.Object r2 = r1.c     // Catch: java.lang.Throwable -> L96
            r15 = r2
            java.lang.String r15 = (java.lang.String) r15     // Catch: java.lang.Throwable -> L96
            java.lang.Object r2 = r1.a     // Catch: java.lang.Throwable -> L96
            l3d r2 = (defpackage.l3d) r2     // Catch: java.lang.Throwable -> L96
            java.lang.String r9 = r2.getValue()     // Catch: java.lang.Throwable -> L96
            java.lang.Object r2 = r1.d     // Catch: java.lang.Throwable -> L96
            r16 = r2
            java.lang.String r16 = (java.lang.String) r16     // Catch: java.lang.Throwable -> L96
            java.io.Serializable r1 = r1.e     // Catch: java.lang.Throwable -> L96
            r18 = r1
            java.lang.String r18 = (java.lang.String) r18     // Catch: java.lang.Throwable -> L96
            if (r34 == 0) goto L5d
            java.lang.String r7 = r34.getValue()     // Catch: java.lang.Throwable -> L96
        L5d:
            r14 = r7
            gen.model.request.AcctSignInContent r8 = new gen.model.request.AcctSignInContent     // Catch: java.lang.Throwable -> L96
            java.lang.Boolean r24 = java.lang.Boolean.valueOf(r35)     // Catch: java.lang.Throwable -> L96
            r29 = 1015052(0xf7d0c, float:1.422391E-39)
            r30 = 0
            r11 = 0
            r12 = 0
            r17 = 0
            r19 = 0
            r20 = 0
            r21 = 0
            r22 = 0
            r23 = 0
            r25 = 0
            r26 = 0
            r27 = 0
            r28 = 0
            r13 = r33
            r8.<init>(r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30)     // Catch: java.lang.Throwable -> L96
            r3.d = r6     // Catch: java.lang.Throwable -> L96
            java.lang.Object r2 = r0.q(r8, r3)     // Catch: java.lang.Throwable -> L96
            if (r2 != r4) goto L8d
            return r4
        L8d:
            jn7 r2 = (defpackage.jn7) r2     // Catch: java.lang.Throwable -> L96
            java.lang.Object r0 = r2.getPayload()     // Catch: java.lang.Throwable -> L96
            gen.model.AuthInfo r0 = (gen.model.AuthInfo) r0     // Catch: java.lang.Throwable -> L96
            return r0
        L96:
            r0 = move-exception
            ajb r1 = new ajb
            r1.<init>(r0)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.e(q62, java.lang.String, com.medium.android.core.susi.SusiOperation, boolean, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable f(com.medium.android.susi.data.CreateAccountData r31, java.lang.String r32, defpackage.p92 r33) {
        /*
            r30 = this;
            r0 = r30
            r1 = r33
            boolean r2 = r1 instanceof defpackage.w3d
            if (r2 == 0) goto L17
            r2 = r1
            w3d r2 = (defpackage.w3d) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            w3d r2 = new w3d
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 1
            r6 = 0
            if (r4 == 0) goto L32
            if (r4 != r5) goto L2c
            defpackage.br7.v(r1)     // Catch: java.lang.Throwable -> La0
            goto L95
        L2c:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r6
        L32:
            defpackage.br7.v(r1)
            in7 r0 = r0.a     // Catch: java.lang.Throwable -> La0
            java.lang.String r8 = r31.getAccessToken()     // Catch: java.lang.Throwable -> La0
            java.lang.String r11 = r31.getEmail()     // Catch: java.lang.Throwable -> La0
            java.lang.String r23 = r31.getDefaultEmail()     // Catch: java.lang.Throwable -> La0
            java.lang.String r15 = r31.getName()     // Catch: java.lang.Throwable -> La0
            l3d r1 = r31.getSusiMethod()     // Catch: java.lang.Throwable -> La0
            java.lang.String r19 = r1.getValue()     // Catch: java.lang.Throwable -> La0
            gen.model.OnboardingStatus r17 = r31.getOnboardingStatus()     // Catch: java.lang.Throwable -> La0
            java.lang.String r10 = r31.getAccountName()     // Catch: java.lang.Throwable -> La0
            java.lang.String r9 = r31.getAccessTokenSecret()     // Catch: java.lang.Throwable -> La0
            java.lang.String r22 = r31.getUsername()     // Catch: java.lang.Throwable -> La0
            tw3 r1 = r31.getEmailAvailability()     // Catch: java.lang.Throwable -> La0
            if (r1 == 0) goto L69
            java.lang.String r6 = r1.getValue()     // Catch: java.lang.Throwable -> La0
        L69:
            r24 = r6
            boolean r1 = r31.getRememberMe()     // Catch: java.lang.Throwable -> La0
            gen.model.request.AcctCreateRequestBody r7 = new gen.model.request.AcctCreateRequestBody     // Catch: java.lang.Throwable -> La0
            java.lang.Boolean r25 = java.lang.Boolean.valueOf(r1)     // Catch: java.lang.Throwable -> La0
            r28 = 799088(0xc3170, float:1.119761E-39)
            r29 = 0
            r12 = 0
            r13 = 0
            r14 = 0
            r16 = 0
            r20 = 0
            r21 = 0
            r26 = 0
            r27 = 0
            r18 = r32
            r7.<init>(r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29)     // Catch: java.lang.Throwable -> La0
            r2.d = r5     // Catch: java.lang.Throwable -> La0
            java.lang.Object r1 = r0.m(r7, r2)     // Catch: java.lang.Throwable -> La0
            if (r1 != r3) goto L95
            return r3
        L95:
            jn7 r1 = (defpackage.jn7) r1     // Catch: java.lang.Throwable -> La0
            java.lang.Object r0 = r1.getPayload()     // Catch: java.lang.Throwable -> La0
            gen.model.response.AcctCreateResponse r0 = (gen.model.response.AcctCreateResponse) r0     // Catch: java.lang.Throwable -> La0
            gen.model.AuthInfo r0 = r0.value_     // Catch: java.lang.Throwable -> La0
            return r0
        La0:
            r0 = move-exception
            ajb r1 = new ajb
            r1.<init>(r0)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.f(com.medium.android.susi.data.CreateAccountData, java.lang.String, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.x3d
            if (r0 == 0) goto L13
            r0 = r8
            x3d r0 = (defpackage.x3d) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            x3d r0 = new x3d
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            goto L49
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.VerifyLoginCodeMutation r8 = new com.medium.android.graphql.VerifyLoginCodeMutation
            r8.<init>(r7)
            e00 r6 = r6.b
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            java.lang.Object r8 = r7.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            if (r8 != r1) goto L49
            return r1
        L49:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            com.medium.android.graphql.VerifyLoginCodeMutation$Data r6 = (com.medium.android.graphql.VerifyLoginCodeMutation.Data) r6     // Catch: java.lang.Throwable -> L78
            com.medium.android.graphql.VerifyLoginCodeMutation$VerifyLoginCode r6 = r6.getVerifyLoginCode()     // Catch: java.lang.Throwable -> L78
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            y3d r4 = defpackage.y3d.b     // Catch: java.lang.Throwable -> L78
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La0
            if (r6 == 0) goto L90
            goto La0
        L90:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L98
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L98
            throw r6     // Catch: java.lang.Throwable -> L98
        L98:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La0:
            return r6
        La1:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3d.g(java.lang.String, p92):java.lang.Object");
    }
}
